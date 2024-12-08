function(get_git_version FULL_VERSION SEMANTICS_VERSION)
    # Set a default version
    set(DEFAULT_VERSION "0.0.0")
    # Check if git command is available
    find_package(Git QUIET)
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
        string(REGEX REPLACE "^v" "" VERSION_NUMS "${GIT_TAG}")
        set(${SEMANTICS_VERSION} ${PROJECT_VERSION} PARENT_SCOPE)
        message(STATUS "semantics version: ${VERSION_NUMS}")
        # Get the count of commits since the last tag
        execute_process(
            COMMAND git rev-list --count ${GIT_TAG}..HEAD
            OUTPUT_VARIABLE COMMITS_SINCE_LAST_TAG
            OUTPUT_STRIP_TRAILING_WHITESPACE
        )
        if(COMMITS_SINCE_LAST_TAG GREATER 0)
        # Get the short hash of the current commit
            execute_process(
                COMMAND git rev-parse --short HEAD
                OUTPUT_VARIABLE GIT_COMMIT_HASH
                OUTPUT_STRIP_TRAILING_WHITESPACE
            )
            # Append the number of commits and the short hash to the version
            set(${FULL_VERSION} "${VERSION_NUMS}dev${COMMITS_SINCE_LAST_TAG}+${GIT_COMMIT_HASH}" PARENT_SCOPE)
            set(${SEMANTICS_VERSION} "${VERSION_NUMS}.${COMMITS_SINCE_LAST_TAG}" PARENT_SCOPE)
        else()
            set(${FULL_VERSION} "${VERSION_NUMS}" PARENT_SCOPE)
            set(${SEMANTICS_VERSION} "${VERSION_NUMS}" PARENT_SCOPE)
        endif()
    else()
        message(WARNING "Git not found or no tags are available. Using default version ${DEFAULT_VERSION}.")
        set(${FULL_VERSION} ${DEFAULT_VERSION} PARENT_SCOPE)
        set(${SEMANTICS_VERSION} ${DEFAULT_VERSION} PARENT_SCOPE)
    endif()
endfunction()