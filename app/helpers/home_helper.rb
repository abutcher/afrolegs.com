module HomeHelper
  include AFROLEGS
  include Mysql2

  require 'open-uri'

  def db
    return Mysql2::Client.new(:host => AFROLEGS[:database_host],
                              :port => AFROLEGS[:database_port],
                              :database => AFROLEGS[:database_name],
                              :username => AFROLEGS[:database_user],
                              :password => AFROLEGS[:database_pass])
  end

  def server_online?
    url = "http://cache.www.gametracker.com/components/html0/?host=50.97.49.79:3068"
    doc = Nokogiri::HTML(open(url))
    status = doc.css("img")[2]["alt"]
    return status == "Online"
  end

  def get_leaderboard_zombiekills
    sql = "SELECT name, total_zombie_kills FROM profile WHERE total_zombie_kills > 0 ORDER BY total_zombie_kills DESC LIMIT 0,10;"
    results = db().query(sql, :symbolize_keys => true)
    kills = []
    results.each do |result|
      kills.push(result)
    end
    return kills
  end

  def get_leaderboard_humanity
    sql = "SELECT name, humanity FROM profile WHERE humanity > 2500 ORDER BY humanity DESC LIMIT 0,10;"
    results = db().query(sql, :symbolize_keys => true)
    humanity = []
    results.each do |result|
      humanity.push(result)
    end
    return humanity
  end

  def get_leaderboard_deaths
    sql = "SELECT name, survival_attempts FROM profile WHERE survival_attempts > 1 ORDER BY survival_attempts DESC LIMIT 0,10;"
    results = db().query(sql, :symbolize_keys => true)
    deaths = []
    results.each do |result|
      deaths.push(result)
    end
    return deaths
  end

  def get_leaderboard_banditkills
    sql = "SELECT name, total_bandit_kills FROM profile WHERE total_bandit_kills > 0 ORDER BY total_bandit_kills DESC LIMIT 0,10;"
    results = db().query(sql, :symbolize_keys => true)
    banditkills = []
    results.each do |result|
      banditkills.push(result)
    end
    return banditkills
  end

  def get_leaderboard_survivorkills
    sql = "SELECT name, total_survivor_kills FROM profile WHERE total_survivor_kills > 0 ORDER BY total_survivor_kills DESC LIMIT 0,10;"
    results = db().query(sql, :symbolize_keys => true)
    survivorkills = []
    results.each do |result|
      survivorkills.push(result)
    end
    return survivorkills
  end
end
