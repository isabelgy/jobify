class Api::V1::QuestionsController < Api::V1::BaseController

  def index
    questions = Question.all
    @user = User.find_by(openid: params[:openid])
    @questions = questions.shift(@user.last_question_id)
  end

  def show

  end

end
