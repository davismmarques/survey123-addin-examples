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

    readonly property string kKeyStart: "start"

    //--------------------------------------------------------------------------
    // Default values

    readonly property real kDefaultStart: 0

    //--------------------------------------------------------------------------

    property real start: kDefaultStart

    //--------------------------------------------------------------------------

    Component.onCompleted: {
        read();
    }

    //--------------------------------------------------------------------------

    function read() {
        start = settings.value(kKeyStart, kDefaultStart);
    }

    //--------------------------------------------------------------------------

    function write() {
        settings.setValue(kKeyStart, start, kDefaultStart);
    }

    //--------------------------------------------------------------------------
}
