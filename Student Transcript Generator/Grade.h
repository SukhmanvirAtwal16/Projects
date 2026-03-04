#ifndef GRADE_H
#define GRADE_H

#include <string>
using namespace std;


class Grade{
private:
    string szModuleCode;
    int iMark;

public:
    Grade();
    Grade(const string &szModuleCode, int iMark);

    string getModuleCode() const;
    int getMark() const;
};

#endif
