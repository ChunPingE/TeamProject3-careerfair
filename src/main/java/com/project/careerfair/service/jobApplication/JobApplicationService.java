package com.project.careerfair.service.jobApplication;

import com.project.careerfair.domain.Files;
import com.project.careerfair.domain.JobApplication;
import com.project.careerfair.domain.Members;
import org.springframework.http.ResponseEntity;

import java.io.IOException;
import java.util.List;

public interface JobApplicationService {

    List<JobApplication> getList(Integer postingId);

    List<Members> getDetails(String memberId);

    List<Files> getFileDetails(Integer applicationId);

    ResponseEntity<byte[]> getObject(String fileName) throws IOException;

    void updateStatus(String memberId, Integer applicationId, String applicationStatus, Integer postingId);

    JobApplication redirectList(Integer postingId);
}
