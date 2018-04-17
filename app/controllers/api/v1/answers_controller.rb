class Api::V1::AnswersController < Api::V1::BaseController

  def create
    @answer = Answer.new(answer_params)
    @answer.save
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :swiped_yes)
  end

end
