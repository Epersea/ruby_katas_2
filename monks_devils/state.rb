class State
  attr_accessor :shore_1, :shore_2, :trips

  def initialize(shore_1 = all_passengers, shore_2 = [], trips = [])
    @shore_1 = shore_1
    @shore_2 = shore_2
    @trips = trips
  end

  def all_passengers
    ['D', 'D', 'D', 'M', 'M', 'M']
  end

  def validate
    if @shore_2.sort == all_passengers
      return 'FINISHED'
    end

    count_devils_and_monks
  end

  def count_devils_and_monks
    devils_shore_1 = @shore_1.count('D')
    monks_shore_1 = @shore_1.count('M')
    devils_shore_2 = @shore_2.count('D')
    monks_shore_2 = @shore_2.count('M')

    if (devils_shore_1 > monks_shore_1) && monks_shore_1 > 0  || (devils_shore_2 > monks_shore_2) && monks_shore_2 > 0
      'INVALID'
    else 
      'VALID'
    end
  end
end