# FlowerPowerLinux - Linux Extrem

## Descripció

**FlowerPowerLinux** és un contenidor Linux basat en Ubuntu, dissenyat com a repte/activitat educativa per practicar ordres de terminal i conceptes avançats del sistema operatiu Linux.

## Objectiu

Esta distribució s'ha creat com a projecte docent per a ús en aula educativa, permetent als estudiants:

- Aprendre i practicar ordres essencials de Linux
- Enfonsar-se en la administració de sistemes
- Desenvolupar habilitats de línia de comandes
- Entendre l'estructura i funcionament del kernel Linux
- Compendre els riscos de treballar en sistemes en temps real

## Característiques

- Basada en Ubuntu (versió estable)
- Entorn optimitzat per a l'aprenentatge pràctic
- Comptador d'ordres introduïdes correctament
- El sistema s'elimina quan introdueixen una ordre malament

## Ús

Este projecte està pensat per a:

- **Docents**: Com a material educatiu estructurat
- **Estudiants**: Com a plataforma per practicar i aprendre
- **Aula**: Com a activitat col·lectiva de consolidació de coneixements i a mode torneig

## Requisits

- Docker
- Ordinador 4GB RAM
- 200MB d'espai en disc
- Disponible per AMD64 i ARM64

## Execució

- Mode de prova, sense log:

```docker run --rm -it vbinfor/FlowerPowerLinux:latest```

- Mode competició amb log, es crea un volum "LOGS".

```docker run --rm -it -v LOGS:/LOGS vbinfor/FlowerPowerLinux:latest```


## HUB 
[hub.docker.com/r/vbinfor/FlowerPowerLinux](https://hub.docker.com/r/vbinfor/FlowerPowerLinux)