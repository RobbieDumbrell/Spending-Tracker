require('minitest/autorun')
require('minitest/rg')
require_relative('../transaction')

class TransactionTest < MiniTest::Test

  def test_total_spent_calculates_correctly
    calculation = Transaction.total_all()
    assert_equal(3530, calculation)
  end

end
