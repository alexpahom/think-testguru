document.addEventListener('turbolinks:load', () => {
    const form = document.getElementById('badge-form')
    if (form) new RuleOptionsProvider(form).listenRules()
})

class RuleOptionsProvider {

    constructor(form) {
        this.form = form
        this.optionsField = document.getElementById('badge_rule_options')
        this.label = this.form.querySelector('label[for=badge_rule_options]')
        this.labelText = this.label.innerText
    }

    listenRules = () => {
        this.form.addEventListener('change', this.adjustOptionsField)
    }

    adjustOptionsField = () => {
        const checkedRadio = this.form.querySelector('[id*=badge_rule_template_id]:checked')
        const radioOption = checkedRadio.dataset.option

        if (radioOption) {
            this.optionsField.removeAttribute('disabled')
            this.label.innerText = `${this.labelText}: (${radioOption})`
        } else {
            this.label.innerText = this.labelText
            this.optionsField.setAttribute('disabled', 'true')
        }
    }
}
