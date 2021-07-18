class CreateUsers::V00000000000010 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(User) do
      primary_key id : UUID
      add_timestamps
      add email : String, unique: true, case_sensitive: false
      add first_name : String?
      add last_name : String?
      add encrypted_password : String
      add confirmed_at : Time?
      add confirmation_token : String
    end
  end

  def rollback
    drop table_for(User)
  end
end
