package ;

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
    }

    private function lost() {
        Sys.println("If you get stuck, use -h to read the help file");
    }

    private function help() {
        Sys.println("To create a new project, use -n \"My Project Name\" inside the directory that you want to create the project folder in.");
    }

}
