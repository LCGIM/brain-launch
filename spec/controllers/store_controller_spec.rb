require 'rails_helper'

RSpec.describe StoreController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #register" do
    it "returns http success" do
      get :register
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #checkout" do
    it "returns http success" do
      get :checkout
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #account" do
    it "returns http success" do
      get :account
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #print_materials" do
    it "returns http success" do
      get :print_materials
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #program_exercises" do
    it "returns http success" do
      get :program_exercises
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #admin" do
    it "returns http success" do
      get :admin
      expect(response).to have_http_status(:success)
    end
  end

end
