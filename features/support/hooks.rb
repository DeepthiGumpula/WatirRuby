

Before do

  @browser = Watir::Browser.new :firefox

end

After do |scenario|
  if scenario.failed?
    @browser.screenshot.save (scenario.name+".png")
    embed(scenario.name+".png", 'image/png')
  end
  @browser.quit
end
at_exit do
  ENV['ARCHIVE_RESULTS'] = 'no' if ENV['ARCHIVE_RESULTS'].nil?
  if ENV['ARCHIVE_RESULTS']=="yes"
    Dir.mkdir("resultsarchive") if Dir["resultsarchive"].empty?
    folder = Dir.pwd
    input_filenames = ['results.html']

    zipfile_name = "#{Date.today}_results.zip"

    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      input_filenames.each do |filename|
        zipfile.add(filename, folder + '/' + filename)
      end
    end
    FileUtils.mv(zipfile_name,"resultsarchive/#{zipfile_name}")
  end
end

After do
  @browser.quit
end



