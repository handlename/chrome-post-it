p = (message) -> console.log(message)

endpoint = 'https://im.handlena.me/api/post'

postToNakamap = (message) ->
    code = localStorage['group_code']

    unless code
        alert 'Group code is not defined.\nPlease set code at options page.'
        return

    xhr = new XMLHttpRequest()

    xhr.onreadystatechange = () ->
        if xhr.readyState == 4 && xhr.status == 200
            p "res: #{xhr.responseText}"

    xhr.open('POST', "#{endpoint}/#{code}", false)
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    xhr.send("message=#{encodeURI(message)}")

    p 'post done'

chrome.contextMenus.create
    title: 'post to nakamap'
    contexts: ['selection', 'link']
    onclick: (info, tab) ->
        message = if info.linkUrl? then info.linkUrl else info.selectionText
        postToNakamap(message)
