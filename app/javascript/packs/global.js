document.addEventListener('turbolinks:load', () => {
    let testTitleHeader = document.getElementById('test-title')
    let passwordConfirm = document.getElementById('password-confirmation')
    let password = document.getElementById('password')

    testTitleHeader && testTitleHeader.addEventListener('click', sortByColText)
    passwordConfirm && passwordConfirm.addEventListener('input', checkPasswordMatch)
    password && password.addEventListener('input', checkPasswordMatch)
});

function sortByColText() {
    const hideClass = 'd-none'
    const table = document.querySelector('table')
    const rows = table.querySelectorAll('.data')
    const header = table.querySelector('tr')

    let rowsArray = Array.prototype.slice.call(rows, 0)
    let arrowUp = this.querySelector('.sort-asc')
    let arrowDown = this.querySelector('.sort-desc')

    if (arrowUp.classList.contains(hideClass)) {
        rowsArray.sort(compareRowsAsc)
        arrowUp.classList.remove(hideClass)
        arrowDown.classList.add(hideClass)
    } else {
        rowsArray.sort(compareRowsDesc)
        arrowDown.classList.remove(hideClass)
        arrowUp.classList.add(hideClass)
    }

    let sortedTable = document.createElement('table')
    let tbody = document.createElement('tbody')
    sortedTable.classList.add('table', 'table-borderless', 'table-hover', 'align-middle', 'ms-5')
    sortedTable.appendChild(tbody)
    sortedTable.children[0].appendChild(header)

    rowsArray.forEach(row => sortedTable.children[0].appendChild(row))
    table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
    const title1 = row1.querySelector('td').textContent
    const title2 = row2.querySelector('td').textContent

    if (title1 < title2) { return -1 }
    if (title1 > title2) { return 1 }
    return 0
}

function compareRowsDesc(row1, row2) {
    const title1 = row1.querySelector('td').textContent
    const title2 = row2.querySelector('td').textContent

    if (title1 < title2) { return 1 }
    if (title1 > title2) { return -1 }
    return 0
}

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
