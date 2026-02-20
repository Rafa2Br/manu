@echo off
cls
:menu
cls
color 1e
echo Criado por LACERDA INFORMATICA
echo Cachoeiro de Itapemirim - ES

echo Versao 1.2 20/10/21
date /t


echo Detectando privilegios...
net session >nul 2>&1
if %errorLevel% == 0 (
    rem //Comandos com privilegios de Administrador
    echo Privilegios de Administrador confirmados.
msg * Privilegios de Administrador confirmados.



) else (
    rem //Comandos sem privilegios de Administrador
    echo Sem privilegios de Administrador.

msg * Execute como administrador



goto opcao5

)





echo Computador: %computername%   Usuario: %username%
                   
echo            MENU TAREFAS
echo  ==================================
echo * 1. Remover KB5006670          * 
echo * 2. Remover KB5005565          *
echo * 3. Alterar Registro           *
echo * 4. Reparo de impressora       * 
echo * 5. Sair                       * 
echo  ==================================

set /p opcao= Escolha uma opcao: 
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% GEQ 5 goto opcao5

:opcao1
cls
wusa /uninstall /kb:5006670
echo ==================================
echo *      Remocao concluida       *
echo ==================================
pause
goto menu

:opcao2
cls

wusa /uninstall /kb:5005565
echo ==================================
echo *       Remocao concluida       *
echo ==================================
pause
goto menu

:opcao3
cls
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print" /V RpcAuthnLevelPrivacyEnabled /T REG_DWORD /D 0 /F
echo ==================================
echo *     Alteracao de Registro Executada     *
echo ==================================
pause
goto menu

:opcao4
cls
REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print" /V RpcAuthnLevelPrivacyEnabled /T REG_DWORD /D 0 /F
wusa /uninstall /kb:5005565
wusa /uninstall /kb:5006670
echo ==================================
echo *       Execucao Completa     *
echo ==================================
pause
goto menu

:opcao5
cls
exit

:opcao6
echo ==============================================
echo * Opcao Invalida! Escolha outra opcao do menu *
echo ==============================================
pause
goto menu