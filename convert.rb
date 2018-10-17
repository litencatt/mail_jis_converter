require 'nkf'

unless File.exists?(ARGV[0])
  puts "file is not exits."
  return
end

source = File.read(ARGV[0])
header, body = source.split("\n\n", 2)

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


