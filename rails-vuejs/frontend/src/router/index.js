import { createRouter, createWebHistory } from 'vue-router'

const TodosIndex = () => import('@/pages/Todos/Index')
const NewTodo = () => import('@/pages/Todos/New')
const EditTodo = () => import('@/pages/Todos/Edit')

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
