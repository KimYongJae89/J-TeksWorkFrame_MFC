; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "APMD"
!define PRODUCT_VERSION "1.11"
!define PRODUCT_PUBLISHER "GTSM"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\APMDMonitor32.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
BrandingText " "
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "D:\Work\Script\Installer\license.txt"
; Directory page
;!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\APMDMonitor32.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "Korean"
; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Setup.exe"
InstallDir "C:\APMD Files\"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01
  SetOutPath "C:\APMD Files\"
  SetOverwrite ifnewer
  File "..\..\RunTime\Bin\APMDMonitor32.exe"
  CreateDirectory "$SMPROGRAMS\APMD"
  CreateShortCut "$SMPROGRAMS\APMD\APMD View.lnk" "$INSTDIR\APMDMonitor32.exe" "1"
  CreateShortCut "$SMPROGRAMS\APMD\APMD Review.lnk" "$INSTDIR\APMDMonitor32.exe"
  CreateShortCut "$DESKTOP\APMD View.lnk" "$INSTDIR\APMDMonitor32.exe" "1"
  CreateShortCut "$DESKTOP\APMD Review.lnk" "$INSTDIR\APMDMonitor32.exe"
  File "..\..\RunTime\Bin\UniUtility32.dll"
  File "..\..\RunTime\Bin\APMDFORM.xlsx"
SectionEnd

Section -AdditionalIcons
  CreateShortCut "$SMPROGRAMS\APMD\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\APMDMonitor32.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\APMDMonitor32.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name)��(��) ������ ���ŵǾ����ϴ�."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "$(^Name)��(��) �����Ͻðڽ��ϱ�?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\APMDFORM.xlsx"
  Delete "$INSTDIR\UniUtility32.dll"
  Delete "$INSTDIR\APMDMonitor32.exe"

  Delete "$SMPROGRAMS\APMD\Uninstall.lnk"
  Delete "$SMPROGRAMS\APMD\Website.lnk"
  Delete "$DESKTOP\APMD.lnk"
  Delete "$SMPROGRAMS\APMD\APMD View.lnk"
  Delete "$SMPROGRAMS\APMD\APMD Review.lnk"

  RMDir "$SMPROGRAMS\APMD"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd