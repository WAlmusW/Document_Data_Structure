project('Docs', 
        ['c', 'vala'],
        version : '0.1',
        default_options : ['warning_level=3'])

deps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gio-2.0'),
    dependency('gee-0.8'),  
]

source_code = [
  'src/Document.vala',
  'src/Entry.vala',
  'src/KeyValue.vala',
  'src/main.vala',
  'src/UniqueIDGen.vala',
]

test_code = [
  'TEST/UniqueIDGen_TEST.vala',
  'TEST/KeyValue_TEST.vala',
  'TEST/Entry_TEST.vala',
  'TEST/Document_TEST.vala',
]

codes = [
  source_code, test_code
]

executable('Docs',
           codes,
           dependencies: deps,
           install : true)
