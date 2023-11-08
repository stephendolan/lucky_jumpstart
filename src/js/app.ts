/* eslint no-console:0 */

// Rails Unobtrusive JavaScript (UJS) is *required* for links in Lucky that use DELETE, POST and PUT.
// Though it says "Rails" it actually works with any framework.
require("@rails/ujs").start();

import { Application } from "@hotwired/stimulus";

import HelloController from "./controllers/hello_controller";
import RemovableController from "./controllers/removable_controller";
import ToggleController from "./controllers/toggle_controller";

declare global {
  interface Window {
    Stimulus: any;
  }
}

let Stimulus = (window.Stimulus = Application.start());
Stimulus.register("hello", HelloController);
Stimulus.register("toggle", ToggleController);
Stimulus.register("removable", RemovableController);
