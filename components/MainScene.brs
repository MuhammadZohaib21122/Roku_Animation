function init()
    m.ExitGroup = m.top.FindNode("ExitGroup")
    m.exitAppButton = m.top.findNode("exitButton")
    m.cancelExitDialogeButton = m.top.findNode("cancelExitButton")
    m.exitAppButton.observeField("buttonSelected", "exitButtonSelect")
    m.cancelExitDialogeButton.observeField("buttonSelected", "cancelExitDialoge")
    m.myBtn = m.top.findNode("myBtn")
    m.myBtn.observeField("buttonSelected", "myButtonClick")
    m.myInterp2 = m.top.FindNode("myInterp2")
    m.transAnimation = m.top.FindNode("transAnimation")
    m.transLX = 0
    m.transLY = 0
    m.transL = [0, 0]
    m.X = 0
    m.Y = 0
    m.XL = 0

    m.top.setFocus(true)
    m.myBtn.setFocus(true)


end function

function myButtonClick()


    ' ?"Tr X on BC"m.transLX
    ' ?"Tr Y on BC"m.transLY

    ' ' m.transAnimation.control = "start"
    ' m.transL = m.myBtn.translation
    ' ?"Log 1......"m.transL

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

                m.ExitGroup.visible = true
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

        else if key = "play" and m.myBtn.hasFocus()
            ?"Play Button press ======================"
            m.transAnimation.control = "stop"

            m.transLF = m.myBtn.translation
            ?"Press Play Button and Translation is =="m.transLF
            m.transLX = m.transLF.[0]
            m.transLY = m.transLF.[1]

            ?"Translation_X"m.transLX
            ?"Translation_Y"m.transLY

            handled = true
        end if


        if key = "right" and m.myBtn.hasFocus() then


            if m.XL < 1820

                m.X = m.X + 140
                m.myInterp2.keyValue = [[m.X, m.Y], [m.X, m.Y]]
                m.transAnimation.control = "start"
                m.transL = m.myBtn.translation
                sleep(50)

                m.XL = m.X
                ?"Right"m.XL

                m.transLF = m.myBtn.translation
            ?"Press right Button and Translation is =="m.transLF
            end if
        else if key = "left" and m.myBtn.hasFocus() then

            if m.XL <= 1820 and m.XL > 0
                m.X = m.X - 140
                m.myInterp2.keyValue = [[m.X, m.Y], [m.X, m.Y]]
                m.transAnimation.control = "start"
                m.transL = m.myBtn.translation
                sleep(50)

                m.XL = m.X
                ?"Left"m.XL

                m.transLF = m.myBtn.translation
            ?"Press left Button and Translation is =="m.transLF
            end if

        else if key = "down" and m.myBtn.hasFocus() then

        
            if m.Y < 980

                m.Y = m.Y + 98
                m.myInterp2.keyValue = [[m.X, m.Y], [m.X, m.Y]]
                m.transAnimation.control = "start"
                m.transL = m.myBtn.translation
                sleep(50)

                ?"Down"m.Y

                m.transLF = m.myBtn.translation
            ?"Press down Button and Translation is =="m.transLF
            end if

        else if key = "up" and m.myBtn.hasFocus() then

            if m.Y <= 980 and m.Y > 0

                m.Y = m.Y - 98
                m.myInterp2.keyValue = [[m.X, m.Y], [m.X, m.Y]]
                m.transAnimation.control = "start"
                m.transL = m.myBtn.translation
                sleep(50)

                ?"Up"m.Y

                m.transLF = m.myBtn.translation
            ?"Press up Button and Translation is =="m.transLF

            end if
        end if
    end if

    return handled
end function


