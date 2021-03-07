import json

locales = ['en', 'es', 'ca']

dictionary = {
    'id': {
        'en': 'hello',
        'ca': 'hola',
        'es': 'hola'
    }
}

for lang in locales:
    local_dictionary = {}
    for word, translation in dictionary.items():
        local_dictionary[word] = translation[lang]
    # Serializing json
    jsn = json.dumps(local_dictionary, indent=4, ensure_ascii=False)
    with open(f'{lang}.json', 'w', encoding='utf-8') as f:
        f.write(jsn)