require 'rails_helper'

RSpec.describe Search, type: :model do
  
    describe "Direct Associations" do

    it { should have_one(:saved_song) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
