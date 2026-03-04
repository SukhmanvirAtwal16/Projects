#include "Grade.h"
using namespace std;

Grade::Grade()
{
    szModuleCode = "";
    iMark = 0;

}

Grade::Grade(const string &szModuleCode, int iMark)
{
    this->szModuleCode = szModuleCode;
    this->iMark = iMark;
}

string Grade::getModuleCode()
const
{
    return szModuleCode;
}

int Grade::getMark()
const
{
    return iMark;
}
