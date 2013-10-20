require 'unit_spec_helper'

describe SyncTaskRecurrence do
  context "add recurrence" do
    let(:task) { stub(id: 666, user: user, time_expression: 'time expression', errors: errors) }
    let(:user) { stub(time_zone: 'Europe/Rome') }
    let(:errors) { stub }
    let(:result) { stub_everything }
    let(:service) { SyncTaskRecurrence.new(task) }

    before do
      Recurrence.stubs(:sync_with_task)
    end

    it 'should parse the time expression using pickle' do
      Tickle.expects(:parse).with('time expression').returns(result)
      service.perform
    end

    it 'should add an error if Tickle fails to parse and destroy task' do
      Tickle.stubs(:parse).returns(nil)
      task.expects(:destroy)
      errors.expects(:add).with(:time_expression, I18n.t('activerecord.errors.models.task.attributes.time_expression.parse_failed'))
      service.perform
    end

    context "recurrence creation" do
      let(:moment) { Time.parse("2013-10-20 13:13:25") }

      let(:result) do
        {
          expression: "day",
          starting: moment,
          next: moment,
          until: moment
        }
      end

      before do
        Tickle.stubs(:parse).returns(result)
      end

      let(:moment_with_timezone) { stub }

      it 'should create the recurrence object' do
        TimeZoneConverter.expects(:convert).with(moment, task.user).returns(moment_with_timezone).at_least(3)

        Recurrence.expects(:sync_with_task).with(666, {
          expression: "day",
          starting_at: moment_with_timezone,
          next_at: moment_with_timezone,
          until_at: moment_with_timezone
        })

        service.perform
      end

    end
  end

end


