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
}

for lang in locales:
    local_dictionary = {}
    for word, translation in dictionary.items():
        local_dictionary[word] = translation[lang]
    # Serializing json
    jsn = json.dumps(local_dictionary, indent=4, ensure_ascii=False)
    with open(f'{lang}.json', 'w', encoding='utf-8') as f:
        f.write(jsn)