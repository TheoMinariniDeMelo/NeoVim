local java = require("java")

java.setup({
	jdk_version = 17, -- Define a versão do JDK (ajuste conforme necessário)
	root_markers = {
		'settings.gradle',
		'settings.gradle.kts',
		'pom.xml',
		'build.gradle',
		'mvnw',
		'gradlew',
		'build.gradle',
		'build.gradle.kts',
		'.git',
	},
})

