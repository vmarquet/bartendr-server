# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

# le fichier css pour la barre de navigation tout en haut
Rails.application.config.assets.precompile += %w( navbar.css )
Rails.application.config.assets.precompile += %w( custom.css )
