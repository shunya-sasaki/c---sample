#ifndef PARENT_H_
#define PARENT_H_
#include <iostream>
#include <string>

class Parent
{
public:
    Parent();
    Parent(std::string name);
    ~Parent();
    Parent(const Parent &other);
    Parent &operator=(const Parent &other);
    Parent(Parent &&other);
    Parent &operator=(Parent &&other);

private:
    std::string _name;
    static int _count;
};
#endif
