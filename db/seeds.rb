require_relative('../models/category')
require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/budget')

merchant1 = Merchant.new({
  'name' => 'Amazon'
  })

merchant1.save()

category1 = Category.new({
  'type' => 'House Stuff'
  })

category1.save()

transaction1 = Transaction.new({
  'category_id' => category1.id,
  'merchant_id' => merchant1.id,
  'amount_spent' => 30,
  'entry_date' => '2018-06-22'
  })

transaction1.save()

janbud = Budget.new({
  'month' => 1,
  'month_name' => 'January',
  'budget' => 100,
  'year' => '2018'
  })
febbud = Budget.new({
  'month' => 2,
  'month_name' => 'February',
  'budget' => 100,
  'year' => '2018'
  })
marbud = Budget.new({
  'month' => 3,
  'month_name' => 'March',
  'budget' => 100,
  'year' => '2018'
  })
aprbud = Budget.new({
  'month' => 4,
  'month_name' => 'April',
  'budget' => 100,
  'year' => '2018'
  })
maybud = Budget.new({
  'month' => 5,
  'month_name' => 'May',
  'budget' => 100,
  'year' => '2018'
  })
junbud = Budget.new({
  'month' => 6,
  'month_name' => 'June',
  'budget' => 100,
  'year' => '2018'
  })
julbud = Budget.new({
  'month' => 7,
  'month_name' => 'July',
  'budget' => 100,
  'year' => '2018'
  })
augbud = Budget.new({
  'month' => 8,
  'month_name' => 'August',
  'budget' => 100,
  'year' => '2018'
  })
sepbud = Budget.new({
  'month' => 9,
  'month_name' => 'September',
  'budget' => 100,
  'year' => '2018'
  })
octbud = Budget.new({
  'month' => 10,
  'month_name' => 'October',
  'budget' => 100,
  'year' => '2018'
  })
novbud = Budget.new({
  'month' => 11,
  'month_name' => 'November',
  'budget' => 100,
  'year' => '2018'
  })
decbud = Budget.new({
  'month' => 12,
  'month_name' => 'December',
  'budget' => 100,
  'year' => '2018'
  })

janbud2 = Budget.new({
  'month' => 1,
  'month_name' => 'January',
  'budget' => 100,
  'year' => '2019'
  })
febbud2 = Budget.new({
  'month' => 2,
  'month_name' => 'February',
  'budget' => 100,
  'year' => '2019'
  })
marbud2 = Budget.new({
  'month' => 3,
  'month_name' => 'March',
  'budget' => 100,
  'year' => '2019'
  })
aprbud2 = Budget.new({
  'month' => 4,
  'month_name' => 'April',
  'budget' => 100,
  'year' => '2019'
  })
maybud2 = Budget.new({
  'month' => 5,
  'month_name' => 'May',
  'budget' => 100,
  'year' => '2019'
  })
junbud2 = Budget.new({
  'month' => 6,
  'month_name' => 'June',
  'budget' => 100,
  'year' => '2019'
  })
julbud2 = Budget.new({
  'month' => 7,
  'month_name' => 'July',
  'budget' => 100,
  'year' => '2019'
  })
augbud2 = Budget.new({
  'month' => 8,
  'month_name' => 'August',
  'budget' => 100,
  'year' => '2019'
  })
sepbud2 = Budget.new({
  'month' => 9,
  'month_name' => 'September',
  'budget' => 100,
  'year' => '2019'
  })
octbud2 = Budget.new({
  'month' => 10,
  'month_name' => 'October',
  'budget' => 100,
  'year' => '2019'
  })
novbud2 = Budget.new({
  'month' => 11,
  'month_name' => 'November',
  'budget' => 100,
  'year' => '2019'
  })
decbud2 = Budget.new({
  'month' => 12,
  'month_name' => 'December',
  'budget' => 100,
  'year' => '2019'
  })

janbud3 = Budget.new({
  'month' => 1,
  'month_name' => 'January',
  'budget' => 100,
  'year' => '2020'
  })
febbud3 = Budget.new({
  'month' => 2,
  'month_name' => 'February',
  'budget' => 100,
  'year' => '2020'
  })
marbud3 = Budget.new({
  'month' => 3,
  'month_name' => 'March',
  'budget' => 100,
  'year' => '2020'
  })
aprbud3 = Budget.new({
  'month' => 4,
  'month_name' => 'April',
  'budget' => 100,
  'year' => '2020'
  })
maybud3 = Budget.new({
  'month' => 5,
  'month_name' => 'May',
  'budget' => 100,
  'year' => '2020'
  })
junbud3 = Budget.new({
  'month' => 6,
  'month_name' => 'June',
  'budget' => 100,
  'year' => '2020'
  })
julbud3 = Budget.new({
  'month' => 7,
  'month_name' => 'July',
  'budget' => 100,
  'year' => '2020'
  })
augbud3 = Budget.new({
  'month' => 8,
  'month_name' => 'August',
  'budget' => 100,
  'year' => '2020'
  })
sepbud3 = Budget.new({
  'month' => 9,
  'month_name' => 'September',
  'budget' => 100,
  'year' => '2020'
  })
octbud3 = Budget.new({
  'month' => 10,
  'month_name' => 'October',
  'budget' => 100,
  'year' => '2020'
  })
novbud3 = Budget.new({
  'month' => 11,
  'month_name' => 'November',
  'budget' => 100,
  'year' => '2020'
  })
decbud3 = Budget.new({
  'month' => 12,
  'month_name' => 'December',
  'budget' => 100,
  'year' => '2020'
  })

janbud.save()
febbud.save()
marbud.save()
aprbud.save()
maybud.save()
junbud.save()
julbud.save()
augbud.save()
sepbud.save()
octbud.save()
novbud.save()
decbud.save()
janbud2.save()
febbud2.save()
marbud2.save()
aprbud2.save()
maybud2.save()
junbud2.save()
julbud2.save()
augbud2.save()
sepbud2.save()
octbud2.save()
novbud2.save()
decbud2.save()
janbud3.save()
febbud3.save()
marbud3.save()
aprbud3.save()
maybud3.save()
junbud3.save()
julbud3.save()
augbud3.save()
sepbud3.save()
octbud3.save()
novbud3.save()
decbud3.save()

# found_merchant = Merchant.find(2)
# found_category = Category.find(2)
# found_transaction = Transaction.find(2)
# found_budget = Budget.find(12)


# db_time =  found_transaction.entry_date
# # # #
# p db_time

# p found_transaction.entry_date.mon


# p Merchant.all()
# p Category.all()
# p Transaction.all()
# p Budget.all()

# found_merchant.name = 'Ebay'
# found_merchant.update()

# found_category.type = 'Groceries'
# found_category.update()

# found_transaction.merchant_id = found_merchant.id
# found_transaction.category_id = found_category.id
# found_transaction.amount_spent = 1000
# found_transaction.entry_date =  '2017-01-24'
# found_transaction.update()
#
# found_budget.budget = 500
# found_budget.update()

# found_merchant.delete()
# found_category.delete()
# found_transaction.delete()

# Merchant.delete_id(3)
# Category.delete_id(2)
# Transaction.delete_id(5)

# Merchant.delete_all()
# Category.delete_all()
# Transaction.delete_all()

# p found_merchant.all_transactions()
# p found_merchant.all_categories()
#
# p found_category.all_transactions()
# p found_category.all_merchants()

# p Date.parse(db_time)

# p Date.today()
