module.exports = function (grunt)
{
    
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-haxe');
    grunt.loadNpmTasks('grunt-notify');
    grunt.loadNpmTasks('grunt-concurrent');    
    grunt.loadNpmTasks('grunt-sass');
    grunt.loadNpmTasks('grunt-shell');

    grunt.initConfig(
    {
        shell:
        {
            launch:
            {
                options:
                {
                    stderr: false,
                    
                    execOptions:
                    {
                        cwd: 'tools/node-webkit/'
                    }
                },
                command: 'nw.exe ..\\..\\bin'
            }
        },

    	copy:
        {
            main:
            {
                files: [{
                            cwd: 'assets/',
                            expand: true,
                            src: ['**'],
                            dest: 'bin'
                        }]
            }
        },

        haxe:
        {
            main:
            {
                hxml: 'build.hxml'
            }
        },

        sass:
        {
            options:
            {
                compass: true
            },      

            dist:
            {
                files:
                {
                    'bin/styles/app.css' : 'assets/styles/app.scss'
                }
            }
        },

        watch:
        {
            scss:
            {
                files: '**/*.scss',
                tasks: ['sass', 'notify:scss']
            },

            haxe:
            {
                files: '**/*.hx',
                tasks: ['haxe:main', 'notify:haxe']
            },

            html:
            {
                files: '**/*.html',
                tasks: ['copy', 'notify:haxe']
            }
        },

        notify:
        {
            haxe:
            {
                options:
                {
                    title: 'Haxe',
                    message: 'Compiled!'
                }
            },

            scss:
            {
                options:
                {
                    title: 'SCSS',
                    message: 'Compiled!'
                }
            },
        },

        concurrent:
        {
            options:
            {
               logConcurrentOutput: true
            },
            watch_n_connect:
            {
                tasks: [ "watch:haxe", "watch:scss", "watch:html", "shell:launch" ]
            }
        },

    });


    grunt.registerTask('default', ['copy', 'haxe:main', 'sass', 'concurrent:watch_n_connect']);
}