// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import { initializeMaps } from "./controllers/maps.js"
window.initializeMaps = initializeMaps