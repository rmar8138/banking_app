module Database
  @database = File.exists?('./database/database.txt') ? JSON.parse(File.read('./database.txt')) : {}

  def self.return_database
    @database
  end
end