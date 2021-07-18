class EnableCitext::V00000000000002 < Avram::Migrator::Migration::V1
  def migrate
    enable_extension "citext"
  end

  def rollback
    disable_extension "citext"
  end
end
