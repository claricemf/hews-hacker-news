Documentation   Mapping dos campos das telas Inicial e Login do app

*** Variables ***
&{TELA_INICIAL}   buttonMenu=accessibility_id=Navigate up
...               buttonExpandirLogin=com.leavjenn.hews:id/iv_expander
...               buttonSearch=com.leavjenn.hews:id/action_search
...               buttonRefresh=com.leavjenn.hews:id/action_refresh
...               buttonTypography=com.leavjenn.hews:id/action_typography

&{TELA_LOGIN}     inputUsername=com.leavjenn.hews:id/et_user_name
...               inputPassword=com.leavjenn.hews:id/et_password
...               buttonLogin=android:id/button1
...               buttonCancelar=android:id/button2
...               message=com.leavjenn.hews:id/tv_prompt
...               titleAlertLogin=android:id/alertTitle
...               account=com.leavjenn.hews:id/tv_account
