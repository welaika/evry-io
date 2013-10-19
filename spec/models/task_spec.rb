require 'model_spec_helper'

describe Task do
  context "using repository" do
    let(:attributes) do
      {
        time_expression: "every day",
        action: "go swimming"
      }
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
