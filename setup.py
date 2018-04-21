from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

from Cython.Compiler.Options import get_directive_defaults

directive_defaults = get_directive_defaults()
directive_defaults['linetrace'] = True
directive_defaults['binding'] = True

extensions = [
   Extension("colors_or_cyt", ["colors_or_cyt.pyx"],
             define_macros=[('CYTHON_TRACE', '1')])
]

setup(
   name = 'colors',
   ext_modules = cythonize(extensions)
   )
