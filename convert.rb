require 'nkf'

def has_transfer_encoding?(header)
  @has_transfer_encoding ||= header.include?("Content-Transfer-Encoding: 7bit")
end

unless File.exists?(ARGV[0])
  puts "file is not exits."
  return
end

header, body = File.read(ARGV[0]).split("\n\n", 2)

converted_header = []
header.split("\n").each do |line|
  if line.include?("Subject")
    converted_header << NKF.nkf("--mime", line)
  else
    converted_header << line
  end
end
puts converted_header
puts ""
# Convett Body
puts NKF.nkf("--oc=iso-2022-jp", body)


