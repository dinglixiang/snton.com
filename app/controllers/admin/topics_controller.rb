class Admin::TopicsController < ApplicationController
  before_action :set_admin_topic, only: [:show, :edit, :update, :destroy]

  # GET /admin/topics
  # GET /admin/topics.json
  def index
    @admin_topics = Admin::Topic.all
  end

  # GET /admin/topics/1
  # GET /admin/topics/1.json
  def show
  end

  # GET /admin/topics/new
  def new
    @admin_topic = Admin::Topic.new
  end

  # GET /admin/topics/1/edit
  def edit
  end

  # POST /admin/topics
  # POST /admin/topics.json
  def create
    @admin_topic = Admin::Topic.new(admin_topic_params)

    respond_to do |format|
      if @admin_topic.save
        format.html { redirect_to @admin_topic, notice: 'Topic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/topics/1
  # PATCH/PUT /admin/topics/1.json
  def update
    respond_to do |format|
      if @admin_topic.update(admin_topic_params)
        format.html { redirect_to @admin_topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/topics/1
  # DELETE /admin/topics/1.json
  def destroy
    @admin_topic.destroy
    respond_to do |format|
      format.html { redirect_to admin_topics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_topic
      @admin_topic = Admin::Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_topic_params
      params.require(:admin_topic).permit(:title, :content, :clicks)
    end
end
