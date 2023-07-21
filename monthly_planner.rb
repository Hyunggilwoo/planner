#!/usr/bin/env ruby

require 'prawn'
require 'prawn/measurement_extensions'
require 'pry'
require 'date'

require_relative 'planner'
require_relative 'file_format' # stored constants to be used as a style

def setup
    font_families.update(FONTS)
    font(FONTS.keys.first)
    stroke_color MEDIUM_COLOR
    line_width(0.5)
end

def calculate_dates
    date = ARGV.empty? ? Date.today : Date.parse(ARGV.first)

    sunday = if ARGV.empty? # if no argument, generate pages for set time
        date = DateTime.now.to_date
        if date.wday > 2
          puts "Generating pages for the next week"
          date.next_day(7-date.wday)
        else
          puts "Generating pages for this week"
          date.prev_day(date.wday)
        end
      else
        date = DateTime.parse(ARGV.first).to_date # if date specified, generate pages for the specified time
        puts "Parsed #{date} from arguments"
        date.prev_day(date.wday)
      end
      sunday
    end
end

def generate_weekly_pages(sunday)
    '''
    Generate monthly pages.
    '''
    WEEKS.times do |week|
        unless week.zero?
          # ...then the page for the week
          begin_new_page :right
        end
    
        monday = sunday.next_day(1)
        # sunday = sunday.next_day(7)
        puts "Generate pages for week #{monday.strftime('%W')}: #{monday.strftime('%A, %B %-d, %Y')} through #{sunday.strftime('%A, %B %-d, %Y')} in #{FILE_NAME}"
        week_ahead_page monday, sunday
    
        # I want to measure my weekend too
        (1..7).each do |i|
          day = sunday.next_day(i)
          daily_tasks_page day
          daily_calendar_page day
          journal_page day
        end
    
        sunday = monday.next_day(6)
    end
end

date = ARGV.empty? ? Date.today : Date.parse(ARGV.first)
start_date = Date.new(date.year, date.month - 1)
end_date = Date.new(date.year, date.month, -1)

# TODO: Can I change the file name later after a user prompt?
MONTHLY_FILE_NAME = ""
'''
Generating a monthly document
User enters a year and month, it generates a monthly calendar page
'''
Prawn::Document.generate(FILE_NAME, margin: RIGHT_PAGE_MARGINS, print_scaling: :none) do
    setup
    sunday = calculate_dates
    generate_weekly_pages(sunday)
end
      
