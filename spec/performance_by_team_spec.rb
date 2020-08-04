require_relative '../performance_by_team'

RSpec.describe PerformanceByTeam do
  describe '#calculate' do
    context 'two players same team' do
      let(:players_info) {[
        {"nombre"=>"EL Cuauh", "nivel"=>"Cuauh", "goles"=>30, "sueldo"=>100000, "bono"=>30000, "sueldo_completo"=>nil, "equipo"=>"azul"},
        {"nombre"=>"Cosme Fulanito", "nivel"=>"A", "goles"=>7, "sueldo"=>20000, "bono"=>10000, "sueldo_completo"=>nil, "equipo"=>"azul"}
      ]}
      let(:goals_table) {{:a=>10, :b=>20, :c=>30, :cuauh=>40}}

      it 'returns a hash with one key and one value' do
        params = { players_info: players_info, goals_table: goals_table}
        performance_by_team = described_class.new(params)

        expect(performance_by_team.calculate).to be == {"azul"=>0.74}
      end
    end

    context 'four players in two diferent teams' do
      let(:players_info) {[
        {"nombre"=>"EL Cuauh", "nivel"=>"Cuauh", "goles"=>25, "sueldo"=>100000, "bono"=>30000, "sueldo_completo"=>nil, "equipo"=>"azul"},
        {"nombre"=>"El Brayan", "nivel"=>"B", "goles"=>20, "sueldo"=>50000, "bono"=>20000, "sueldo_completo"=>nil, "equipo"=>"azul"},
        {"nombre"=>"El Kevin", "nivel"=>"C", "goles"=>30, "sueldo"=>100000, "bono"=>50000, "sueldo_completo"=>nil, "equipo"=>"rojo"},
        {"nombre"=>"Cosme Fulanito", "nivel"=>"A", "goles"=>7, "sueldo"=>20000, "bono"=>10000, "sueldo_completo"=>nil, "equipo"=>"rojo"}
      ]}

      let(:goals_table) {{:a=>10, :b=>20, :c=>30, :cuauh=>40}}

      it 'returns a hash with two keys and two values' do
        params = { players_info: players_info, goals_table: goals_table}
        performance_by_team = described_class.new(params)

        expect(performance_by_team.calculate).to be == {"azul"=>0.75, "rojo"=>0.925}
      end
    end
  end
end
