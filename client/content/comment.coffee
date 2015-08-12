Template.comment.events
  'click .branch-btn': ->
    Topics.insert
      name: this.text
      parent: Session.get('currentTopic')
    # TODO - update current Topic w/ child node