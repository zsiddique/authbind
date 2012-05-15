Description
===========
This cookbook will install authbind for Ubuntu and then allow you to use a resource named authbind_port, authbind_addr, authbind_uid which will allow you to bind to ports based on the port used and they belong to the user who is running the script.

Changes
=======
## v0.1.0:

* First cut of "stable".  Only has port add

## v0.2.0:

* Added byaddr and byuid and delete for all the providers.  Thanks to Pre-ChefCon hacknight.

Requirements
============
Ubuntu

Attributes
==========
None but you could use [:attribute][:enabled] for your app to flag it.

Usage
=====

Put `recipe[authbind]` first in the run list. If you have other recipes that you want to use to configure how authbind behaves, like new port, notify the port resource to run, e.g.:

    authbind_port "443" do
      owner "nobody"
      group "nogroup"
      action :add
    end
    
    authbind_addr "0.0.0.0" do
      port "443"
      action :add
    end
    
    authbind_uid "1001" do
      action :add
    end
    
    
To delete a authbind just do it backwards and set the action :delete.

The above will run during execution phase since it is a normal template resource, and should appear before other package resources that need the sources in the template.

TODO
=====
More testing anc cleaning up