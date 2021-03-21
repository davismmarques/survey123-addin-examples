/*
 *------------------------------------------------------------------------------
 *  Survey123 Add-In
 *
 *  Dial Settings Info
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

    readonly property string kKeyExample: "example"

    //--------------------------------------------------------------------------
    // Default values

    readonly property real kDefaultExample: 0

    //--------------------------------------------------------------------------

    property real example: kDefaultExample

    //--------------------------------------------------------------------------

    Component.onCompleted: {
        read();
    }

    //--------------------------------------------------------------------------

    function read() {
        example = settings.value(kKeyExample, kDefaultExample);
    }

    //--------------------------------------------------------------------------

    function write() {
        settings.setValue(kKeyExample, example, kDefaultExample);
    }

    //--------------------------------------------------------------------------
}
