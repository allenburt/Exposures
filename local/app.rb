helpers do
  def background_image
    path = File.join(Nesta::Configuration.attachment_path, "backgrounds", File::SEPARATOR)
    default = "#{path}index.jpg"
    return default if @page.nil?
    image = "#{path}#{@page.path}.jpg"
    File.exist?(image) ? image : default
  end

  def background_credit
    credits = File.join(Nesta::Configuration.attachment_path, "backgrounds", "credits.yml")
    @@yaml ||= YAML::load(IO.read(credits))
    (@page.nil? or @@yaml[@page.path].nil?) ? @@yaml["index"] : @@yaml[@page.path]
  end
end