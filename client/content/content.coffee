Template.content.onCreated ->
  Session.set('name', 'testUser')
  Session.set('currentTopic', 'main')

Template.content.helpers
  currentName: -> Session.get('name')
  currentTopic: -> Session.get('currentTopic')
  comments: -> Comments.find topic: Session.get('currentTopic')
  topics: -> Topics.find()
  topicCount: (topicName) ->
    Comments.find(topic: topicName).count()
  mainCount: -> Comments.find(topic: 'main').count()

Template.content.events
  'click .name-submit': ->
    name = $('.name-input').val()
    Session.set('name', name)

  'click .chat-submit': ->
    text = $('.chat-input').val()
    name = Session.get('name')
    topic = Session.get('currentTopic')
    Comments.insert
      username: name
      text: text
      topic: topic

  'click .topic': (e) ->
    topicName = $(e.target).text()
    Session.set('currentTopic', topicName)