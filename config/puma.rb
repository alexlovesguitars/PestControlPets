# config/puma.rb

max_threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)
min_threads_count = ENV.fetch("RAILS_MIN_THREADS", max_threads_count)
threads min_threads_count, max_threads_count

environment ENV.fetch("RAILS_ENV", "development")

port ENV.fetch("PORT", 3000)

# Render Free tier: single worker only
workers ENV.fetch("WEB_CONCURRENCY", 1)

preload_app!

plugin :tmp_restart
