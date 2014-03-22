describe 'Timer' do

  before do
    class << self
      include CDQ
    end
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a Timer entity' do
    Timer.entity_description.name.should == 'Timer'
  end
end
