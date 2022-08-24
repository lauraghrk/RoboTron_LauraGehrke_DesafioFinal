#Sessão para configuração, documentação, imports de arquivos e librarys
*** Settings ***
Documentation    Arquivo simples para requisições HTTP em APIs REST

Library        RequestsLibrary
Library        Collections
Library        OperatingSystem

Resource        ./common/common.robot
Resource        ./fixtures/dynamics.robot
Resource        ./variables/serverest_variables.robot
