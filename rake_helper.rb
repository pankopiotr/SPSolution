def calculate_occurences(file:)
  logs = parse_logs(file: file)
  logs.stats
end

def calculate_unique_occurences(file:)
  logs = parse_logs(file: file)
  logs.unique_stats
end

def parse_logs(file:)
  abort('ERROR! Provided file is missing or invalid') unless file && File.exist?(file)

  LogCSVParser.parse(file: file, delimiter: ' ')
end

def present(array)
  array.each { |element| p element }
end
