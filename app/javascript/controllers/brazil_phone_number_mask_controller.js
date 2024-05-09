import { Controller } from "@hotwired/stimulus"
import "inputmask";

export default class extends Controller {
  connect() {
    new Inputmask({
      regex: "\\([1-9]{2}\\) [0-9]{4,5}-[0-9]{4}",
      keepStatic: true,
    }).mask(this.element);
  }
}
