#ifndef STUDENT_H
#define STUDENT_H

#include <string>
#include <map>
#include <vector>
#include "Grade.h"
using namespace std;

class Student{
private:
    string szStudentID;

public:
    map<int, vector<Grade>> terms; // term_code -> grades

    Student();
    Student(const string &szStudentID);

    string getStudentID() const;
};

#endif
