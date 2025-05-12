from setuptools import setup, find_packages


setup(
    name='copilot_training',
    version='0.1',
    packages=find_packages(),
    package_dir={'': '.'},
    include_package_data=True,
    install_requires=[
        'Flask',
    ],
    entry_points={
        'console_scripts': [
            'course101=copilot_training.c101.src.app101:create_app',
            'course201=copilot_training.c201.src.app201:create_app',
        ],
    },
)
