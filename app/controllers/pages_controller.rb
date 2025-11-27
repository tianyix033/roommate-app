class PagesController < ApplicationController
  def home
    @routes =
      Rails.application.routes.routes.map do |route|
        next if route.internal?

        verb = route.verb&.gsub(/\s/, "")
        path = route.path.spec.to_s.sub(/\(\.:format\)/, "")
        controller = route.defaults[:controller]
        action = route.defaults[:action]

        next if verb.blank? || path.blank? || controller.blank? || action.blank?

        {
          name: route.name,
          verb: verb,
          path: path,
          controller: controller,
          action: action
        }
      end.compact.uniq { |r| [r[:verb], r[:path]] }.sort_by { |r| [r[:path], r[:verb]] }

    render layout: false
  end
end
