function fn() {

    var config = {
        name: "test123",
        baseURL: 'https://reqres.in/api'
    }

    var env = karate.env
    // karate.log('Env is : ',env )

    if (!env) {
        config.baseURL = 'https://reqres.in/api'
    }
    if (env == 'qa') {
        config.baseURL = 'https://reqres.in/api/qa'
    } else if (env == 'dev') {
        config.baseURL = 'https://reqres.in/api/dev'
    } else {
        config.baseURL = 'https://reqres.in/api'
    }

    karate.configure('connectTimeout', 50000);
    karate.configure('readTimeout', 50000);
    karate.configure('logPrettyRequest', true);
    karate.configure('logPrettyResponse', true);
    karate.configure('retry', {count: 3, interval: 9000});

    return config;
}