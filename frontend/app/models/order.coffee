`import DS from "ember-data"`

orderModel = DS.Model.extend
  user: DS.belongsTo('user')
  deal: DS.belongsTo('deal')
  orderDate: DS.attr('date')

`export default orderModel`
