#! /usr/bin/ruby -r csv -r uri
query = URI.encode ARGV[0]

format = -> uri {
  uri.host&.slice! 'www.'
  unless uri.scheme
    uri.scheme = 'https'
    uri.path.insert 0, '//'
  end
  return uri.to_s.sub /QUERY|([=\/])$/, "\\1#{query}"
}

csv = CSV.read Dir['*.csv'].first
print csv.map(&:pop).map(&URI.method(:parse)).map(&format).join "\n"
