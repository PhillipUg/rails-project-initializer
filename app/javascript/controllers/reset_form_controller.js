import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="reset-form"
export default class extends Controller {
    handleFormSubmit(event) {
        event.preventDefault();

        // Form data
        const formData = new FormData(this.element);

        // Submit the form using fetch
        fetch(this.element.action, {
            method: 'POST',
            body: formData,
            headers: {
                'X-Requested-With': 'XMLHttpRequest', // To indicate an AJAX request
                'Accept': 'application/json'
            }
        })
            .then(response => response.blob())
            .then(blob => {
                // Create a link element to trigger the download
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.href = url;
                a.download = 'project.zip'; // Name for the downloaded file
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);

                // Reset the form
                this.resetForm();
            })
            .catch(error => {
                // Handle any errors in the submission
                console.error('There was an error submitting the form:', error);
            });
    }

    resetForm() {
        this.element.reset(); // Reset the form itself

        // Get all the radio-selection controller instances within the form
        this.element.querySelectorAll('[data-controller="radio-selection"]').forEach(element => {
            const controller = this.application.getControllerForElementAndIdentifier(element, "radio-selection");

            // Call the resetRadio method
            if (controller) {
                controller.resetRadioSelection();
            }
        });
    }
}
