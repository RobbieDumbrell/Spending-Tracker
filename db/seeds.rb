require_relative('../models/category')
require_relative('../models/merchant')
require_relative('../models/transaction')

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
  'amount_spent' => 25
  })

transaction1.save()
