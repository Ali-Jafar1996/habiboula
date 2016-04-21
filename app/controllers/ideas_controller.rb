class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate, only: [:index, :empty_jobs]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @selectedjob = params[:role_check] || []
    @newparam = idea_params.merge(:user_id => current_user.id, :role => @selectedjob) #############
    @idea = Idea.new(@newparam) ##########
    #@idea = Idea.new(idea_params)  

    respond_to do |format|
      if @idea.save

        for i in 0..@selectedjob.length-1
          puts "xyzxyzxyzxyzxyzxyz"
          puts @selectedjob[i]

          @array = {}
          @array[:user_id] = 0
          @array[:idea_id] = @idea.read_attribute(:id)
          @array[:role_id] = @selectedjob[i]
          @array[:filled] = false
          @array[:created_id] = current_user.id
          @user_idea = Job.new(@array)
          @user_idea.save
        end

          # @array = {} ############
        # @array[:user_id] = current_user.id ############
        # @array[:idea_id] = @idea.read_attribute(:id) ##########
        # @array[:role_id] = @idea.user.role.read_attribute(:id) ####--#--#--#--# 

        # @user_idea = Job.new(@array) #########
        # @user_idea.save ##########

        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @jobs = Job.where(idea_id: @idea.id)

    @idea.destroy

    puts "yooooooooooo"
    puts @jobs

    for i in 0..@jobs.length-1
      @jobs[i].destroy
    end


    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:name, :description, :skills, :add_information, :user_id, :platform_id)
    end
end
