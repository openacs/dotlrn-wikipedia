
create function inline_0()
returns integer as '
begin

    perform acs_sc_impl__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia'',
        ''dotlrn_wikipedia''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia'',
        ''GetPrettyName'',
        ''dotlrn_wikipedia::get_pretty_name'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia'',
        ''AddApplet'',
        ''dotlrn_wikipedia::add_applet'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia'',
        ''RemoveApplet'',
        ''dotlrn_wikipedia::remove_applet'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia'',
        ''AddAppletToCommunity'',
        ''dotlrn_wikipedia::add_applet_to_community'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia'',
        ''RemoveAppletFromCommunity'',
        ''dotlrn_wikipedia::remove_applet_from_community'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia'',
        ''AddUser'',
        ''dotlrn_wikipedia::add_user'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia'',
        ''RemoveUser'',
        ''dotlrn_wikipedia::remove_user'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia'',
        ''AddUserToCommunity'',
        ''dotlrn_wikipedia::add_user_to_community'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia'',
        ''RemoveUserFromCommunity'',
        ''dotlrn_wikipedia::remove_user_from_community'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia'',
        ''AddPortlet'',
        ''dotlrn_wikipedia::add_portlet'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia'',
        ''RemovePortlet'',
        ''dotlrn_wikipedia::remove_portlet'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia'',
        ''Clone'',
        ''dotlrn_wikipedia::clone'',
        ''TCL''
    );

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia'',
        ''ChangeEventHandler'',
        ''dotlrn_wikipedia::change_event_handler'',
        ''TCL''
    );

    perform acs_sc_binding__new (
        ''dotlrn_applet'',
        ''dotlrn_wikipedia''
    );

    return 0;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();

