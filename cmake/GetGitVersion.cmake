function(get_git_version OUT_VERSION)
    # Set a default version
    set(DEFAULT_VERSION "0.0.0")

    # Try to get the latest Git tag
    execute_process(
        COMMAND git describe --tags --abbrev=0
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE GIT_TAG
        OUTPUT_STRIP_TRAILING_WHITESPACE
        ERROR_QUIET
        RESULT_VARIABLE GIT_TAG_RESULT
    )

    if(GIT_TAG_RESULT EQUAL 0)
        # Remove leading 'v' if present
        string(REGEX REPLACE "^v" "" PROJECT_VERSION "${GIT_TAG}")
        set(${OUT_VERSION} ${PROJECT_VERSION} PARENT_SCOPE)
    else()
        message(WARNING "Git not found or no tags are available. Using default version ${DEFAULT_VERSION}.")
        set(${OUT_VERSION} ${DEFAULT_VERSION} PARENT_SCOPE)
    endif()
endfunction()