Java is high-level, platform-independent, Object-Oriented, multi-paradigm and general-purpose programming language. it is used for Development of Android applications, Enterprise Web apps, tools, utilities, GUI applications or programs across the Desktop. Usually, Java applications and programs runs on any OS platform without needing to recompile as long as latest version of Java is installed properly, thanks to **JVM** (Java Virtual Machine) which interprets bytecode to make Java programs run, typically found in .class files inside of runnable JARs.
JVM interprets bytecode (low-level code format that isn't more high-level than Java source code but isn't more low-level than machine code) line by line. This gives huge advantage for Java developers to run their Java programs on any platforms such as Windows, MacOS, Linux, Oracle Solaris and etc. also JIT (Just in Time) Compiler found in JVM uses hot, frequently executed code lines to form native machine code to make Java applications run faster. However, there are platforms where usage of many programming languages is strictly limited, and one of those examples are iOS. Apple prefers to keep only their own native languages (Swift, Objective-C) as for original Development tools for iOS apps. Whenever developer wants to use restricted languages on iOS, they always have to use **Runtime translation tools** to convert their code into Objective-C or Swift code, made by community around specific language that they use. So, if directly running JavaScript, Pascal, C, C++, Python or any languages on iOS without translating code to native iOS language code isn't easily possible, then Java isn't exclusive to this either, as any JVM-related runtime is disallowed on iOS as well as JIT is being restricted. While knowing that Java can't natively run on iOS, Java's community wasn't just sitting around too. there are several solutions that Developers and Google have made over the years when it comes to translating Java code to Objective-C/Swift code.</br>

# Understanding My setup:</br>
1. I used iPhone 5s space gray/iOS 12.5.8 (even though the version itself is old, but trying to push limits and achieve what I wanted still felt like a goal).
2. I wanted to run Java code on iOS (which doesn't use any External libraries and isn't GUI-Based), to let it write basic "Experiment.txt" file and print anything in console (like "GUI-Less Java Code Running on iOS!").
3. Since I'm not an iOS developer and never was, I was aiming to let this Java code to run on any versions of iOS but then I remembered about my iPhone 5s which is iOS 12.5.8. since we already know that Java also has Runtime translation tools made by it's community (one of well-remembered ones are J2Objective-C) which I exactly tried to use at the beginning for this experiment.</br>
4. I used Windows 10 and 3uTools for IPA signing. for better signing and installing IPA directly on my iPhone, I used Sideloady.</br>

My first original steps was to:<br>
**Write GUI-Less Java code without libraries -> Download J2Objective-C -> Use it to convert .java file to header (.h) and .m file -> Create Command Line tool Project in XCode and select language as Objective-C -> attach .h and .m file to the project -> set deployment target to iOS 12.5.8 -> get .app file -> sign it -> run on my iPhone.**</br>

## **Nuances:**</br>
| What was Expected: | What nuances turned out to exist: |
| :--- | :--- |
| .app extension can run on iOS by clicking on it. | .app extension is for Apple store, it's not an signed IPA file which  you run by clicking on it.|
| J2Objective-C works on Windows | No, J2Objective-C is best supported on MacOS, and doesn't work easily on Windows.|
| XCode is something that I can get | XCode only is downloadable on Mac, but I only have windows.|
| J2Objective-C plugin on Eclipse is what I can try to use | J2Objective-C plugin on Eclipse had problems with installing as last maintaince of it was in Early 2012.|
| I can ask anybody to help me by using their XCode | Nobody minds helping without money.|
| I can use RoboVM on Eclipse | It doesn't work well on Eclipse.|
| The Codename one! I can use that! | Also doesn't work on Eclipse well.|
| Gluon Substrate + GraalVM on MacOS! | Asking someone to setup all those just to help me will be huge pain.|
| Run Java code by help of Cloud and SSH console on iPhone (Remotely) | Many SSH console apps don't support iOS 12.5.8 from Apple store or if some do, used to crash often.|
| Ask on Stack Overflow to get ideas about using J2Objective-C on Windows| J2Objective-C tag on SO isn't actively popular so answers there were specific and in small amount.|
| Trying to find Passionate iOS developer who understands XCode well on Reddit | Only trolls and user called 'CrocodiluQ' commented this experiment as "huge waste of time" (I like being specific so don't get amused).|
| I can ask on Discord iOS development discord servers to get help| Nobody wants to help even there.|
| Someone can try to set Deployment target to iOS 12.5.8| Apple removed Deployment target beyond iOS 13.0 in XCode and plus deployment is paid.|
