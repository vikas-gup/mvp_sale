`import DS from "ember-data"`

roleModel = DS.Model.extend
  users: DS.hasMany('user')
  name: DS.attr('string')

`export default roleModel`
