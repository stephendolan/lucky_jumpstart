class EnablePgcrypto::V00000000000001 < Avram::Migrator::Migration::V1
  def migrate
    execute "CREATE EXTENSION IF NOT EXISTS pgcrypto"
  end

  def rollback
    execute "DROP EXTENSION pgcrypto"
  end
end
