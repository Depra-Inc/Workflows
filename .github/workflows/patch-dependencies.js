const fs = require("fs");

const patchDependencies = (scope) => {
    const packageJson = JSON.parse(fs.readFileSync('package.json', 'utf8'))
    packageJson.dependencies = Object.fromEntries(
        Object.entries(packageJson.dependencies).map(([key, value]) => {
            if (key.startsWith("com.depra")) {
                return [["@${scope}/", key].join(""), value];
            } else {
                return [key, value];
            }
        })
    );
    fs.writeFileSync("package.json", JSON.stringify(packageJson, null, 2));
    console.log(JSON.stringify(packageJson.dependencies, null, 2));
};

module.exports = patchDependencies;