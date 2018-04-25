class Api::V1::UsersController < Api::V1::BaseController
  # require 'rest-client'
  # require 'pry-byebug'

  # respond_to :json

  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def create
    @user = (User.find_by openid: wechat_email) || User.new(user_wechat_params)

    # unless
     @user.save

    #  puts @user.openid
    # puts @user.password
    # puts @user.id
      # render_error
    # end
    render json: @user if @user.persisted?
  end

  def my_jobs
     @user = User.find(params[:id])
     render json: @user.jobs
  end

  def un_save
    @user = User.find(params[:user_id])
    @job = Job.find(params[:job_id])
    @user.favorite(@job).destroy
    @user.save
    @user.reload
  end



  def show
    @user = User.find(params[:id])
    unless @user.last_question_id == Question.first.id
      last_question = @user.questions.map {|q| q.id}
      @user.update(last_question_id: last_question.max)
    end
    score_and_tags
    @user.save
    @user.reload
    @user
  end

  private

  # def render_error
  #   render json: { errors: @rental.errors.full_messages },
  #     status: :unprocessable_entity
  # end

  def wechat_email

   @wechat_email ||= wechat_user.fetch('openid') + "@myapp.com"

  end

  def user_wechat_params
    @user_wechat_params ||= {}

   # GET both openid and session_key
    # @user_wechat_params = user_params
    @user_wechat_params['openid'] = wechat_email
    @user_wechat_params['password'] = wechat_user.fetch('session_key')
    @user_wechat_params
  end


  def wechat_user

    @wechat_response ||= RestClient.post(URL, wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
    @wechat_user
  end

  def wechat_params
    { appid: ENV.fetch("APPID"),
      secret: ENV.fetch("APPSECRET"),
      js_code: params[:code],
      grant_type: "authorization_code"}
  end

  def user_params
    params.require(:user).permit(:name, :openid, :password, :last_question_id, :tag_list, :i_trait_list, :ii_trait_list, :iii_trait_list, :iv_trait_list, :v_trait_list, :favorites)
  end

  # methods for calculating personality scores and adding tags

  def score_and_tags
    i_surgency_extraversion = 0
    ii_agreeableness = 0
    iii_conscientiousness = 0
    iv_emotional_stability = 0
    v_intellect_imagination = 0

#     @user = (User.find_by openid: wechat_email)

    @user.answers.all.each do |answer|
      primary_trait = answer.question.first_trait[/([A-Z])+/]
      secondary_trait = answer.question.second_trait[/([A-Z])+/]
      sign_primary = answer.question.first_trait[/\W/]
      sign_secondary = answer.question.second_trait[/\W/]
      primary_value = answer.question.first_value
      secondary_value = answer.question.second_value
      unless answer.swiped_yes
        primary_value = -(primary_value)
        secondary_value = -(secondary_value)
      end

      case primary_trait
      when "V"
      # checking if corresponding trait score is affected positively or negatively by the question
        sign_primary == "+" ? v_intellect_imagination += primary_value : v_intellect_imagination -= primary_value
      when "IV"
        sign_primary == "+" ? iv_emotional_stability += primary_value : iv_emotional_stability -= primary_value
      when "III"
        sign_primary == "+" ? iii_conscientiousness += primary_value : iii_conscientiousness -= primary_value
      when "II"
        sign_primary == "+" ? ii_agreeableness += primary_value : ii_agreeableness -= primary_value
      when "I"
        sign_primary == "+" ? i_surgency_extraversion += primary_value : i_surgency_extraversion -= primary_value
      end

      case secondary_trait
      when "V"
        sign_secondary == "+" ? v_intellect_imagination += secondary_value : v_intellect_imagination -= secondary_value
      when "IV"
        sign_secondary == "+" ? iv_emotional_stability += secondary_value : iv_emotional_stability -= secondary_value
      when "III"
        sign_secondary == "+" ? iii_conscientiousness += secondary_value : iii_conscientiousness -= secondary_value
      when "II"
        sign_secondary == "+" ? ii_agreeableness += secondary_value : ii_agreeableness -= secondary_value
      when "I"
        sign_secondary == "+" ? i_surgency_extraversion += secondary_value : i_surgency_extraversion -= secondary_value
      end


      if i_surgency_extraversion >= 6
        @user.i_trait_list = "outgoing, driven, assertive, sociable"
      elsif i_surgency_extraversion >= 3
        @user.i_trait_list = "outgoing, assertive"
      elsif i_surgency_extraversion >= 0
        @user.i_trait_list = "extraverted"
      elsif i_surgency_extraversion <= -5
        @user.i_trait_list = "loyal, indirect, non-conflicting"
      elsif i_surgency_extraversion <= -3
        @user.i_trait_list = "reserved, loyal"
      elsif i_surgency_extraversion <= 0
        @user.i_trait_list = "intraverted"
      end

      if ii_agreeableness >= 6
        @user.ii_trait_list = "talkative, empathetic, light-hearted, agreeable"
      elsif ii_agreeableness >= 3
        @user.ii_trait_list = "empathetic, warm-hearted"
      elsif ii_agreeableness >= 0
        @user.ii_trait_list = "collaborative"
      elsif ii_agreeableness <= -5
        @user.ii_trait_list = "independent, determined, direct"
      elsif ii_agreeableness <= -3
        @user.ii_trait_list = "self-going, direct"
      elsif ii_agreeableness <= 0
        @user.ii_trait_list = "independent"
      end

      if iii_conscientiousness >= 6
        @user.iii_trait_list = "responsible, structure-freak, perfectionist"
      elsif iii_conscientiousness >= 3
        @user.iii_trait_list = "responsible, thorough, detail-oriented"
      elsif iii_conscientiousness >= 0
        @user.iii_trait_list = "aware"
      elsif iii_conscientiousness <= -5
        @user.iii_trait_list = "flexible, can-improvise, great-under-pressure, risk-taker"
      elsif iii_conscientiousness <= -3
        @user.iii_trait_list = "flexible, details-don't-matter"
      elsif iii_conscientiousness <= 0
        @user.iii_trait_list = "trusting"
      end

      if iv_emotional_stability >= 6
        @user.iv_trait_list = "level-headed, risk-averse, unemotional"
      elsif iv_emotional_stability >= 3
        @user.iv_trait_list = "level-headed, unemotional"
      elsif iv_emotional_stability >= 0
        @user.iv_trait_list = "steady"
      elsif iv_emotional_stability <= -5
        @user.iv_trait_list = "easily-excited, passionate, emotional"
      elsif iv_emotional_stability <= -3
        @user.iv_trait_list = "passionate, risk-taker"
      elsif iv_emotional_stability <= 0
        @user.iv_trait_list = "expressive"
      end

      if v_intellect_imagination >= 6
        @user.v_trait_list = "thorough, cynical, perfectionist, out-of-the-box"
      elsif v_intellect_imagination >= 3
        @user.v_trait_list = "thorough, cynical, risk-averse"
      elsif v_intellect_imagination >= 0
        @user.v_trait_list = "analytical"
      elsif v_intellect_imagination <= -5
        @user.v_trait_list = "intuitive, quick-decisions, flexible, risk-taker"
      elsif v_intellect_imagination <= -3
        @user.v_trait_list = "flexible, practical"
      elsif v_intellect_imagination <= 0
        @user.v_trait_list = "fast-paced"
      end

      @user.tag_list = @user.v_trait_list + @user.iv_trait_list + @user.iii_trait_list + @user.ii_trait_list + @user.i_trait_list
      @user.save
    end
  end

end
