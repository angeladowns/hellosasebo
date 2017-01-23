require 'rails_helper'

#------------------INDEX

describe "adventures", type: :request do
  let!(:adventure) { FactoryGirl.create(:adventure) }
  describe 'reading adventures' do
    it "should render adventures index template" do
      get '/adventures'
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end
  end

#------------------NEW/CREATE

  describe 'GET /adventures/new' do
    it "should render adventures new template" do
      get '/adventures/new'
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end
  end

  describe 'POST /adventures' do
    it 'should create a new adventure' do
      expect {
        post '/adventures', adventure: { date_time: adventure.date_time,
                                     activity: adventure.activity,
                                     location: adventure.location,
                                     description: adventure.description }
      }.to change(adventure, :count).by(1)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(adventure_url(adventure.last.id))
    end
  end


#-----NEW/CREATE FAILURE

  describe 'GET /adventures/:id save failure' do
    before do
        post '/adventures', adventure: { location: adventure.location,
                                     description: adventure.description }
    end
    it 'should not render adventure show template' do
      get "/adventures/#{adventure.last.id}"
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end

    it 'does not save the new adventure' do
      expect{
        post '/adventures', adventure: { location: adventure.location,
                                     description: adventure.description }
      }.to_not change(adventure,:count)
    end

    it 're-renders the new page' do
      post '/adventures', adventure: { location: adventure.location,
                                   description: adventure.description }
      expect(response).to render_template :new
    end
  end

#------------------SHOW

  describe 'GET /adventures/:id' do
    before do
      post '/adventures', adventure: { date_time: adventure.date_time,
                                   activity: adventure.activity,
                                   location: adventure.location,
                                   description: adventure.description }
    end

    it "should render adventure show template" do
      get "/adventures/#{adventure.last.id}"
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end
  end

#------------------EDIT/UPDATE

  describe 'GET /adventures/:id/edit' do
    it "should render adventures edit template" do
      get "/adventures/#{adventure.id}/edit"
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end
  end

  describe 'POST /adventures/:id' do
    before do
      post '/adventures', adventure: { date_time: adventure.date_time,
                                   activity: adventure.activity,
                                   location: adventure.location,
                                   description: adventure.description }
    end

    it "should update a adventure" do
      expect {
        patch "/adventures/#{adventure.id}", adventure: { date_time: adventure.date_time,
                                   activity: adventure.activity,
                                   location: adventure.location,
                                   description: adventure.description }
      }.to change(adventure, :count).by(0)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(adventure_url(adventure))
    end
  end

#-----EDIT/UPDATE FAILURE

  describe 'GET /adventures/:id/edit failure' do
    before do
      post '/adventures', adventure: { date_time: adventure.date_time,
                                   activity: adventure.activity,
                                   location: adventure.location,
                                   description: adventure.description }
    end

    it 're-renders the edit page' do
      get "/adventures/#{adventure.last.id}/edit", adventure: { date_time: adventure.date_time,
                                  activity: adventure.activity,
                                  location: adventure.location,
                                  description: adventure.description }
      expect(response).to render_template :edit
    end
  end

#------------------DELETE

  describe 'DELETE' do
    before do
      post '/adventures', adventure: { date_time: adventure.date_time,
                                   activity: adventure.activity,
                                   location: adventure.location,
                                   description: adventure.description }
    end

    it "should delete a adventure" do
      expect {
        delete "/adventures/#{adventure.last.id}"
      }.to change(adventure, :count).by(-1)
      expect(response).to have_http_status(302)
    end
  end

end
