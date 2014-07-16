class TopicsController < ApplicationController
  before_action :set_topic, only: [:show]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.published
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    update_clicks
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def update_clicks
      @topic.clicks += 1
      @topic.save
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :content, :clicks, :status)
    end
end
