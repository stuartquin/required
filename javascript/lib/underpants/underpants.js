HTTP_ACCEPT_CHARSET  = '';
HTTP_ACCEPT          = '';
HTTP_ACCEPT_ENCODING = '';
HTTP_ACCEPT_LANGUAGE = '';

var Underpants = (function (w) {

    var nav = w.navigator,
        scr = w.screen,
        underpants  = {
            screenSize: scr.width + 'x' + scr.height + 'x' + scr.colorDepth,
            devicePixelRatio: w.devicePixelRatio || 1,
            timezone: new Date().getTimezoneOffset(),
            mimeTypes: [],
            plugins: [],
            httpAcceptHeaders: HTTP_ACCEPT + ';' + HTTP_ACCEPT_ENCODING + ';' + HTTP_ACCEPT_LANGUAGE + ';' + HTTP_ACCEPT_CHARSET,
            fonts: ''
        },
        navParms = [
            'appCodeName',
            'appName',
            'appVersion',
            'cookieEnabled',
            'language',
            'platform',
            'product',
            'productSub',
            'userAgent',
            'vendor',
            'vendorSub'
        ],
        fingerprint = '',
        flashTimeout,
        flashFailed;

    function init () {
        var i, l;

        // Get the Navigator params
        for ( i = 0, l = navParms.length; i < l; i++ ) {
            underpants[navParms[i]] = navParms[i] in nav ? nav[navParms[i]] : '';
        }

        // Get the mime types
        if ( 'mimeTypes' in nav ) {
            for ( i = 0, l = nav.mimeTypes.length; i < l; i++ ) {
                underpants.mimeTypes.push( nav.mimeTypes[i].description + ',' + nav.mimeTypes[i].suffixes + ',' + nav.mimeTypes[i].type );
            }

            underpants.mimeTypes = underpants.mimeTypes.join(',');
        }

        // Get the plugins
        if ( 'plugins' in nav ) {
            for ( i = 0, l = nav.plugins.length; i < l; i++ ) {
                underpants.plugins.push( nav.plugins[i].description + ',' + nav.plugins[i].filename + ',' + nav.plugins[i].name );
            }
        }

        swfobject.embedSWF("swf/FontList.swf", "flwobj", "1", "1", "9.0.0", null, null, null, null, flashCallback);

        // Get an intital reading before flash callback, may be useful
        ready();
    }

    function flashCallback (result) {
        if ( !result.success ) {
            flashFailed = true;
            ready();
            return;
        }

        flashTimeout = setTimeout(function () {
            flashFailed = true;
            ready();
        }, 5000);
    }

    function addFonts (fonts) {
        clearTimeout(flashTimeout);

        if ( flashFailed ) return;

        underpants.fonts = fonts.join(',');
        ready();
    }

    function makeFingerprint () {
        var i,
            out = [];

        for ( i in underpants ) {
            out.push(underpants[i]);
        }

        return out.join(';');
    }

    function getFingerprint(){
        return fingerprint;
    }

    function ready () {
        fingerprint = Crypto.SHA1(makeFingerprint());
    }

    function ajax (url, parms) {
        var req = new XMLHttpRequest(),
            post = parms.post || null,
            callback = parms.callback || null,
            timeout = parms.timeout || null;

        req.onreadystatechange = function () {
            if ( req.readyState != 4 ) return;

            // Error
            if ( req.status != 200 && req.status != 304 ) {
                if ( callback ) callback(false);
                return;
            }

            if ( callback ) callback(req.responseText);
        };

        if ( post ) {
            req.open("POST", url, true);
            req.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
            req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        } else {
            req.open('GET', url, true);
        }

        req.send(post);

        if ( timeout ) {
            setTimeout(function () {
                req.onreadystatechange = function () {};
                req.abort();
                if ( callback ) callback(false);
            }, timeout);
        }
    }

    init();

    return {
        addFonts: addFonts,
        getFingerprint: function(){
            return fingerprint;
        }
    };
})(this);

function fontList (fonts) {
    underpants.addFonts(fonts);
}
