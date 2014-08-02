class ActionHandler < MessageHandler

  # get user by message
  def get_user(message)
    return nil unless message.is_a?(Message) and message.is_valid?

    User.find_by(phone_number: message.sender)
  end

  # get stock by name
  def get_stock(name)
    raise TypeError, "wrong argument type #{name.class.name} for name (expected String)" unless name.is_a?(String)

    Stock.find_by(name: name)
  end

  # define create action
  def create(message, custom_call = false)
    return nil unless message.is_a?(Message) and message.is_valid?

    return false if message.arguments.length > 0 and !custom_call

    user = self.get_user(message)

    if user.nil?
      User.create(phone_number: message.sender, credits: 1000)
      return "Created user #{message.sender}."
    end

    "User #{message.sender} already exists."
  end

  # define help action
  def help(message)
    return nil unless message.is_a?(Message) and message.is_valid?

    self.create(message, true)
  end

  # define credits action
  def credits(message)
    return nil unless message.is_a?(Message) and message.is_valid?

    return false if message.arguments.length != 0

    self.create(message, true)

    user = self.get_user(message)

    return nil if user.nil?

    stock = "stock".pluralize(user.ownerships.length)

    "You currently have #{user.credits} credits and own #{user.ownerships.length} #{stock}."
  end

  # define stock action
  def stock(message)
    return nil unless message.is_a?(Message) and message.is_valid?

    return false if message.arguments.length != 1

    stock = self.get_stock(message.arguments.first)

    return "Invalid stock #{message.arguments.first}." if stock.nil?

    "Stock #{message.arguments.first} is worth #{stock.value} credits."
  end

  # define stocks action
  def stocks(message)
    return nil unless message.is_a?(Message) and message.is_valid?

    return false if message.arguments.length != 0

    stocks = Stock.order(:value).reverse.first(10)

    output = []

    stocks.each do |stock|
      output.push("#{stock.name} #{stock.value}")
    end

    output.join("\n")
  end

  # define buy action
  def buy(message)
    return nil unless message.is_a?(Message) and message.is_valid?

    return false if message.arguments.length < 1 || message.arguments.length > 2

    self.create(message, true)

    stock_name = message.arguments[0]

    user = self.get_user(message)

    stock = self.get_stock(stock_name)

    return nil if user.nil?
    return 'Please enter a valid stock name.' if stock.nil?

    if message.arguments.length == 1
      quantity = 1
    else
      quantity = message.arguments[1].to_i
    end

    return 'Please enter a valid quantity.' if quantity < 1
    return 'You don\'t have enough credits to do that.' if stock.value * quantity > user.credits

    stock_plural = "stock".pluralize(quantity)
    ownership = Ownership.create(user: user, stock: stock, quantity: quantity)

    "You have purchased #{quantity} #{stock.name} #{stock_plural}."
  end
end
