require 'rails_helper'

RSpec.describe Task, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:task_tags) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
