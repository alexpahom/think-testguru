document.addEventListener('turbolinks:load', function () {
    $('.form-inline-link').on('click', formInlineLinkHandler)

    const errors = document.querySelector('.resource-errors')

    if (errors) {
        const resourceId = errors.dataset.resourceId
        formInlineHandler(resourceId)
    }
})

function formInlineLinkHandler(event) {
    event.preventDefault()

    let testId = this.dataset.testId
    formInlineHandler(testId)
}

function formInlineHandler(testId) {
    const link = document.querySelector(`.form-inline-link[data-test-id='${testId}']`)
    const $testTitle = $(`.test-title[data-test-id='${testId}']`)
    const $formInline = $(`.form-inline[data-test-id='${testId}']`)

    $testTitle.toggle()
    $formInline.toggle()

    if ($formInline.is(':visible')) {
        link.textContent = 'Cancel'
    } else {
        link.textContent = 'Edit'
    }
}