from distutils.core import setup
from Cython.Build import cythonize

setup(
   name = 'colors',
   ext_modules = cythonize('colors_or_cyt.pyx')
   )
