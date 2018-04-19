class Api::V1::QuestionsController < Api::V1::BaseController

  def index
    # @questions = Question.all
    @user = User.find(params[:user_id])
    @questions = Question.where("id > ?", @user.last_question_id).limit(5)
  end

  def show

  end

end
