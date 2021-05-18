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


    #CREATEPUBLICATION TRANSLATIONS

    'longContent': {
        'en': 'The description is too long',
        'ca': 'La descripció és massa llarga',
        'es': 'La descripción es demasiado larga'
    },
    'noGenre': {
        'en': 'You have to select at least 1 genre',
        'ca': 'Ha de seleccionar al menys un gènere',
        'es': 'Tienes que seleccioanar al menos un género'
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
    'Accion': {
        'en': 'Action',
        'ca': 'Acció',
        'es': 'Acción'
    },
    'Aventura': {
        'en': 'Adventure',
        'ca': 'Aventura',
        'es': 'Aventura'
    },
    'Literaria': {
        'en': 'Literary',
        'ca': 'Literària',
        'es': 'Literaria'
    },
    'Contemporanea': {
        'en': 'Contemporary',
        'ca': 'Contemporània',
        'es': 'Contemporánea'
    },
    'Negra': {
        'en': 'Thriller',
        'ca': 'Novel·la negra',
        'es': 'Novela negra'
    },
    'Historica': {
        'en': 'Historical',
        'ca': 'Historica',
        'es': 'Histórica'
    },
    'Romantica': {
        'en': 'Romantic',
        'ca': 'Romantica',
        'es': 'Romántica'
    },
    'Erotica': {
        'en': 'Erotica',
        'ca': 'Eròtica',
        'es': 'Erótica'
    },
    'Poesia': {
        'en': 'Poetry',
        'ca': 'Poesia',
        'es': 'Poesía'
    }, 
    'Teatro': {
        'en': 'Theater',
        'ca': 'Teatre',
        'es': 'Teatro'
    },  
    'Terror': {
        'en': 'Terror',
        'ca': 'Terror',
        'es': 'Terror'
    },  
    'Comic': {
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
    'Fantasia': {
        'en': 'Fantasy',
        'ca': 'Fantasia',
        'es': 'Fantasía'
    },
    'Infantil': {
        'en': 'Childish',
        'ca': 'Infantil',
        'es': 'Infantil'
    },
    'Economia': {
        'en': 'Economy',
        'ca': 'Economia',
        'es': 'Economía'
    },
    'Cocina': {
        'en': 'Cook',
        'ca': 'Cuina',
        'es': 'Cocina'
    },
    'Comedia': {
        'en': 'Comedy',
        'ca': 'Comèdia',
        'es': 'Comedia'
    },
    'Documental': {
        'en': 'Documentary',
        'ca': 'Documental',
        'es': 'Documental'
    },
    'Drama': {
        'en': 'Drama',
        'ca': 'Drama',
        'es': 'Drama'
    },
    'Suspense': {
        'en': 'Suspense',
        'ca': 'Suspens',
        'es': 'Suspense'
    },
    'Juvenil': {
        'en': 'Youth',
        'ca': 'Juvenil',
        'es': 'Juvenil'
    },
    'Adulto': {
        'en': 'Adult',
        'ca': 'Adult',
        'es': 'Adulto'
    },
    'Belico': {
        'en': 'Warlike',
        'ca': 'Bèl·lic',
        'es': 'Bélico'
    },
    'Crimen': {
        'en': 'Crime',
        'ca': 'Crim',
        'es': 'Crimen'
    },
    'Deporte': {
        'en': 'Sport',
        'ca': 'Esport',
        'es': 'Deporte'
    },
    'Historia': {
        'en': 'History',
        'ca': 'Història',
        'es': 'Historia'
    },
    'Biografia': {
        'en': 'Biography',
        'ca': 'Biografia',
        'es': 'Biografía'
    },
    'Policiaco': {
        'en': 'Crime novel',
        'ca': 'Policíac',
        'es': 'Policiaco'
    },
    'Familiar': {
        'en': 'Family',
        'ca': 'Familiar',
        'es': 'Familiar'
    },
    'Western': {
        'en': 'Western',
        'ca': 'Western',
        'es': 'Western'
    },
    'Religion': {
        'en': 'Religion',
        'ca': 'Religió',
        'es': 'Religión'
    },
    'Futurismo': {
        'en': 'Futurism',
        'ca': 'Futurisme',
        'es': 'Futurismo'
    },
    'Otro': {
        'en': 'Others',
        'ca': 'Altres',
        'es': 'Otros'
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