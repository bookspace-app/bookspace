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

}

for lang in locales:
    local_dictionary = {}
    for word, translation in dictionary.items():
        local_dictionary[word] = translation[lang]
    # Serializing json
    jsn = json.dumps(local_dictionary, indent=4, ensure_ascii=False)
    with open(f'{lang}.json', 'w', encoding='utf-8') as f:
        f.write(jsn)