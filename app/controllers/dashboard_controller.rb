class DashboardController < ApplicationController
  def index
    @about = Topic.find_by_title("about")
    @contact= Topic.find_by_title("contact")
    @job = Topic.find_by_title("job")
  end

end
