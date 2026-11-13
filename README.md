iJava is an experiment of running Java on older version of iOS (specifically iOS 12.5.8). instead of depending on **Runtime Translation Tools**, iJava's Unsigned IPA is directly produced by GitHub Actions of forked repository, WkWebViewApp. Application represents dark empty window which writes ``Experiment.txt`` file silently on background while printing text in XCode terminal.</br>
```java
  import java.io.IOException;
  import java.nio.charset.StandardCharsets;
  import java.nio.file.Files;
  import java.nio.file.Path;
  import java.nio.file.Paths;
  import java.util.List;

  public class Main {

  public boolean write() {
        System.out.println("Hello iOS experiment!");

        List<Path> paths = List.of(Paths.get(System.getProperty("user.home"), "Documents"));
        Path documentsDir = paths.getFirst();

        Path filePath = documentsDir.resolve("myExperiment.txt");
        String content = "GUI-less Java logic running on iOS!";

        boolean success;
        try {
            Files.createDirectories(documentsDir);
            Path tempFile = Files.createTempFile(documentsDir, "myExperiment", ".tmp");
            Files.writeString(tempFile, content, StandardCharsets.UTF_8);
            Files.move(tempFile, filePath, StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
            success = true;
        } catch (IOException e) {
            success = false;
            System.out.println("Error writing file: " + e.getLocalizedMessage());
        }
        if (success) {
            System.out.println("File written at: " + filePath);
        }
        return true;
    }
    public static void main(String[] args) {
        new Main().write();
    }
  ``

# What is the Runtime translation about?</br>
Apple only allows specific Development languages on IOS (such as Swift or Objective-C), any other language that isn't native to iOS is disallowed.
Regardless of whether its Java/JavaScript/Pascal/C/C++ none of them are able to run on iOS natively. to solve this, community around languages started Runtime Translation Tool projects to translate foreign code into code that is native to the platform. translated code is no longer in same language as it was before.</br>

# What does it mean in context of Java:<br>
Java indeed has Runtime Translation tools around it too, but workaround isn't simple for Windows users like me who have no access to MacOS at all, which is exactly what gives sophistication to this experiment, I managed to run Java on iOS without needing to use XCode directly.</br>
                      The original flow was:<br>
**Setup J2Objective-C on Windows -> let it translate .java file into .h and .m files -> create Command Line tool project in XCode and select Language as Objective-C -> attach those files -> set deployment target to iOS 12.5.8 -> produce .app file -> Run it.</br>
But the grass isn't always as greener as imagined, there are always nuances.** <br>
## **Runtime Translation Tools, Apps or services:**</br>
| Tool: | What it does: | Nuances: |
| :--- | :--- | :--- |
| J2Obj-C| Translates GUI-Less .java code into .h (header) and .m Objective-C code that needs to be attached to the XCode Command line tool project's structure.| Not for Windows, Eclipse plugin isn't maintained. |
| XCode | Only official IDE for iOS development. Lets you to create iOS projects, set deployment target, produce IPA file and more| Strictly for Mac, paid, Deployment target of 12.0 is removed. |
| RoboVM | Tool made for converting Java code into Objective-C code, includes Eclipse plugin.| Deployment from Eclipse only works on MacOS. |
| Codename One | close to RoboVM by converting Java code into Objective-C code, includes Eclipse plugin.| Not well-maintained. |
| Gluon Substrate + GraalVM | Gluon substrate is for JavaFX to iOS projects but technically allows Core Java to convert into Objective-C code with GraalVM.| Only works on MacOS to which I don't have access to. |
| SSH Console + Google Cloud | Many SSH console applications let you to run Java code across Google cloud.| Many SSH Console apps are crashing on iOS 12.0x |
| Stikdebug | Enables JIT (Just in Time) Compiler to run JAR file, especially for those who want to run Games such as Minecraft (like via PojavLauncher) | I don't want to run Games, I'm attempting specific experiment. |
| 3uTools | Really awesome app, let's you to sign IPA files and directly install on iPhone for 1 week, and gives access to storage | sometimes it fails to sign because of miscommunication with Apple services But it works overall. |
| Sideloady | Elegant app for directly signing and installing IPA files on iPhone via USB | very picky about IPA's content but works excellently overall. |

## **The Factual and Social context:**</br>
| Expectation: | Reality: |
| :--- | :--- |
| .app is runnable by clicking. | .app extension is for Apple store, it's not an signed, runnable IPA file.|
| People will help on Reddit | Nope, bunch of trolls who will downvote your post and type hateful comments.|
| Ask anybody with XCode for help | I have nobody such who has XCode to help, only one local, Georgian iOS developer friend who had limited access to XCode, asking him to setup tools was too much pain, also nobody bothers to help without money.|
| Asking help in Discord servers| Nobody helps even there.|

### What was overall solution:</br>
One day when I was wondering about what to do, I found one online Website that helped to translate my GUI-Less Java code into Objective-C code, I pasted code there and finally got ``code.m`` file. Finally I no longer needed to use any translation tools. then I told my friend about this who was using **XCodebuild** to make first IPA file and he did it with icon! but later it became harder and harder so he got me GitHub repository that I forked. But this repository relies on XCode project structure which I got by someone to who I'm very grateful
for. But during this experiment, I met with many different people.</br>

## **People's realitions behind iJava:**</br>
| Person: | Who is: | Did what: |
| :--- | :--- | :---|        
| ShadowX | Owner of iCodeWin and iCodeSwift. | Helped with Building first Unsigned IPA files, supported my experiment. |
| Bacho Dev (Bacho Oniani) | Georgian iOS developer. | Worked on overall XCode project structure and provided it. |
| One of the partners of Manager from topworknow.com | Used to have communication with manager of topworknow.com | First determined person to try XCode on their MacOS, their help was genuine but limited. |

## **Conclusion, how was the iJava built and what it represents:**</br>
When you download ``iJava.ipa`` file, it is Unsigned IPA and it needs to be signed by 3uTools or Sideloady to be installed on iOS 12.5.8</br>
When it is installed, it has an dark Java icon and when opening it up, there is an dark empty background. But in 3uTools inside of iJava's Sandboxed "Documents" folder, you can see ``Experiment.txt`` file. and in the XCode console, the printed text. iJava was built after Github actions that came along after Forking ``WkWebViewApp`` Github repository. this current repository contains XCode Project structure developed by Bacho Dev.</br>
**Sideloady:** https://sideloadly.io/index.html</br>
**3uTools:** https://www.3u.com/</br>
**CodeConvert (website I used to translate Java code to Objective-C code):** https://www.codeconvert.ai/java-to-objective_c-converter</br>

<img width="640" height="1136" alt="image" src="https://github.com/IosebiGames/iJava/blob/main/iJava/iJava_image.png?raw=true" /></br>
