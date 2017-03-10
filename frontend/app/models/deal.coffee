`import DS from "ember-data"`

dealModel = DS.Model.extend
  title: DS.attr('string')
  description: DS.attr('string')
  publishDate: DS.attr('date')
  discountedPrice: DS.attr('number')
  imagePath: DS.attr('string')
  price: DS.attr('number')
  quantity: DS.attr('number')

`export default dealModel`
