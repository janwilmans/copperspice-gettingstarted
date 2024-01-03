#include <string>
#include <fstream>
#include <iostream>

bool ends_with(const std::string& str, const std::string& suffix) {
    if (suffix.length() > str.length()) {
        return false;
    }
    return str.compare(str.length() - suffix.length(), suffix.length(), suffix) == 0;
}

int main(int argc, char* argv[])
{
    if (argc == 1)
    {
        std::cout << " --- write dummy option_test.cpp\n";
        std::ofstream ofs("option_test.cpp");
        ofs << "int main() {}\n";
        exit(0);
    }
    std::cout << " --- Got " << argc << " argument(s)\n";

    std::string cmd;
    for(int i=1; i< argc; ++i)
    {
        std::string argument(argv[i]);
        if (ends_with(argument, ".rsp"))
        {
            std::ifstream ifs(argument.substr(1));
            std::string line;
            while (std::getline(ifs, line)) {
                std::cout << line << std::endl;
            }
        }
        cmd += argument;
        cmd += " ";
        std::cout << argv[i] << std::endl;
    }
    cmd.resize(cmd.size()-1);
    std::flush(std::cout);
    system(cmd.c_str());
}
