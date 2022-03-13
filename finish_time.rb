require "date"
require 'time'
class TaskFinishTime
  def get_finish_time
    now_finish_time = Time.now
    @string_finish_time = now_finish_time.strftime("%H:%M:%S")
    @finish_date = now_finish_time.strftime("%Y%m%d")
  end
#  タスク名と現在日時で検索し、時刻を抽出する
  def read_start_file
    self.get_finish_time
    file_name = @finish_date + ARGV[1]
    read_file = File.open(".#{file_name}.txt","r")
    read_file_string = read_file.read  
    read_file.close
    re = Regexp.new('\d{2}:\d{2}:\d{2}')
    @read_file_time = re.match(read_file_string)
  end

# タスク名と現在時刻、実績時間をコマンドラインに表示する
  def print_finish_time
    self.read_start_file
    end_time = Time.parse(@string_finish_time)
    start_time = Time.parse(@read_file_time[0])
    actual_time = Time.at(end_time - start_time).utc.strftime('%X')
    @fin_date = @finish_date
    @start_time_string = start_time.strftime("%H:%M:%S")
    @end_time_string = end_time.strftime("%H:%M:%S")
    @actual_time = actual_time
    p "タスク名: #{ARGV[1]} を #{@end_time_string} に終了しました。実績時間は #{actual_time}です。"
  end

  def output_finish_time
    self.print_finish_time
    file_name = @fin_date + ARGV[1]
    write_file = File.new(".#{file_name}.txt","a")
    write_file.puts "タスク名: #{ARGV[1]} 時間 #{@start_time_string} ~ #{@end_time_string}です。実績時間は#{@actual_time}"
    write_file.close
  end
end