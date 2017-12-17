%w(
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
  lib/**.rb
  app/**.rb
).each { |path| Spring.watch(path) }
