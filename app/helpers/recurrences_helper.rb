module RecurrencesHelper
  def recurrence_human_next_at(recurrence)
    recurrence_human_date(recurrence, :next_at, "Not planned yet")
  end

  def recurrence_human_last_at(recurrence)
    recurrence_human_date(recurrence, :last_at, "Not reminded yet")
  end

  def recurrence_human_date(recurrence, field, empty_message)
    date = recurrence.send(field)

    if date.present?
      content_tag :span, class: "popup", data: { tip: human_date(date) } do
        distance_of_time_in_words(Time.now, date)
      end
    else
      content_tag :span do
        empty_message
      end
    end
  end

end
