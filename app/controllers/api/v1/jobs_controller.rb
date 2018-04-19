class Api::V1::JobsController < Api::V1::BaseController

  def index
    # @jobs = Job.all
    # finding jobs based on user tag_list
    @user = User.find(params[:id])
    @jobs = Job.tagged_with([@user.tag_list], :any => true)

    @tags = []
    @jobs.each do |job|
      @user.tag_list.each do |tag|
        (@tags << tag) if job.tag_list.include?("#{tag}")
      end
    end
    @tags
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    # @job.tag_list = "#{params[:tags]}"
    @user = User.find(params[:user_id])
    @job.user = @user
    @job.tag_list = params[:tag_list]
    @job.save
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
  end

  def edit
     @job = Job.find(params[:id])
  end

  private
  def job_params
    params.require(:job).permit(:title, :company, :description, :image, :location, :salary, :email, :phone, :wechat, :attachment, :user_id, :tag_list)
  end

end
