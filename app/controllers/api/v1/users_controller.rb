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

  def show
    @user = User.find(params[:id])
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
    params.require(:user).permit(:name, :openid, :password, :last_question_id)
  end

end
