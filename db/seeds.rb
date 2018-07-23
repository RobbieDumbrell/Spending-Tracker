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
  'month' => 'January',
  'budget' => 100,
  'year' => '2018'
  })
febbud = Budget.new({
  'month' => 'February',
  'budget' => 100,
  'year' => '2018'
  })
marbud = Budget.new({
  'month' => 'March',
  'budget' => 100,
  'year' => '2018'
  })
aprbud = Budget.new({
  'month' => 'April',
  'budget' => 100,
  'year' => '2018'
  })
maybud = Budget.new({
  'month' => 'May',
  'budget' => 100,
  'year' => '2018'
  })
junbud = Budget.new({
  'month' => 'June',
  'budget' => 100,
  'year' => '2018'
  })
julbud = Budget.new({
  'month' => 'July',
  'budget' => 100,
  'year' => '2018'
  })
augbud = Budget.new({
  'month' => 'August',
  'budget' => 100,
  'year' => '2018'
  })
sepbud = Budget.new({
  'month' => 'September',
  'budget' => 100,
  'year' => '2018'
  })
octbud = Budget.new({
  'month' => 'October',
  'budget' => 100,
  'year' => '2018'
  })
novbud = Budget.new({
  'month' => 'November',
  'budget' => 100,
  'year' => '2018'
  })
decbud = Budget.new({
  'month' => 'December',
  'budget' => 100,
  'year' => '2018'
  })

janbud2 = Budget.new({
  'month' => 'January',
  'budget' => 100,
  'year' => '2019'
  })
febbud2 = Budget.new({
  'month' => 'February',
  'budget' => 100,
  'year' => '2019'
  })
marbud2 = Budget.new({
  'month' => 'March',
  'budget' => 100,
  'year' => '2019'
  })
aprbud2 = Budget.new({
  'month' => 'April',
  'budget' => 100,
  'year' => '2019'
  })
maybud2 = Budget.new({
  'month' => 'May',
  'budget' => 100,
  'year' => '2019'
  })
junbud2 = Budget.new({
  'month' => 'June',
  'budget' => 100,
  'year' => '2019'
  })
julbud2 = Budget.new({
  'month' => 'July',
  'budget' => 100,
  'year' => '2019'
  })
augbud2 = Budget.new({
  'month' => 'August',
  'budget' => 100,
  'year' => '2019'
  })
sepbud2 = Budget.new({
  'month' => 'September',
  'budget' => 100,
  'year' => '2019'
  })
octbud2 = Budget.new({
  'month' => 'October',
  'budget' => 100,
  'year' => '2019'
  })
novbud2 = Budget.new({
  'month' => 'November',
  'budget' => 100,
  'year' => '2019'
  })
decbud2 = Budget.new({
  'month' => 'December',
  'budget' => 100,
  'year' => '2019'
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
