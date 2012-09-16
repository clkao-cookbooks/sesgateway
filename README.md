Description
===========

Configures a tunnel to Amazone Simple Email Service

Requirements
============

* stunnel coobook


Attributes
==========

See `attributes/default.rb` for default values.

Usage
=====

Most likely you want to use it along with postfix.  Note that you must verify your sender
address with SES, and you probably want to use sender_canonical_maps in postfix too.

By default the smtp gateway listens on localhost:2525, so you will want to configure your postfix accordingly.

Examples
--------
    name "base"
    run_list("recipe[postfix]", "recipe[postfix::sasl_auth]", "recipe[sesgateway]")
    override_attributes(
      "postfix" => {
        "smtp_tls_cafile": "/etc/ssl/certs/cacert.org.pem",
        "relayhost": "localhost:2525",
        "mail_type" => "client",
        "mydomain" => "example.com",
        "myorigin" => "example.com",
        "relayhost": "localhost:2525",
        "smtp_sasl_user_name": "Your SES user name"
        "smtp_sasl_passwd": "Your SES password"
      }
    )
