bartendr-server
===============

Style guide
-----------
In order to keep the code the easiest possible to read, we should follow a style guide. Let's follow [this Ruby style guide](https://github.com/bbatsov/ruby-style-guide) and [this Rails style guide](https://github.com/bbatsov/rails-style-guide). Please read them and understand them before starting to code.


### Indentation

The convention in Ruby is to use __2 spaces__.

To configure Sublime Text to use 2 spaces for Ruby files, open a Ruby file, and then go to `Preferences` -> `Settings - more` -> `Syntax Specific - User`, this will open a file where you can configure things that will apply to every Ruby file. Paste the following code:

```
{
	"tab_size": 2,
	"translate_tabs_to_spaces": true
}
```


Workflow
--------

### Tests

In order to make sure that you don't break things, remember to run tests often enough with `rake test`.


### `git`

Develop all features in separate branches. See [here](http://nvie.com/posts/a-successful-git-branching-model/) and [here](https://guides.github.com/introduction/flow/) for details. In short, the `master` branch should __always__ be deployable. Also, always use the `--no-ff` option when using `git merge`.


### Fixing bugs

Make fixing bugs a priority. Remember the [Joel Test question 5](http://www.joelonsoftware.com/articles/fog0000000043.html). Having a bug-free master branch allows to have a product shippable at any time.


