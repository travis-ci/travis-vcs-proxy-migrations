#!/usr/bin/env ruby

path_to_structure = ARGV[0] || 'db/structure.sql'
path = File.expand_path("../../#{path_to_structure}", __FILE__)
structure = File.read(path)
if structure =~ /AS integer/
  STDERR.puts <<-MESSAGE
\033[0;31mStructure dump was generated using a PostgreSQL version.\033[0m
\033[0;31mthat is incompatible with 12.x which we use in production. Please revert the\033[0m
\033[0;31mstructure.sql file changes and regenerate the file using earlier PostgreSQL\033[0m
\033[0;31mversion.\033[0m
MESSAGE
  exit 1
end
