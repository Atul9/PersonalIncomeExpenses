# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#search_start_date').datepicker
    startDate: new Date(2014, 12, 1)
    endDate: '0d'
    format: 'dd-mm-yyyy'
    autoclose: true
  $('#search_end_date').datepicker
    startDate: new Date(2014, 12, 1)
    endDate: '0d'
    autoclose: true
    format: 'dd-mm-yyyy'
  $('#expenses_search').click ->
    if $("#search_start_date").val() == "" || $('serach_end_date').val() == ""
      alert("Please enter a date range")
      return false

