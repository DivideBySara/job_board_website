class JobsController < ApplicationController
	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end

	def create
		p "In the create method!"
		Job.create (job_params)
		p job = @job
		redirect_to jobs_path
	end

	def job_params		
		params.require(:job).permit(:title, :description, :timestamps)
	end

	def edit
    	@job = Job.find(params[:id])
    end

    def update
    	@job = Job.find(params[:id])   	
  		@job.update_attributes(job_params)
    	#redirect_to jobs_path
    	redirect_to job_path(@job)
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to jobs_path
	end

	def show
		@job = Job.find(params[:id])
	end

end
