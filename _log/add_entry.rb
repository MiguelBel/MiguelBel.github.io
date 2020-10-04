title = ARGV[0]
slug = ARGV[1]

template = <<EOF
---
categories: Log
layout: log_entry
published: true
title: #{title}
anchor: #{slug}
---

EOF

filename = "#{Time.now.year}-#{Time.now.strftime("%m")}-#{Time.now.strftime('%d')}-#{slug}.md"
File.write("_posts/#{filename}", template)
