# Pin npm packages by running ./bin/importmap

pin "application", to: "javascript/application.js"
pin "admin", to: "javascript/admin.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin_all_from "app/javascript", under: "javascript"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "stimulus-autocomplete"
