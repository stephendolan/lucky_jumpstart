import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  // Defines a `this.helloTarget` that you can use in your functions.
  static get targets(): Array<string> {
    return ["hello"];
  }

  // Called whenever the controller is attached to an element on the page.
  initialize(): void {
    console.log("Hello! StimulusJS is working!");
  }

  // Can be called from within this file with `this.hello()`, or in an action in your HTML.
  hello(): void {
    console.log("Hello! You're in a StimulusJS function!");
  }
}
