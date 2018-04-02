puts "単一ファイル画像比率計算プログラム made by kazuya yuda"
puts "ファイル名を入力してください（拡張子必要）"
#File.open()
filename = gets.chomp.to_s
p width = `identify -format "%w" #{filename}`.to_i
p hight = `identify -format "%h" #{filename}`.to_i

base = width + hight
hirituW = width / base.to_f  * 100
hirituH = hight / base.to_f  * 100

puts "#{hirituW.round}:#{hirituH.round}"
