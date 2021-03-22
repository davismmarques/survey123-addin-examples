/*
 *------------------------------------------------------------------------------
 *  Survey123 Add-In
 *
 *  Dial
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

    implicitHeight: 160
    onSettingsModified: {
        settingsInfo.read();
    }
    onUpdateValue: function(nextValue) {
        value = nextValue;
    }

    //--------------------------------------------------------------------------

    DialSettingsInfo {
        id: settingsInfo

        settings: addIn.settings
    }

    //--------------------------------------------------------------------------

    LoggingCategory {
        id: logCategory

        name: AppFramework.typeOf(addIn, true)
    }

    //--------------------------------------------------------------------------

    Item {
        anchors.fill: parent

        Dial {
            id: dial
            anchors.centerIn: parent
            from: addIn.properties.start
            height: 120
            onMoved: {
                console.log('dial value changed', value);
                addIn.value = value;
            }
            snapMode: Dial.SnapAlways
            stepSize: addIn.properties.step
            to: addIn.properties.end
            value: addIn.value
            width: 120
        }

        Text {
            anchors.centerIn: parent
            text: dial.value
        }
    }

    //--------------------------------------------------------------------------
}
