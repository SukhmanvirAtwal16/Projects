#include "Module.h"
using namespace std;


Module::Module() : szCode(""), iCredit(0), szModuleName("")
{
    szCode = "";
    iCredit = 0;
    szModuleName = "";

}


Module::Module(const string &szCode, int iCredit, const string &szModuleName)
{
    this->szCode = szCode;
    this->iCredit = iCredit;
    this->szModuleName = szModuleName;
}


string Module::getCode()
const
{
    return szCode;
}


int Module::getCredit()
const
{
    return iCredit;
}

string Module::getName()
const
{
    return szModuleName;
}
