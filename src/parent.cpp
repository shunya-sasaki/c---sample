#include "parent.h"

int Parent::_count = 0;

Parent::Parent()
{
    this->_count += 1;
    std::cout << "  " << "Call default constructor" << std::endl;
    std::cout << "  " << "count = " << _count << std::endl;
    _name = "Anonymous";
}
Parent::Parent(std::string name) : _name(name)
{
    this->_count += 1;
    std::cout << "  " << "Call parameterized constructor" << std::endl;
    std::cout << "  " << "count = " << _count << std::endl;
}

Parent::~Parent()
{
    this->_count -= 1;
    std::cout << "  " << "Call destructor" << std::endl;
    std::cout << "  " << "count = " << _count << std::endl;
}

// copy constructor
Parent::Parent(const Parent &other)
{
    this->_count += 1;
    std::cout << "  " << "Call copy constructor" << std::endl;
    _name = other._name;
}
// copy assignment
Parent &Parent::operator=(const Parent &other)
{
    std::cout << "  " << "Call copy assignment" << std::endl;
    std::cout << "  " << "count = " << _count << std::endl;
    if (this == &other)
        return *this;
    _name = other._name;
    return *this;
}
// move constructor
Parent::Parent(Parent &&other)
{
    this->_count += 1;
    std::cout << "  " << "Call move constructor" << std::endl;
    std::cout << "  " << "count = " << _count << std::endl;
    _name = other._name;
    other._name = "";
}
// move assignment
Parent &Parent::operator=(Parent &&other)
{
    std::cout << "  " << "Call move assignment" << std::endl;
    if (this == &other)
        return *this;
    _name = other._name;
    other._name = "";
    return *this;
}