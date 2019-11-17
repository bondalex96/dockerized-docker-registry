#!/bin/sh

htpasswd -Bbn ${AUTH_USER} ${AUTH_PASSWORD} > /auth/htpasswd