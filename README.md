Git that WiFi
====
[![Build Status](https://travis-ci.org/danielbonnell/git_that_wifi.svg?branch=DB_1_view_page_details)](https://travis-ci.org/danielbonnell/git_that_wifi)
[![Code Climate](https://codeclimate.com/github/danielbonnell/git_that_wifi.png)](https://codeclimate.com/github/danielbonnell/git_that_wifi)
[![Coverage Status](https://coveralls.io/repos/danielbonnell/git_that_wifi/badge.png)](https://coveralls.io/r/danielbonnell/git_that_wifi)

## Contributors
* [Daniel Bonnell](http://www.github.com/danielbonnell)
* [Chan Park](http://www.github.com/chanhpark)
* [Nick Clucas](http://www.github.com/nickcluc)
* [Jenny Brown](http://www.github.com/jennyzbrown)
* [Kiran Sridhar](http://www.github.com/kiransridhar)

## About the Project
[Git that WiFi](http://stark-peak-6172.herokuapp.com/) is a group project that we completed for Launch Academy. The goal of the project was to build a fully functional review site similar to Yelp. Git that WiFi is a review site for public working spaces, such as coffee shops and libraries.
![Git that WiFi!](https://github.com/danielbonnell/git_that_wifi/blob/master/screenshot.png)

## Learning Outcomes
The primary purpose of the group project was to learn how to effectively work as a team. Below is a brief list of learning outcomes from the project.
* We learned how to use git workflow to allow pairs and individuals to simultaneously work on different parts of the app while minimizing duplication of work.
* We learned to use project management software (Trello / Pivotal Tracker) to assign components of the project to different team members and track progress through the planning, development, commit, code review, and merged stages of development.
* We practiced pair programming, making sure to regularly switch partners and alternate between the driver and observer roles.
* We strictly adhered to test driven development (TDD) best practices.
* We ensured that all core functionality was implemented before devoting time for non-core features.

## Core Features
Below is a list of the core features that were required for the app.
* Users can register, log in, and log out.
* Registered users can update their profile with their contact information.
* Registered users can upload an image for their avatar.
* Users can add a 'site' to be reviewed. The site must include an address, phone number, and name at a minimum. The user can also specify a website and upload an image of the site.
* A user can edit a site that they created.
* Users can post reviews of a site.
* A user who creates a site will receive an email notification when a new review has been posted.
* Users can upvote or downvote other users' reviews. Reviews with the highest score will be shown at the top of the list.
* Users can search for sites by title.
* Administrative users can edit or delete both sites and reviews.

## Non-Core Features
Below is a list of features the team implemented that were not required.
* Users can use their Gravatar as their avatar.
* Each site page has an interactive map showing its location (Google Maps API).
* A user can search for sites using a full-text search (Searchkick gem).
* Basic front end styling with Foundation.
