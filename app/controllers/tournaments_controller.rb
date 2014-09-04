class TournamentsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new


    # Scoring!
    cooperate_score = 6
    defect_score = -17
    win_score = 3
    lose_score = -1
    @users = User.all
    users = []

    @round_players = []
    @round_winners = []

    count = @users.length


    @users.each do |user|
      users.push(user)
    end

    count = users.length

    while count > 1

      @challenger_array = users.shuffle

      @round_players.push(@challenger_array.dup)

      @results = []
      @winners = []
      odd = false

      challenger = 0

      while count > 0 # @challenger_array.length
        round = 0
        challenger1 = @challenger_array[challenger]

        if (1 != count) && (count.even?)
          challenger2 = @challenger_array[challenger + 1]
        elsif (1 == count) && (count.odd?)
          odd = true
          challenger2 = @challenger_array[challenger]
        else
          challenger2 = @challenger_array[challenger + 1]
        end

        challenger1_record = []
        challenger2_record = []

        p1 = Challenger.new(challenger1.code, challenger1.name)
        p2 = Challenger.new(challenger2.code, challenger2.name)

        @p1last_five = []
        @p2last_five = []

        while round < 100

          p1choice = p1.choice(challenger1_record, cooperate_score, defect_score, win_score, lose_score)
          p2choice = p2.choice(challenger2_record, cooperate_score, defect_score, win_score, lose_score)

          @p1last_five.push(p1choice)
          @p2last_five.push(p2choice)

          # Screw you hackers!
          !!p1choice
          !!p2choice

          five_in_row = false

          if (round > 5) && (round < 95)
            if @p1last_five.uniq.length == 1
              challenger1_record.push(-30)
              challenger2_record.push(10)
              five_in_row = true
            else
              five_in_row = false
            end
            if @p2last_five.uniq.length == 1
              challenger2_record.push(-30)
              challenger1_record.push(10)
              five_in_row = true
            else
              five_in_row = false
            end
            @p1last_five.shift
            @p1last_five.shift
          end

          if !five_in_row
            if p1choice

              if p2choice
                challenger1_record.push(cooperate_score)
                challenger2_record.push(cooperate_score)


              elsif !p2choice
                challenger1_record.push(lose_score)
                challenger2_record.push(win_score)

              end

            elsif !p1choice
              if p2choice
                challenger1_record.push(win_score)
                challenger2_record.push(lose_score)

              elsif !p2choice
                challenger1_record.push(defect_score)
                challenger2_record.push(defect_score)

              end

            end
          end

          round += 1

          @record1 = challenger1_record
          @record2 = challenger2_record

        end


        challenger += 2

        count -= 2

        player1_final = challenger1_record.inject { |sum, x| sum + x }
        player2_final = challenger2_record.inject { |sum, x| sum + x }

        if player1_final >= player2_final
          @winners.push(challenger1)
        else
          @winners.push(challenger2)
        end

        @results.push([challenger1.name, player1_final])
        if count != 1
          @results.push([challenger2.name, player2_final])
        end

        @winners
      end

      @round_winners.push(@results.dup)
      p "-"*80
      p @winners
      p "="*80

      users = @winners
      count = users.length
    end

    @round_winners.push(["Winner!"])
    @round_players.push(@winners.dup)

  end

  # GET /users/1/edit
  def edit

    # Scoring!
    cooperate_score = 3
    defect_score = -4
    win_score = 7
    lose_score = -1
    @users = User.all
    users = []

    @round_players = []
    @round_winners = []

    count = @users.length


    @users.each do |user|
      users.push(user)
    end

    count = users.length

    while count > 1

      @challenger_array = users.shuffle

      @round_players.push(@challenger_array.dup)

      @results = []
      @winners = []
      odd = false

      challenger = 0

      while count > 0 # @challenger_array.length
        round = 0
        challenger1 = @challenger_array[challenger]

        if (1 != count) && (count.even?)
          challenger2 = @challenger_array[challenger + 1]
        elsif (1 == count) && (count.odd?)
          odd = true
          challenger2 = @challenger_array[challenger]
        else
          challenger2 = @challenger_array[challenger + 1]
        end

        challenger1_record = []
        challenger2_record = []

        p1 = Challenger.new(challenger1.code, challenger1.name)
        p2 = Challenger.new(challenger2.code, challenger2.name)

        while round < 100

          p1choice = p1.choice(challenger1_record, cooperate_score, defect_score, win_score, lose_score)
          p2choice = p2.choice(challenger2_record, cooperate_score, defect_score, win_score, lose_score)


          # Screw you hackers!
          !!p1choice
          !!p2choice

          if p1choice

            if p2choice
              challenger1_record.push(cooperate_score)
              challenger2_record.push(cooperate_score)


            elsif !p2choice
              challenger1_record.push(lose_score)
              challenger2_record.push(win_score)

            end

          elsif !p1choice
            if p2choice
              challenger1_record.push(win_score)
              challenger2_record.push(lose_score)

            elsif !p2choice
              challenger1_record.push(defect_score)
              challenger2_record.push(defect_score)

            end

          end

          round += 1

          @record1 = challenger1_record
          @record2 = challenger2_record

        end


        challenger += 2

        count -= 2

        player1_final = challenger1_record.inject { |sum, x| sum + x }
        player2_final = challenger2_record.inject { |sum, x| sum + x }

        if player1_final >= player2_final
          @winners.push(challenger1)
        else
          @winners.push(challenger2)
        end

        @results.push([challenger1.name, player1_final])
        if count != 1
          @results.push([challenger2.name, player2_final])
        end

        @winners
      end

      @round_winners.push(@results.dup)
      p "-"*80
      p @winners
      p "="*80

      users = @winners
      count = users.length
    end

    @round_winners.push(["Winner!"])
    @round_players.push(@winners.dup)

  end
end