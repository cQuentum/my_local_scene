import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js"

const initFlatpickr = () => {
  flatpickr(".datepicker", {
  enableTime: true,
  altInput: true,
  "locale": French,
  altFormat: "H:i D d M Y",
});
}

export { initFlatpickr }
