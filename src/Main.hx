package ;

import sys.io.File;
import sys.FileSystem;

import haxe.zip.Reader;

class Main {

	private var isBSD(get, null):Bool;
	private var isLinux(get, null):Bool;
	private var isMac(get, null):Bool;
	private var isWindows(get, null):Bool;

	static function main() {
		new Main();
	}

	public function new() {
		var args = Sys.args();

		switch(args[0]) {
			case "-n":
				// do thing
				newProject(args[1]);

			case "-v":
				newVHost(args[1]);

			case "-h":
				help();

			default:
				lost();
		}
	}

	private function newProject(name:String) {
		// TODO: Use a relative path once we know how this will be installed 
		unzip("/home/erik/Documents/Code/Apps/SpiderTools/templates/NewProject.zip", '${name}');
	}

	private function newVHost(name:String, path:String = '') {
		var httpd;
		var httpd_location = '';

		var hosts;
		var hosts_location = '';

		var vhosts;
		var vhosts_location = '';

		if(isLinux) {
			httpd_location = '/opt/lampp/etc/httpd.conf';
			hosts_location = '/etc/hosts';
			vhosts_location = '/opt/lampp/etc/extra/httpd-vhosts.conf';
		}

		if(isMac) {  }
		if(isWindows) {  }
		if(isBSD) {  }

		// search hosts for the name
		// search the vhosts file for the name 

		// if we don't find it in either of those, move on

		// make a backup copy of these files

		// insert the name + ip into the hosts file 
		// insert the vhost into the vhosts file

		// close the files 
	}

	private function lost() {
		Sys.println("If you get stuck, use -h to read the help file");
	}

	private function help() {
		Sys.println("To create a new project, use -n \"My Project Name\" inside the directory that you want to create the project folder in.");
		Sys.println("To create a new vhost use -v \"example.dev\"");
	}

	private function unzip(zip:String, dest:String) {
		var f = File.read(zip);
		var entries = Reader.readZip(f);

		f.close();

		var cwd = Sys.getCwd();

		for(e in entries){
			var fileName = e.fileName;
			var dirs = fileName.split("/");
			var filename = "";
			var path = '${dest}/';

			filename = dirs.pop();

			for(dir in dirs){
				var dirPath = '${dest}/${dir}/';
				path += '${dir}/';
			}

			if(!FileSystem.exists(path)) {
				FileSystem.createDirectory(path);
				Sys.println('Spinning : ${path}');
			}

			if(filename != "") {
				var data = Reader.unzip(e);
				var output = File.write('${path}${filename}');

				output.close();
			}

		}
	}

	private function get_isWindows() {
		if(Sys.systemName() == "Windows") {
			return true;
		}
		
		return false;
	}

	private function get_isMac() {
		if(Sys.systemName() == "Mac") {
			return true;
		}
		
		return false;
	}

	private function get_isLinux() {
		if(Sys.systemName() == "Linux") {
			return true;
		}
		
		return false;
	}

	private function get_isBSD() {
		if(Sys.systemName() == "BSD") {
			return true;
		}
		
		return false;
	}

}
