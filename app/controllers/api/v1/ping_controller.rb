class Api::V1::PingController < ActionController::Base
  def ping
    Redis.current.ping
    ActiveRecord::Base.connection.execute("SELECT 1")

    head :ok
  end
end
