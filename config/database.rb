MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

case Padrino.env
  when :development then MongoMapper.database = 'marvin_development'
  when :production  then MongoMapper.database = 'marvin_production'
  when :test        then MongoMapper.database = 'marvin_test'
end
