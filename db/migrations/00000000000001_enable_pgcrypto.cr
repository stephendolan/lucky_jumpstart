class EnablePgcrypto::V00000000000001 < Avram::Migrator::Migration::V1
  def migrate
    enable_extension "pgcrypto"
  end

  def rollback
    disable_extension "pgcrypto"
  end
end
