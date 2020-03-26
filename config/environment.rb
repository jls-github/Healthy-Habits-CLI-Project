require 'bundler'
require 'uri'
require 'net/http'
require 'openssl'
require 'date'

Bundler.require
require_all 'app/controllers'
require_all 'app'
require_all 'app/models'
require_all 'lib'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil