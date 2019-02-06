# <u>__Elasticsearch Cookbook__</u>

## Contents
---
- <a href="#what" style="font-size: 20px;"> What is Elasticsearch? </a>
- <a href="#how" style="font-size: 20px;"> How to use this cookbook </a>
- <a href="#tests" style="font-size: 20px;"> Run the tests </a>
---

<h2 id="what">Elasticsearch </h2>
Elasticsearch is a search engine based on Lucene. It provides a distributed, multitenant-capable full-text search engine with an HTTP web interface and schema-free JSON documents. Elasticsearch is developed in Java and is released as open source under the terms of the Apache License. Official clients are available in Java, .NET (C#), PHP, Python, Apache Groovy, Ruby and many other languages. Elasticsearch is part of the <a> https://www.elastic.co/</a> stack which is used to monitor immutable infrastructure.

## How to use this cookbook
- In your projects Berksfile, include this line:
```ruby
cookbook 'Elasticsearch', git:'git@github.com:Mhaventhan/ElasticsearchCookBook.git'
```
- Run this line in your console:
```bash
berks vendor cookbooks
```
- This cookbook is now ready to provision! For vagrant use this in your Vagrantfile:
```ruby
config.vm.provision("chef_solo") do |chef|
    chef.add_recipe("Elasticsearch:default")
  end
```
