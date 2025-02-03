function init()
    m.ExitGroup = m.top.FindNode("ExitGroup")
    m.exitAppButton = m.top.findNode("exitButton")
    m.cancelExitDialogeButton = m.top.findNode("cancelExitButton")
    m.exitAppButton.observeField("buttonSelected", "exitButtonSelect")
    m.cancelExitDialogeButton.observeField("buttonSelected", "cancelExitDialoge")
    m.myBtn = m.top.findNode("myBtn")
    m.myBtn.observeField("buttonSelected", "myButtonClick")

    ' m.currentPosition = [0, 0] 
    ' m.positions = [ [0, 0], [1848, 0], [1848, 1008], [0, 1008] ] ' 4 corner positions
    ' m.index = 0 

    m.top.setFocus(true)
    m.myBtn.setFocus(true)

   




end function

function myButtonClick()
    m.transAnimation = m.top.FindNode("transAnimation")
    m.transAnimation.control = "start"
end function


function cancelExitDialoge()
    m.ExitGroup.visible = false
    m.myBtn.setFocus(true)
    m.ExitGroup.visible = false

end function

sub exitButtonSelect()
    m.top.getScene().exitApp = true
end sub

function onKeyEvent(key as string, press as boolean) as boolean

    handled = false

    if press

        if key = "back"

            if m.myBtn.hasFocus()

                m.transL= m.myBtn.translation
                ?"Log 1"m.transL
                 m.transLX = m.transL.[0]
                 m.transLY = m.transL.[1]

                ?"Log 2"m.transLX
                ?"Log 3"m.transLY

                m.ExitGroup.visible = true
                m.transAnimation.control = "stop"
                m.myBtn.setFocus(false)
                m.cancelExitDialogeButton.setFocus(true)

                handled = true
            else if m.ExitGroup.visible = true
                m.ExitGroup.visible = false
                m.myBtn.setFocus(true)


                handled = true
            end if
        end if

        if key = "right" and m.cancelExitDialogeButton.hasFocus()
            m.cancelExitDialogeButton.setFocus(false)
            m.exitAppButton.setFocus(true)

        else if key = "left" and m.exitAppButton.hasFocus()
            m.exitAppButton.setFocus(false)
            m.cancelExitDialogeButton.setFocus(true)

        end if


    end if

    return handled
end function




' function onKeyEvent(key as string, press as boolean) as boolean
'     handled = false

'     if press then
        
'         if key = "back" then
'             if m.myBtn.hasFocus() then
'                 ?"band kr na app. kya howa?"
'                 m.ExitGroup.visible = true
'                 m.transAnimation.control = "stop"
'                 m.myBtn.setFocus(false)
'                 m.cancelExitDialogeButton.setFocus(true)
'                 handled = true
'             else if m.ExitGroup.visible = true then
'                 m.ExitGroup.visible = false
'                 m.myBtn.setFocus(true)
'                 handled = true
'             end if
'         end if

       
'         if key = "right" and m.cancelExitDialogeButton.hasFocus() then
'             m.cancelExitDialogeButton.setFocus(false)
'             m.exitAppButton.setFocus(true)
'             handled = true
'         else if key = "left" and m.exitAppButton.hasFocus() then
'             m.exitAppButton.setFocus(false)
'             m.cancelExitDialogeButton.setFocus(true)
'             handled = true
'         end if

        
'         if m.myBtn.hasFocus() then
'             if key = "right" then
'                 moveButton(1) 
'                 handled = true
'             else if key = "left" then
'                 moveButton(-1) 
'                 handled = true
'             else if key = "down" then
'                 moveButton(-1) 
'                 handled = true
'             else if key = "up" then
'                 moveButton(-1) 
'                 handled = true
'             end if
'         end if
'     end if

'     return handled
' end function


' sub moveButton(direction as integer)
'     if m.myBtn <> invalid then
'         if m.positions = invalid then
'             m.positions = [ [0, 0], [1848, 0], [1848, 1008], [0, 1008] ] 
'             m.index = 0 
'         end if

       
'         m.index = (m.index + direction + 4) mod 4
'         m.myBtn.translation = m.positions[m.index]
'     end if
' end sub


