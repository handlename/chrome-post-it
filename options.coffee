window.addEventListener 'load', () ->
    doc = window.document

    codeE = doc.getElementById('code')

    saveOptions = () ->
        console.log 'save!!!'
        localStorage['group_code'] = codeE.value

    restoreOptions = () ->
        console.log 'load!!!'
        code = localStorage['group_code']
        return unless code

        codeE.value = code

    doc.getElementById('save').addEventListener('click', saveOptions)

    restoreOptions()
