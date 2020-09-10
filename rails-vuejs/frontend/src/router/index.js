import Vue from 'vue'
import VueRouter from 'vue-router'

const TodosIndex = () => import('@/pages/Todos/index')
const NewTodo = () => import('@/pages/Todos/new')
const EditTodo = () => import('@/pages/Todos/edit')

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'index-todo',
      component: TodosIndex
    },
    {
      path: '/todos/new',
      name: 'new-todo',
      component: NewTodo
    },
    {
      path: '/todos/:id/edit',
      name: 'edit-todo',
      component: EditTodo
    },
    {
      path: '*',
      redirect: '/'
    }
  ]
})
