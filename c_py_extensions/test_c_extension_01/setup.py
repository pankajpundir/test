from distutils.core import setup, Extension

mod1 = Extension("hw",
                 include_dirs=["P:/prog/python/Python27/include"],
                 libraries=[],
                 sources=["hello_world_module.c"])

setup(name="hw", version="0.1", description="This is a test extension.",
      author="Pankaj Singh", url="www.test.org", ext_modules=[mod1])
