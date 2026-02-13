# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Structs' do
  let(:hello) do
    stub_const('Hello', Struct.new(:ca, :dabra, :abra))
    Hello.new(2, 3, 1)
  end

  describe 'Formatting a struct' do
    it 'attributes' do
      out = hello.ai(colors: :none, raw: true)
      str = <<~EOSTR.strip
        #<struct Hello:placeholder_id
               ca = 2,
            dabra = 3,
             abra = 1
        >
      EOSTR
      expect(out).to be_similar_to(str)
    end

    it 'without the plain options print the colorized values' do
      AmazingPrint.force_colors!
      out = hello.ai(raw: true)
      str = <<~EOSTR.strip
        #<struct Hello:placeholder_id
               ca\e[0;37m = \e[0m\e[1;34m2\e[0m,
            dabra\e[0;37m = \e[0m\e[1;34m3\e[0m,
             abra\e[0;37m = \e[0m\e[1;34m1\e[0m
        >
      EOSTR
      expect(out).to be_similar_to(str)
    ensure
      AmazingPrint.force_colors = false
    end

    it 'with multine as false show inline values' do
      out = hello.ai(multiline: false, colors: :none, raw: true)
      str = <<~EOSTR.strip
        #<struct Hello:placeholder_id ca = 2, dabra = 3, abra = 1>
      EOSTR
      expect(out).to be_similar_to(str)
    end

    it 'without the sort_keys option does not sort fields' do
      out = hello.ai(colors: :none, raw: true, sort_keys: false)
      str = <<~EOSTR.strip
        #<struct Hello:placeholder_id
               ca = 2,
            dabra = 3,
             abra = 1
        >
      EOSTR
      expect(out).to be_similar_to(str)
    end

    it 'with the sort_keys option does sort fields' do
      out = hello.ai(colors: :none, raw: true, sort_keys: true)
      str = <<~EOSTR.strip
        #<struct Hello:placeholder_id
             abra = 1,
               ca = 2,
            dabra = 3
        >
      EOSTR
      expect(out).to be_similar_to(str)
    end

    it 'object_id' do
      out = hello.ai(colors: :none, raw: true, object_id: false)
      str = <<~EOSTR.strip
        #<struct Hello
               ca = 2,
            dabra = 3,
             abra = 1
        >
      EOSTR
      expect(out).to be_similar_to(str)
    end

    it 'class_name' do
      stub_const(
        'Hello',
        Struct.new(:abra, :ca, :dabra) do
          def to_s
            'CustomizedHello'
          end
        end
      )

      hello = Hello.new(1, 2, 3)
      out = hello.ai(colors: :none, raw: true, class_name: :to_s)
      str = <<~EOSTR.strip
        #<struct CustomizedHello:placeholder_id
             abra = 1,
               ca = 2,
            dabra = 3
        >
      EOSTR
      expect(out).to be_similar_to(str)
    end

    it 'empty struct instance' do
      stub_const('Empty', Struct.new)
      out = Empty.new.ai(colors: :none, raw: true)
      str = <<~EOSTR.strip
        #<struct Empty:placeholder_id

        >
      EOSTR
      expect(out).to be_similar_to(str)
    end

    it 'anonymous struct' do
      anon = Struct.new(:x, :y).new(1, 2)
      out = anon.ai(colors: :none, raw: true)
      expect(out).to match(/\A#<struct #<Class:0x[a-f\d]+>:0x[a-f\d]+\n {4}x = 1,\n {4}y = 2\n>\z/)
    end

    it 'with custom indent' do
      out = hello.ai(colors: :none, raw: true, indent: 2)
      str = <<~EOSTR.strip
        #<struct Hello:placeholder_id
             ca = 2,
          dabra = 3,
           abra = 1
        >
      EOSTR
      expect(out).to be_similar_to(str)
    end

    it 'nested struct' do
      stub_const('Inner', Struct.new(:val))
      stub_const('Outer', Struct.new(:inner, :name))
      outer = Outer.new(Inner.new(42), 'test')
      out = outer.ai(colors: :none, raw: true)
      str = <<~EOSTR.strip
        #<struct Outer:placeholder_id
            inner = #<struct Inner:placeholder_id
                val = 42
            >,
             name = "test"
        >
      EOSTR
      expect(out).to be_similar_to(str)
    end

    it 'circular reference' do
      stub_const('Node', Struct.new(:child))
      node = Node.new(nil)
      node.child = node
      out = node.ai(colors: :none, raw: true)
      str = <<~EOSTR.strip
        #<struct Node:placeholder_id
            child = {...}
        >
      EOSTR
      expect(out).to be_similar_to(str)
    end
  end

  if defined?(Data)
    describe 'Formatting a Data object' do
      let(:point) do
        stub_const('Point', Data.define(:x, :y))
        Point.new(x: 3, y: 7)
      end

      it 'attributes' do
        out = point.ai(colors: :none, raw: true)
        str = <<~EOSTR.strip
          #<data Point:placeholder_id
              x = 3,
              y = 7
          >
        EOSTR
        expect(out).to be_similar_to(str)
      end

      it 'colorized values' do
        AmazingPrint.force_colors!
        out = point.ai(raw: true)
        str = <<~EOSTR.strip
          #<data Point:placeholder_id
              x\e[0;37m = \e[0m\e[1;34m3\e[0m,
              y\e[0;37m = \e[0m\e[1;34m7\e[0m
          >
        EOSTR
        expect(out).to be_similar_to(str)
      ensure
        AmazingPrint.force_colors = false
      end

      it 'with multiline as false show inline values' do
        out = point.ai(multiline: false, colors: :none, raw: true)
        str = <<~EOSTR.strip
          #<data Point:placeholder_id x = 3, y = 7>
        EOSTR
        expect(out).to be_similar_to(str)
      end

      it 'with sort_keys' do
        out = point.ai(colors: :none, raw: true, sort_keys: true)
        str = <<~EOSTR.strip
          #<data Point:placeholder_id
              x = 3,
              y = 7
          >
        EOSTR
        expect(out).to be_similar_to(str)
      end

      it 'object_id: false' do
        out = point.ai(colors: :none, raw: true, object_id: false)
        str = <<~EOSTR.strip
          #<data Point
              x = 3,
              y = 7
          >
        EOSTR
        expect(out).to be_similar_to(str)
      end

      it 'class_name' do
        stub_const(
          'LabeledPoint',
          Data.define(:x, :y) do
            def to_s
              'CustomPoint'
            end
          end
        )

        lp = LabeledPoint.new(x: 5, y: 10)
        out = lp.ai(colors: :none, raw: true, class_name: :to_s)
        str = <<~EOSTR.strip
          #<data CustomPoint:placeholder_id
              x = 5,
              y = 10
          >
        EOSTR
        expect(out).to be_similar_to(str)
      end

      it 'with custom indent' do
        out = point.ai(colors: :none, raw: true, indent: 2)
        str = <<~EOSTR.strip
          #<data Point:placeholder_id
            x = 3,
            y = 7
          >
        EOSTR
        expect(out).to be_similar_to(str)
      end
    end
  end
end
