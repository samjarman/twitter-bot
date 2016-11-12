require 'twitter'
require 'pry'
require 'dotenv'

#MODERATION_MODE = false.freeze
MODERATION_MODE = true.freeze

SEARCH_COUNT = 50.freeze #Max 100, kinda.
Dotenv.load

#Fuctions

def add_users_to_list(client, list_name, search)
	client.search(search).take(SEARCH_COUNT).each do |tweet|
		puts "#{tweet.user.screen_name} - #{tweet.text}"
		if user_wants_action('Add user to list')
			puts "Adding user #{tweet.user.screen_name} to #{list_name}..."
			client.add_list_member(list_name, tweet.user.id) 
			puts "Added!"
		else 
			puts "User not added"
		end
		puts ""
	end
end


def fave_tweets(client, search)
	client.search(search).take(SEARCH_COUNT).each do |tweet|
		puts "#{tweet.user.screen_name} - #{tweet.text}"
		if user_wants_action('Fave tweet')
			puts "Favouriting #{tweet.text} by #{tweet.user.screen_name}"
			puts client.fave(tweet.user.id) 
			puts "Done!"
		else 
			puts "Tweet not favourited"
		end
		puts ""
	end
end

## Utils
def user_wants_action(instruction)
	if MODERATION_MODE
		puts "#{instruction}?"
		answer = gets.chomp
		return answer == 'y'
	end
	true
end

def start_client 
	client = Twitter::REST::Client.new do |config|
		puts ENV
	  	config.consumer_key        = ENV['TWITTER_CONSUMER_KEY'] 
	  	config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
	  	config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
	  	config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
	  end
end

client = start_client

## Search terms https://dev.twitter.com/rest/public/search
#add_users_to_list(client, 'dog-lovers', '"love dogs" :)')
fave_tweets(client, '"love dogs" :)')