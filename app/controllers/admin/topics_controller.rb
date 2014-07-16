class Admin::TopicsController < AdminController
  before_action :set_admin_topic, only: [:show, :edit, :update, :destroy]
  before_action :find_topic, only: [:publish, :ban]

  # GET /admin/topics
  # GET /admin/topics.json
  def index
    @admin_topics = Topic.all
  end

  def published
    @admin_topics = Topic.published
  end

  def drafted
    @admin_topics = Topic.drafted
  end

  def banned
    @admin_topics = Topic.banned
  end

  def publish
    @topic.publish
    redirect_to admin_topics_path
  end

  def ban
    @topic.ban
    redirect_to admin_topics_path
  end

  # GET /admin/topics/1
  # GET /admin/topics/1.json
  def show
  end

  # GET /admin/topics/new
  def new
    @admin_topic = Topic.new
  end

  # GET /admin/topics/1/edit
  def edit
  end

  # POST /admin/topics
  # POST /admin/topics.json
  def create
    @admin_topic = Topic.new(admin_topic_params)

    respond_to do |format|
      if @admin_topic.save
        format.html { redirect_to admin_topics_path, notice: 'Topic was successfully created.' }
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
    def find_topic
      @topic = Topic.find(params[:format])
    end
    def set_admin_topic
      @admin_topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_topic_params
      params.require(:topic).permit(:title, :content, :clicks, :status)
    end
end
