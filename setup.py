from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

extensions = [
   Extension("colors_or_cyt", ["colors_or_cyt.pyx"])
]

setup(
   name = 'colors',
   ext_modules = cythonize(extensions)
   )
