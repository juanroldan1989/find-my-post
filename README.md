<div align="left">
  <a href="https://github.com/juanroldan1989/find-my-post"><img width="300" src="https://github.com/juanroldan1989/find-my-post/raw/master/app/assets/images/icon.jpg" alt="find my post logo" /></a>
</div>

# Find My Post !

[![Code Climate](https://codeclimate.com/github/juanroldan1989/find-my-post/badges/gpa.svg)](https://codeclimate.com/github/juanroldan1989/find-my-post)
[![Build Status](https://travis-ci.org/juanroldan1989/find-my-post.svg?branch=master)](https://travis-ci.org/juanroldan1989/find-my-post)
[![Coverage Status](https://coveralls.io/repos/github/juanroldan1989/find-my-post/badge.svg?branch=master)](https://coveralls.io/github/juanroldan1989/find-my-post?branch=master)

Responsive web application built to search inside facebook groups and find any missed post.

# Development

Clone repository:

```
git clone git@github.com:juanroldan1989/find-my-post.git
```

Install gems:

```
bundle install
```

Set values inside `application.yml` file:

```
cp config/application.sample.yml config/application.yml
```

Validate test suite:

```
rspec spec
```

Launch server:

```
foreman start
```

# Live app

http://find-my-post.herokuapp.com
