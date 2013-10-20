namespace :guest do
  desc "Setup Guest User"
  task reset: :environment do
    User.where(is_guest: true).destroy_all
    guest = User.create(
      email: "evry.guest@mailinator.com",
      password: "gu3st1s4w3s0m3",
      is_guest: true
    )

    CreateTask.create({
      user_id: guest.id,
      time_expression: "Every Monday",
      action: "go to the gym."
    })

    CreateTask.create({
      user_id: guest.id,
      time_expression: "Every month",
      action: "do the cleaning."
    })

    CreateTask.create({
      user_id: guest.id,
      time_expression: "Every day",
      action: "do the homework."
    })

    CreateTask.create({
      user_id: guest.id,
      time_expression: "Every 6 months",
      action: "update my resume."
    })

    unscheduled = CreateTask.create({
      user_id: guest.id,
      time_expression: "Every day",
      action: "buy milk"
    })

    unscheduled.recurrence.update_attribute(:next_at, nil)
  end
end


