class Challenger

  def initialize(code,name)
    @code = code
    @name = name
  end

  def name
    @name
  end

  def choice(record, cooperate_score, defect_score, win_score, lose_score)
   eval(@code)

  end
end