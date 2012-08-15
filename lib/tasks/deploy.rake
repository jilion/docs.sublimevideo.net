# Thanks to http://michaeldwan.com/writings/customize-your-heroku-deployment.html

# List of environments and their heroku git remotes
ENVIRONMENTS = %w[staging production]

namespace :deploy do
  ENVIRONMENTS.each do |env|
    desc "Deploy to #{env}"
    task env do
      current_branch = `git branch | grep ^* | awk '{ print $2 }'`.strip

      Rake::Task['deploy:before_deploy'].invoke(env, current_branch)
      Rake::Task['deploy:update_code'].invoke(env, current_branch)
      Rake::Task['deploy:after_deploy'].invoke(env, current_branch)
    end
  end

  task :before_deploy, :env, :branch do |t, args|
    # Ensure the user wants to deploy a non-master branch to production
    if args[:env] == :production && args[:branch] != 'master'
      print "Continue deploying '#{args[:branch]}' to production? (y/n) " and STDOUT.flush
      char = $stdin.getc
      if char != ?y && char != ?Y
       puts "Deploy aborted"
       exit
      end
    else
      puts "Deploying #{args[:branch]} to #{args[:env]}"
    end
  end

  task :after_deploy, :env, :branch do |t, args|
    Rake::Task['search:index'].invoke
  end

  task :update_code, :env, :branch do |t, args|
    FileUtils.cd Rails.root do
      puts "Updating #{args[:env]} with branch #{args[:branch]}"
      `git push #{args[:env]} +#{args[:branch]}:master`
    end
  end
end
