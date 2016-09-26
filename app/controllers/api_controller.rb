class ApiController < ApplicationController
  before_action ->{ @remote_ip = request.headers["REMOTE_ADDR"] }
end
