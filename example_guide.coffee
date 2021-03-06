if typeof(window) != 'undefined'
  Guide = window.__xtnd_guide
else
  Guide = global.XtndGuide

class ExampleGuide extends Guide
  DEBUG_REQ_HEADERS: false
  DEBUG_OUTPUT_HTML: false
  DEBUG_RES_HEADERS: false
  BUFFER_WHOLE_HTML: true
  htmlVisitor: (location, name, context, url) ->
    value = super(location, name, context, url)
    if name == 'body' && location == 'end'
      return '<script src="'+@INTERNAL_URL_PREFIX+'/inject.js"></script>'
    else
      value

if typeof(window) != 'undefined'
  options = require('data::options')
  guide = new ExampleGuide(options)
  window.xtnd = guide.xtnd
else
  module.exports = ExampleGuide
