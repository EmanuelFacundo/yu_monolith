import { Controller } from "@hotwired/stimulus"
import "inputmask";

export default class extends Controller {
  connect() {
    new Inputmask({
      regex: "(\\d{3}\\.\\d{3}\\.\\d{3}-\\d{2})|(\\d{2}\\.\\d{3}\\.\\d{3}\\/\\d{4}-\\d{2})",
      keepStatic: true,
    }).mask(this.element);
  }
}

