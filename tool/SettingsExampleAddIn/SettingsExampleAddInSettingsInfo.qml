/*
 *------------------------------------------------------------------------------
 *  Survey123 Add-In
 *
 *  SettingsExampleAddIn Settings Info
 *
 *  Created %{CurrentDate} %{CurrentTime}
 *
 *------------------------------------------------------------------------------
*/

import QtQml 2.12
import QtQuick 2.12

import ArcGIS.AppFramework 1.0

import ArcGIS.Survey123 1.0

QtObject {

    property Settings settings

    //--------------------------------------------------------------------------
    // Keys names

    readonly property string kKeyShowButton: "showButton"

    //--------------------------------------------------------------------------
    // Default values

    readonly property int kDefaultShowButton: 0

    //--------------------------------------------------------------------------

    property int showButton: kDefaultShowButton

    //--------------------------------------------------------------------------

    Component.onCompleted: {
        read();
    }

    //--------------------------------------------------------------------------

    function read() {
        showButton = settings.value(kKeyShowButton, kDefaultShowButton);
    }

    //--------------------------------------------------------------------------

    function write() {
        settings.setValue(kKeyShowButton, showButton, kDefaultShowButton);
    }

    //--------------------------------------------------------------------------
}
