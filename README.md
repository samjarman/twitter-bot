# Twitter Bot
A collection of tools for maintaining commercial twitter accounts, built on top of the Twitter Gem

## Installation

 1. Clone, run `bundle install`.
 2. Run `cp .env.sample .env` to make a copy of the environment variable files
 3. Populate `.env` with your keys from [https://apps.twitter.com/](https://apps.twitter.com/)

## Use

### Moderation Mode
This setting, when enabled, requires you to allow every action the script wants to take on your behalf. 
To enable, change the code at the top of twitter_bot.rb 
```ruby
MODERATION_MODE = true.freeze #toggle between true and false
```

### Features

#### Adding users to lists based on search term
By calling `add_users_to_list` you can provide a slug for a list (already created on your account) and a serch term (listed [here](https://dev.twitter.com/rest/public/search))
```ruby
add_users_to_list(client, 'dog-lovers', '"love dogs" :)')
```

#### Favouriting tweets based on search term
This will favourite tweets that match the search terms.
```ruby
fave_tweets(client, '"love dogs" :)')
```

## Roadmap
There are a few items I'd like to add to this tool!
 * Caching of actions to avoid duplicate API calls and not hit limit sooner
 * Following based on search terms
 * Follow/Unfollower management tools
 ... Feel free to send a PR!
