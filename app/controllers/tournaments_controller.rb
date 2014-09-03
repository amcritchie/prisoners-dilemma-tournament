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
    cooperate_score = 100
    defect_score = -100
    win_score = 500
    lose_score = -600

    @winners = []

    @users = User.all
    users = []
    count = @users.length

    @users.each do |user|
      users.push(user)
    end


    count = @users.length


    @challenger_array = users.shuffle


    challenger = 0

    while count > 0 # @challenger_array.length
      round = 0
      challenger1 = @challenger_array[challenger]

      if (1 != count) && (count.even?)
      challenger2 = @challenger_array[challenger + 1]
      elsif (1 == count) && (count.odd?)
        challenger2 = @challenger_array[challenger]
      else
        challenger2 = @challenger_array[challenger + 1]
      end

      challenger1_record = []
      challenger2_record = []

      p1 = Challenger.new(challenger1.code, challenger1.name)
      p2 = Challenger.new(challenger2.code, challenger2.name)

      while round < 10

        p1choice = p1.choice(challenger1_record, cooperate_score, defect_score, win_score, lose_score)
        p2choice = p2.choice(challenger2_record, cooperate_score, defect_score, win_score, lose_score)

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
        @winners.push(challenger1.name)
      else
        @winners.push(challenger2.name)
      end

      @winners
    end

    # GET /users/1/edit
    def edit
    end


  end
end