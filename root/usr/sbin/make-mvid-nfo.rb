#!/usr/bin/env ruby

v1 = ARGV[0]
Dir.glob("#{v1}/*.*").each do |file|
  nfo = File.dirname(file) + "/" + File.basename(file, ".*") + ".nfo"
  artist, title = File.basename(file, ".*").split(' - ')
  next if File.exists?(nfo)
  puts "Creating nfo for #{title} - #{artist} of type musicvideo"
  file = File.open(nfo, 'w')
    file << <<EOF
<musicvideo>
  <artist>#{artist}</artist>
  <title>#{title}</title>
</musicvideo>
EOF
end
