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

  context "add recurrence" do
    let(:task) { stub(id: 666, time_expression: 'time expression', errors: errors) }
    let(:errors) { stub }
    let(:service) { AddRecurrence.new(task) }
    let(:result) { stub_everything }

    before do
      Recurrence.stubs(:create)
    end

    it 'should parse the time expression using pickle' do
      Tickle.expects(:parse).with('time expression').returns(result)
      service.perform
    end

    it 'should add an error if Tickle fails to parse' do
      Tickle.stubs(:parse).returns(nil)
      errors.expects(:add).with(:time_expression, I18n.t('activerecord.errors.models.task.attributes.time_expression.parse_failed'))
      service.perform
    end

    context "recurrence creation" do
      let(:moment) { Time.parse("2013-10-20 13:13:25") }

      let(:result) do
        OpenStruct.new({
          expression: "day",
          starting: moment,
          next: moment,
          until: moment
        })
      end

      before do
        Tickle.stubs(:parse).returns(result)
      end

      it 'should create the recurrence object' do
        Recurrence.expects(:create).with({
          task_id: 666,
          expression: "day",
          starting_at: moment,
          next_at: moment,
          until_at: moment
        })

        service.perform
      end

    end
  end

end

