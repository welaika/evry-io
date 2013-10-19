require 'unit_spec_helper'

describe UpdateTask do
  let(:task) { stub }
  let(:service) { stub }
  let(:attributes) { stub }
  let(:repository) { UpdateTask.new(task) }

  before do
    task.stubs(:update_attributes).with(attributes).returns(true)
  end

  it 'parses again recurrence information' do
    SyncTaskRecurrence.expects(:new).with(task).returns(service)
    service.expects(:perform)
    repository.perform(attributes)
  end

end
