`import Ember from 'ember'`

dealCreateRoute = Ember.Route.extend
  model: ->
    []

  setupController: (controller,model)->
    newDeal = @store.createRecord('deal', {title: null, description: null, price: null, discountedPrice: null, quantity:null})
    controller.set('newDeal', newDeal)

  actions:
    newDeal: (newDeal)->
      publishDate = new Date(@controller.get('publishDate'))
      newDeal.set('publishDate', publishDate)
      newDeal.save().then((resp)=>
          alert("Deal Created")
          newDeal = @store.createRecord('deal', {title: null, description: null, price: null, discountedPrice: null, quantity:null})
          @controller.set('newDeal', newDeal)
        (error)->
          alert('Deal could not be created...')
      )


`export default dealCreateRoute`
