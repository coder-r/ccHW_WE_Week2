class Guest

  attr_reader :guest_name, :guest_age, :wallet,

  def initialize (guest_name, guest_age, wallet)

    @guest_name = guest_name
    @guest_age = guest_age
    @wallet = wallet

  end

  def pay_money(charge)
    if @wallet >= charge
      @wallet -= charge
    else
      return false
    end
    return true
  end


end
