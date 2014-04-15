module.exports = () ->
    @initConfig
        coffee:
            compile:
                files:
                    "build/app.js" : "src/scripts/*.coffee"
        copy:
            main:
                files: [
                    {cwd: ".",    expand: yes, src: "assets/**",   dest: "build/"}
                    {cwd: "src/", expand: yes, src: "partials/**", dest: "build/"}
                    {cwd: "src/", expand: yes, src: "index.html",  dest: "build/"}
                    {cwd: "src/", expand: yes, src: "app.css",     dest: "build/"}
                ]

        sass:
            compile:
                files:
                    'build/app.css' : 'src/app.scss'



        clean: ["build/"]



    @loadNpmTasks "grunt-contrib-coffee"
    @loadNpmTasks "grunt-contrib-copy"
    @loadNpmTasks "grunt-contrib-clean"
    @loadNpmTasks "grunt-contrib-uglify"
    @loadNpmTasks "grunt-contrib-sass"

    @registerTask "default", ["clean", "copy", "coffee", "sass"]
