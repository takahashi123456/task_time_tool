class ViewTodayTask
  def view_today
    now_time = Time.now
    now_date = now_time.strftime("%Y%m%d")
    task_time = []
    Dir.glob(".#{now_date}**.txt") do |item|
      File.foreach(item){|line|
      task_time << line.chomp
        }
    end
    odd_task_time = task_time.each_slice(2).map(&:last)
    p odd_task_time
  end
end

