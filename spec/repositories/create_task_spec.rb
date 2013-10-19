require 'unit_spec_helper'

describe CreateTask do
  let(:repository) { CreateTask.new }
  let(:attributes) { stub }
  let(:task) { stub(persisted?: true) }

  it 'should delegate creation' do
    Task.expects(:create).with(attributes).returns(task)
    repository.create(attributes)
  end
end
