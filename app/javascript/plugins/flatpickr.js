import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
  enableTime: true,
  altInput: true,
  "locale": French,
  altFormat: "D d M Y à H:i"
});
}

export { initFlatpickr }

