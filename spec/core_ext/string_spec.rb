# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'String extensions' do
  %i[gray red green yellow blue purple cyan white].each_with_index do |color, i|
    it "should have #{color} color" do
      expect(color.to_s.send(color)).to eq("\e[1;#{30 + i}m#{color}\e[0m")
    end

    it "should have #{color}ish color" do
      expect(color.to_s.send(:"#{color}ish")).to eq("\e[0;#{30 + i}m#{color}\e[0m")
    end
  end
end
