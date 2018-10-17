require 'nkf'

def has_transfer_encoding?(header)
  @has_transfer_encoding ||= header.include?("Content-Transfer-Encoding: 7bit")
end

unless File.exists?(ARGV[0])
  puts "File is not exits."
  return
end

source = File.read(ARGV[0])
unless source.encoding == Encoding::UTF_8
  puts "Please input utf-8 encofing file."
  return
end

header, body = source.split("\n\n", 2)

converted_header = []
header.split("\n").each do |line|
  case
  when line.include?("Subject")
    converted_header << NKF.nkf("--mime", line)
  when line.include?("Content-Type")
    converted_header << line
    converted_header << "Content-Transfer-Encoding: 7bit" unless has_transfer_encoding?(header)
  else
    converted_header << line
  end
end


puts converted_header
puts ""
puts NKF.nkf("--oc=iso-2022-jp", body)
