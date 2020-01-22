const db = require('../data/db-config')

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove
}

function find() {
  return db('schemes')
}

function findById(schemeId) {
  return db('schemes')
    .where({ id: schemeId })
    .first()
}

function findSteps(schemeId) {
  return db('steps as st')
    .where('st.scheme_id', schemeId)
    .join('schemes as sc', 'st.scheme_id', 'sc.id')
    .select('st.id', 'sc.scheme_name', 'st.step_number', 'st.instructions')
    .orderBy('st.step_number')
}

function add(scheme) {
  return db('schemes').insert(scheme).then(([id]) => {
    return findById(id)
  })
}

function addStep(stepData, schemeId) {
  return db('steps')
    .insert(stepData)
}

function update(changes, id) {
  return db('schemes')
    .where('id', id)
    .update(changes)
    .then(() => {
      return findById(id)
    })
}

function remove(id) {
  return db('schemes')
    .where('id', id)
    .del()
}