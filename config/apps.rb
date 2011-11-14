Padrino.configure_apps do
  set :session_secret, 'e52e14542f0dd1ea0617c6305e9ab93ef747d72f1eae2542a9cde5c48a0c5ffe'
end

Padrino.mount("Marvin").to('/')
Padrino.mount("Admin").to("/marvin")
