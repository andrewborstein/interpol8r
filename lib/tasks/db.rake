namespace :db do
  # bundle exec rake db:reset_default_data
  desc "Destroy all messages that random visitors have added."
  task :reset_default_data => [:environment] do
    messages = Message.all
    count = messages.length

    messages.destroy_all

    Message.create(
      [
        { name: 'my-name', spec: 'Andrew Borstein' },
        { name: 'hobby', spec: 'eating cake 🍰' },
        { name: 'true-fact', spec: '${my-name} loves ${hobby}' },
        { name: 'new-linkedin-bio', spec: 'True Fact: ${true-fact}' },
        { name: 'undefined', spec: '${fake} does not reference anything'  },
        { name: 'uh-uh', spec: '$${hobby} will not interpolate' }
      ]
    )

    puts "Successfully destroyed #{count} messages."
  end
end
