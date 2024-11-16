#include <iostream>
#include <memory>
#include "parent.h"

int main(int argc, char const *argv[])
{
    // deault constructor
    std::cout << "default constructor" << std::endl;
    Parent parent;

    // parameterized constructor
    std::cout << "parameterized constructor" << std::endl;
    Parent parent_with_name("John");

    // copy constructor
    std::cout << "copy constructor" << std::endl;
    Parent parent_cc = parent;

    // copy assignment
    Parent parent_ca;
    std::cout << "copy assignment" << std::endl;
    parent_ca = parent;

    // move constructor
    std::cout << "move constructor" << std::endl;
    Parent parent_mc = std::move(parent);

    // move assignment
    Parent parent_ma;
    std::cout << "move assignment" << std::endl;
    parent_ma = std::move(parent);

    // dynamic object with unique pointer
    std::cout << "dynamic object with unique pointer" << std::endl;
    std::unique_ptr<Parent> ptr_parent = std::make_unique<Parent>("Unique");

    // dynamic object with shared pointer
    std::cout << "dynamic object with shared pointer" << std::endl;
    std::shared_ptr<Parent> ptr_parent_shared = std::make_shared<Parent>("Shared");

    // call destructors
    std::cout << "destructors" << std::endl;
    return 0;
}