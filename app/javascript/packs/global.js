document.addEventListener('turbolinks:load', () => {
    document
        .querySelectorAll('#test-title')
        .forEach(node => node.addEventListener('click', sortByColText))
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