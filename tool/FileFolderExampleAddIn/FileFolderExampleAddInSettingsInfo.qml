/*
 *------------------------------------------------------------------------------
 *  Survey123 Add-In
 *
 *  FileFolderExampleAddIn Settings Info
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

    readonly property string kKeySetting1: "setting1"

    //--------------------------------------------------------------------------
    // Default values

    readonly property string kDefaultSetting1: "Default value"

    //--------------------------------------------------------------------------

    property string setting1: kDefaultSetting1

    //--------------------------------------------------------------------------

    Component.onCompleted: {
        read();
    }

    //--------------------------------------------------------------------------

    function read() {
        setting1 = settings.value(kKeySetting1, kDefaultSetting1);
    }

    //--------------------------------------------------------------------------

    function write() {
        settings.setValue(kKeySetting1, setting1, kDefaultSetting1);
    }

    //--------------------------------------------------------------------------
}
