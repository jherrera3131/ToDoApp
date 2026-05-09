#asset version
Rails.application.config.assets.version = "1.0"

#extra asset paths
# Rails.application.config.assets.paths << Emoji.images_path

#precompile extras
# Rails.application.config.assets.precompile += %w[ admin.js admin.css ]
Rails.application.config.assets.precompile += %w(bootstrap.min.js popper.js application.js main.js)
