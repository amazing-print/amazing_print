# frozen_string_literal: true

require 'spec_helper'

require 'logger'
require 'amazing_print/core_ext/logger'

RSpec.describe 'AmazingPrint logging extensions' do
  before(:all) do
    @logger = begin
                Logger.new('/dev/null')
              rescue Errno::ENOENT
                Logger.new('nul')
              end
  end

  describe 'ap method' do
    it 'should awesome_inspect the given object' do
      object = double
      expect(object).to receive(:ai)
      @logger.ap object
    end

    describe 'the log level' do
      before do
        AmazingPrint.defaults = {}
      end

      it 'should fallback to the default :debug log level' do
        expect(@logger).to receive(:debug)
        @logger.ap(nil)
      end

      it 'should use the global user default if no level passed' do
        AmazingPrint.defaults = { log_level: :info }
        expect(@logger).to receive(:info)
        @logger.ap(nil)
      end

      it 'should use the passed in level' do
        expect(@logger).to receive(:warn)
        @logger.ap(nil, :warn)
      end
    end
  end
end
