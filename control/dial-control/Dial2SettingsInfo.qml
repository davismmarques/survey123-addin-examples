/*
 *------------------------------------------------------------------------------
 *  Survey123 Add-In
 *
 *  Dial2 Settings Info
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
    readonly property string kKeyEnd: "end"
    readonly property string kKeyStep: "step"

    //--------------------------------------------------------------------------
    // Default values

    readonly property real kDefaultStart: 0
    readonly property real kDefaultEnd: 20
    readonly property real kDefaultStep: 1.0

    //--------------------------------------------------------------------------

    property real start: kDefaultStart
    property real end: kDefaultEnd
    property real step: kDefaultStep

    //--------------------------------------------------------------------------

    Component.onCompleted: {
        read();
        console.info('>>>>>>>>>>> read settings', start, end, step);
    }

    //--------------------------------------------------------------------------

    function read() {
        start = settings.value(kKeyStart, kDefaultStart);
        end = settings.value(kKeyEnd, kDefaultEnd);
        step = settings.value(kKeyStep, kDefaultStep);
    }

    //--------------------------------------------------------------------------

    function write() {
        settings.setValue(kKeyStart, start, kDefaultStart);
        settings.setValue(kKeyEnd, end, kDefaultEnd);
        settings.setValue(kKeyStep, step, kDefaultStep);
    }

    //--------------------------------------------------------------------------
}
