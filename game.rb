$LOAD_PATH.unshift File.dirname(__FILE__)

Dir['lib/life*', 'lib/*.rb', 'lib/**/*.rb'].each do |file|
  require file
end
