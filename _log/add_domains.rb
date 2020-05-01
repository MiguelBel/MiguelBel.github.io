require 'uri'

def domain_name(url, with_dot_principal: false)
  if with_dot_principal
    URI(url).hostname.split('.').last(2).join('.')
  else
    URI(url).hostname.split('.').last(2).first
  end
end

filepath = ARGV[0]

lines = File.read(filepath).split("\n")

content_with_domain = lines.map do |line|
  if line.start_with?('- [') &&  # Is a link
      !line.start_with?('- [[') &&  # Do not do if is a link content index
      !line.end_with?(']') # Do not do if already has the link added
    url = line.split('(')[1].split(')')[0]
    puts "Adding domain to #{url}"
    domain = domain_name(url, with_dot_principal: true)
    puts "Added"

    "#{line} [#{domain}]"
  else
    line
  end
end.join("\n")

File.write(filepath, content_with_domain)