when not isMainModule:
  quit()

import nigui
import nimclipboard/libclipboard

include convert

const labelWidth = 55

app.init()
app.defaultFontfamily = "Atkinson Hyperlegible"
app.defaultFontSize = 24

var window = newWindow("AI-Pronouceable Ainu Converter")
window.width = 640
window.height = 480

var mainContainer = newLayoutContainer(Layout_Vertical)
mainContainer.padding = 10
mainContainer.xAlign=XAlign_Center
mainContainer.heightMode = HeightMode_Fill
window.add(mainContainer)

var inputContainer = newLayoutContainer(Layout_Horizontal)
mainContainer.add(inputContainer)

var inputLabel = newLabel("Input:")
inputContainer.add(inputLabel)
inputLabel.minWidth = labelWidth
inputLabel.heightMode = HeightMode_Fill

var inputTextArea = newTextArea()
inputContainer.add(inputTextArea)
inputTextArea.heightMode = HeightMode_Fill

var clearButton = newButton("Clear")
clearButton.minWidth = 70
clearButton.heightMode = HeightMode_Fill
inputContainer.add(clearButton)

var resultContainer = newLayoutContainer(Layout_Horizontal)
mainContainer.add(resultContainer)

var resultLabel = newLabel("Result:")
resultContainer.add(resultLabel)
resultLabel.minWidth = labelWidth
resultLabel.heightMode = HeightMode_Fill

var resultTextArea = newTextArea()
resultContainer.add(resultTextArea)
resultTextArea.editable = false

resultTextArea.height = 300

inputTextArea.onTextChange = proc(event: TextChangeEvent) =
  resultTextArea.text = convert(inputTextArea.text)

var cb = clipboard_new(nil)
var resultCopyButton = newButton("Copy")
resultCopyButton.minWidth = 150
resultCopyButton.onClick = proc(event: ClickEvent) =
  discard cb.clipboard_set_text(cstring(resultTextArea.text))
mainContainer.add(resultCopyButton)

clearButton.onClick = proc(event: ClickEvent) =
  inputTextArea.text = ""
  resultTextArea.text = ""
  inputTextArea.focus()

window.show()
inputTextArea.focus()
app.run()
