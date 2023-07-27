document.addEventListener('turbolinks:load', () => {
    const form = document.querySelector('#new_user')

    if(form) {
        new PasswordConfirmationValidator(form).listen()
        // form.addEventListener('input', new PasswordConfirmationValidator(form).validatePassword)
    }
})

class PasswordConfirmationValidator {

    constructor(form) {
        this.form = form
        this.password = document.getElementById('password')
        this.confirmation = document.getElementById('password-confirmation')
        this.error = document.getElementById('confirmation-alert')
    }

    listen = () => {
        this.form.addEventListener('input', this.validatePassword.bind(this))
    }

    validatePassword = () => {
        if (!this.confirmation.value) {
            this.error.textContent = ''
            return
        }

        if (this.confirmation.value !== this.password.value) {
            this.error.classList.remove('text-success')
            this.error.classList.add('text-danger')
            this.error.textContent = 'Passwords do not match'
        } else {
            this.error.classList.remove('text-danger')
            this.error.classList.add('text-success')
            this.error.textContent = 'Passwords match'
        }
    }
}