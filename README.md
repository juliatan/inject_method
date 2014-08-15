Recreation of the inject method for Arrays
==========================================

Part of the challenge set at the end of Week 4 at Makers Academy was to recreate the Array method, inject. To aid my learning, I also decided to recreate a few other methods within the Array class.

Objective
---------

- Gain a deeper understanding of how Ruby methods work
- Practice using Blocks in Ruby

Technologies used
-----------------

* Ruby
* RSpec

How to use
----------

```sh
git clone git@github.com:juliatan/inject_method.git
cd inject_method
irb
require './lib/blocks'
```

Test the various methods I have rewritten, e.g.

```sh
[1,2,3].reduce2(:+)
```

How to run tests
----
```sh
cd inject_method
rspec
```