# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:load ready', ->
  $('#transactions').dataTable
    "sPaginationType": "full_numbers"
  $('#transaction_search').click ->
    if $("#search_start_date").val() == "" || $('serach_end_date').val() == ""
      alert("Please enter a date range")
      return false

