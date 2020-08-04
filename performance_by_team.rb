# frozen_string_literal: true

class PerformanceByTeam
  attr_reader :players_info, :goals_table, :teams

  def initialize(players_info:, goals_table:)
    @players_info = players_info
    @goals_table = goals_table
    @teams = {}
  end

  def calculate
    extract_team_goals_per_player
    calculate_team_performance
  end

  def extract_team_goals_per_player
    players_info.each do |player|
      goals = player['goles']
      minimum_goals = goals_table[player['nivel'].downcase.to_sym]
      team = player['equipo'].downcase

      if teams[team].nil?
        teams[team] = [goals, minimum_goals]
      else
        teams[team][0] += goals
        teams[team][1] += minimum_goals
      end
    end
  end

  def calculate_team_performance
    teams.each { |k, v| teams[k] = (v[0].to_f / v[1].to_f) }
  end
end
