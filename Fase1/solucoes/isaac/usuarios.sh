#!/usr/bin/env bash

# Adiciona um usuário chamado `jose_gota` com UID 5000
useradd --uid 5000 jose_gota
 
# Adiciona um grupo chamado `administracao` com GID 1001
groupadd --gid 1001 administracao
# Adiciona um grupo chamado `enfermeiros` com GID 2000
groupadd --gid 2000 enfermeiros
# Adiciona um grupo chamado `medicos` com GID 3000
groupadd --gid 3000 medicos
 
# Acrescenta os grupos `administracao`, `enfermeiros` e `medicos` ao usuário `jose_gota`
usermod --append --groups administracao,enfermeiros,medicos jose_gota
# Expira a senha do `jose_gota`, obrigando-o a definir uma nova senha em seu primeiro login
passwd --expire jose_gota

# `num` assume cada um dos números da sequência 01, 02, ..., 15
for num in $(seq -w 1 15)
do
	 # Adiciona um usuário com UID da sequência 1001, 1002, 1003, ..., 1015
	 # com nome adm01, adm02, ..., adm15
	 useradd --uid "10${num}" --gid 1001 "adm${num}" 
	 # Expira a senha do usuário, de modo que o usuário tenha que definir sua senha
	 # no primeiro login
	 passwd --expire "adm${num}"
done

# `num` assume cada um dos números da sequência 01, 02, ..., 30
for num in $(seq -w 1 30)
do
	 # Adiciona um usuário com UID da sequência 1001, 1002, 1003, ..., 1030
	 # com nome enfermeiro01, enfermeiro02, ..., enfermeiro30
	 useradd --uid "20${num}" --gid 2000 "enfermeiro${num}" 
	 # Expira a senha do usuário, de modo que o usuário tenha que definir sua senha
	 # no primeiro login
	 passwd --expire "enfermeiro${num}"
done

# `num` assume cada um dos números da sequência 01, 02, ..., 20
for num in $(seq -w 1 20)
do
	 # Adiciona um usuário com UID da sequência 1001, 1002, 1003, ..., 1020
	 # com nome med01, med02, ..., med20
	 useradd --uid "30${num}" --gid 3000 "med${num}" 
	 # Expira a senha do usuário, de modo que o usuário tenha que definir sua senha
	 # no primeiro login
	 passwd --expire "med${num}"
done
