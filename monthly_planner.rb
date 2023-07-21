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

    start_date = Date.new(date.year, date.month - 1)
    end_date = Date.new(date.year, date.month, -1)

    (start_date..end_date)
end

def calculate_quarterly_dates
    date = ARGV.empty? ? Date.today : Date.parse(ARGV.first)

    quarter = ((date.month - 1) / 3) + 1
    quarter_start_month = (quarter - 1) * 3 + 1

    start_date = Date.new(date.year, quarter_start_month)
    end_date = (start_date >> 2) - 1

    [start_date, end_date]
end



def generate_quarterly_pages(start_date, end_date)
    '''
    Generate monthly pages. Assumes that a quarter is 13 weeks.
    pre: start date and end_date is given
    post:
    '''
    quarter_start = start_date
    quarter_end = end_date
    week_start = quarter_start

    # which part are we comparing?
    while week_start <= quarter_end
        week_end = week_start + 6

        begin_new_page :right

        week_ahead_page(week_start, week_end) # week_ahead_page accepts 2 parameters

        puts "Generate pages for a quarter of #{week_start.strftime('%A, %B %-d, %Y')}: in #{FILE_NAME}"

        # Generate days in a week
        (week_start..week_end).each do |date|
            # ...then the page for the week

            # I want to measure my weekend too
            daily_tasks_page date
            daily_calendar_page date
            journal_page date

        end
        # update new week_start
        week_start = week_end + 1
    end
end

# date = ARGV.empty? ? Date.today : Date.parse(ARGV.first)
# start_date = Date.new(date.year, date.month - 1)
# end_date = Date.new(date.year, date.month, -1)

# TODO: Can I change the file name later after a user prompt?
def journal_title(start_date, end_date)
    return title = "#{start_date.year} #{start_date.strftime('%B')} - #{end_date.strftime('%B')} Timeblock Planner"
end

# Journal titles are changed here
start_date, end_date = calculate_quarterly_dates

QUARTERLY_FILE_NAME = journal_title(start_date, end_date)

# Journal title ends here

'''
Generating a monthly document
User enters a year and month, it generates a monthly calendar page
post: generate a single file of all pages combined
'''
Prawn::Document.generate(QUARTERLY_FILE_NAME, margin: RIGHT_PAGE_MARGINS, print_scaling: :none) do
    setup
    start_date, end_date = calculate_quarterly_dates
    generate_quarterly_pages(start_date, end_date)
end
      
