class RailheadPreheatController < ActionController::Metal
  include AbstractController::Rendering
  include AbstractController::Helpers
  include ActionController::Caching
  include ActionView::Layouts

  def initialize(*args)
    super()
    self.class.send :include, Rails.application.routes.url_helpers
    self.class.send :helper, ApplicationHelper
    lookup_context.view_paths = ApplicationController.view_paths
    config.cache_store = ActionController::Base.cache_store
  end
end


module RailheadPreheat

  def preheat(locals = {})
    RailheadPreheatController.new.render_to_string(self.reload, locals: locals)
  end
end


ActiveRecord::Base.send :include, RailheadPreheat
