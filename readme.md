# Belfast Ruby 2014

Belfast Ruby is community of aspiring and experienced developers in Belfast, Northern Ireland passionate about Ruby and Rails.
We hold monthly meetups which are open to everyone.

Visit the website - [belfastruby.com](http://www.belfastruby.com)

##Open Sourced - Get Involved

This website is open sourced so that the community can get involved in its development and contribute whatever they can. Please refer to the GitHub Issues to view a list of bugs or suggested improvements. Feel free to work on these, then when you've committed the changes send a pull request or attach it to the related issue so we can merge it in.

### Ideas for Features or Improvements

We're open to ideas about improving the Belfast Ruby website. Here's a couple ideas we've come up with so far. Add your own or work on bringing these ideas to life.

- Update the resources page with Ruby related links that you find useful
- Have a section for links to each speaker's slides/companion notes
- Pull in related Instagram or Flickr images for each meetup

Even if you aren't interested in contributing code, we'd love if you could suggest any ideas for improvements or let us know via GitHub Issue if you run into any bugs.


## Dependencies

Here's what you need to run the website locally.

### Bundler

This will install all gems required to run the app.

    gem install bundler
    cd belfastruby-website
    bundle install

### Run site locally


This site is built on Jekyll. To run the site in your browser locally and watch for any changes made use:

    jekyll serve --watch

Please refer to Jekyll's documentation for help with setting it up http://jekyllrb.com/docs/home/


### Compass

To use sass, Compass is being used. Edit scss within sass folder, do not edit the css files directly. To install and watch scss files for changes:

    gem install compass
    compass install compass
    compass watch





