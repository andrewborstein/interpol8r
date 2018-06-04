# Interpol8r

### Demo

https://interpol8r.herokuapp.com/

### Overview

With this super kewl app you can:

* create `messages` that when run, return text described in their `spec`
* reference other `messages` to embed the output of their `spec`
* view a list of all current `messages` (including their `name` and `spec`)
* have endless fun with the whole family

### Dependencies
* Ruby
* Rails

### Installation

* clone the repo locally
* cd into the directoy
* bundle install gems
* run migrations
* start the rails server
* have a ball 🎉

### Process

This project took about a full day to complete. The general outline of work went something like this:

1. Read the prompt. Re-read the prompt. Re-read the prompt [n] more times.
2. Get some clarifications on the prompt (Thanks, Eli!)
3. Sit down with a note-taking app and start planning
	* list resources and attributes
 	* list app functionality / product reqs
 	* list views / pages
 	* list components and subcomponents
 	* weigh pros and cons of several technology approaches
 		* rails app w/ standard crud
		* rails app w/ react front-end
		* sever-less react app
 	* user flows
		* index page
		* new/edit page
	* architecture
		* tl:dr; roll-your-own string interpolation based on db records
		* should feel like ruby's implementation
		* how to deal with undefined interpolated values
	* error handling
		* do i need it?
	* open questions
		* need to strip out reserved words?
	* tests
		* TDD! start with test cases, work from there.
		* is rspec ok? do i need to create factories since this involves the db?
4. Start building the ruby app — ugly but functional, no styling at all
5. Ensure test suite is sufficient and passes
6. Refactor where appropriate, for clarity and maintainability
7. Deploy to heroku and test 
8. Make UX and design improvements
9. Polish it up
10. Test it some more and then 🚢 it!
