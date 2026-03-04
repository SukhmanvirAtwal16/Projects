#include "Student.h"
using namespace std;

Student::Student()
{
    szStudentID = "";


}

Student::Student(const string &szStudentID)
{
    this->szStudentID = szStudentID;
}

string Student::getStudentID() const
{
    return szStudentID;
}

