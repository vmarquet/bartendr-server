# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# must be executed each time a page containing bootstrap toggles is loaded
onload_articles_page = ->
    # each time a page containing bootstrap toggles is loaded
    # (and new toggle checkboxes are added to the DOM),
    # we must execute bootstrapToggle() again, otherwise the checkboxes won't work
    $(".bootstrap-toggle").bootstrapToggle()

    # when a button is toggled on the articles index page,
    # we submit the form to the server
    $(".submit-toggle").change ->
        $(this).closest('form').submit()
        return


$(document).ready(onload_articles_page)            # when page loaded via HTTP
$(document).on('page:load', onload_articles_page)  # when page reloaded with TurboLinks
