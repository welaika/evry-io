require 'unit_spec_helper'

describe HandleRecurrences do
  let(:service) { HandleRecurrences.new }

  context "#recurrences" do
    it 'fetches all recurrences' do
      Recurrence.expects(:ready)
      service.recurrences
    end
  end

  context "#perform" do
    before do
      service.stubs(:recurrences).returns(recurrences)
    end

    let(:first) { stub }
    let(:second) { stub }
    let(:recurrences) do [ first, second ] end

    it 'should handle each recurrence' do
      service.expects(:handle_recurrence).with(first)
      service.expects(:handle_recurrence).with(second)
      service.perform
    end

    context "#send_mail_notification" do
      let(:mail) { stub }
      let(:recurrence) { stub(user: "alice", task: "cooking") }

      it 'sends an email to every recurrence' do
        RecurrenceMailer.expects(:notify).with("alice", "cooking").returns(mail)
        mail.expects(:deliver)
        service.send_mail_notification(recurrence)
      end
    end

    context "#set_last_at" do
      let(:recurrence) { stub(next_at: 'paperino') }

      it 'set last_at to next_at' do
        recurrence.expects(:update_attributes).with(last_at: recurrence.next_at)
        service.set_last_at(recurrence)
      end
    end

    context "#reset_next_at" do
      let(:recurrence) { stub }

      it 'resets next_at to nil' do
        recurrence.expects(:update_attributes).with(next_at: nil)
        service.reset_next_at(recurrence)
      end
    end

  end

end
