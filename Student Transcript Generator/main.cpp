#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>
#include <map>
#include <vector>

#include "Module.h"
#include "Student.h"
#include "Grade.h"

using namespace std;

//NOTE: Some variables may be 'duplicates', but they're all declared in different scopes.

// Calculate credit-weighted average
double Average(const vector<Grade> &records, const map<string, Module> &modules)
{
    double dWeighted = 0.0;
    double dTotalCredits = 0.0;

    for (const auto &gCurrentGrade : records)
    {
        auto it = modules.find(gCurrentGrade.getModuleCode());
        if (it != modules.end())
        {
            int iCredit = it->second.getCredit();
            dWeighted += gCurrentGrade.getMark() * iCredit;
            dTotalCredits += iCredit;
        }
    }

    if (dTotalCredits == 0)
    {
        return 0.0;
    }
    return dWeighted/dTotalCredits;
}


int main()
{
    map<string, Module> modules;
    map<string, Student> students;

    // -------------------------------
    // Load modules.txt
    // -------------------------------
    ifstream moduleFile("modules.txt");
    string szCode;
    string szName;
    int iCredit;

    while (moduleFile >> szCode >> iCredit >> szName)
    {
        modules[szCode] = Module(szCode, iCredit, szName);
    }

    // -------------------------------
    // Load grades.txt
    // -------------------------------
    ifstream gradeFile("grades.txt");
    string szStudentID;
    string szModuleCode;
    int iTerm;
    int iMark;

    while (gradeFile >> szStudentID >> iTerm >> szModuleCode >> iMark)
    {
        if (students.count(szStudentID) == 0)
        {
            students[szStudentID] = Student(szStudentID);
        }

        //Can comment out if needed?
        students[szStudentID].terms[iTerm].push_back(Grade(szModuleCode, iMark));
    }

    // -------------------------------
    // Process requests.txt
    // -------------------------------
    ifstream requestFile("requests.txt");
    string szLine;

    while (getline(requestFile, szLine))
    {
        if (szLine.empty())
        {
            continue;
        }

        stringstream ss(szLine);
        string szRequestID;
        int iRequestTerm;
        ss >> szRequestID;

        bool bHasTerm = false;
        if (ss >> iRequestTerm)
        {
            bHasTerm = true;  // <-- FIXED LINE
        }

        cout << "Student ID: " << szRequestID << '\n';

        if (students.count(szRequestID) == 0)
        {
            continue;
        }

        Student &sCurrentStudent = students[szRequestID];
        double dOverallWeighted = 0;
        double dOverallCredits = 0;

        if (bHasTerm)
        {
            cout << "Term " << iRequestTerm << '\n';
            if (sCurrentStudent.terms.count(iRequestTerm))
            {
                auto &gradeVector = sCurrentStudent.terms[iRequestTerm];
                for (auto &gCurrentGrade : gradeVector)
                {
                    Module mCurrentModule = modules[gCurrentGrade.getModuleCode()];
                    cout << "  " << mCurrentModule.getCode() << " " << mCurrentModule.getName() << " (" << mCurrentModule.getCredit() << " credits): " << gCurrentGrade.getMark() << '\n';
                }
                double dAverage = Average(sCurrentStudent.terms[iRequestTerm], modules);
                cout << fixed << setprecision(2);
                cout << "Term Average: " << dAverage << '\n';
            }
            else
            {
                cout << "Term Average: 0.00" << '\n';
            }
            continue;
        }

        // Print all terms
// Loop over all terms for the current student
        for (auto &tCurrentTerm : sCurrentStudent.terms)
        {
            int termCode = tCurrentTerm.first;          // term number
            auto &gradesInTerm = tCurrentTerm.second;   // vector of grades for this term

            cout << "Term " << termCode << '\n';

            for (auto &currentGrade : gradesInTerm)
            {
                Module currentModule = modules[currentGrade.getModuleCode()];

                cout << "   " << currentModule.getCode() << " " << currentModule.getName() << " (" << currentModule.getCredit() << " credits): " << currentGrade.getMark() << "\n";

                dOverallWeighted += currentGrade.getMark() * currentModule.getCredit();
                dOverallCredits += currentModule.getCredit();
            }

            double dTermAverage = Average(gradesInTerm, modules);
            cout << fixed << setprecision(2);
            cout << "Term Average: " << dTermAverage << '\n';
        }


        double dOverall;
        if (dOverallCredits == 0)
        {
            dOverall = 0;
        } else
        {
            dOverall = dOverallWeighted / dOverallCredits;
        }
        cout << "Overall Average: " << fixed << setprecision(2) << dOverall << '\n';
    }

    return 0;
}

