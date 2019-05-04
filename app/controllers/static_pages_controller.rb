class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
    @micropost = current_user.microposts.build
    @feed_items = Micropost.feed(current_user).micropost_desc.paginate(
      page: params [:page],
      per_page: Settings.mocropost.per_page
    )
  end

  def help; end

  def about; end

  def contact; end
end
