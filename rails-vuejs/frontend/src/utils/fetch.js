export function jsonFetch (url, options = {}) {
  if (options.body && typeof options.body === 'object') {
    options.body = JSON.stringify(options.body)
  }

  if (options.params) {
    url = `${url}?${new URLSearchParams(options.params)}`

    delete options.params
  }

  options = {
    headers: {
      'X-Requested-With': 'XMLHttpRequest',
      Accept: 'application/json',
      'Content-Type': 'application/json'
    },
    ...options
  }

  return fetch(url, options)
    .then(async (response) => {
      if (response.status === 204) {
        return null
      }

      const data = await response.json()

      if (response.ok) {
        return data
      }

      return Promise.reject(data)
    })
}
