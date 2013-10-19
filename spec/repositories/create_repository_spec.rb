require 'unit_spec_helper'

describe CreateRepository do
  let(:repository) { CreateRepository.new }
  let(:attributes) { stub }
  let(:klass) { stub }
  let(:buy) { stub(:persisted? => true) }

  before do
    repository.stubs(:klass).returns(klass)
    repository.stubs(:after_create_hooks).returns([])
  end

  context "#create" do
    it 'sanitizes and delegates object creation' do
      repository.expects(:sanitize_attributes!).with(attributes)
      klass.expects(:create).with(attributes).returns(buy)
      repository.create(attributes)
    end

    context "#after_create_hooks" do
      class ExampleCallback
        cattr_accessor :count

        def initialize(model)
          @@count ||= 0
        end

        def perform
          @@count += 1
        end
      end

      context 'when object is created successfully' do
        before do
          repository.stubs(:after_create_hooks).returns([ ExampleCallback ])
          klass.stubs(:create).with(attributes).returns(buy)
        end

        it 'runs callbacks' do
          repository.create(attributes)
          expect(ExampleCallback.count).to be(1)
        end

      end
    end
  end

end
