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
                ]

        sass:
            compile:
                files:
                    'build/app.css' : 'src/app.scss'

        jade:
            compile:
                options:
                    pretty: yes
                files:
                    "build/index.html" : "src/app.jade"



        clean: ["build/"]



    @loadNpmTasks "grunt-contrib-coffee"
    @loadNpmTasks "grunt-contrib-copy"
    @loadNpmTasks "grunt-contrib-clean"
    @loadNpmTasks "grunt-contrib-sass"
    @loadNpmTasks "grunt-contrib-jade"

    @registerTask "default", ["clean", "copy", "coffee", "sass", "jade"]
