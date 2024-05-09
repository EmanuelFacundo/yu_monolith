import { Controller } from "@hotwired/stimulus"
import "inputmask";

export default class extends Controller {
  connect() {
    new Inputmask({
      regex: "^[\w.-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,}$",
      keepStatic: true,
    }).mask(this.element);
  }
}