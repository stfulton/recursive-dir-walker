//recursive directory walker
//alternative to using apache filefilter
// too difficult to install apache.commons in processing

import java.util.*;

File examplesRoot=new File("/Applications/Processing.app/");

//re-using inside recursive function, so declare globally.
Set <File> uDirs = new TreeSet <File>();

//preserves the existing architecture since this is what
//sketchbrowser uses
Set <File> uniqueExampleDirs=new TreeSet <File>();
Set <File> uniqueLibraryDirs=new TreeSet <File>();


void setup(){

  uDirs.clear();
  uniqueExampleDirs=walk(examplesRoot);
  
  //
  //uniqueDirs.clear();
  //uniqueLibraryDirs=walk(librariesRoot);
  
  println("unique example dirs = "+uniqueExampleDirs.size());
}

void draw(){}

//if dir contains objects, check each and:
//walk it if a directory or check against
//pattern if file, adding to global set on match
//----------------------------------------walk(File dir)
Set <File> walk(File dir) {
   
  String patt = ".pde";
  File contents[] = dir.listFiles();
  
  if (contents != null) {
    for (File f: contents) {
      if (f.isDirectory()) walk(f);
      else if (f.getName().endsWith(patt)) uDirs.add(f.getParentFile());
     }
  }
return uDirs;
}
