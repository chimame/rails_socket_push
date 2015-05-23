class Book < ActiveRecord::Base
  after_commit :push, on: [:create]

  def push
    SocketIO::Emitter.new(redis: Redis.new(:host => '127.0.0.1', :port => 6379)).emit("create", self.to_json)
  end
end
