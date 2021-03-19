/*
 *------------------------------------------------------------------------------
 *  Survey123 Add-In
 *
 *  Dial2
 *
 *  Created %{CurrentDate} %{CurrentTime}
 *
 *------------------------------------------------------------------------------
*/

import QtQml 2.12
import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

import ArcGIS.AppFramework 1.0

import ArcGIS.Survey123 1.0

AddInControl {
    id: addIn

    //--------------------------------------------------------------------------

    onPropertiesChanged: {
        console.log('>>>>> properties', JSON.stringify(addIn.properties));
    }

    onSettingsModified: {
        settingsInfo.read();
    }

    //--------------------------------------------------------------------------

    Dial2SettingsInfo {
        id: settingsInfo

        settings: addIn.settings
    }

    //--------------------------------------------------------------------------

    LoggingCategory {
        id: logCategory

        name: AppFramework.typeOf(addIn, true)
    }

    //--------------------------------------------------------------------------

    ColumnLayout {
        anchors.fill: parent

        Dial {
            from: addIn.properties.start
            to: addIn.properties.end
            snapMode: Dial.SnapAlways
            stepSize: addIn.properties.step
            height: 120
            width: 120
            anchors.centerIn: parent
            onMoved: {
                console.log('dial value is', value);
            }
        }
    }

    //--------------------------------------------------------------------------
}

