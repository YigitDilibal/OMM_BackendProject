package runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {
                "pretty",                         // Konsolda okunabilir loglar
                "html:target/cucumber-reports/cucumber.html", // Cucumber HTML raporu
                "json:target/cucumber-reports/cucumber.json", // JSON raporu (Cucumber HTML için gerekli)
                "io.qameta.allure.cucumber7jvm.AllureCucumber7Jvm" // Allure raporları için plugin
        },
        features = {"src/test/resources/features/api", "src/test/resources/features/db"},
        glue = {"stepdefinitions","hooks","utilities"},
        tags = "@DB",
        dryRun =false



)
public class Runner {
}
