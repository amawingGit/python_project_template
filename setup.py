import os
from setuptools import find_packages, setup

this_dir = os.path.abspath(os.path.dirname(__file__))

dependencies = []

setup(
    name='galaxy',
    version='0.1',
    author='wing',
    author_email='chnyun010@gmail.com',
    description='galaxy',
    long_description="galaxy",
    include_package_data=True,
    zip_safe=False,
    platforms='any',
    install_requires=dependencies,
    packages=find_packages("galaxy", exclude="tests"),
    package_dir={"": "src"},
    classifiers=[
        'Programming Language :: Python :: 3'
    ]
)
