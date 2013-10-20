namespace :handle_recurrences do
  desc "Send mail for every passed recurrence"
  task perform: :environment do
    HandleRecurrences.perform
  end

  task daemon: :environment do
    while true
      sleep 10
      HandleRecurrences.perform
    end
  end

end

