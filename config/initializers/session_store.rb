# Be sure to restart your server when you modify this file.

ActiveRecord::SessionStore::Session.attr_accessible :data, :session_id
Evry::Application.config.session_store :active_record_store

