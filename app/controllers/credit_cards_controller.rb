class CreditCardsController < ApplicationController
  def open
  end

  def debit
  end

  def credit
    @current_time = Time.now
  end

  def close
  end
end
