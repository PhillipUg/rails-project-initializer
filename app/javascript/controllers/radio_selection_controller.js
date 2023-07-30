import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["option", "check", "radio"]

    connect() {
        this.update()
    }

    toggle(event) {
        const radio = event.currentTarget;
        if (radio.dataset.checked === "true") {
            radio.checked = false;
            radio.dataset.checked = "false";
        } else {
            radio.dataset.checked = "true";
        }
        this.update()
    }

    update() {
        this.optionTargets.forEach((option, index) => {
            const check = this.checkTargets[index]
            const radio = this.radioTargets[index]


            if (radio.checked) {
                radio.dataset.checked = "true"; // Keep track of the checked state
                option.classList.add('border-red-800', 'border', 'ring', 'ring-red-800')
                option.classList.remove('border-red-800')
                check.classList.add("text-red-800")
                check.classList.remove("text-gray-300")
            } else {
                radio.dataset.checked = "false"; // Keep track of the unchecked state
                option.classList.remove('border-red-800', 'border', 'ring', 'ring-red-800')
                option.classList.add('border-red-800', 'hover:border', 'hover:border-red-800', 'hover:ring', 'hover:ring-red-800')
                check.classList.remove("text-red-800")
                check.classList.add("text-gray-300")
                // check.classList.add('invisible')
            }
        })
    }
}
