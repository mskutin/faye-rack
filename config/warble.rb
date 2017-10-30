Warbler::Config.new do |config|
  config.features = %w(compiled runnable executable)
  config.webinf_files += FileList["config/weblogic.xml"]
  config.jar_name = "faye"
  config.jar_extension = "war"
end
