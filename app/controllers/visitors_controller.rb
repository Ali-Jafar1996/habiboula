class VisitorsController < ApplicationController
	#before_action :set_idea, only: [:show, :edit, :update, :destroy]
	skip_before_action :authenticate

  def index
    @jobs = Job.all
  end

  def show
  end

end
