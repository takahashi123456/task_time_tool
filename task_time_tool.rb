#!/Users/hasebe/.rbenv/shims/ruby
# 上記は自分のrubyのパスを書いてください。
require './task_time'
require './finish_time'
require './view_time'

case ARGV[0]
  when "-s" then
    start_task = TaskTime.new()
    start_task.output_time
  when "-f" then
    finish_task = TaskFinishTime.new()
    finish_task.output_finish_time
  when "-vt" then 
    view_today_task = ViewTodayTask.new()
    view_today_task.view_today
end