import { createRouter, createWebHistory } from 'vue-router'

const TodosIndex = () => import('@/pages/Todos/Index.vue')
const NewTodo = () => import('@/pages/Todos/New.vue')
const EditTodo = () => import('@/pages/Todos/Edit.vue')

export const router = createRouter({
  history: createWebHistory(),
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
      path: '/:pathMatch(.*)*',
      redirect: '/'
    }
  ]
})
