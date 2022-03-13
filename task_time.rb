require "date"

# ARGV[0] == -sの場合のクラス
# コマンドラインにタスク名と現在時刻を出力し、後のために時刻のフォーマットを整える
class TaskTime
  def get_time
    now_time = Time.now
    @string_time = now_time.strftime("%H:%M:%S")
    @now_date = now_time.strftime("%Y%m%d")
  end
#   タスク名と開始時刻をファイルに出力
  def output_time
    self.get_time
    file_name = @now_date + ARGV[1]
    write_file = File.new(".#{file_name}.txt","w")
    write_file.puts "タスク名 #{ARGV[1]} 開始時間 #{@string_time}"
    write_file.close
  end
end
