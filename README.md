# stockz-rails
Stock market simulator

## Setup
1. Install `ruby-2.1.2`.

		rvm install ruby-2.1.2
		rvm use ruby-2.1.2

2. Install `rails`.

		gem install rails --no-document

	- You can use `gem install rails --no-document --verbose` to see more information.

3. Install required gems.

		bundle install

4. Set up the database.

		rake db:create db:migrate

5. Start the server.

		rails server

	- You can also use `rails s` to start the server.

## Setting up Sublime Text 2
By default, Sublime Text 2 uses tabs for indentation. To use two spaces as per the unofficial [ruby style guide][], do the following.

1. Open an `.rb` file, or create a new document and set it's syntax to `Ruby`.

2. Go to `Preferences -> Settings -> More -> Syntax Specific`.

	- This should open a file called `Ruby.sublime-settings`.

3. Add the following settings to the file.

		{
			"tab_size": 2,
			"translate_tabs_to_spaces": true
		}

	- If the file is empty, just copy and paste this text. If it is not empty, copy the individual lines, excluding `{` `}`.

4. Close and save the file.

5. Repeat for files with the `Ruby on Rails` syntax.

#### Lovingly created by [@playonverbs][], [@jackwilsdon][], [@dontpanicitsellen][] and [@Daedalus191][].

  [@playonverbs]: http://github.com/playonverbs
  [@jackwilsdon]: http://github.com/jackwilsdon
  [@dontpanicitsellen]: http://github.com/dontpanicitsellen
  [@Daedalus191]: http://github.com/Daedalus191
  [ruby style guide]: https://github.com/bbatsov/ruby-style-guide