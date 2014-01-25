#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
#include <cstdlib>
#include <set>

using namespace std;

int main(int argc, char ** argv){
    ifstream settings, data;
    ofstream out;
    string line, param, value;
    double percentage;
    int seed=0, attribute=0;
    if (argc != 4) {
        cout << "Usage: preparedata settings.conf data.arff output.arff"<<endl;
    }
    try{
        settings.open(argv[1]);
        data.open(argv[2]);
        out.open(argv[3]);
    }
    catch(...){
        cout << "exception occured while accessing files"<<endl;
        return 1;
    }

    while (getline(settings, line)){
        if (line.find("#")==0) continue;
        stringstream ss(line);
        ss >> param;
        if (param.size()== 0) continue;
        if (param == "percentage")
            ss>> percentage;
        else if (param == "seed")
            ss>>seed;
        else if (param == "attribute")
            ss>>attribute;
        else {
            cout << "settings file contains unrecognised parameter: " << param<<endl;
            return 1;
        }
    }
    //count rows in file, attributes
    int num_attributes=0;
    while (getline(data,line) && line.find("@data")!=0){
        if (line.find("@attribute")==0) num_attributes ++;
        out << line<<endl;
    }
    out << line<<endl;
    int number_of_lines=0;
    while (getline(data, line))
        ++number_of_lines;
    cout << number_of_lines;
    srand(seed);

    set<int> selected;
    while (selected.size() *1.0/number_of_lines < percentage){
        int chosen = rand()% number_of_lines;
        selected.insert(chosen);
    }
    // go through data and change it
    data.close();
    data.open(argv[2]);
    while (getline(data,line) && line.find("@data")!=0);
    int curr = 0;
    while (getline(data, line)){
        int att = attribute;
        if (att==0) att =  1+rand()%num_attributes;
        int flag=0, pos=1;
        if ( selected.count(curr)==1 ){
            for (int k = 0; k<line.size();++k){
                if (flag == 0 && pos == att) {
                    out<< "?";
                    flag = 1;
                }
                if (line[k] ==',') {pos++; flag=0;}
                if (flag==1) continue;
                out << line[k];
            }
            out << endl;
        }
        else out << line<<endl;
        curr++;
    }



    data.close();
    settings.close();
    out.close();
    return 0;
}
