#############################################################################################
# Programme Objet connecté                                                                  #
#                                                                                           #
# - Création d'un client MQTT                                                               #
# - Etablissement d'une connexion avec un serveur MQTT sur localhost (port 1883)            #
# - Envoi en boucle des messages de présence sur la file "ma/topic" toutes les 10 secondes  #
#                                                                                           #
# Fonction on_disconnect  : appelée lorsque la connexion au serveur MQTT est perdue         #
# Affiche un message d'erreur contenant un code retour sur la déconnexion                   #
#############################################################################################

# Importation des modules
import paho.mqtt.client as mqtt
import time

# Fonction appelée lorsque la connexion au serveur MQTT est établie
def on_connect(client, userdata, flags, rc):
    print("Connexion au serveur MQTT établie avec le code retour : " + str(rc))

# Fonction appelée lorsque le client publie un message
def on_publish(client, userdata, mid):
    print("Message publié avec l'ID de message : " + str(mid))

# Fonction appelée lorsque la connexion au serveur MQTT est perdue
def on_disconnect(client, userdata, rc):
    if rc != 0:
        print("Perte de connexion du serveur MQTT avec le code retour : " + str(rc))

# Création d'un client MQTT
client = mqtt.Client()

# Connexion des fonctions de callback
client.on_connect = on_connect
client.on_publish = on_publish
client.on_disconnect = on_disconnect

# Connexion au serveur MQTT
client.connect("192.168.1.18", 1883, 60)
#client.connect("192.168.1.23", 5672, 60)
#client.connect("192.168.1.23", 5672, 60)

# Démarrage du bouclage
client.loop_start()

# Envoi de messages de présence toutes les 10 secondes
while True:
    #presence = 1
    #presence = "OK"
    presence = "Objet connecte - MQTT"
    client.publish("ma/topic", presence)
    time.sleep(1)

# Arrêt du bouclage
client.loop_stop()
