Db::Create.new(quiet: true).call
Db::Migrate.new(quiet: true).call
Db::CreateRequiredSeeds.new(quiet: true).call
