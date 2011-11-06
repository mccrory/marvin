require 'yaml'

configuration = YAML::load(File.open(File.join(PADRINO_ROOT, 'db', 'mongo.yml')))

MongoMapper.setup(configuration, PADRINO_ENV)

