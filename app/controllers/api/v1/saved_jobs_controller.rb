class Api::V1::SavedJobsController < Api::V1::BaseController
  def create
    @saved_jobs = SavedJob.new(saved_jobs_params)
    @job = Job.find(@saved_jobs[:job_id])
    @saved_jobs.
  end

@rental = Rental.new(rental_params)
    @station = Station.find(@rental[:station_id])
    @rental.station = @station
    @station.update(availability: false)

    @user = User.find(params[:user_id])
    @rental.user = @user
    @rental.save


    render json: @rental

  def index

  end

  def delete
  end

end
