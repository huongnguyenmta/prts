class PullRequestsController < ApplicationController
  def index
    @pull_requests = PullRequest.order created_at: :desc
  end

  def destroy
    @pull_request = PullRequest.find_by id: params[:id]

    if @pull_request.destroy
      flash[:success] = "Destroy successful"
    else
      flash[:notice] = "Destroy failed"
    end
    redirect_to request.referrer
  end
end
