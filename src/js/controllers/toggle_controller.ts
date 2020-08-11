import { Controller } from "stimulus";

export default class extends Controller {
  static get targets(): Array<string> {
    return ["toggleable"];
  }

  readonly toggleableTargets!: Array<HTMLElement>;

  toggle(): void {
    this.toggleableTargets.forEach((toggleable) => {
      toggleable.classList.toggle("hidden");
    });
  }
}
