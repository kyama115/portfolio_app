// // app/javascript/controllers/autocomplete_controller.js
// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   static targets = [ "input", "results", "hidden" ]
//   static values = { url: String }

//   connect() {
//     console.log("Autocomplete controller connected")
//   }

//   onInput(event) {
//     const query = event.target.value.trim()
//     console.log("Input value:", query)

//     if (query.length === 0) {
//       this.hideResults()
//       return
//     }

//     this.fetchResults(query)
//   }

//   onFocus() {
//     const query = this.inputTarget.value.trim()
//     if (query.length > 0) {
//       this.showResults()
//     }
//   }

//   onBlur() {
//     setTimeout(() => {
//       this.hideResults()
//     }, 200)
//   }

//   async fetchResults(query) {
//     try {
//       const response = await fetch(`${this.urlValue}?q=${encodeURIComponent(query)}`, {
//         headers: { 
//           "Accept": "text/html",
//           "X-Requested-With": "XMLHttpRequest"
//         }
//       })
//       const html = await response.text()
//       this.resultsTarget.innerHTML = html
//       this.showResults()
//     } catch (error) {
//       console.error("Error fetching results:", error)
//     }
//   }

//   showResults() {
//     this.resultsTarget.classList.remove('hidden')
//   }

//   hideResults() {
//     this.resultsTarget.classList.add('hidden')
//   }

//   select(event) {
//     const selectedValue = event.currentTarget.dataset.value
//     this.inputTarget.value = selectedValue
//     this.hiddenTarget.value = selectedValue
//     this.hideResults()
//   }
// }

// export { Controller };