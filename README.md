# README


#### View the results of this project on Heroku: [Home Consultant](https://trelora-home.herokuapp.com/)

* To log in, use the email: 'steven@trel.co' and the password: 'password'.
* Use this address to explore: `1860 South Marion St Denver CO 80210`

This [project](https://trelora-home.herokuapp.com/) was submitted as the second Module 3 group project at the Turing School of Software and Design. Designed to function as an introduction to interacting with an external API, students are expected to appropriately utilize POST requests, create API services and micro-services, develop adequate MVC architecture, and render the results of their queries using JQuery and JavaScript.

## Introduction and Function

Home Consultant was designed to serve as a home consultation tool prototype for TRELORA, a Denver-based real estate brokerage. By partnering with the Turing School of Software and Design, TRELORA has provided a valuable learning experience for Module 3 students. Our team seeks to present a sleek and fast mobile app that helps TRELORA agents cut down on time spent on data entry, making efficient use of their consultations. 

The app retrieves data from an API setup through TRELORA. The property information page has a link that shows google map directions and traffic from their current location. Also by clicking on "Zillow' the Home Agent will see the property page on Zillow. When agent clicks 'Start Consultation', a timestamp will be recorded and another timestamp will be recorded at the end. The consultation information along with time stamps is sent to TRELORA when the Home Agent clicks 'Save'.  

## Design and Architecture

Home Consultant is designed to be a single page app that guides the agent through the consulting process, from preparation to review. Original designs involved a tab structure, but the team determined to move away from that format. On a backend level, the architecture is relatively streamlined. 

## Setup and Implementation

* Change into new directory, and run "git clone https://github.com/patrickshobe/home-consultant"
* Run rake db:reset
* Run rake db:migrate
* Run bundle/bundle update
* Run rspec to ensure that all tests are passing

## Demo app 

* Visit app at https://trelora-home.herokuapp.com/
* Demo user email: `steven@trel.co`
* Demo user password: `password`
* Demo address: `1860 South Marion St Denver CO 80210`

## Tools/Dependencies

* Ruby 2.5.1
* Rails 5.2.1
* [Byebug](https://github.com/deivid-rodriguez/byebug/blob/master/README.md)
* [Capybara](https://github.com/teamcapybara/capybara)
* [Faraday](https://github.com/lostisland/faraday)
* [Figaro](https://github.com/laserlemon/figaro)
* [Launchy](https://github.com/copiousfreetime/launchy)
* [Pry](https://github.com/pry/pry)
* [Rspec-rails](https://github.com/rspec/rspec)
* [Shoulda-Matchers](https://github.com/thoughtbot/shoulda-matchers)
* [SimpleCov](https://github.com/colszowka/simplecov)
* [VCR](https://relishapp.com/vcr/vcr/docs)
* [Webmock](https://github.com/bblimke/webmock)

### Contributors

* [Patrick Shobe](https://github.com/patrickshobe), Project Manager
* [Daniel Mulitauopele](https://github.com/DanielMulitauopele)
* [Andrew Tobin](https://github.com/andrewetobin)
* [Tim Fielder](https://github.com/tfielder)
