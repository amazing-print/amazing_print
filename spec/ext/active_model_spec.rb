# frozen_string_literal: true

require 'spec_helper'
require 'active_record_helper'

RSpec.describe 'ActiveModel formatting', skip: -> { !ExtVerifier.has_rails? }.call do
  before do
    @ap = AmazingPrint::Inspector.new(plain: true)
  end

  describe 'ActiveModel class' do
    it 'prints the class' do
      expect(@ap.awesome(ActiveModelModel)).to eq <<~PRINT.strip
        class ActiveModelModel < Object {
            name: :string,
            rank: :integer
        }
      PRINT
    end
  end

  describe 'ActiveModel instance' do
    it 'prints the instance' do
      model = ActiveModelModel.new(name: 'John', rank: 1)
      expect(@ap.awesome(model)).to be_similar_to <<~PRINT.strip
        #<ActiveModelModel:placeholder_id> {
            name: "John",
            rank: 1
        }
      PRINT
    end
  end

  it 'formats active_model_errors properly' do
    model = TableFreeModel.new
    model.errors.add(:name, "can't be blank")

    out = @ap.awesome(model.errors)

    str = <<~ERRORS.strip
      #<ActiveModel::Errors:placeholder_id> {
             "name" => nil,
           details: {
              name: [
                  [0] {
                      error: "can't be blank"
                  }
              ]
          },
          messages: {
              name: [
                  [0] "can't be blank"
              ]
          }
      }
    ERRORS

    expect(out).to be_similar_to(str)
  end
end
