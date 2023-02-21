import model.File;

public class FileManager {

    public static int ALL = 0;
    public static int IMAGE = 1;
    public static int AUDIO = 2;
    public static int VIDEO = 3;
    public static int DOCUMENT = 4;


    public void listFile(int fileType) {
        switch (fileType) {
            case 0:
                System.out.println("Show all files");
                break;
            case 1:
                System.out.println("Show all Image files");
                break;
            case 2:
                System.out.println("Show all Audio files");
                break;
            case 3:
                System.out.println("Show all Video files");
                break;
            case 4:
                System.out.println("Show all Document files");
                break;
        }
    }

    public void openFile(File file) {
        System.out.println(String.format("Open file %1$s (path = %2$s) using %3$s", file.getFileName(), file.getFilePath(), file.getOpenApp()));
    }

    public void deleteFile(File file) {
        System.out.println(String.format("Delete file %1$s (path = %2$s)", file.getFileName(), file.getFilePath()));
    }

    public void shareFile(File file, String shareApp, String recipient) {
        System.out.println(
                String.format("Share file %1$s (path = %2$s) with %3$s via %4$s successfully",
                        file.getFileName(),
                        file.getFilePath(),
                        recipient,
                        shareApp));
    }

    public void moveFile(File file, String newLocation) {
        String oldPath = file.getFilePath();
        file.setFileLocation(newLocation);
        System.out.println(
                String.format("Move file %1$s (path = %2$s) to %3$s (path = %4$s) successfully",
                        file.getFileName(),
                        oldPath,
                        file.getFileLocation(),
                        file.getFilePath()));
    }

    public void renameFile(File file, String newName) {
        String oldName = file.getFileName();
        String oldPath = file.getFilePath();
        file.setFileName(newName);
        System.out.println(
                String.format("Rename file %1$s (path = %2$s) successfully. New name is %3$s, (path = %4$s)",
                        oldName,
                        oldPath,
                        file.getFileName(),
                        file.getFilePath()));
    }

    public void showFileDetails(File file) {
        System.out.println(file.toString());
    }
}