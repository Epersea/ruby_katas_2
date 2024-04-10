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
    if all_passengers_in_shore_2
      return 'FINISHED'
    elsif more_devils_than_monks_in_shore_1
      return 'INVALID'
    elsif more_devils_than_monks_in_shore_2
      return 'INVALID'
    else
      return 'VALID'
    end
  end

  def all_passengers_in_shore_2
    @shore_2.sort == all_passengers
  end

  def more_devils_than_monks_in_shore_1
    devils_shore_1 = @shore_1.count('D')
    monks_shore_1 = @shore_1.count('M')

    (devils_shore_1 > monks_shore_1) && monks_shore_1 > 0
  end

  def more_devils_than_monks_in_shore_2
    devils_shore_2 = @shore_2.count('D')
    monks_shore_2 = @shore_2.count('M')

    (devils_shore_2 > monks_shore_2) && monks_shore_2 > 0
  end
end