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