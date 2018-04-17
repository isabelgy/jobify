class Api::V1::QuestionsController < Api::V1::BaseController

  def index
    questions = Question.all
    @user = User.find(params[:user_id])
    @questions = questions.shift(@user.last_question_id)
  end

  def show

  end

end
