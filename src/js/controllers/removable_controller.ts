import { Controller } from "@hotwired/stimulus";

// This controller adds the ability to remove any arbitrary object in the DOM.
export default class extends Controller {
  public remove(): void {
    const parentElement = this.element.parentElement;

    if (parentElement !== null) {
      parentElement.removeChild(this.element);
    }
  }
}
