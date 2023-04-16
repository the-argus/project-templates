project('generic', 'c', default_options: ['default_library=static', 'buildtype=debugoptimized', 'warning_level=3'])

cc = meson.get_compiler('c')

# collect source files
source_file_names = [
  'main.cpp'
]
sources = []
foreach file : source_file_names
  sources += files(file)
endforeach

# collect headers
my_headers = declare_dependency(include_directories : include_directories(['.']))

executable('generic', sources, dependencies: [ my_headers ], link_args: [])
