class Api::V1::AnswersController < Api::V1::BaseController

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @user = User.find(params[:user_id])
    @answer.user = @user
    @answer.question = @question
    @answer.save
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :swiped_yes)
  end

end
