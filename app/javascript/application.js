import Rails from "@rails/ujs";
Rails.start();

import "@hotwired/turbo-rails";
import "controllers";

// Core
import "./vendor/@popperjs/core/dist/umd/popper.min.js";
import "./vendor/bootstrap/dist/js/bootstrap.min.js";

// Vendor JS
// import "./vendor/onscreen/dist/on-screen.umd.min.js";

// Slider
import "./vendor/nouislider/dist/nouislider.min.js";

// Smooth scroll
import "./vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js";

// Charts
// import "./vendor/chartist/dist/chartist.min.js";
// import "./vendor/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js";

// Datepicker
import "./vendor/vanillajs-datepicker/dist/js/datepicker.min.js";

// Sweet Alerts 2
import "./vendor/sweetalert2/dist/sweetalert2.all.min.js";

// Notyf
import "./vendor/notyf/notyf.min.js";

// Simplebar
import "./vendor/simplebar/dist/simplebar.min.js";

// Volt JS
// import "./volt.js";

document.addEventListener("click", function (event) {
    if (event.target.matches("[data-method='delete']")) {
        console.log("Delete method clicked!");
    }
});