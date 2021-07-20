@ECHO OFF

set object_name=�޲�boot��ʽһ��ˢ�����
set device_name=Xiaomi 10 Ultra
set rec_name=���һ��ˢ��
set rec_ver=С��10U 12.5.3.0 �ȶ���
set rec_auth=���ֱ���
set rec_team=�ᰲ
set rec_date=2021.06.11
set magisk_img=magisk_patched.img

TITLE %device_name% %object_name%--by %rec_auth%
color 3f

cd /d "%~dp0"

:LOGO
CLS
ECHO.
ECHO.         %device_name% %object_name%
ECHO.***********************************************
ECHO.              ������Ϣ
ECHO.
ECHO.              ���� ��%rec_name%
ECHO.              �汾 ��%rec_ver%
ECHO.              ������ͣ�%device_name%
ECHO.              �ű����ߣ�%rec_auth%
ECHO.              �׷���̳��%rec_team%
ECHO.              ����ʱ�䣺%rec_date%
ECHO.     ��֧�ֿ���״̬ˢ���fastbootģʽˢ�룩    
ECHO.***********************************************
ECHO.
ECHO.�����������...
pause>nul

:MENU
CLS
ECHO.
ECHO.         %device_name% %object_name%
ECHO.***********************************************
ECHO.             ���ֻ��ĵ�ǰ״̬��
ECHO.
ECHO.              1.����״̬
ECHO.
ECHO.              2.fastbootģʽ
ECHO.
ECHO.              3.����״̬
ECHO.
ECHO.              4.�ָ�ԭ��boot
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
set choice=
set /p choice=��ֱ�������Ӧ���ֻس���
if not "%choice%"=="" set choice=%choice:~0,1%
if /i "%choice%"=="1" goto IN_SYSTEM
if /i "%choice%"=="2" goto FASTBOOT_MODE
if /i "%choice%"=="3" goto OTHERS
if /i "%choice%"=="4" goto RECOVER_BOOT
ECHO.
ECHO.������Ч������������...
timeout /t 2 /nobreak >NUL
ECHO.
goto MENU


:OTHERS
CLS
ECHO.
ECHO.         %device_name% %object_name%
ECHO.***********************************************
ECHO.             ���Ƚ��ֻ�����
ECHO.
ECHO.               ������״̬��
ECHO.                  ����
ECHO.             ��fastbootģʽ��
ECHO.
ECHO.��������������ϼ��˵������޲�����6����Զ����أ�
ECHO.***********************************************
ECHO.
timeout /t 6 >nul
echo.
goto MENU


:IN_SYSTEM
CLS
ECHO.
ECHO.         %device_name% %object_name%
ECHO.***********************************************
ECHO.          �������ֻ���ȷ���ӵ����ԣ�
ECHO.
ECHO.            ��ȷ����
ECHO.      ��1.�ֻ�bootloaderδ����
ECHO.      ��2.�ֻ����ڿ���״̬��
ECHO.      ��3.�ֻ�����USB���ԡ�
ECHO.      ��4.�������Ѿ���ȷ��װ������
ECHO.      ��5.�ֻ���ʾUSB������Ȩʱ��ѡʼ�յ����Ȩ��
ECHO.
ECHO.            �����������������
ECHO.***********************************************
ECHO.
pause>nul
ECHO.        ���ڼ���豸�Ƿ���������...
ECHO.
ECHO.   ������ʱ��ͣ���ڴ˽��棬�����������
ECHO.           ���������ù��ߣ�
ECHO.***********************************************
ECHO.
timeout /t 2 /nobreak >NUL
adb.exe wait-for-device >NUL 2>NUL

CLS
ECHO.
ECHO.         %device_name% %object_name%
ECHO.***********************************************
ECHO.
ECHO.
ECHO.             �ֻ�������...
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
ECHO.   ������ʱ��ͣ���ڴ˽��棬�������ù��ߣ�
ECHO.
adb.exe reboot bootloader >NUL 2>NUL
timeout /t 3 /nobreak >NUL
goto FLASHING


