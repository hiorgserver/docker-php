# docker-php
Docker Container, der auf Debian basiert und eine PHP-Umgebung (inkl. Composer in der aktuellen Version) zur Verfügung stellt.

## Run Container
Der Container kann von [dockerhub](https://hub.docker.com/r/hiorgserver/docker-php/) bezogen 
 und mit folgendem Commando direkt ausgeführt werden:

    docker run -it --rm hiorgserver/docker-php /bin/sh

## Branches/Tags
Wir verwenden für unterschiedliche PHP-Versionen verschiedene Container, die im Git-Repository über Branches,
und im DockerHub mit Tags spezifiziert werden.
Hierfür sind die Docker-Container mit entsprechenden Tags (z.b. `php7.3`) versehen analog zum Namen
 der Git-Branches, welche die Grundlage für die gebauten Container darstellen.

Je nach PHP-Version wird ggf. eine andere Debian-Version verwendet.

Das Tag `latest` entspricht immer dem aktuellen `master`.

Wird kein Tag angegeben, so wird `latest` als Default angenommen.

## Build Container
Bei jedem Git-Push auf den `master` wird ein neuer Container mit dem Tag `latest` gebaut.
Weiterhin werden für alle Pushs auf Branches, die auf den regulären Ausdruck `/^php([0-9.]+)$/` matchen
 ein Container mit dem Tag `php{\1}` erzeugt.
Beispiel: Git Push im Branch `php7.3` erzeugt/aktualisiert einen Container mit dem Tag `php7.3`.
