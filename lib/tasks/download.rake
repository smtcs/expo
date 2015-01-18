require 'net/http'
require 'open-uri'

task :image_download => :environment do
  @websites = Website.all
  @websites.each do |site|
    json = JSON.parse(open(site.image_src).read)
    case json['status']
    when 'processing'
      sleep json['estimated_need_time']
      if File.exists? "./public/img/#{site.id}.png"
        puts 'file exists'
      else
        File.write("./public/img/#{site.id}.png", Net::HTTP.get(URI.parse(json[:image_url])).force_encoding(Encoding::UTF_8))
      end
    when 'error'
      puts json['msg']
    when 'finished'
      if File.exists? "./public/img/#{site.id}.png"
        puts 'file exists'
      else
        File.write("./public/img/#{site.id}.png", Net::HTTP.get(URI.parse(json[:image_url])).force_encoding(Encoding::UTF_8))
      end
    end
  end
end
