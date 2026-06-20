# MQTT-dashboard
VCL app for Windows to publish and receive messages using MQTT application layer protocol

MQTT Dashboard is an application that allows to publish and receive messages via the internet using the application layer protocol MQTT (https://mqtt.org/)
This is a VCL application for Windows 64 bits. It has been developed using RAD Studio 11 and coded in Delphi using TMS MQTT components to implement the MQTT protocol (see https://www.tmssoftware.com/site/tmsmqtt.asp). 
The app allows connection with a broker deployed in the cloud which can be selected through a combobox. The brokers listed in the combobox are
•	test.mosquitto.org
•	broker.hivemq.com
•	mqttshared.crystalmq.com
•	mqtt.fluux.io
•	test.mosca.io
•	broker.mqttdashboard.com
•	mqtt.flespi.io
•	broker.emqx.io
•	saas.theakiro.com
•	ioticos.org

Another broker name can be written on this list.
Others users options include the port number (1883 or 8883), the use of SSL certificate, credentials (username and password), and the settings of the Last Will and Testament (LWT, including QoS and retain flag). 
Once connected to a broker selected, the application allows the user to subscribe and unsubscribe to topics (which includes the use of wildcards). It also allows the user to publish messages on a topic head with a QoS, and with retain flag. Topic and payload must be written in the corresponding edit boxes.
A memo log window reports information about the connection as well as shows the messages received from other clients written on a topic to which this application has been subscribed.
The following figure shows the screen of the application

<img width="886" height="516" alt="image" src="https://github.com/user-attachments/assets/18eab41f-be0b-429c-8a0c-bc3a27c67763" />

