namespace :handle_recurrences do
  desc "Send mail for every passed recurrence"
  task perform: :environment do
    HandleRecurrences.perform
  end

end

