require 'model_spec_helper'

describe Task do
  it { should validate_presence_of(:action) }
  it { should validate_presence_of(:time_expression) }
  it { should validate_presence_of(:user_id) }

  context "using repository" do
    let(:attributes) { build_attributes_for(:task) }

    class TimeZoneConverter
      def self.convert(moment, user)
        moment
      end
    end

    before do
      @now = Time.local(2013, 10, 19, 0, 0, 0)
      Timecop.freeze(@now)
    end

    it 'creates task and recurrence' do
      task = CreateTask.create(attributes)
      recurrence = task.recurrence

      expect(recurrence).to be_present
      expect(recurrence.expression).to eq("day")
      expect(recurrence.starting_at).to eq(@now)
      expect(recurrence.next_at).to eq(@now.advance(days: 1))
      expect(recurrence.until_at).to be_nil
    end

  end
end

