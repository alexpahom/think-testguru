
function checkPasswordMatch() {
    const password = document.getElementById('password')
    const confirm = document.getElementById('password-confirmation')
    let error = confirm.parentElement.querySelector('em')
    if (error === null) {
        error = document.createElement('em')
        error.classList.add('position-absolute')
        confirm.parentElement.appendChild(error)
    }
    if (confirm.value === '') {
        error.textContent = ''
    } else if (confirm.value !== password.value) {
        error.classList.remove('text-success')
        error.classList.add('text-danger')
        error.textContent = 'Passwords do not match'
    } else {
        error.classList.remove('text-danger')
        error.classList.add('text-success')
        error.textContent = 'Passwords match'
    }
}
