Configuration SqlServerInstance_config
{
    param
    (

        [Parameter()]
        [string]
        $StigVersion,

        [Parameter()]
        [string[]]
        $SkipRule,

        [Parameter()]
        [string[]]
        $SkipRuleType,

        [Parameter()]
        [string[]]
        $Exception,

        [Parameter()]
        [string[]]
        $OrgSettings,
        ### Begin DO NOT REMOVE Required for Consolidated Integration Tests
        [Parameter()]
        [string]
        [AllowNull()]
        $BrowserVersion,

        [Parameter()]
        [string[]]
        [AllowNull()]
        $OfficeApp,

        [Parameter()]
        [string]
        [AllowNull()]
        $ConfigPath,

        [Parameter()]
        [string]
        [AllowNull()]
        $PropertiesPath,

        [Parameter()]
        [string]
        [AllowNull()]
        $SqlVersion,

        [Parameter()]
        [string]
        [AllowNull()]
        $SqlRole
         ### End DO NOT REMOVE
    )

    Import-DscResource -ModuleName PowerStig

    Node localhost
    {
        & ([scriptblock]::Create("
        SqlServer Instance
        {
            SqlVersion = $SqlVersion
            SqlRole = '$SqlRole'
            StigVersion = $StigVersion
            ServerInstance = 'TestServer'
            $(if ($null -ne $OrgSettings)
            {
                "Orgsettings = '$OrgSettings'"
            })
            $(if ($null -ne $Exception)
            {
                "Exception = @{'$Exception'= @{'SetScript'='TestScript'}}"
            })
            $(if ($null -ne $SkipRule)
            {
                "SkipRule = @($( ($SkipRule | % {"'$_'"}) -join ',' ))`n"
            }
            if ($null -ne $SkipRuleType)
            {
                " SkipRuleType = @($( ($SkipRuleType | % {"'$_'"}) -join ',' ))`n"
            })
        }")
        )
    }
}

Configuration SqlServerDatabase_config
{
    param
    (

        [Parameter()]
        [string]
        $StigVersion,

        [Parameter()]
        [psobject]
        $SkipRule,

        [Parameter()]
        [psobject]
        $SkipRuleType,

        [Parameter()]
        [psobject]
        $Exception,

        [Parameter()]
        [string[]]
        $OrgSettings,
        ### Begin DO NOT REMOVE Required for Consolidated Integration Tests
        [Parameter()]
        [string]
        [AllowNull()]
        $BrowserVersion,

        [Parameter()]
        [string[]]
        [AllowNull()]
        $OfficeApp,

        [Parameter()]
        [string]
        [AllowNull()]
        $ConfigPath,

        [Parameter()]
        [string]
        [AllowNull()]
        $PropertiesPath,

        [Parameter()]
        [string]
        [AllowNull()]
        $SqlVersion,

        [Parameter()]
        [string]
        [AllowNull()]
        $SqlRole
         ### End DO NOT REMOVE
    )

    Import-DscResource -ModuleName PowerStig

    Node localhost
    {
        & ([scriptblock]::Create("
        SqlServer Database
        {
            SqlVersion = '$SqlVersion'
            SqlRole = '$SqlRole'
            StigVersion = '$StigVersion'
            ServerInstance = 'TestServer'
            Database = 'TestDataBase'
            $(if ($null -ne $OrgSettings)
            {
                "Orgsettings = '$OrgSettings'"
            })
            $(if ($null -ne $Exception)
            {
                "Exception = @{'$Exception'= @{'SetScript'='TestScript'}}"
            })
            $(if ($null -ne $SkipRule)
            {
                "SkipRule = @($( ($SkipRule | % {"'$_'"}) -join ',' ))`n"
            }
            if ($null -ne $SkipRuleType)
            {
                "SkipRuleType = @($( ($SkipRuleType | % {"'$_'"}) -join ',' ))`n"
            })
        }")
        )
    }
}
