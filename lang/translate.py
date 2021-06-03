import json

locales = ['en', 'es', 'ca']

dictionary = {
    'id': {
        'en': 'hello',
        'ca': 'hola',
        'es': 'hola'
    },
    'home': {
        'en': 'Home',
        'ca': 'Inici',
        'es': 'Inicio'
    },
    'chatList': {
        'en': 'Chats',
        'ca': 'Xats',
        'es': 'Chats'
    },
    'createPublication': {
        'en': 'New Publication',
        'ca': 'Nova Publicació',
        'es': 'Nueva Publicación'
    },
    'activity': {
        'en': 'Activity',
        'ca': 'Activitat',
        'es': 'Actividad'
    },
    'profile': {
        'en': 'Profile',
        'ca': 'Perfil',
        'es': 'Perfil'
    },
    'editProfile': {
        'en': 'Edit Profile',
        'ca': 'Edita Perfil',
        'es': 'Edita Perfil'
    },
    'search': {
        'en': 'Search',
        'ca': 'Busca',
        'es': 'Búsqueda'
    },
    'configuration': {
        'en': 'Configuration',
        'ca': 'Configuració',
        'es': 'Configuración'
    },
    'favPubs': {
        'en': 'Favorites',
        'ca': 'Favorits',
        'es': 'Favoritos'
    },

    #CREATEPUBLICATION TRANSLATIONS

    'longContent': {
        'en': 'The description is too long',
        'ca': 'La descripció és massa llarga',
        'es': 'La descripción es demasiado larga'
    },
    'noGenre': {
        'en': 'You have to select at least 1 genre',
        'ca': 'Ha de seleccionar al menys un gènere',
        'es': 'Tienes que seleccionar al menos un género'
    },
    'noTitle': {
        'en': 'You have to write a title for the publication',
        'ca': "Ha d'escriure un títol per la publcació",
        'es': 'Tienes que escribir un título para la publicación'
    },
    'shortTitle': {
        'en': 'The title is too short',
        'ca': 'El títol és massa curt',
        'es': 'El título es demasiado corto'
    },
    'longTitle': {
        'en': 'The title is too long',
        'ca': 'El títol és massa llarg',
        'es': 'El título es demasiado largo'
    },
    'noContent': {
        'en': 'You have to write a description for the publication',
        'ca': "Ha d'escriure una descripció per la publcació",
        'es': 'Tienes que escribir una descripción para la publicación'
    },
    'titulo': {
        'en': 'Title',
        'ca': "Títol",
        'es': 'Título'
    },
    'tituloDesc': {
        'en': 'Be specific when asking',
        'ca': "Sigues específic a l'hora de preguntar",
        'es': 'Sé específico a la hora de preguntar'
    },
    'tituloHelpTxt': {
        'en': 'Write your question here ...',
        'ca': "Escriu la teva pregunta aquí ...",
        'es': 'Escribe tu pregunta aquí...'
    },
    'descripcion': {
        'en': 'Description',
        'ca': "Descripció",
        'es': 'Descripción'
    },
    'descripcionDesc': {
        'en': 'Include all the necessary information so that other users can give an answer',
        'ca': "Inclou tota la informació necessària perquè els altres usuaris puguin donar una resposta",
        'es': 'Incluye toda la información necesaria para que los demás usuarios puedan dar una respuesta'
    },
    'genero': {
        'en': 'Genre',
        'ca': "Gènere",
        'es': 'Género'
    },
    'generoDesc': {
        'en': 'Choose the literary genre that best suits',
        'ca': "Escull el gènere literari que més s'adeqüi",
        'es': 'Escoge el género literario que más se adecue'
    },
    'tagsDesc': {
        'en': 'Put the tags that best describe your question',
        'ca': "Posa les tags que descriguin millor la teva pregunta",
        'es': 'Pon las tags que describan mejor tu pregunta'
    },
    'publicar': {
        'en': 'Post',
        'ca': "Publicar",
        'es': 'Publicar'
    },

    

    #SIGNUP TRANSLATIONS

    'emptyField': {
        'en': 'Fill this field',
        'ca': 'Emplena aquest camp',
        'es': 'Rellena este campo'
    },
    'shortUName': {
        'en': 'The username cannot be shorter than 4 characters',
        'ca': "El nom d'usuari ha de ser al menys de 4 caràcters",
        'es': 'El nombre de usuario tiene que ser al menos de 4 caracteres'
    },
    'longUName': {
        'en': 'The username cannot be longer than 15 characters',
        'ca': "El nom d'usuari no pot tenir més de 15 caràcters",
        'es': 'El nombre de usuario no puede tener más de 15 caracteres'
    },
    'usedUName': {
        'en': 'The username is already in use, enter another',
        'ca': "El nom d'usuari ja està en ús, introdueixi un altre",
        'es': 'El nombre de usuario ya esta en uso, introduzca otro'
    },
    'shortName': {
        'en': 'The name cannot be shorter than 2 characters',
        'ca': 'El nom ha de ser al menys de 2 caràcters',
        'es': 'El nombre tiene que ser al menos de 2 caracteres'
    },
    'longName': {
        'en': 'The name cannot be longer than 20 characters',
        'ca': 'El nom no pot tenir més de 20 caràcters',
        'es': 'El nombre no puede tener más de 20 caracteres'
    },
    'shortSurname': {
        'en': 'The surname cannot be shorter than 2 characters',
        'ca': 'El cognom ha de ser al menys de 2 caràcters',
        'es': 'El apellido tiene que ser al menos de 2 caracteres'
    },
    'longSurname': {
        'en': 'The surname cannot be longer than 20 characters',
        'ca': 'El cognom no pot tenir més de 20 caràcters',
        'es': 'El apellido no puede tener más de 20 caracteres'
    },
    'invalidEmail': {
        'en': 'The email has not a vaild format',
        'ca': "L'email no té un format vàlid",
        'es': 'El email no tiene un formato válido'
    },
    'usedEmail': {
        'en': 'The email is already registered',
        'ca': "L'email indicat ja està registrat",
        'es': 'El email indicado ya está registrado'
    },
    'shortPass': {
        'en': 'The password cannot be shorter than 6 characters',
        'ca': 'La contrasenya ha de ser al menys de 6 caràcters',
        'es': 'La contraseña tiene que ser al menos de 6 caracteres'
    },    
    'longPass': {
        'en': 'The password cannot be longer than 20 characters',
        'ca': 'La contrasenya no pot tenir més de 20 caràcters',
        'es': 'La contraseña no puede tener más de 20 caracteres'
    },
    'invalidPass': {
        'en': 'The password must contain at least \none majuscule, one minuscule, a number and a symbol',
        'ca': "La contrasenya ha de contenir almenys \nuna majúscula, una minúscula, un nombre i un símbol",
        'es': 'La contraseña tiene que contener al menos \nuna mayúscula, una minúscula, un número y un simbolo'
    },
    'nomatchPass': {
        'en': 'The passwords does not match',
        'ca': 'Les contrasenyes no coincideixen',
        'es': 'Las contraseñas no coinciden'
    },


    #GENRES TRANSLATIONS
    'action': {
        'en': 'Action',
        'ca': 'Acció',
        'es': 'Acción'
    },
    'adventure': {
        'en': 'Adventure',
        'ca': 'Aventura',
        'es': 'Aventura'
    },
    'literary': {
        'en': 'Literary',
        'ca': 'Literària',
        'es': 'Literaria'
    },
    'contemporary': {
        'en': 'Contemporary',
        'ca': 'Contemporània',
        'es': 'Contemporánea'
    },
    'black': {
        'en': 'Thriller',
        'ca': 'Novel·la negra',
        'es': 'Novela negra'
    },
    'historic': {
        'en': 'Historical',
        'ca': 'Historica',
        'es': 'Histórica'
    },
    'horror': {
        'en': 'Horror',
        'ca': 'Horror',
        'es': 'Horror'
    },  
    'romantic': {
        'en': 'Romantic',
        'ca': 'Romantica',
        'es': 'Romántica'
    },
    'erotic': {
        'en': 'Erotica',
        'ca': 'Eròtica',
        'es': 'Erótica'
    },
    'poetry': {
        'en': 'Poetry',
        'ca': 'Poesia',
        'es': 'Poesía'
    }, 
    'theater': {
        'en': 'Theater',
        'ca': 'Teatre',
        'es': 'Teatro'
    },  
    'terror': {
        'en': 'Terror',
        'ca': 'Terror',
        'es': 'Terror'
    },  
    'comic': {
        'en': 'Comic',
        'ca': 'Còmic',
        'es': 'Cómic'
    }, 
    'Manga': {
        'en': 'Manga',
        'ca': 'Manga',
        'es': 'Manga'
    }, 
    'SciFi': {
        'en': 'Science fiction',
        'ca': 'Ciència ficció',
        'es': 'Ciencia ficción'
    }, 
    'fantasy': {
        'en': 'Fantasy',
        'ca': 'Fantasia',
        'es': 'Fantasía'
    },
    'children': {
        'en': 'Childish',
        'ca': 'Infantil',
        'es': 'Infantil'
    },
    'economy': {
        'en': 'Economy',
        'ca': 'Economia',
        'es': 'Economía'
    },
    'kitchen': {
        'en': 'Cook',
        'ca': 'Cuina',
        'es': 'Cocina'
    },
    'comedy': {
        'en': 'Comedy',
        'ca': 'Comèdia',
        'es': 'Comedia'
    },
    'documentary': {
        'en': 'Documentary',
        'ca': 'Documental',
        'es': 'Documental'
    },
    'drama': {
        'en': 'Drama',
        'ca': 'Drama',
        'es': 'Drama'
    },
    'suspense': {
        'en': 'Suspense',
        'ca': 'Suspens',
        'es': 'Suspense'
    },
    'teen': {
        'en': 'Youth',
        'ca': 'Juvenil',
        'es': 'Juvenil'
    },
    'adult': {
        'en': 'Adult',
        'ca': 'Adult',
        'es': 'Adulto'
    },
    'war': {
        'en': 'Warlike',
        'ca': 'Bèl·lic',
        'es': 'Bélico'
    },
    'crime': {
        'en': 'Crime',
        'ca': 'Crim',
        'es': 'Crimen'
    },
    'sport': {
        'en': 'Sport',
        'ca': 'Esport',
        'es': 'Deporte'
    },
    'history': {
        'en': 'History',
        'ca': 'Història',
        'es': 'Historia'
    },
    'biography': {
        'en': 'Biography',
        'ca': 'Biografia',
        'es': 'Biografía'
    },
    'cops': {
        'en': 'Crime novel',
        'ca': 'Policíac',
        'es': 'Policiaco'
    },
    'family': {
        'en': 'Family',
        'ca': 'Familiar',
        'es': 'Familiar'
    },
    'western': {
        'en': 'Western',
        'ca': 'Western',
        'es': 'Western'
    },
    'religion': {
        'en': 'Religion',
        'ca': 'Religió',
        'es': 'Religión'
    },
    'futurism': {
        'en': 'Futurism',
        'ca': 'Futurisme',
        'es': 'Futurismo'
    },
    'other': {
        'en': 'Others',
        'ca': 'Altres',
        'es': 'Otros'
    },
    'all': {
        'en': 'All',
        'ca': 'Tots',
        'es': 'Todos'
    },
    'filter': {
        'en': 'Filter by category',
        'ca': 'Filtrar per categoria',
        'es': 'Filtrar por categoria'
    },

    'publications': {
        'en': 'Publications',
        'ca': 'Publicacions',
        'es': 'Publicaciones'
    },
    'users': {
        'en': 'Users',
        'ca': 'Usuaris',
        'es': 'Usuarios'
    },

    #EDITPROFILE TRANSLATIONS
    'save': {
        'en': 'Save',
        'ca': 'Desar',
        'es': 'Guardar'
    },
    'username': {
        'en': 'Username',
        'ca': "Nom d'usuari",
        'es': 'Nombre de usuario'
    },
    'name': {
        'en': 'Name',
        'ca': "Nom",
        'es': 'Nombre'
    },
    'favgenres': {
        'en': 'Favorite genres',
        'ca': "Gèneres preferits",
        'es': 'Géneros favoritos'
    },
    'choosepic': {
        'en': 'Choose a profile pic',
        'ca': "Tria una imatge de perfil",
        'es': 'Escoge una foto de perfil'
    },
    'camera': {
        'en': 'Camera',
        'ca': "Caméra",
        'es': 'Cámara'
    },
    'gallery': {
        'en': 'Gallery',
        'ca': "Galeria",
        'es': 'Galería'
    },


    #VIEWPROFILE  TRANSLATIONS

    'joined': {
        'en': 'Joined',
        'ca': "Es va unir el dia",
        'es': 'Se unió el dia'
    },
    'mypubls': {
        'en': 'My posts',
        'ca': "Es va unir el dia",
        'es': 'Mis publicaciones'
    },


    #CONFIGURATION  TRANSLATIONS

    'logout': {
        'en': 'Log out',
        'ca': "Tancar sessió",
        'es': 'Cerrar sesión'
    },
    'mypubls': {
        'en': 'My posts',
        'ca': "Les meves publicacions",
        'es': 'Mis publicaciones'
    },
    'day': {
        'en': 'Day',
        'ca': "Dia",
        'es': 'Día'
    },
    'night': {
        'en': 'Night',
        'ca': "Nit",
        'es': 'Noche'
    },
    'changestyle': {
        'en': 'Change style',
        'ca': "Cambiar el tema",
        'es': 'Cambiar tema'
    },   

    #LOGIN  TRANSLATIONS
    'password': {
        'en': 'Password',
        'ca': "Contrasenya",
        'es': 'Contraseña'
    },   
    'login': {
        'en': 'Log in',
        'ca': "Iniciar sessió",
        'es': 'Iniciar sesión'
    },
    'loginwith': {
        'en': 'Log in with',
        'ca': "Iniciar sessió amb",
        'es': 'Iniciar sesión con'
    },
    'forgotpass': {
        'en': 'Forgot your password?',
        'ca': "Has oblidat la teva contrasenya?",
        'es': '¿Olvidaste tu contraseña?'
    },
    'signup': {
        'en': 'Sign up',
        'ca': "Registrar-se",
        'es': 'Registrarse'
    },
    'wrongpass': {
        'en': 'Wrong password',
        'ca': "Contrasenya incorrecta",
        'es': 'Contraseña incorrecta'
    },
    'wronguser': {
        'en': 'User does not exist, please register first',
        'ca': "No existeix l'usuari, si us plau, registrat primer",
        'es': 'No existe el usuario, por favor regístrese primero'
    },

    #SIGNUP  TRANSLATIONS       
    'wrongformatdate': {
        'en': 'Invalid date format',
        'ca': "La data té un format invàlid",
        'es': 'La fecha tiene un formato inválido'
    }, 
    'register': {
        'en': 'Sign up',
        'ca': "Registre",
        'es': 'Registro'
    },  
    'surname': {
        'en': 'Surame',
        'ca': "Cognom",
        'es': 'Apellido'
    },
    'repeatpass': {
        'en': 'Repeat password',
        'ca': "Repeteix la contrasenya",
        'es': 'Repite la contraseña'
    },
    'next': {
        'en': 'Next',
        'ca': "Següent",
        'es': 'Siguiente'
    },
    'errasepic': {
        'en': 'Delete Photo',
        'ca': "Eliminar Foto",
        'es': 'Eliminar Foto'
    },
    'profilepic': {
        'en': 'Profile pic',
        'ca': "Foto de perfil",
        'es': 'Foto de perfil'
    },
    'userdescdesc': {
        'en': 'Tell us who you are and what you like',
        'ca': "Explica'ns qui ets i que t'agrada",
        'es': 'Explicanos quién eres y que te gusta'
    },               
    'favgenresdesc': {
        'en': 'Write yout favorite genres',
        'ca': "Escriu els temes que més t'interessen",
        'es': 'Escribe los temas que más te interesan'
    },
    'completeregister': {
        'en': 'Complete register',
        'ca': "Completar registre",
        'es': 'Completar registro'
    },    

    #RESETPASS  TRANSLATIONS       
    'resetdesc': {
        'en': 'Enter your email address. You will receive an email shortly to reset your password.',
        'ca': "Introdueix la teva adreça electrònica. En breus rebràs un correu per restablir la nova contrasenya.",
        'es': 'Introduce tu dirección electrónica. En breves recibirás un correo para restablecer la nueva contraseña.'
    },
    'resetemaildesc': {
        'en': 'Enter your email address',
        'ca': "Introdrueix la teva adreça electrònica",
        'es': 'Introduce tu dirección electrónica'
    },      
    'ty': {
        'en': 'Thanks',
        'ca': "Gràcies",
        'es': 'Gracias'
    },
    'resetconfirm1': {
        'en': 'An email has been sent to the email address',
        'ca': "S'ha enviat un correu a l'adreça electrònica",
        'es': 'Se ha enviado un correo a la dirección electrónica'
    }, 
    'resetconfirm2': {
        'en': 'to reset password',
        'ca': "per reestablir la seva contrasenya",
        'es': 'para restablecer la contraseña'
    },
    'send': {
        'en': 'Send',
        'ca': "Envia",
        'es': 'Envía'
    },     

    #ACTIVITY  TRANSLATIONS 
    'nomentions': {
        'en': 'Your mentions will be displayed here',
        'ca': "Aquí es mostraran les teves mencions",
        'es': 'Aquí se mostrarán tus menciones'
    },    

}

for lang in locales:
    local_dictionary = {}
    for word, translation in dictionary.items():
        local_dictionary[word] = translation[lang]
    # Serializing json
    jsn = json.dumps(local_dictionary, indent=4, ensure_ascii=False)
    with open(f'{lang}.json', 'w', encoding='utf-8') as f:
        f.write(jsn)