require_relative '../salary'

RSpec.describe Salary do
  describe '#calculate' do
    context 'valid json' do
      let(:json_players_info) {'[
        {"nombre"=>"EL Cuauh", "nivel"=>"Cuauh", "goles"=>30, "sueldo"=>100000, "bono"=>30000, "sueldo_completo"=>nil, "equipo"=>"azul"},
        {"nombre"=>"Cosme Fulanito", "nivel"=>"A", "goles"=>7, "sueldo"=>20000, "bono"=>10000, "sueldo_completo"=>nil, "equipo"=>"azul"}
      ]'}
      let(:json_goals_table) {'{"a": 10, "b": 20, "c": 30, "cuauh": 40}'}

      it 'creates two instances from: PerformanceByTeam & PlayersSalary' do
        params = { json_players_info: json_players_info, json_goals_table: json_goals_table }

        expect(PerformanceByTeam).to receive(:new)
        expect(PlayersSalary).to receive(:new)
        players_salary = described_class.new(params).calculate

      end
    end
  end
end
