class HomeController < ApplicationController
  include HomeHelper
  
  def index
    @online = server_online?
  end

  def zombiekills
    @zombiekills = get_leaderboard_zombiekills
  end

  def humanity
    @humanity = get_leaderboard_humanity
  end

  def deaths
    @deaths = get_leaderboard_deaths
  end

  def banditkills
    @banditkills = get_leaderboard_banditkills
  end

  def survivorkills
    @survivorkills = get_leaderboard_survivorkills
  end
end
