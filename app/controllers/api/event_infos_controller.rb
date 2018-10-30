class Api::EventInfosController < ApplicationController
  def index
    @event_infos = EventInfo.search(params['currentType'], params['currentDate'], params['currentTitle'])
    render('api/event_infos/index', formats: :json)
  end
end
