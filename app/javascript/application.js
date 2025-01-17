// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Add Rails UJS for handling DELETE method in forms and links
import Rails from "@rails/ujs"
Rails.start()