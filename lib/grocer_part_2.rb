require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  index = 0
  coupons.each do |coupon|
    grocery_with_coupon = find_item_by_name_in_collection(coupon[:item], cart)
    grocery_in_cart = grocery_with_coupon
    coupon_to_apply = grocery_in_cart && grocery_with_coupon[:count] >= coupon[:num]
    if grocery_in_cart && coupon_to_apply
      cart << {item: "#{grocery_with_coupon[:item]} W/COUPON",price: coupon[:cost] / coupon[:num],
      clearance: grocery_with_coupon[:clearance], count: coupon[:num]}
      grocery_with_coupon[:count] -= coupon[:num]
    end
    index += 1
  end
  cart
  end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  cart.each do |grocery|
    if grocery[:clearance]
      grocery[:price] *= 0.8
    end
    grocery
  end
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  
   final_cart = apply_clearance(apply_coupons(consolidate_cart(cart), coupons))
  
  total = 0

  final_cart.each do |grocery|
    total += grocery[:price] * grocery[:count]
  end
total *= 0.9 if total > 100
total.round(2)
end
