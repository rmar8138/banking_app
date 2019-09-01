require("json")

module Database
  @database = File.exists?('./database.json') ? JSON.parse(File.read('./database.json'), symbolize_names: true) : {}

  def self.return_database
    @database
  end

  def self.save_database(updated_database)
    File.open('./database.json', 'w') { |file|
      file.write(JSON.generate(updated_database))
    }
  end

  def self.username_exists?(username)
    username_match = @database.filter do |key, value|
      value[:username] == username
    end
  
    username_match.length == 0 ? false : true
  end
end