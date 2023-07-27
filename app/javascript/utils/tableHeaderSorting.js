document.addEventListener('turbolinks:load', () => {
    const tableHeaders = document.querySelectorAll('th.sortable')

    if (tableHeaders.length !== 0) {
        let table = tableHeaders[0].closest('table')
        let tableSorting = new TableHeaderSorting(table)
        tableHeaders.forEach(header =>
            header.addEventListener('click', tableSorting.listen.bind(tableSorting))
        )
    }
})

class TableHeaderSorting {

    hideClass = 'd-none'
    sort = {
        asc: 1,
        desc: -1
    }

    constructor(table) {
        this.table = table

        this.rowsArray = [...this.table.querySelectorAll('tr:not(:first-child)')]
        this.headersRow = this.table.querySelector('tr')
        this.headersArray = [...this.headersRow.querySelectorAll('th')]
        this.allArrows = this.table.querySelectorAll('.sort-asc, .sort-desc')
    }


    listen = (header) => {
        const tbody = this.table.querySelector('tbody')
        let currentNode = header.currentTarget
        let arrowUp = currentNode.querySelector('.sort-asc')
        let arrowDown = currentNode.querySelector('.sort-desc')

        const headerIndex = this.headersArray.findIndex(h => h === currentNode)
        let direction
        let isAsc = arrowUp.classList.contains(this.hideClass)
        this.allArrows.forEach(e => e.classList.add(this.hideClass))

        if (isAsc) {
            direction = this.sort.asc
            arrowUp.classList.remove(this.hideClass)
            arrowDown.classList.add(this.hideClass)
        } else {
            direction = this.sort.desc
            arrowDown.classList.remove(this.hideClass)
            arrowUp.classList.add(this.hideClass)
        }

        const sortedRows = this.sortTableRows(this.rowsArray, headerIndex, direction)
        const newBody = document.createElement('tbody')
        newBody.appendChild(this.headersRow)
        sortedRows.forEach(row => newBody.appendChild(row))
        this.table.replaceChild(newBody, tbody)
    }

    sortTableRows = (rows, headerIndex, multiplier) => rows.sort((row1, row2) => {
        const title1 = row1.querySelectorAll('td')[headerIndex].textContent
        const title2 = row2.querySelectorAll('td')[headerIndex].textContent

        if (title1 < title2) {
            return -1 * multiplier
        }
        if (title1 > title2) {
            return 1 * multiplier
        }
        return 0
    })
}