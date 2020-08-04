# frozen_string_literal: true

require 'json'

class Salary
  attr_reader :players_info, :goals_table
  DEFAULT_GOAL_TABLE = { a: 5, b: 10, c: 15, cuauh: 20 }.freeze

  def initialize(json_players_info:, json_goals_table: nil)
    @players_info = parse_json(json_players_info)
    @goals_table = define_goals_table(json_goals_table)
  end

  def calculate
    performance_by_team = PerformanceByTeam.new(players_info: players_info, goals_table: goals_table).calculate
    PlayersSalary.new(players_info: players_info, goals_table: goals_table, performance_by_team: performance_by_team).calculate
  end

  def define_goals_table(json_goals_table)
    return DEFAULT_GOAL_TABLE if (json_goals_table.nil? || json_goals_table.empty?)

    parse_json(json_goals_table).transform_keys(&:to_sym)
  end

  def parse_json(json_data)
    JSON.parse(json_data)
  rescue JSON::ParserError
    3.times { puts '---------' }
    puts 'Invalid JSON'
    3.times { puts '---------' }
    abort
  end
end
