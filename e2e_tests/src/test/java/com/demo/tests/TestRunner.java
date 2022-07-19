package com.demo.tests;

import com.intuit.karate.cucumber.CucumberRunner;
import com.intuit.karate.cucumber.KarateStats;

import cucumber.api.CucumberOptions;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@CucumberOptions(tags = { "@PositiveScenario" }, features = { "src/test/resources/features" }) // ,@createCompanyZipAssociation_Negative"})
//@CucumberOptions(tags = {"~@ignore"})
public class TestRunner {

    @Test
    public void testParallel() {
        String karateOutputPath = "target/surefire-reports";
        KarateStats stats = CucumberRunner.parallel(getClass(), 1, karateOutputPath);
        generateReport(karateOutputPath);
        assertTrue("there are scenario failures", stats.getFailCount() == 0);
    }

    private static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
        List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
        for (File file : jsonFiles) {
            jsonPaths.add(file.getAbsolutePath());
        }
        Configuration config = new Configuration(new File("target"), "Accelarate End To End API Tests");
        config.addClassifications("Environment", System.getProperty("karate.env"));
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        System.out.println("Generating report***************");
        reportBuilder.generateReports();
    }


}

