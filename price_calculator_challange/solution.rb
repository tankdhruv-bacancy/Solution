regularPrice = {'milk' => 3.97, 'bread' => 2.17, 'banana' => 0.99, 'apple' => 0.89}
discountedItem = {'milk' => 2, 'bread' => 3}
discountedPrice = {'milk' => 5, 'bread' => 6}

p 'Please Enter All item purchased seperated by comma'

items = gets.chomp.split(',');

p items

purchasedItem = Hash.new
if items - regularPrice.keys == []
    items.each do |item|
        count = 1;
        if purchasedItem.key?(item)
            count = purchasedItem[item] + 1;
        end
        purchasedItem[item] = count
    end
    p "Item     Quantity     Price"
    p "----------------------------"

    priceWithoutDiscount = 0;
    priceWithDiscount = 0
    purchasedItem.each do |item,price|
        priceWithoutDiscount = priceWithoutDiscount + (purchasedItem[item] * regularPrice[item])
        if discountedItem.key?(item)
            price = ((purchasedItem[item] / discountedItem[item]).to_i * discountedPrice[item]) + ((purchasedItem[item] % discountedItem[item]) * regularPrice[item])
        else
            price = purchasedItem[item] * regularPrice[item];
        end
        priceWithDiscount = priceWithDiscount + price;
        p "#{item}     #{purchasedItem[item]}          $#{price}"
    end
    p "Total Price : $#{priceWithDiscount.round(2)}"
    p "You saved $#{(priceWithoutDiscount - priceWithDiscount).round(2)} today"
else
    p "Please Enter valid item"
end