:FASTBOOT_MODE
CLS
ECHO.
ECHO.         %device_name% %object_name%
ECHO.***********************************************
ECHO.          �������ֻ���ȷ���ӵ����ԣ�
ECHO.
ECHO.          ��ȷ����
ECHO.        ��1.�ֻ�bootloaderδ����
ECHO.        ��2.�ֻ�����fastbootģʽ��
ECHO.        ��3.�������Ѿ���ȷ��װ������
ECHO.
ECHO.            �����������������
ECHO.***********************************************
ECHO.
pause>nul
goto FLASHING

:RECOVER_BOOT
CLS
ECHO.
ECHO.         %device_name% %object_name%
ECHO.***********************************************
ECHO.          �������ֻ���ȷ���ӵ����ԣ�
ECHO.
ECHO.          ��ȷ����
ECHO.        ��1.�ֻ�bootloaderδ����
ECHO.        ��2.�ֻ�����fastbootģʽ��
ECHO.        ��3.�������Ѿ���ȷ��װ������
ECHO.
ECHO.            �����������������
ECHO.***********************************************
ECHO.
pause>nul
set magisk_img=boot.img
:RECOVER_BOOT

:FLASHING
CLS
ECHO.
ECHO.         %device_name% %object_name%
ECHO.***********************************************
ECHO.
ECHO.          ���ڼ���豸�Ƿ���������...
ECHO.
ECHO.
ECHO.      �������ʱ��ͣ���ڴ˽��棬���飺��
ECHO.
ECHO.      ��1.USB���Ƿ���ȷ���ӡ�
ECHO.      ��2.���������Ƿ���ȷ��װ��ʶ��
ECHO.      ��3.�ֻ��Ƿ����fastbootģʽ��
ECHO.
ECHO.             ���������ù��ߣ�
ECHO.***********************************************
timeout /t 2 /nobreak >NUL
fastboot.exe wait-for-device >NUL 2>NUL

CLS
ECHO.
ECHO.         %device_name% %object_name%
ECHO.***********************************************
ECHO.
ECHO.
ECHO.               ����ˢ��boot...
ECHO.
ECHO.
ECHO.***********************************************
ECHO.
ECHO.      �������� OKAY ˢ��ɹ�������ʧ�ܣ�
ECHO.
ECHO.    ������ʱ��ͣ���ڴ˽��棬�������ù��ߣ�
ECHO.
fastboot.exe flash boot "%magisk_img%" || goto FLASH_FAILED
fastboot.exe flash vbmeta vbmeta.img --disable-verity --disable-verification || goto FLASH_FAILED
rem fastboot.exe flash misc misc.bin >NUL 2>NUL
timeout /t 6 /nobreak >NUL
goto FLASH_OVER


:FLASH_FAILED
ECHO.
ECHO. ����������
timeout /t 6 /nobreak >NUL
CLS
ECHO.
ECHO.         %device_name% %object_name%
ECHO.***********************************************
ECHO.
ECHO.                   ˢ��ʧ�ܣ�
ECHO.
ECHO.           1.�����ֻ��ͺ��Ƿ���ȷ
ECHO.           2.��ȷ��fastboot�Ƿ�����
ECHO.           3.��ѹ���������б�����
ECHO.             �������ɹ�������ϵ����
ECHO.
ECHO.           %rec_auth%��л��ʹ�ñ�����
ECHO.
ECHO.            ����������˳�����
ECHO.***********************************************
ECHO.
timeout /t 1 /nobreak >NUL
pause >NUL
EXIT


:FLASH_OVER
CLS
ECHO.
ECHO.         %device_name% %object_name%
ECHO.***********************************************
ECHO.
ECHO.                 ˢдboot���
ECHO.
ECHO.
ECHO.                   �ֻ�������
ECHO.
ECHO.
ECHO.           %rec_auth%��л��ʹ�ñ�����
ECHO.
ECHO.           ����������رմ˴��ڣ�
ECHO.***********************************************
ECHO.
fastboot.exe reboot
pause >NUL

EXIT


