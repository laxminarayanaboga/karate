Feature: Learning json feautes of karate

Scenario: defining Jsons and asserting
* def cat = { name: 'Billie', scores: [2, 5] }
* assert cat.scores[1] == 5


Scenario: List in Jsons and asserting
* def cats = [{ name: 'Billie' }, { name: 'Bob' }]
* match cats[1] == { name: 'Bob' }

Scenario: Assigning part of json to other
* def cats = [{ name: 'Billie' }, { name: 'Bob' }]
* def first = cats[0]
* match first == { name: 'Billie' }
* assert first.name == 'Billie'

Scenario: Embedded expression
* def name = 'abcd'
# wrong !
* def foo = { bar: 'hello #(name)' }
* assert foo.bar == 'hello #(name)'
# right !
* def boo = { bar: '#("hello " + name)' }
* assert boo.bar == 'hello abcd'

Scenario: Enclosed Javascript
When def user = { name: 'john', age: 21 }
And def lang = 'en'
* def embedded = { name: '#(user.name)', locale: '#(lang)', sessionUser: '#(user)' }
* def enclosed = ({ name: user.name, locale: lang, sessionUser: user })
* assert embedded.name == 'john'
* assert enclosed.name == 'john'
* match embedded == enclosed

Scenario: Table expressions are trated as Java arrays
* table cats
  | name   | age |
  | 'Bob'  | 2   |
  | 'Wild' | 4   |
  | 'Nyan' | 3   |
* print cats
* match cats == [{name: 'Bob', age: 2}, {name: 'Wild', age: 4}, {name: 'Nyan', age: 3}]

Scenario: Two different ways to define a table.
* set firstWay
  | path       | 0        | 1      | 2       |
  | name.first | 'John'   | 'Jane' |         |
  | name.last  | 'Smith'  | 'Doe'  | 'Waldo' |
  | age        | 20       |        |         |

* match firstWay[0] == { name: { first: 'John', last: 'Smith' }, age: 20 }
* match firstWay[1] == { name: { first: 'Jane', last: 'Doe' } }
* match firstWay[2] == { name: { last: 'Waldo' } }

* table secondWay
	|name|age|
	|{ first: 'John', last: 'Smith' }|20|
	|{ first: 'Jane', last: 'Doe' }|null|
	|{ last: 'Waldo' }|null|

* match secondWay[0] == { name: { first: 'John', last: 'Smith' }, age: 20 }
* match secondWay[1] == { name: { first: 'Jane', last: 'Doe' } }
* match secondWay[2] == { name: { last: 'Waldo' } }
