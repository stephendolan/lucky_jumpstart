require "spark"

class Jumpstart::Init < LuckyTask::Task
  summary "Set up and customize the Jumpstart template"
  name "jumpstart.init"

  getter prompt : Spark::Prompt = Spark::Prompt.new
  getter bullet_list_icon : String = "💎"
  getter default_programmatic_app_name : String = "lucky_jumpstart"
  getter default_human_app_name : String = "Lucky Jumpstart"

  def call
    prompt.say "🚀 Welcome to #{default_human_app_name}!", color: :yellow, style: :bold
    prompt.newline

    prompt.say "#{bullet_list_icon} Let's start by renaming a few things in the starter application.", color: :light_cyan
    Spark.indent
    rename_files_and_content

    Spark.reset_indentation
    prompt.newline

    if prompt.yes?("#{bullet_list_icon} Would you like to set up a git pre-commit hook with Ameba and the Crystal Formatter?", color: :light_cyan)
      Spark.indent
      prompt.say "Great, we'll get those copied over now...", color: :white
      set_up_git_pre_commit_hook
    else
      Spark.indent
      prompt.say "No worries, the built-in GitHub Action workflow files will have you covered!", color: :white
    end

    Spark.reset_indentation
    prompt.newline

    prompt.say "🚀 Thanks for getting started with #{default_human_app_name}!", color: :yellow, style: :bold
  end

  private def set_up_git_pre_commit_hook
    Spark::File.copy_file ".jumpstart/templates/git_pre_commit_hook.sh", ".git/hooks/pre-commit"
    Spark::File.chmod_file ".git/hooks/pre-commit", File::Permissions::All
  end

  private def rename_files_and_content
    programmatic_app_name = prompt.ask "What programmatic app name should replace '#{default_programmatic_app_name}' in the application?", color: :white, style: :bright do |question|
      question.validate(
        /^[a-z_]+$/,
        error_message: "Your provided name needs to contain only lowercase letters and underscores. Please try again.",
        retry_on_failure: true
      )
    end

    replace_programmatic_app_name(programmatic_app_name)

    human_readable_app_name = prompt.ask "What human-readable app name should replace '#{default_human_app_name}' in the application?", color: :white, style: :bold do |question|
      question.validate(
        /^[\w\s]+$/,
        error_message: "Your provided name should contain only alpha-numeric characters, underscores, and spaces.",
        retry_on_failure: true
      )
    end

    replace_human_app_name(human_readable_app_name)
  end

  private def replace_programmatic_app_name(name : String)
    file_paths = [
      "shard.yml",
      "docker-compose.yml",
      "config/route_helper.cr",
      "config/application.cr",
      "config/cookies.cr",
      "config/database.cr",
    ]

    file_paths.each do |file_path|
      Spark::File.replace_in_file(file_path, /#{default_programmatic_app_name}/, name)
    end

    Spark::File.move_file("src/#{default_programmatic_app_name}.cr", "src/#{name}.cr")
  end

  private def replace_human_app_name(name : String)
    file_paths = [
      "src/components/shared/navbar.cr",
      "config/application.cr",
    ]

    file_paths.each do |file_path|
      Spark::File.replace_in_file(file_path, /#{default_human_app_name}/, name)
    end
  end
end
