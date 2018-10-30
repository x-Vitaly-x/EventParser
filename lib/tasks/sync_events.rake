namespace :events do
  task :sync => :environment do
    # should be done like every couple of hours
    EventInfo.sync
  end
end
