class Api::V1::SavedJobsController < Api::V1::BaseController

  # def create
  #   @saved_job = SavedJob.new(saved_jobs_params)
  #   @job = Job.find(@saved_jobs[:job_id])
  #   @saved_job.job  = @job
  #   @user = User.find(params[:user_id])
  #   @saved_job.user = @user
  #   @saved_job.save

  #   render json: @saved_job
  # end


  def create
    @job = Job.find(params[:job_id])
    @user = User.find(params[:user_id])
    @user.favorite @job
    @user.save
  end

    def saved_jobs
      @user = User.find(params[:id])
      render json: @user.favorited_jobs
    end


  def destroy
    @saved_job = SavedJob.find(params[:id])
    @saved_job.destroy
  end

  private
  def saved_jobs_params
   params.require(:saved_job).permit(:job_id, :user_id)
  end

end
