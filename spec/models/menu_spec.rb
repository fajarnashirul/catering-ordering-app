require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'should valid factory bot' do
    expect(FactoryBot.build(:menu)).to be_valid
  end
  
  it 'should invalid with duplicate name ' do
    menu1 = FactoryBot.create(:menu, name:"Nasi Uduk")
    menu2 = FactoryBot.build(:menu, name:"Nasi Uduk")

    menu2.valid?
    expect(menu2.errors[:name]).to include("has already been taken")
  end
  
  it 'should invalid with blank name' do
    menu = FactoryBot.build(:menu, name: nil)
    
    menu.valid?
    
    expect(menu.errors[:name]).to include("can't be blank")
  end

  it 'should invalid with price less than 0.01' do
    menu = FactoryBot.build(:menu, price: 0.001)
    
    menu.valid?
    
    expect(menu.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  it 'should invalid with description more than 150 character' do
    menu = FactoryBot.build(:menu, description: "Nasi kuning, sesuai dengan namanya merupakan nasi yang berwarna kuning dengan menggunakan pewarna makanan alami yakni kunyit. Selain warnanya yang berbeda dengan nasi biasanya adalah rasa yang gurih serta aroma yang harum.")
    
    menu.valid?
    
    expect(menu.errors[:description]).to include("description must less than 150 character")
  end
  
 it 'menu can have multiple categories' do
    menu = FactoryBot.build(:menu)

    category1 = FactoryBot.create(:category)
    category2 = FactoryBot.create(:category, name: "desert")
    categories = [category1, category2]
    menu.insert_category(menu, categories)
    expect(menu.categories.select('name')). to eq([category1, category2])
  end
end
