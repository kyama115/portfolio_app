# lib/tasks/database_migration.rake
namespace :db do
  desc "Migrate data from MySQL to PostgreSQL"
  task mysql_to_postgresql: :environment do
    # MySQLデータのエクスポート
    system("mysqldump -u root -p myapp_development > mysql_dump.sql")

    # PostgreSQL用に変換
    sql_content = File.read('mysql_dump.sql')

    # MySQL固有のSQLをPostgreSQL用に変換
    sql_content.gsub!(/ENGINE=InnoDB/, '')
    sql_content.gsub!(/AUTO_INCREMENT/, 'SERIAL')
    sql_content.gsub!(/`/, '"')
    sql_content.gsub!(/UNSIGNED/, '')

    File.write('postgresql_dump.sql', sql_content)

    # PostgreSQLにインポート
    system("psql -U postgres -d your_postgresql_database < postgresql_dump.sql")
  end
end
