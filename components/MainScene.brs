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
    m.transL=[0,0]

    m.X = 0
    m.Y = 0

    m.top.setFocus(true)
    m.myBtn.setFocus(true)


end function

function myButtonClick()
   
    
    ?"Tr X on BC"m.transLX
    ?"Tr Y on BC"m.transLY

    m.transAnimation.control = "start"
        m.transL= m.myBtn.translation
        ?"Log 1......"m.transL

end function


function cancelExitDialoge()
    m.ExitGroup.visible = false
    m.myBtn.setFocus(true)
    m.ExitGroup.visible = false
    m.transL= m.myBtn.translation
    ?"Log 2"m.transL

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
                ' m.transAnimation.control = "stop"
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

           m.transLF= m.myBtn.translation
           ?"Log 3"m.transLF
            m.transLX = m.transLF.[0]
            m.transLY = m.transLF.[1]

           ?"Log 4"m.transLX
           ?"Log 5"m.transLY
            
           handled = true
        end if


        if key = "right" and m.myBtn.hasFocus()
            
            m.myInterp2 .keyValue=[[0,0],[m.X +1848, m.Y]]

            m.transAnimation.control = "start"
            m.transL= m.myBtn.translation
            ?"Log 1......"m.transL

        else if key = "down" and m.myBtn.hasFocus()
            
            m.myInterp2 .keyValue=[[1848,0],[1848, m.Y + 1008]]

            m.transAnimation.control = "start"
            m.transL= m.myBtn.translation
            ?"Log 1......"m.transL

        else if key = "back" and m.myBtn.hasFocus()
            
            m.myInterp2 .keyValue=[[0,1008],[1848, m.Y + 1008]]

            m.transAnimation.control = "start"
            m.transL= m.myBtn.translation
            ?"Log 1......"m.transL

        else if key = "down" and m.myBtn.hasFocus()
            
            m.myInterp2 .keyValue=[[0,1008],[m.X, m.Y]]

            m.transAnimation.control = "start"
            m.transL= m.myBtn.translation
            ?"Log 1......"m.transL
        end if
    end if

    return handled
end function


