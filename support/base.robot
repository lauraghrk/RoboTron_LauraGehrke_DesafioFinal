*** Settings ***
Documentation    Testes automatizados para a API ServeRest

Library         RequestsLibrary
Library        Collections
Library        OperatingSystem
Library        ./common/library.py

Resource        ./common/commons.robot
Resource        ./fixture/dynamics.robot