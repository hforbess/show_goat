   #thius script calcualtes a time off set given a time in  and the number 
   #of minutes 
    TWENTY_FOUR_HOURS = 1440
    TWELVE_HOURS = 720
    ONE_HOUR = 60
def my_time( the_time, add_time )
    #TODO erorr checkingA
    arr = Array.new
    arr = the_time.split( ":")
    hour = arr[0].to_i
    minute = arr[1][0,2].to_i
    ampm = the_time.split(" ")[1]
    #reduce everything to 12 hours and then calculate meridian
    abs_hour_to_minute = hour * ONE_HOUR
    ampm_add = 0
    if ampm == 'PM'
         ampm_add = TWELVE_HOURS
    end
    abs_time_in_minutes = minute + abs_hour_to_minute
    calculated_minutes = abs_time_in_minutes + add_time + ampm_add
   #strip out extra days. Only need to worry about 12 hours
   strip_away_days  = calculated_minutes / TWENTY_FOUR_HOURS
   final_time = calculated_minutes - ( strip_away_days * TWENTY_FOUR_HOURS )
   ampm = 'AM'
   if final_time > TWELVE_HOURS
      ampm = 'PM'
      final_time = final_time - TWELVE_HOURS
   end

   final_hour = ( final_time / ONE_HOUR ).floor
   final_minute = sprintf '%02d', ( final_time % ONE_HOUR )
   final_hour.to_s + ":" + final_minute.to_s + " " + ampm
end
print my_time "09:30 AM",  1320

