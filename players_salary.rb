# frozen_string_literal: true

class PlayersSalary
  attr_reader :players_info, :goals_table, :performance_by_team

  def initialize(players_info:, goals_table:, performance_by_team:)
    @players_info = players_info
    @goals_table = goals_table
    @performance_by_team = performance_by_team
  end

  def calculate
    players_info.each do |player|
      base_salary = player['sueldo']
      total_performance = calculate_total_performance(player)
      extra_bonus = total_performance.truncate(6) * player['bono']

      player['sueldo_completo'] = base_salary + extra_bonus
    end
  end

  def calculate_total_performance(player)
    player_performance = player['goles'].to_f / goals_table[player['nivel'].downcase.to_sym].to_f
    team_performance = performance_by_team[player['equipo'].downcase]

    (fix_performance_percentage(player_performance) + fix_performance_percentage(team_performance)) / 2
  end

  def fix_performance_percentage(percentage)
    return 1 if percentage > 1

    percentage
  end
end
