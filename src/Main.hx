package ;

import sys.io.File;
import haxe.zip.Reader;
import sys.FileSystem;

class Main {

    static function main() {
        new Main();
    }

    public function new() {
        var args = Sys.args();

        switch(args[0]) {
        case "-n":
            // do thing
            newProject(args[1]);

        case "-h":
            help();

        default:
            lost();
        }
    }

    private function newProject(name:String) {
        // check the name is valid
        // create the folder if it doesn't already exist
        // unzip and copy the empty project template files into the new folder
        // done! :D

        unzip("/home/erik/Documents/Code/Apps/SpiderTools/templates/test.zip", '${name}');
    }

    private function lost() {
        Sys.println("If you get stuck, use -h to read the help file");
    }

    private function help() {
        Sys.println("To create a new project, use -n \"My Project Name\" inside the directory that you want to create the project folder in.");
    }

    private function unzip(zip:String, dest:String) {
        var f = File.read(zip);
        var enries = Reader.readZip(f);

        f.close();

        var cwd = Sys.getCwd();

        for(e in enries){
            var fileName = e.fileName;
            var dirs = fileName.split("/");

            // no dirs
            if(dirs.length == 1) {
                dirs = [];
            } else {
                dirs.pop();
            }

            for(dir in dirs){
                var dirPath = '${cwd}${dest}/${dir}';

                trace(dirPath);
            }

            // create the directories it lives in
            // write the file 
        }
    }

}
