require 'unit_spec_helper'

describe CreateTask do
  let(:repository) { CreateTask.new }
  let(:attributes) { stub }
  let(:task) { stub(persisted?: true) }

  before do
    repository.stubs(:after_create_hooks).returns([])
  end

  it 'should delegate creation' do
    Task.expects(:create).with(attributes).returns(task)
    repository.create(attributes)
  end
end

