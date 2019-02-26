function remoteFetchClicked() {
    var uri = 'https://api.github.com/users/phongnlu'; 
    fetch(uri, {
        method: 'GET',
        headers: {}
    }).then(function(response) {
        return response.json();
    }).then(function(result) {
        console.log(result);
        document.getElementById('output-remote').innerHTML = JSON.stringify(result, null, 2);
    }).catch(function(error) {
        console.log(error);
        document.getElementById('output-remote').innerHTML = error;
    });
}

function localFetchReadFileClicked() {
    fetch('local://fileManager/read/?param1=123&param2=test', {
        method: 'POST',
        headers: {},
        body: {
            resource: 'dummy.txt'
        }
    }).then(function(result) {
        console.log(result);
        document.getElementById('output-local').innerHTML = atob(result.data);
    }).catch(function(error) {
        console.log(error);
        document.getElementById('output-local').innerHTML = error.data;
    });
}

function localFetchOsInfoClicked() {
    fetch('local://os/info', {
        method: 'GET',
        headers: {},
        body: {}
    }).then(function(result) {
        console.log(result);
        document.getElementById('output-local').innerHTML = result.data;
    }).catch(function(error) {
        console.log(error);
        document.getElementById('output-local').innerHTML = error.data;
    });
}