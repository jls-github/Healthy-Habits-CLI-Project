require 'bundler'
require 'uri'
require 'net/http'
require 'openssl'

Bundler.require

require_all 'app'
require_all 'app/models'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
