require "mina/logrotate/version"

namespace :logrotate do
  set_default :logrotate_path,     '/etc/logrotate.d'
  set_default :logrotate_config,   -> { "#{deploy_to}/#{shared_path}/config/logrotate" }
  set_default :logrotate_config_e, -> { "#{logrotate_path}/#{application}" }

  desc 'Setup logrotate'
  task setup: :environment do
    queue  %(echo "-----> Setup the logrotate")
    queue! %(touch #{logrotate_config})
    queue  %(echo "-----> Be sure to edit 'shared/config/logrotate'.")
  end

  desc 'Symlinking logrotate config file'
  task link: :environment do
    queue  %(echo "-----> Symlinking logrotate config file")
    queue! %(sudo ln -nfs "#{logrotate_config}" "#{logrotate_config_e}")
  end

  desc 'Parse logrotate configuration file and upload it to the server.'
  task parse: :environment do
    content = erb(logrotate_template)
    queue %(echo '#{content}' > #{logrotate_config})
    queue %(cat #{logrotate_config})
    queue %(echo "-----> Be sure to edit 'shared/config/logrotate'.")
  end

  desc 'Run logrotate into symlink file'
  task apply: :environment do
    queue  %(echo "----->  Applying logrotate")
    queue! "sudo logrotate #{logrotate_config_e}"
  end

  private

  def logrotate_template
    File.expand_path('../templates/logrotate.erb', __FILE__)
  end
end
