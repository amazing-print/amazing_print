# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'AmazingPrint::ActionController', skip: -> { !ExtVerifier.has_rails? }.call do
  let(:inspector) { AmazingPrint::Inspector.new }

  context 'with unpermitted ActionController::Parameters' do
    let(:parameters) do
      ActionController::Parameters.new post: { id: 1, content: 'Some' }
    end

    it 'should format as an object' do
      expect(inspector.send(:awesome, parameters)).to match(
        /\A#?<ActionController::Parameters {"post"=>{"id"=>1, "content"=>"Some"}} permitted: false>\z/
      )
    end
  end

  context 'with permitted ActionController::Parameters' do
    let(:expected_output) do
      <<~OUTPUT
        {
            \"post\"\e[0;37m => \e[0m{
                     \"id\"\e[0;37m => \e[0m\e[1;34m1\e[0m,
                \"content\"\e[0;37m => \e[0m\e[0;33m\"Some\"\e[0m
            }
        }
      OUTPUT
        .chomp
    end
    let(:parameters) do
      ActionController::Parameters.new post: { id: 1, content: 'Some' }
    end

    it 'should format as a hash' do
      expect(inspector.send(:awesome, parameters.permit!)).to eq expected_output
    end
  end
end
