---
layout: default-documentation
title: ShipCompliant - Ruby API Client
---

# Installation

Adding the ShipCompliant API client to your project is incredibly easy.

Add the gem to your application's Gemfile.

```ruby
gem 'ship_compliant'
```

Then execute:

```bash
$ bundle install
```

Add your credentials to `config/initializers/ship_compliant.rb`

```ruby
ShipCompliant.configure do |c|
  c.partner_key = ENV.fetch('SHIP_COMPLIANT_KEY')
  c.username = ENV.fetch('SHIP_COMPLIANT_USER')
  c.password = ENV.fetch('SHIP_COMPLIANT_PASS')
end
```

Next step. View the [Getting Started Guide](./getting-started.html).