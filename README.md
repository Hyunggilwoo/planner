# Generate Time-Block Planner Pages

I'm a big fan of [Cal Newport's Time-Block Planner](https://www.timeblockplanner.com) but I didn't like 
having unused weekend pages and got tired of writing in the dates so I wrote this script to generate
my take on it. It generates a PDF with a week's worth of 8.5 x 11 inch pages. You can take a look at a
[sample](sample.pdf) and see what you think.

I'm also a fan of [Manager Tools' 1-on-1s](https://www.manager-tools.com/map-universe/one-ones) so I also
incorporated a version of their form meeting form.

If you prefer A4 or Helvetica, check out [jlorenzetti](https://github.com/jlorenzetti)'s [fork](https://github.com/jlorenzetti/planner).


## Installation

Assuming you've got [Ruby](http://www.ruby-lang.org/en/) and [Bundler](https://bundler.io)
installed you can just run:
```
git clone git@github.com:drewish/planner.git
cd planner
bundle install
```

## Usage

It assumes you want to generate pages for the next week so there are no options:
```
./planner.rb
```

You can generate pages for a different weeks by passing in the date:
```
./planner.rb 2022-05-27
```

On a Mac you can send the PDF directly to your printer:
```
lpr time_block_pages.pdf
```

## Limitations

Probably only works on a Mac since it hardcodes the font path.
