cmake_minimum_required(VERSION 3.20)
project(project LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Core Quick REQUIRED)
find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick Widgets)
find_package(nlohmann_json CONFIG REQUIRED)


qt_standard_project_setup()

qt_policy(SET QTP0001 NEW)

qt_add_executable(${PROJECT_NAME}
        #        main.cpp

)

qt_add_qml_module(${PROJECT_NAME}
        URI EngineMod
        VERSION 1.0
        RESOURCE_PREFIX "/qt/qml"
        QML_FILES
        QML/main.qml
        QML/proto.qml
        QML/project.qml
        QML/task.qml
        QML/subTask.qml
        QML/link.qml
        QML/part.qml
        QML/dir.qml
        QML/file.qml
        QML/homeTask.qml

        SOURCES
        main.cpp
        Engine.cpp
        Engine.h
        RESOURCES
        JSON/DATA.json
)

target_link_libraries(${PROJECT_NAME} PRIVATE
        Qt6::Core
        Qt6::Gui
        Qt6::Qml
        Qt6::Quick
        Qt6::Widgets
        nlohmann_json::nlohmann_json
)

target_include_directories(${PROJECT_NAME} PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/JSON"
)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Gui Qt6::Qml Qt6::Quick nlohmann_json::nlohmann_json)
#configure_file(QML/main.qml ${CMAKE_CURRENT_BINARY_DIR}/main.qml COPYONLY)
