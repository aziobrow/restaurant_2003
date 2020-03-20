class Restaurant
  attr_reader :opening_time, :name, :dishes

  def initialize(open_time_parameter, name_parameter)
    @opening_time = open_time_parameter
    @name = name_parameter
    @dishes = []
  end

  def closing_time(hours_open)
    closing_hour = @opening_time.to_i + hours_open
    closing_hour.to_s + ":00"
  end

  def add_dish(dish_name)
    @dishes << dish_name
  end

  def open_for_lunch?
    @opening_time.to_i < 12
  end

  def menu_dish_names
    @dishes.map { |dish| dish.upcase }
  end

  def announce_closing_time(hours_open)
    closing_hour = closing_time(hours_open)
    time_suffix = "PM"

    if closing_hour.to_i < 12
      time_suffix = "AM"
    end

    if closing_hour.to_i > 12
      closing_hour = (closing_hour.to_i - 12).to_s + ":00"
    end

    "#{name} will be closing at #{closing_hour}#{time_suffix}"
  end
end
