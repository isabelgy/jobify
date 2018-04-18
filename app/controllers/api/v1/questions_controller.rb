class Api::V1::QuestionsController < Api::V1::BaseController

  def index
    # @questions = Question.all
    @user = User.find(params[:user_id])
    @questions = Question.all[@user.last_question_id, 5]
  end

  def show

  end

end
