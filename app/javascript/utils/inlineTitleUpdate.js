document.addEventListener('turbolinks:load', function () {
    let $formInline = $('.form-inline-link')
    $formInline.on('click', formInlineLinkHandler)

    const errors = document.querySelector('.resource-errors')

    if (errors && $formInline.length) formInlineHandler(errors.dataset.resourceId)
})

function formInlineLinkHandler(event) {
    event.preventDefault()

    formInlineHandler(this.dataset.testId)
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
