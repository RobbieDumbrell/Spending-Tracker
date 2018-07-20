require_relative('../models/category')
require_relative('../models/merchant')
require_relative('../models/transaction')

merchant1 = Merchant.new({
  'name' => 'Amazon'
  })

# merchant1.save()

category1 = Category.new({
  'type' => 'House Stuff'
  })

# category1.save()

transaction1 = Transaction.new({
  'category_id' => category1.id,
  'merchant_id' => merchant1.id,
  'amount_spent' => 25
  })

# transaction1.save()

# found_merchant = Merchant.find(2)
# found_category = Category.find(3)
# found_transaction = Transaction.find(4)

# p Merchant.all()
# p Category.all()
# p Transaction.all()

# found_merchant.name = 'Ebay'
# found_merchant.update()

# found_category.type = 'Groceries'
# found_category.update()

# found_transaction.merchant_id = found_merchant.id
# found_transaction.category_id = found_category.id
# found_transaction.amount_spent = 1000
# found_transaction.update()

# found_merchant.delete()
# found_category.delete()
# found_transaction.delete()

# Merchant.delete_id(3)
# Category.delete_id(2)
# Transaction.delete_id(5)

# Merchant.delete_all()
# Category.delete_all()
# Transaction.delete_all()
