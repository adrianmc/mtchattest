Template.content.onCreated ->
  Session.set('name', 'testUser')

Template.content.helpers
  currentName: -> Session.get('name')
  comments: -> Comments.find()

Template.content.events
  'click .name-submit': ->
    name = $('.name-input').val()
    Session.set('name', name)

  'click .chat-submit': ->
    text = $('.chat-input').val()
    author = Session.get('name')
    Comments.insert
      username: author
      text: text