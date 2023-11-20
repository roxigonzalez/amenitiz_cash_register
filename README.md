# amenitiz_cash_register
# Technical Evaluation Amenitiz Problem 

## Cash Register

### Language
  Developed with Ruby `3.0.6`, Framework Rails: `7.1.1`

### Other Frameworks and utilities used

- Trailblazer: Architectural framework for Ruby on Rails applications that aims to improve the organization, structure, and maintainability of code.
- Rubocop: Helps to follow good practices and to keep code clean

### Installation

#### Install Dependencies
Run `bundle install`


#### Create DB
Create database

Run to create the DB
`rails db:create`

Run migrations

`rails db:migrate`

Run seed to load products

`rails db:seed`

#### Launch project

`rails s`
Go to a browser `http://localhost:3000`


#### Run tests
Run 
`rails test`


### About the Cart

Is possible to add products to a cart, if you click the button `Add to Cart` located in each product. 
If you want to see a summary of the shopping cart, click on cart icon on left corner at header.
The rules were added in the operation that is responsible to get the total of the line items. 
