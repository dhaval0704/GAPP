package gapp.model;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;
 
public class MultipleFileUpload {
 
    private List<MultipartFile> crunchifyFiles;
 
    public List<MultipartFile> getFiles() {
        return crunchifyFiles;
    }
 
    public void setFiles(List<MultipartFile> files) {
        this.crunchifyFiles = files;
    }
}
