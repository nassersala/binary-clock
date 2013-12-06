class Clock
  def convert_time(time)
    time_strings = [time.hour, time.min, time.sec].map(&:to_s)

    ######
    #time_strings = ["10", "1", "59"]
    #####

    prepended_zero = prepend_zero_for(time_strings)

    whole_time = ''
    prepended_zero.each do |time_part| #h m s
     whole_time << convert_first_digit(time_part)
     whole_time << convert_second_digit(time_part)
    end
    whole_time
  end

  def prepend_zero_for(time_strings)
    prepended_zero = []
    time_strings.each do |number|
      if number.to_i < 10
        prepended_zero << '0' + number 
      else
        prepended_zero << number
      end
    end
    prepended_zero
  end

  def convert_first_digit(time_part)
    convert(time_part[0].to_i)
  end
  
  def convert_second_digit(time_part)
    convert(time_part[1].to_i)
  end

  CONVERSIONS = [ 
    [9, '1001'], 
    [8, '1000'], 
    [7, '0111'], 
    [6, '0110'], 
    [5, '0101'], 
    [4, '0100'], 
    [3, '0011'], 
    [2, '0010'], 
    [1, '0001'], 
    [0, '0000']
  ]

  def conversion_factors_for(number)
    CONVERSIONS.find { |base_ten, _| base_ten <= number } 
  end

  def convert(number)
    real, binary = conversion_factors_for(number)
    binary 
  end
end

class BinaryClockDrawer
  def initialize(clock)
    @clock = clock
  end

  def draw_time
    loop do 
      time_in_binary =  @clock.convert_time(Time.now)
      tm_array = time_in_binary.scan(/..../) 


#      tm_array.each do |time_part|
#       time_part.scan(/./).each_with_index do |digit, index|
#         puts time_part
#       end
#      end

      hour_coulmn1 =  tm_array[0]
      hour_coulmn2 =  tm_array[1]

      minute_coulmn1 =  tm_array[2]
      minute_coulmn2 =  tm_array[3]

      seconds_coulmn1 =  tm_array[4]
      seconds_coulmn2 =  tm_array[5]

      puts hour_coulmn1[0] + " " + hour_coulmn2[0] + " " + minute_coulmn1[0] + " " + minute_coulmn2[0] + " " + seconds_coulmn1[0] + " " + seconds_coulmn2[0]
      puts hour_coulmn1[1] + " " + hour_coulmn2[1] + " " + minute_coulmn1[1] + " " + minute_coulmn2[1] + " " + seconds_coulmn1[1] + " " + seconds_coulmn2[1]
      puts hour_coulmn1[2] + " " + hour_coulmn2[2] + " " + minute_coulmn1[2] + " " + minute_coulmn2[2] + " " + seconds_coulmn1[2] + " " + seconds_coulmn2[2]
      puts hour_coulmn1[3] + " " + hour_coulmn2[3] + " " + minute_coulmn1[3] + " " + minute_coulmn2[3] + " " + seconds_coulmn1[3] + " " + seconds_coulmn2[3]

      sleep(1)
      system "clear"
    end
  end
end


BinaryClockDrawer.new(Clock.new).draw_time
