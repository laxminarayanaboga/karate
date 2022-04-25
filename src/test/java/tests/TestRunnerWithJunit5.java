package tests;

import com.intuit.karate.junit5.Karate;

public class TestRunnerWithJunit5 {

	@Karate.Test
	Karate testSample() {
		return Karate.run("sample").relativeTo(getClass());
	}

	@Karate.Test
	Karate testTags() {
		return Karate.run("ChainingExample").tags("@debug").relativeTo(getClass());
	}

	@Karate.Test
	Karate testMyJsonExpressions() {
		return Karate.run("MyJsonExpressions").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate testJavascriptExamples() {
		return Karate.run("javascriptExamples").relativeTo(getClass());
	}

	@Karate.Test
	Karate testFullPath() {
		return Karate.run("classpath:karate/tags.feature").tags("@first");
	}

	@Karate.Test
	Karate testSystemProperty() {
		return Karate.run("classpath:karate/tags.feature").tags("@second").karateEnv("e2e").systemProperty("foo",
				"bar");
	}

	@Karate.Test
	Karate testAll() {
		return Karate.run().relativeTo(getClass());
	}

}