#ifndef MODULE_H
#define MODULE_H
#include <string>
using namespace std;

class Module{
private:
    string szCode;
    int iCredit;
    string szModuleName;

public:
    Module();
    Module(const string &szCode, int iCredit, const string &szModuleName);

    string getCode() const;
    int getCredit() const;
    string getName() const;
};

#endif
