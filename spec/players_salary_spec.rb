require_relative '../players_salary'

RSpec.describe PlayersSalary do
  describe '#calculate' do
    context 'two players same team' do
      let(:players_info) {[
        {"nombre"=>"EL Cuauh", "nivel"=>"Cuauh", "goles"=>30, "sueldo"=>100000, "bono"=>30000, "sueldo_completo"=>nil, "equipo"=>"azul"},
        {"nombre"=>"Cosme Fulanito", "nivel"=>"A", "goles"=>7, "sueldo"=>20000, "bono"=>10000, "sueldo_completo"=>nil, "equipo"=>"azul"}
      ]}
      let(:goals_table) {{:a=>10, :b=>20, :c=>30, :cuauh=>40}}
      let(:performance_by_team) {{"azul"=>0.75, "rojo"=>0.925}}


      it 'populates sueldo_completo field with a Float number' do
        params = { players_info: players_info, goals_table: goals_table, performance_by_team: performance_by_team}
        players_salary = described_class.new(params).calculate

        players_salary.each { |player| (expect(player['sueldo_completo']).to be_a_kind_of(Float))}
      end
    end

  end
end
