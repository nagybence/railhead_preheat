class RailheadPreheatController < ActionController::Metal
  include AbstractController::Rendering
  include AbstractController::Helpers
  include ActionController::Caching
  include ActionView::Layouts

  def initialize(*args)
    super()
    lookup_context.view_paths = ApplicationController.view_paths
  end
end


module RailheadPreheat

  def preheat(locals = {})
    RailheadPreheatController.new.render_to_string(self, locals: locals)
  end
end


ActiveRecord::Base.send :include, RailheadPreheat