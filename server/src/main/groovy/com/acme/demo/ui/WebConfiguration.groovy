package com.acme.demo.ui

import groovy.util.logging.Slf4j
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Configuration
import org.springframework.core.env.Environment
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter

/**
 * Web configuration
 */
@Configuration
@Slf4j
class WebConfiguration extends WebMvcConfigurerAdapter {

    @Autowired
    Environment environment

    /**
     * Its useful in a when developing locally to be able to make changes to js, css
     * etc and have it be reflected immediately.  This allows for that when the local-dev profile
     * is active.  This is done by loading the resources directly off the file system.
     *
     * Note for this to be effective you must run 'gulp watch' command from inside the acme-ui/client
     * directory. This will compile changes to less, coffee etc. when a change is detected.
     *
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        boolean devMode = this.environment.acceptsProfiles("local-dev")
        log.debug("Active Runtime Profiles are: {}",
                environment.getActiveProfiles().toString())
        String[] locations = null
        Integer cachePeriod = null
        if(devMode){
            String workDirectory = this.environment.getProperty("app.workdir")
            if(!workDirectory){
                throw new RuntimeException("app.workdir property must be set on the environment")
            }
            locations = new String[3]
            locations[0] = "file:///${workDirectory}/client/.tmp/".toString()
            locations[1] = "file:///${workDirectory}/client/src/".toString()
            locations[2] = "file:///${workDirectory}/client/".toString()
            cachePeriod = 0
        }
        else {
            locations = new String[1]
            locations[0] = 'classpath:static/'
        }
        boolean useResourceCache = !devMode

        registry.addResourceHandler("/**")
                .addResourceLocations(locations)
                .setCachePeriod(cachePeriod)
                .resourceChain(useResourceCache)
    }
}
