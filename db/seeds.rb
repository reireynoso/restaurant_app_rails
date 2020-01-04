Review.destroy_all
Rating.destroy_all 
Restaurant.destroy_all 
Dish.destroy_all
User.destroy_all

Review.reset_pk_sequence
Rating.reset_pk_sequence 
Restaurant.reset_pk_sequence 
Dish.reset_pk_sequence
User.reset_pk_sequence


# byebug
restaurant_data = JSON.parse(ENV['restaurant_one'])
restaurant_data_two = JSON.parse(ENV['restaurant_two'])
restaurant_data_three = JSON.parse(ENV['restaurant_three'])
restaurant_data_four = JSON.parse(ENV['restaurant_four'])
#JSON.parse(ENV['restaurant_one'])["results"]
#JSON.parse(ENV['restaurant_one'])["results"].first["name"]
restaurant_data["results"].each do |rest|
    # byebug
    Restaurant.create(
        name: rest["name"],
        city: rest["address"]["address_locality"],
        state: rest["address"]["address_region"],
        postal_code: rest["address"]["postal_code"],
        street_address: rest["address"]["street_address"],
        latitude: rest["address"]["latitude"],
        longitude: rest["address"]["longitude"],
        price_rating: rest["price_rating"],
        media_image: rest["media_image"]["base_url"],
        logo: rest["logo"]
    )
    rest["menu_items"].each do |dish|
        Dish.create(
            name: dish["name"],
            description: dish["description"],
            price: dish["price"],
            restaurant_id: Restaurant.last.id
        )
    end
end

restaurant_data_two["results"].each do |rest|
    # byebug
    Restaurant.create(
        name: rest["name"],
        city: rest["address"]["address_locality"],
        state: rest["address"]["address_region"],
        postal_code: rest["address"]["postal_code"],
        street_address: rest["address"]["street_address"],
        latitude: rest["address"]["latitude"],
        longitude: rest["address"]["longitude"],
        price_rating: rest["price_rating"],
        media_image: rest["media_image"]["base_url"],
        logo: rest["logo"]
    )
    rest["menu_items"].each do |dish|
        Dish.create(
            name: dish["name"],
            description: dish["description"],
            price: dish["price"],
            restaurant_id: Restaurant.last.id
        )
    end
end

restaurant_data_three["results"].each do |rest|
    # byebug
    Restaurant.create(
        name: rest["name"],
        city: rest["address"]["address_locality"],
        state: rest["address"]["address_region"],
        postal_code: rest["address"]["postal_code"],
        street_address: rest["address"]["street_address"],
        latitude: rest["address"]["latitude"],
        longitude: rest["address"]["longitude"],
        price_rating: rest["price_rating"],
        media_image: rest["media_image"]["base_url"],
        logo: rest["logo"]
    )
    rest["menu_items"].each do |dish|
        Dish.create(
            name: dish["name"],
            description: dish["description"],
            price: dish["price"],
            restaurant_id: Restaurant.last.id
        )
    end
end

restaurant_data_four["results"].each do |rest|
    # byebug
    Restaurant.create(
        name: rest["name"],
        city: rest["address"]["address_locality"],
        state: rest["address"]["address_region"],
        postal_code: rest["address"]["postal_code"],
        street_address: rest["address"]["street_address"],
        latitude: rest["address"]["latitude"],
        longitude: rest["address"]["longitude"],
        price_rating: rest["price_rating"],
        media_image: rest["media_image"]["base_url"],
        logo: rest["logo"]
    )
    rest["menu_items"].each do |dish|
        Dish.create(
            name: dish["name"],
            description: dish["description"],
            price: dish["price"],
            restaurant_id: Restaurant.last.id
        )
    end
end

puts 'seeded'