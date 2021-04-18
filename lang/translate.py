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
}

for lang in locales:
    local_dictionary = {}
    for word, translation in dictionary.items():
        local_dictionary[word] = translation[lang]
    # Serializing json
    jsn = json.dumps(local_dictionary, indent=4, ensure_ascii=False)
    with open(f'{lang}.json', 'w', encoding='utf-8') as f:
        f.write(jsn)