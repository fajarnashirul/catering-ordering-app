require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  describe 'GET #index' do
    it 'populate an array of all menus' do
      menu1 = FactoryBot.create(:menu)
      menu2 = FactoryBot.create(:menu, name: 'Soto Betawi')
      get :index
      expect(assigns(:menus)).to match_array([menu1, menu2])
    end
    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe 'GET #show' do
    it 'assigns the requested menu to @menu' do
      @menu = FactoryBot.create(:menu)
      get :show, params: { id: @menu}
      expect(assigns(:menu)).to eq @menu
    end
    it 'renders the :show template' do
      menu = FactoryBot.create(:menu)
      get :show, params: { id: menu }
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested meny to @menu' do
      @menu = FactoryBot.create(:menu)
      get :edit, params: { id: @menu }
      expect(assigns(:menu)).to eq @menu
    end
    it 'render to edit template' do
      @menu = FactoryBot.create(:menu)
      get :edit, params: { id: @menu }
      expect(response).to render_template :edit
    end
  end
  
  describe 'POST #create' do
    it 'save menu to database' do
      expect{
          post :create, params: { menu: attributes_for(:menu) }
        }.to change(Menu, :count).by(1)
    end
        it 'menu does not save to database with invalid attribut' do
      expect{
          post :create, params: { menu: attributes_for(:invalid_menu) }
        }.not_to change(Menu, :count)
    end
    it "redirects to menu#show" do
      post :create, params: { menu: attributes_for(:menu) }
      expect(response).to redirect_to(menu_path(assigns[:menu]))
    end
  end
  
  describe 'PATCH #update' do
    before :each do
      @menu = FactoryBot.create(:menu)
    end
    it 'valid update' do
      patch :update, params: {id: @menu, menu: attributes_for(:menu)}
      expect(assigns(:menu)).to eq @menu
    end
    it 'update with change attribute' do
      patch :update, params: {id: @menu, menu: attributes_for(:menu, name: "Nasi Padang")}
      @menu.reload
      expect(@menu.name).to eq("Nasi Padang")
    end
    it 'not save with invalid update' do
      patch :update, params: {id: @menu, menu: attributes_for(:invalid_menu, name: "Nasi Padang", price:"test")}
      @menu.reload
      expect(@menu.name).not_to eq('Nasi Uduk')
    end
    it "redirects to the menu" do
        patch :update, params: { id: @menu, menu: attributes_for(:menu) }
        expect(response).to redirect_to @food
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @menu = FactoryBot.create(:menu)
    end
    it "deletes the menu from the database" do
      expect{
        delete :destroy, params: { id: @menu }
      }.to change(Menu, :count).by(-1)
    end
    it "redirects to menu#index" do
      delete :destroy, params: { id: @menu }
      expect(response).to redirect_to menus_path
    end
  end
end
