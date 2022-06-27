# MQTT-dashboard
VCL app for Windows to publish and receive messages using MQTT application layer protocol

MQTT Dashboard is an application that allows to publish and receive messages via the internet using the aplication layer protocol MQTT (https://mqtt.org/).
This is a VCL application for Windows 64 bits. It has been developed using RAD Studio 10.2 and coded in Delphi using TMS MQTT components to provide the functions needed for communication (see https://www.tmssoftware.com/site/tmsmqtt.asp). 
The app allows connection with a broker deployed in the cloud which can be selected from a list in a combobox. The brokers listed in the combobox are

•	test.mosquitto.org\
•	broker.hivemq.com\
•	mqttshared.crystalmq.com\
•	mqtt.fluux.io\
•	test.mosca.io\
•	broker.mqttdashboard.com\
•	mqtt.flespi.io\
•	broker.emqx.io\
•	saas.theakiro.com\
•	ioticos.org

Others users options include the port number (1883 or 8883), the use of SSL certificate, the QoS with which the application will publish and receive the messages and the introduction of credentials (username and password) whenever required by the broker.\
Before connection, the app allows to subscribe topics that can be added in an edit box. The topics written there can use wildcards.\
Once connected to the MQTT broker selected, the app allows to publish messages on a topic head. Topic and payload must be written in the corresponding edit boxes.
A memo log window reports information about the connection as well as shows the messages received from other clients.\
The following figure shows the screen of the application
 
![teladashboard](https://user-images.githubusercontent.com/37451727/175965853-3673c735-6c15-4a6b-921b-268381246713.png)
