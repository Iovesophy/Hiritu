class Hiritu

	def print
		puts "***********************************************************"
		puts "| 複数ファイル画像比率計算プログラム made by kazuya yuda  |"
		puts "***********************************************************"
		puts "対象ファイルをディレクトリへ入れましたか？(y,n,q)"
		ans = gets; if ans == "q\n"; exit; end
		if ans != "y\n"
			puts "エラー（そのようなコマンドは存在しません）"
			exit
		end
		return ans
	end

	def initial()
		@count = 0
		@avewsum = 0
		@avehsum = 0
			system("ls -v > .list.txt")
	end

	def body(filename)
		width = `identify -format "%w" #{filename}`.to_i
		hight = `identify -format "%h" #{filename}`.to_i
		base = width + hight
		hirituW = width / base.to_f  * 100
		hirituH = hight / base.to_f  * 100
		#puts "#{hirituW.round}:#{hirituH.round}"
	end

	def ave(filename)
		@count += 1
		width = `identify -format "%w" #{filename}`.to_i
		hight = `identify -format "%h" #{filename}`.to_i
		base = width + hight
		hirituaveW = width / base.to_f * 100
		hirituaveH = hight / base.to_f * 100
		@avewsum += hirituaveW 
		@avehsum += hirituaveH
	end


	def fileread(filename)
	    File.open(filename,"r") do |f|
		f.each_line do |d|
			if d == "hirituAll.rb\n"
				puts "programfileは対象外です"
				puts d
			else
				data = d
				#body(d)
				#平均プログラム呼び出し
				ave(d)
			end
		end	
	    end
	end

	def calc()
		puts "横平均"
		@count - 1
		h1 = @avewsum / @count
		p h1.round
		puts "縦平均"
		h2 = @avehsum / @count
		p h2.round
	end


end

sum = Hiritu.new()

ans = sum.print()

listname = ".list.txt"

sum.initial()

"y\n" == ans ? sum.fileread(listname) : exit;

sum.calc()

