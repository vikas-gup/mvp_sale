`import Ember from 'ember'`

signInRoute = Ember.Route.extend
  beforeModel: ->
    unless Ember.isPresent(@get('session.user'))
      @transitionTo('sign_in')
    else
      if (@get('session.user.role_id')) == 1
        @transitionTo('home.deal-create')

  model: ->
    @store.findAll('deal')

  setupController: (controller, model)->
    controller.set('model', model.get('lastObject'))

  actions:
    logOut: ->
      that = this
      $.ajax(
        type: 'GET'
        url: '/sign_out'
      ).then((data) =>
        alert "Logged Out"
        if Ember.isPresent(@get('session.user'))
          @get('session').set('user', null)
        @transitionTo('sign_in')
      )

    buy: (deal)->
      status = confirm("Are you sure?")
      if (status == true)
        order = @controller.store.createRecord('order', {user: @session.get('user'), deal: deal, orderDate: new Date()})
        order.save().then((data)->
            alert('Order successfully created...')
          (error)->
            alert('Order could not be created...')
        )

`export default signInRoute`
