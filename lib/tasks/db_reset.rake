namespace :db do
  # bundle exec rake db:reset
  desc "Destroy all blogs that random visitors have added."
  task :reset do
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
