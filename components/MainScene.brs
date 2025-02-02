function init()
    ' m.ExitGroupPoster = m.top.findNode("ExitGroupPoster")
    ' m.ExitAppBtnPoster = m.top.findNode("ExitAppBtnPoster")
    ' m.ResumeAppBtnPoster = m.top.findNode("ResumeAppBtnPoster")
    ' m.ExitGroup = m.top.FindNode("ExitGroup")


    m.myBtn = m.top.findNode("myBtn")
    m.myBtn.observeField("buttonSelected", "myButtonClick")

    m.myBtn.setFocus(true) 

 end function

 function myButtonClick()
        transAnimation = m.top.FindNode("transAnimation")
    transAnimation.control = "start"
 end function

 function onKeyEvent(key as string, press as boolean) as boolean

    handled = false

    if press

        if key = "back"

            ?"band kr na app. kya howa?"
            handled = true

        end if
    end if

    return handled
end function