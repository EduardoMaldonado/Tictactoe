class Board 
    def initialize
        @a=[1,2,3,4,5,6,7,8,9]
    end

    def draw
    	puts""
    	puts "#{@a[0]} | #{@a[1]} | #{@a[2]}"
        puts "--|---|--"
        puts "#{@a[3]} | #{@a[4]} | #{@a[5]}"
        puts "--|---|--"
        puts "#{@a[6]} | #{@a[7]} | #{@a[8]}"
    end

    def turn (move, player)
    		@@move_count=0
	    	if move<1 || move>9
	    		puts "Invalid move, please choose an unselected place between 1 and 9"
	    		return false
	    	else
	    		if @a[move-1].is_a? Numeric
	    			@a[move-1]=player.mark
	    			return true
	    			@@move_count+=1
	    		else
	    			puts "This spot is taken, select another one"
	    			return false
	    		end
	    	end
	end

    def check_win
    	win=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    	winner=false

    	win.each do |win_combinations|
    		if @a[win_combinations[0]]==@a[win_combinations[1]] && @a[win_combinations[0]]==@a[win_combinations[2]]
    			winner=true
    		end
    	end
    	return winner
    end
    

end

class Players_c
	attr_accessor :name, :mark
	@@player_number=0

	def initialize
		@@player_number+=1
		setup
	end

	def setup
		puts ""
		puts "what is your name"
		@name=gets.chomp
		@mark=@@player_number==1? "X" : "O"
	end
end

class Game
	
	def initialize
		@board=Board.new
		@board.draw
		@players=[]
		@players << Players_c.new << Players_c.new
		@player_id=0
	end

	def play
		counter=0
		loop do
		puts ""
		puts "#{@players[@player_id].name} put your #{@players[@player_id].mark}"
		move=gets.chomp.to_i
			if @board.turn(move,@players[@player_id])
				@board.draw
				if @board.check_win
					puts "Congratulations #{@players[@player_id].name} you win"
					break
				elsif counter==8
					puts "It is a tie!"
					break
				end
				counter+=1
			@player_id=@player_id==0? 1:0
			end
		end
	end
end

Game.new.play













