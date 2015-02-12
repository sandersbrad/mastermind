class MasterMind

	def initialize
		puts "Would you like to guess or create?"
		@user_preference = gets.chomp.downcase
		@secret_code = []
		@code_guess = []
		@compare_results = []
		if @user_preference == "guess"
			play_game_guess
		elsif @user_preference == "create"
			play_game_create
		else
			puts "That is not a valid response"
			MasterMind.new
		end
	end

	def code_generator
		4.times do 
			x = rand(6)
			case x
			when x = 0
				@secret_code << "blue"
			when x = 1
				@secret_code << "green"
			when x = 2
				@secret_code << "red"
			when x = 3
				@secret_code << "yellow"
			when x = 4
				@secret_code << "orange"
			when x = 5
				@secret_code << "purple"
			end
		end
		return @secret_code
	end

	def code_breaker
		@code_guess = []
		4.times do
			puts "What color would you like to guess? (red, blue, green, yellow, orange or purple)"
			guess = gets.chomp.downcase
			until guess == "blue" || guess == "green" || guess == "red" || guess == "yellow" || guess == "orange" || guess == "purple"
				puts "That is an invalid entry.  Try again"
				guess = gets.chomp.downcase
			end
				@code_guess << guess
		end
		p @code_guess
	end

	def compare_codes
		p @secret_code
		@temp = @secret_code.clone
		@compare_results = []
		if @code_guess == @secret_code
			puts "Congratulations!  You Win!"
			@compare_results = ["black","black","black","black"]
		else
			if @temp[0]==@code_guess[0]
				@compare_results << "black"
				@code_guess[0]="guess"
				@temp[0]="temp"
			end
			if @temp[1]==@code_guess[1]
				@compare_results << "black"
				@code_guess[1]="guess"
				@temp[1]="temp"
			end
			if @temp[2]==@code_guess[2]
				@compare_results << "black"
				@code_guess[2]="guess"
				@temp[2]="temp"
			end
			if @temp[3]==@code_guess[3]
				@compare_results << "black"
				@code_guess[3]="guess"
				@temp[3]="temp"
			end
			@code_guess.each do |x|
				if @temp.include? x
					@compare_results << "white"
				end
			end
			p @compare_results
		end
	end

	def play_game_guess
		code_generator
		counter = 0
		until @compare_results == ["black","black","black","black"]
			code_breaker
			compare_codes
		end
	end
end

test = MasterMind.new