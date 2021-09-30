# last_fm_music_search_app
Basic music search app using clean architecture

Testing:
    - 42 Unit tests
    - 3 Widget tests
    - 1 Integration test
    
I followed TDD whilst implementing the application, and for Model.fromJson() calls I did my best
to always use genuine .json responses from the data_source (last_fm_api) and test my logic using
these .json files. The file structure of the lib/ is as best as possible mirrored in test/

Architecture:
I followed clean architecture principles, with each feature being split between 3 layers:
    / domain
        - entities
        - use_cases
        - repositories
    / data
        - models
        - repositories
        - data_sources
    / presentation
        - state_management
        - screens
        - widgets

Clean code:
I did my best to refactor out widgets and builder functions where it made sense to do so. Paying
special attention to the naming of my variable and function names.
