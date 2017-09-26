/**
 * This file is a part of Angry IP Scanner source code,
 * see http://www.angryip.org/ for more information.
 * Licensed under GPLv2.
 */

package net.azib.ipscan.fetchers;

import net.azib.ipscan.config.ScannerConfig;

import javax.inject.Inject;

/**
 * HTTPProxyFetcher - detects HTTP proxy on port 3128 (or other requested port)
 *
 * @author Anton Keks
 */
public class HTTPProxyFetcher extends PortTextFetcher {

	@Inject public HTTPProxyFetcher(ScannerConfig scannerConfig) {
		super(scannerConfig, 3128, "HEAD http://www.google.com HTTP/1.0\r\n\r\n", "Location: (https?.*)$");
	}
	
	public String getId() {
		return "fetcher.httpProxy";
	}

}
