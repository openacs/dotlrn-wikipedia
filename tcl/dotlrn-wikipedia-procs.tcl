
ad_library {

}

namespace eval dotlrn_wikipedia {

    ad_proc -public applet_key {
    } {
        What's my applet key?
    } {
        return dotlrn_wikipedia
    }

    ad_proc -public my_package_key {
    } {
        What's my package key?
    } {
        return "dotlrn-wikipedia"
    }

    ad_proc -public package_key {
    } {
        What package does this applet deal with?
    } {
        return wikipedia
    }

    ad_proc -public get_pretty_name {
    } {
        return the pretty name of this applet.
    } {
        return Wikipedia
    }

    ad_proc -public add_applet {
    } {
        Add the wikipedia applet to dotlrn - for one-time init
        Must be repeatable!
    } {
        if {![dotlrn_applet::applet_exists_p -applet_key [applet_key]]} {

            db_transaction {
                dotlrn_applet::mount \
                    -package_key [my_package_key] \
                    -url wikipedia \
                    -pretty_name [get_pretty_name]

                dotlrn_applet::add_applet_to_dotlrn \
                    -applet_key [applet_key] \
                    -package_key [my_package_key]
            }

        }
    }

    ad_proc -public remove_applet {
    } {
        remove the applet from dotlrn
    } {
        ad_return_complaint 1 "[applet_key] remove_applet not implemented!"
    }

    ad_proc -public add_applet_to_community {
        community_id
    } {
        Add the wikipedia applet to a dotlrn community
    } {
        # Create and Mount the wikipedia package
        set package_id [dotlrn::instantiate_and_mount \
            -mount_point wikipedia \
            $community_id \
            [package_key] \
        ]

        # set up the bboard portlet for this community
        set portal_id [dotlrn_community::get_portal_id \
            -community_id $community_id \
        ]

        # add the portlet to the comm's portal using add_portlet_helper
        set args [ns_set create]
        ns_set put $args package_id $package_id
        ns_set put $args param_action overwrite

        dotlrn_wikipedia::add_portlet_helper $portal_id $args

        return $package_id
    }

    ad_proc -public remove_applet_from_community {
        community_id
    } {
        remove the applet from the given community
    } {
        ad_return_complaint 1 "[applet_key] remove_applet_from_community not implemented!"
    }

    ad_proc -public add_user {
        user_id
    } {
        Called when the user is initially added as a dotlrn user.
        For one-time init stuff.
    } {
    }

    ad_proc -public remove_user {
        user_id
    } {
        called when a user is removed from dotlrn.
    } {
    }

    ad_proc -public add_user_to_community {
        community_id
        user_id
    } {
        Add a user to a specific dotlrn community
    } {
        set portal_id [dotlrn::get_portal_id -user_id $user_id]
        set package_id [dotlrn_community::get_applet_package_id \
            -community_id $community_id \
            -applet_key [applet_key] \
        ]
        set args [ns_set create]
        ns_set put $args package_id $package_id
        ns_set put $args param_action append

        # don't use the cached version
        dotlrn_wikipedia::add_portlet_helper \
            [dotlrn::get_portal_id_not_cached -user_id $user_id] \
            $args

        dotlrn_wikipedia::add_portlet_helper $portal_id $args

    }

    ad_proc -public remove_user_from_community {
        community_id
        user_id
    } {
        Remove a user from a community
    } {
        set portal_id [dotlrn::get_portal_id -user_id $user_id]
        set package_id [dotlrn_community::get_applet_package_id \
            -community_id $community_id \
            -applet_key [applet_key] \
        ]

        set args [ns_set create]
        ns_set put $args package_id $package_id

        remove_portlet $portal_id $args

    }

    ad_proc -public add_portlet {
        portal_id
    } {
        A helper proc to set up default params for templates.

        @param portal_id
    } {
        set args [ns_set create]
        ns_set put $args package_id 0
        ns_set put $args param_action overwrite

        set type [dotlrn::get_type_from_portal_id -portal_id $portal_id]

        if {[string equal $type user]} {
            # portal_id is a user portal template
        }

        add_portlet_helper $portal_id $args
    }

    ad_proc -public add_portlet_helper {
        portal_id
        args
    } {
        This does the call to add the portlet to the given portal.
        Params for the portlet are set by the calllers.

        @param portal_id
        @param args An ns_set of params
    } {
        wikipedia_portlet::add_self_to_page \
            -portal_id $portal_id \
            -package_id [ns_set get $args package_id] \
            -param_action [ns_set get $args param_action]
    }

    ad_proc -public remove_portlet {
        portal_id
        args
    } {
        A helper proc to remove the underlying portlet from the given portal.

        @param portal_id
        @param args An ns_set of args
    } {
        set package_id [ns_set get $args package_id]
        #wikipedia_portlet::remove_self_from_page $portal_id $package_id
    }

    ad_proc -public clone {
        old_community_id
        new_community_id
    } {
        Clone this applet's content from the old community to the new one
    } {
        dotlrn_wikipedia::add_applet_to_community $new_community_id
    }

    ad_proc -public change_event_handler {
        community_id
        event
        old_value
        new_value
    } { 
        listens for the following events: rename
    } { 
        switch $event {
            rename {
                handle_rename -community_id $community_id -old_value $old_value -new_value $new_value
            }
        }
    }   

    ad_proc -private handle_rename {
        {-community_id:required}
        {-old_value:required}
        {-new_value:required}
    } {
        what to do with wikipedia when the name of the community changes
    } {
    }

}
