# frozen_string_literal: true

require_relative 'salary.rb'
require_relative 'performance_by_team'
require_relative 'players_salary'

json_players_location = File.join(__dir__, 'json_files/players.json')
json_from_file = File.read(json_players_location)

goals_table_location = File.join(__dir__, 'json_files/goals_table.json')
goals_table = File.file?(goals_table_location) ? File.read(goals_table_location) : ''

salary = Salary.new(json_players_info: json_from_file, json_goals_table: goals_table).calculate

File.write(File.join(__dir__, 'json_files/result.json'), JSON.pretty_generate(salary))

puts JSON.pretty_generate(salary)
