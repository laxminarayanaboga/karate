package tests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

class TestParallel {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:tests")
                .tags("~@skipme")
                .karateEnv("qa")
                .parallel(15);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
