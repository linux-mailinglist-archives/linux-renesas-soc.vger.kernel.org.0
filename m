Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1843598A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Apr 2021 11:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbhDIJHf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Apr 2021 05:07:35 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:52148 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232563AbhDIJH1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 05:07:27 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13990FaW040963;
        Fri, 9 Apr 2021 09:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=u0EY3hRIKtOKXv3rqIDXNAOdlXl3zOlEoMaBIkAKx5M=;
 b=x1NRlcv7WxGpL7iySPDA+pR3YKPhm191gAP0YKMliOWqmDoNM5GchcQuJCf53LZQACBh
 bmheBjr6oV0xFA7jClDP7qEFsXE9uQOdbn4K0xR6wyiUt1k1Ixhzya8QRbaPBDELspaf
 sL3NxbsXfFCZhgVDtzKIHJ58aaj0NGE3u19sAsRLSDWrTi1kX0/xWtB/+S7KYlEpR+UG
 9Vr+F6DJJZXe+QMswUchZJ+XxDak6zhdyktP0Bzg1UeRrtuaEL7VC3tSnjjYIVYlqfMD
 N1zPnWoDN56/EDKSNVmm1rIbHNqnGb4cc6Ujjm3fVHkeB4ejLa6/YkbD8BdjlCYLJSDz Xg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 37rvaggru8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Apr 2021 09:06:41 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139965Ou174837;
        Fri, 9 Apr 2021 09:06:40 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 37rvbgswb4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Apr 2021 09:06:40 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13996aPo027802;
        Fri, 9 Apr 2021 09:06:36 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 09 Apr 2021 02:06:35 -0700
Date:   Fri, 9 Apr 2021 12:06:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Michael Walle <michael@walle.cc>,
        ath9k-devel@qca.qualcomm.com, UNGLinuxDriver@microchip.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org
Subject: [kbuild] Re: [PATCH net-next v2 1/2] of: net: pass the dst buffer to
 of_get_mac_address()
Message-ID: <20210409090626.GG6048@kadam>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Y/WcH0a6A93yCHGr"
Content-Disposition: inline
In-Reply-To: <20210406153725.10059-2-michael@walle.cc>
Message-ID-Hash: JXGQX5NVDSB5JZS7F7ZJAPN2XIVFRPMQ
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9948 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090067
X-Proofpoint-GUID: jSxPEZHQzxi67c6a1-NKQYDuQBG7yVXV
X-Proofpoint-ORIG-GUID: jSxPEZHQzxi67c6a1-NKQYDuQBG7yVXV
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9948 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1011 bulkscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090066
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Y/WcH0a6A93yCHGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Michael-Walle/of-net-support-non-platform-devices-in-of_get_mac_address/20210406-234030 
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git  cc0626c2aaed8e475efdd85fa374b497a7192e35
config: x86_64-randconfig-m001-20210406 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2069 axienet_probe() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +2069 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

2be586205ca2b8 Srikanth Thokala    2015-05-05  1832  static int axienet_probe(struct platform_device *pdev)
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1833  {
8495659bf93c8e Srikanth Thokala    2015-05-05  1834  	int ret;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1835  	struct device_node *np;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1836  	struct axienet_local *lp;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1837  	struct net_device *ndev;
28ef9ebdb64c6f Robert Hancock      2019-06-06  1838  	struct resource *ethres;
411b125c6ace1f Michael Walle       2021-04-06  1839  	u8 mac_addr[ETH_ALEN];
                                                        ^^^^^^^^^^^^^^^^^^^^^^

5fff0151b3244d Andre Przywara      2020-03-24  1840  	int addr_width = 32;
8495659bf93c8e Srikanth Thokala    2015-05-05  1841  	u32 value;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1842  
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1843  	ndev = alloc_etherdev(sizeof(*lp));
41de8d4cff21a2 Joe Perches         2012-01-29  1844  	if (!ndev)
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1845  		return -ENOMEM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1846  
95219aa538e11d Srikanth Thokala    2015-05-05  1847  	platform_set_drvdata(pdev, ndev);
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1848  
95219aa538e11d Srikanth Thokala    2015-05-05  1849  	SET_NETDEV_DEV(ndev, &pdev->dev);
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1850  	ndev->flags &= ~IFF_MULTICAST;  /* clear multicast */
28e24c62ab3062 Eric Dumazet        2013-12-02  1851  	ndev->features = NETIF_F_SG;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1852  	ndev->netdev_ops = &axienet_netdev_ops;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1853  	ndev->ethtool_ops = &axienet_ethtool_ops;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1854  
d894be57ca92c8 Jarod Wilson        2016-10-20  1855  	/* MTU range: 64 - 9000 */
d894be57ca92c8 Jarod Wilson        2016-10-20  1856  	ndev->min_mtu = 64;
d894be57ca92c8 Jarod Wilson        2016-10-20  1857  	ndev->max_mtu = XAE_JUMBO_MTU;
d894be57ca92c8 Jarod Wilson        2016-10-20  1858  
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1859  	lp = netdev_priv(ndev);
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1860  	lp->ndev = ndev;
95219aa538e11d Srikanth Thokala    2015-05-05  1861  	lp->dev = &pdev->dev;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1862  	lp->options = XAE_OPTION_DEFAULTS;
8b09ca823ffb4e Robert Hancock      2019-06-06  1863  	lp->rx_bd_num = RX_BD_NUM_DEFAULT;
8b09ca823ffb4e Robert Hancock      2019-06-06  1864  	lp->tx_bd_num = TX_BD_NUM_DEFAULT;
57baf8cc70ea4c Robert Hancock      2021-02-12  1865  
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1866  	lp->axi_clk = devm_clk_get_optional(&pdev->dev, "s_axi_lite_clk");
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1867  	if (!lp->axi_clk) {
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1868  		/* For backward compatibility, if named AXI clock is not present,
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1869  		 * treat the first clock specified as the AXI clock.
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1870  		 */
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1871  		lp->axi_clk = devm_clk_get_optional(&pdev->dev, NULL);
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1872  	}
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1873  	if (IS_ERR(lp->axi_clk)) {
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1874  		ret = PTR_ERR(lp->axi_clk);
57baf8cc70ea4c Robert Hancock      2021-02-12  1875  		goto free_netdev;
57baf8cc70ea4c Robert Hancock      2021-02-12  1876  	}
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1877  	ret = clk_prepare_enable(lp->axi_clk);
57baf8cc70ea4c Robert Hancock      2021-02-12  1878  	if (ret) {
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1879  		dev_err(&pdev->dev, "Unable to enable AXI clock: %d\n", ret);
57baf8cc70ea4c Robert Hancock      2021-02-12  1880  		goto free_netdev;
57baf8cc70ea4c Robert Hancock      2021-02-12  1881  	}
57baf8cc70ea4c Robert Hancock      2021-02-12  1882  
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1883  	lp->misc_clks[0].id = "axis_clk";
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1884  	lp->misc_clks[1].id = "ref_clk";
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1885  	lp->misc_clks[2].id = "mgt_clk";
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1886  
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1887  	ret = devm_clk_bulk_get_optional(&pdev->dev, XAE_NUM_MISC_CLOCKS, lp->misc_clks);
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1888  	if (ret)
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1889  		goto cleanup_clk;
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1890  
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1891  	ret = clk_bulk_prepare_enable(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1892  	if (ret)
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1893  		goto cleanup_clk;
b11bfb9a19f9d7 Robert Hancock      2021-03-25  1894  
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1895  	/* Map device registers */
46aa27df885321 Srikanth Thokala    2015-05-05  1896  	ethres = platform_get_resource(pdev, IORESOURCE_MEM, 0);
46aa27df885321 Srikanth Thokala    2015-05-05  1897  	lp->regs = devm_ioremap_resource(&pdev->dev, ethres);
fcc028c106e575 Krzysztof Kozlowski 2015-07-09  1898  	if (IS_ERR(lp->regs)) {
fcc028c106e575 Krzysztof Kozlowski 2015-07-09  1899  		ret = PTR_ERR(lp->regs);
59cd4f19267a0a Robert Hancock      2021-03-11  1900  		goto cleanup_clk;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1901  	}
7fa0043d5c74c6 Robert Hancock      2019-06-11  1902  	lp->regs_start = ethres->start;
46aa27df885321 Srikanth Thokala    2015-05-05  1903  
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1904  	/* Setup checksum offload, but default to off if not specified */
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1905  	lp->features = 0;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1906  
8495659bf93c8e Srikanth Thokala    2015-05-05  1907  	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,txcsum", &value);
8495659bf93c8e Srikanth Thokala    2015-05-05  1908  	if (!ret) {
8495659bf93c8e Srikanth Thokala    2015-05-05  1909  		switch (value) {
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1910  		case 1:
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1911  			lp->csum_offload_on_tx_path =
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1912  				XAE_FEATURE_PARTIAL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1913  			lp->features |= XAE_FEATURE_PARTIAL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1914  			/* Can checksum TCP/UDP over IPv4. */
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1915  			ndev->features |= NETIF_F_IP_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1916  			break;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1917  		case 2:
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1918  			lp->csum_offload_on_tx_path =
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1919  				XAE_FEATURE_FULL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1920  			lp->features |= XAE_FEATURE_FULL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1921  			/* Can checksum TCP/UDP over IPv4. */
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1922  			ndev->features |= NETIF_F_IP_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1923  			break;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1924  		default:
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1925  			lp->csum_offload_on_tx_path = XAE_NO_CSUM_OFFLOAD;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1926  		}
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1927  	}
8495659bf93c8e Srikanth Thokala    2015-05-05  1928  	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,rxcsum", &value);
8495659bf93c8e Srikanth Thokala    2015-05-05  1929  	if (!ret) {
8495659bf93c8e Srikanth Thokala    2015-05-05  1930  		switch (value) {
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1931  		case 1:
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1932  			lp->csum_offload_on_rx_path =
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1933  				XAE_FEATURE_PARTIAL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1934  			lp->features |= XAE_FEATURE_PARTIAL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1935  			break;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1936  		case 2:
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1937  			lp->csum_offload_on_rx_path =
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1938  				XAE_FEATURE_FULL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1939  			lp->features |= XAE_FEATURE_FULL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1940  			break;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1941  		default:
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1942  			lp->csum_offload_on_rx_path = XAE_NO_CSUM_OFFLOAD;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1943  		}
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1944  	}
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1945  	/* For supporting jumbo frames, the Axi Ethernet hardware must have
f080a8c35d8932 Srikanth Thokala    2015-05-05  1946  	 * a larger Rx/Tx Memory. Typically, the size must be large so that
f080a8c35d8932 Srikanth Thokala    2015-05-05  1947  	 * we can enable jumbo option and start supporting jumbo frames.
f080a8c35d8932 Srikanth Thokala    2015-05-05  1948  	 * Here we check for memory allocated for Rx/Tx in the hardware from
f080a8c35d8932 Srikanth Thokala    2015-05-05  1949  	 * the device-tree and accordingly set flags.
f080a8c35d8932 Srikanth Thokala    2015-05-05  1950  	 */
8495659bf93c8e Srikanth Thokala    2015-05-05  1951  	of_property_read_u32(pdev->dev.of_node, "xlnx,rxmem", &lp->rxmem);
ee06b1728b9564 Alvaro G. M         2017-07-17  1952  
6c8f06bb2e5147 Robert Hancock      2021-02-12  1953  	lp->switch_x_sgmii = of_property_read_bool(pdev->dev.of_node,
6c8f06bb2e5147 Robert Hancock      2021-02-12  1954  						   "xlnx,switch-x-sgmii");
6c8f06bb2e5147 Robert Hancock      2021-02-12  1955  
ee06b1728b9564 Alvaro G. M         2017-07-17  1956  	/* Start with the proprietary, and broken phy_type */
ee06b1728b9564 Alvaro G. M         2017-07-17  1957  	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,phy-type", &value);
ee06b1728b9564 Alvaro G. M         2017-07-17  1958  	if (!ret) {
ee06b1728b9564 Alvaro G. M         2017-07-17  1959  		netdev_warn(ndev, "Please upgrade your device tree binary blob to use phy-mode");
ee06b1728b9564 Alvaro G. M         2017-07-17  1960  		switch (value) {
ee06b1728b9564 Alvaro G. M         2017-07-17  1961  		case XAE_PHY_TYPE_MII:
ee06b1728b9564 Alvaro G. M         2017-07-17  1962  			lp->phy_mode = PHY_INTERFACE_MODE_MII;
ee06b1728b9564 Alvaro G. M         2017-07-17  1963  			break;
ee06b1728b9564 Alvaro G. M         2017-07-17  1964  		case XAE_PHY_TYPE_GMII:
ee06b1728b9564 Alvaro G. M         2017-07-17  1965  			lp->phy_mode = PHY_INTERFACE_MODE_GMII;
ee06b1728b9564 Alvaro G. M         2017-07-17  1966  			break;
ee06b1728b9564 Alvaro G. M         2017-07-17  1967  		case XAE_PHY_TYPE_RGMII_2_0:
ee06b1728b9564 Alvaro G. M         2017-07-17  1968  			lp->phy_mode = PHY_INTERFACE_MODE_RGMII_ID;
ee06b1728b9564 Alvaro G. M         2017-07-17  1969  			break;
ee06b1728b9564 Alvaro G. M         2017-07-17  1970  		case XAE_PHY_TYPE_SGMII:
ee06b1728b9564 Alvaro G. M         2017-07-17  1971  			lp->phy_mode = PHY_INTERFACE_MODE_SGMII;
ee06b1728b9564 Alvaro G. M         2017-07-17  1972  			break;
ee06b1728b9564 Alvaro G. M         2017-07-17  1973  		case XAE_PHY_TYPE_1000BASE_X:
ee06b1728b9564 Alvaro G. M         2017-07-17  1974  			lp->phy_mode = PHY_INTERFACE_MODE_1000BASEX;
ee06b1728b9564 Alvaro G. M         2017-07-17  1975  			break;
ee06b1728b9564 Alvaro G. M         2017-07-17  1976  		default:
ee06b1728b9564 Alvaro G. M         2017-07-17  1977  			ret = -EINVAL;
59cd4f19267a0a Robert Hancock      2021-03-11  1978  			goto cleanup_clk;
ee06b1728b9564 Alvaro G. M         2017-07-17  1979  		}
ee06b1728b9564 Alvaro G. M         2017-07-17  1980  	} else {
0c65b2b90d13c1 Andrew Lunn         2019-11-04  1981  		ret = of_get_phy_mode(pdev->dev.of_node, &lp->phy_mode);
0c65b2b90d13c1 Andrew Lunn         2019-11-04  1982  		if (ret)
59cd4f19267a0a Robert Hancock      2021-03-11  1983  			goto cleanup_clk;
ee06b1728b9564 Alvaro G. M         2017-07-17  1984  	}
6c8f06bb2e5147 Robert Hancock      2021-02-12  1985  	if (lp->switch_x_sgmii && lp->phy_mode != PHY_INTERFACE_MODE_SGMII &&
6c8f06bb2e5147 Robert Hancock      2021-02-12  1986  	    lp->phy_mode != PHY_INTERFACE_MODE_1000BASEX) {
6c8f06bb2e5147 Robert Hancock      2021-02-12  1987  		dev_err(&pdev->dev, "xlnx,switch-x-sgmii only supported with SGMII or 1000BaseX\n");
6c8f06bb2e5147 Robert Hancock      2021-02-12  1988  		ret = -EINVAL;
59cd4f19267a0a Robert Hancock      2021-03-11  1989  		goto cleanup_clk;
6c8f06bb2e5147 Robert Hancock      2021-02-12  1990  	}
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1991  
8a3b7a252dca9f Daniel Borkmann     2012-01-19  1992  	/* Find the DMA node, map the DMA registers, and decode the DMA IRQs */
95219aa538e11d Srikanth Thokala    2015-05-05  1993  	np = of_parse_phandle(pdev->dev.of_node, "axistream-connected", 0);
28ef9ebdb64c6f Robert Hancock      2019-06-06  1994  	if (np) {
28ef9ebdb64c6f Robert Hancock      2019-06-06  1995  		struct resource dmares;
28ef9ebdb64c6f Robert Hancock      2019-06-06  1996  
46aa27df885321 Srikanth Thokala    2015-05-05  1997  		ret = of_address_to_resource(np, 0, &dmares);
46aa27df885321 Srikanth Thokala    2015-05-05  1998  		if (ret) {
28ef9ebdb64c6f Robert Hancock      2019-06-06  1999  			dev_err(&pdev->dev,
28ef9ebdb64c6f Robert Hancock      2019-06-06  2000  				"unable to get DMA resource\n");
fa3a419d2f674b Wen Yang            2019-03-22  2001  			of_node_put(np);
59cd4f19267a0a Robert Hancock      2021-03-11  2002  			goto cleanup_clk;
46aa27df885321 Srikanth Thokala    2015-05-05  2003  		}
28ef9ebdb64c6f Robert Hancock      2019-06-06  2004  		lp->dma_regs = devm_ioremap_resource(&pdev->dev,
28ef9ebdb64c6f Robert Hancock      2019-06-06  2005  						     &dmares);
28ef9ebdb64c6f Robert Hancock      2019-06-06  2006  		lp->rx_irq = irq_of_parse_and_map(np, 1);
28ef9ebdb64c6f Robert Hancock      2019-06-06  2007  		lp->tx_irq = irq_of_parse_and_map(np, 0);
28ef9ebdb64c6f Robert Hancock      2019-06-06  2008  		of_node_put(np);
d6349e3e14c7f7 Andre Przywara      2020-03-24  2009  		lp->eth_irq = platform_get_irq_optional(pdev, 0);
28ef9ebdb64c6f Robert Hancock      2019-06-06  2010  	} else {
28ef9ebdb64c6f Robert Hancock      2019-06-06  2011  		/* Check for these resources directly on the Ethernet node. */
28ef9ebdb64c6f Robert Hancock      2019-06-06  2012  		struct resource *res = platform_get_resource(pdev,
28ef9ebdb64c6f Robert Hancock      2019-06-06  2013  							     IORESOURCE_MEM, 1);
28ef9ebdb64c6f Robert Hancock      2019-06-06  2014  		lp->dma_regs = devm_ioremap_resource(&pdev->dev, res);
28ef9ebdb64c6f Robert Hancock      2019-06-06  2015  		lp->rx_irq = platform_get_irq(pdev, 1);
28ef9ebdb64c6f Robert Hancock      2019-06-06  2016  		lp->tx_irq = platform_get_irq(pdev, 0);
d6349e3e14c7f7 Andre Przywara      2020-03-24  2017  		lp->eth_irq = platform_get_irq_optional(pdev, 2);
28ef9ebdb64c6f Robert Hancock      2019-06-06  2018  	}
fcc028c106e575 Krzysztof Kozlowski 2015-07-09  2019  	if (IS_ERR(lp->dma_regs)) {
46aa27df885321 Srikanth Thokala    2015-05-05  2020  		dev_err(&pdev->dev, "could not map DMA regs\n");
fcc028c106e575 Krzysztof Kozlowski 2015-07-09  2021  		ret = PTR_ERR(lp->dma_regs);
59cd4f19267a0a Robert Hancock      2021-03-11  2022  		goto cleanup_clk;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  2023  	}
cb59c87dbc8be2 Michal Simek        2013-01-10  2024  	if ((lp->rx_irq <= 0) || (lp->tx_irq <= 0)) {
95219aa538e11d Srikanth Thokala    2015-05-05  2025  		dev_err(&pdev->dev, "could not determine irqs\n");
8a3b7a252dca9f Daniel Borkmann     2012-01-19  2026  		ret = -ENOMEM;
59cd4f19267a0a Robert Hancock      2021-03-11  2027  		goto cleanup_clk;
8a3b7a252dca9f Daniel Borkmann     2012-01-19  2028  	}
8a3b7a252dca9f Daniel Borkmann     2012-01-19  2029  
f735c40ed93cca Andre Przywara      2020-03-24  2030  	/* Autodetect the need for 64-bit DMA pointers.
f735c40ed93cca Andre Przywara      2020-03-24  2031  	 * When the IP is configured for a bus width bigger than 32 bits,
f735c40ed93cca Andre Przywara      2020-03-24  2032  	 * writing the MSB registers is mandatory, even if they are all 0.
f735c40ed93cca Andre Przywara      2020-03-24  2033  	 * We can detect this case by writing all 1's to one such register
f735c40ed93cca Andre Przywara      2020-03-24  2034  	 * and see if that sticks: when the IP is configured for 32 bits
f735c40ed93cca Andre Przywara      2020-03-24  2035  	 * only, those registers are RES0.
f735c40ed93cca Andre Przywara      2020-03-24  2036  	 * Those MSB registers were introduced in IP v7.1, which we check first.
f735c40ed93cca Andre Przywara      2020-03-24  2037  	 */
f735c40ed93cca Andre Przywara      2020-03-24  2038  	if ((axienet_ior(lp, XAE_ID_OFFSET) >> 24) >= 0x9) {
f735c40ed93cca Andre Przywara      2020-03-24  2039  		void __iomem *desc = lp->dma_regs + XAXIDMA_TX_CDESC_OFFSET + 4;
f735c40ed93cca Andre Przywara      2020-03-24  2040  
f735c40ed93cca Andre Przywara      2020-03-24  2041  		iowrite32(0x0, desc);
f735c40ed93cca Andre Przywara      2020-03-24  2042  		if (ioread32(desc) == 0) {	/* sanity check */
f735c40ed93cca Andre Przywara      2020-03-24  2043  			iowrite32(0xffffffff, desc);
f735c40ed93cca Andre Przywara      2020-03-24  2044  			if (ioread32(desc) > 0) {
f735c40ed93cca Andre Przywara      2020-03-24  2045  				lp->features |= XAE_FEATURE_DMA_64BIT;
5fff0151b3244d Andre Przywara      2020-03-24  2046  				addr_width = 64;
f735c40ed93cca Andre Przywara      2020-03-24  2047  				dev_info(&pdev->dev,
f735c40ed93cca Andre Przywara      2020-03-24  2048  					 "autodetected 64-bit DMA range\n");
f735c40ed93cca Andre Przywara      2020-03-24  2049  			}
f735c40ed93cca Andre Przywara      2020-03-24  2050  			iowrite32(0x0, desc);
f735c40ed93cca Andre Przywara      2020-03-24  2051  		}
f735c40ed93cca Andre Przywara      2020-03-24  2052  	}
f735c40ed93cca Andre Przywara      2020-03-24  2053  
5fff0151b3244d Andre Przywara      2020-03-24  2054  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(addr_width));
5fff0151b3244d Andre Przywara      2020-03-24  2055  	if (ret) {
5fff0151b3244d Andre Przywara      2020-03-24  2056  		dev_err(&pdev->dev, "No suitable DMA available\n");
59cd4f19267a0a Robert Hancock      2021-03-11  2057  		goto cleanup_clk;
5fff0151b3244d Andre Przywara      2020-03-24  2058  	}
5fff0151b3244d Andre Przywara      2020-03-24  2059  
522856cefaf09d Robert Hancock      2019-06-06  2060  	/* Check for Ethernet core IRQ (optional) */
522856cefaf09d Robert Hancock      2019-06-06  2061  	if (lp->eth_irq <= 0)
522856cefaf09d Robert Hancock      2019-06-06  2062  		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
522856cefaf09d Robert Hancock      2019-06-06  2063  
8a3b7a252dca9f Daniel Borkmann     2012-01-19  2064  	/* Retrieve the MAC address */
411b125c6ace1f Michael Walle       2021-04-06  2065  	ret = of_get_mac_address(pdev->dev.of_node, mac_addr);
411b125c6ace1f Michael Walle       2021-04-06  2066  	if (!ret) {
411b125c6ace1f Michael Walle       2021-04-06  2067  		axienet_set_mac_address(ndev, mac_addr);
411b125c6ace1f Michael Walle       2021-04-06  2068  	} else {
d05a9ed5c3a773 Robert Hancock      2019-06-06 @2069  		dev_warn(&pdev->dev, "could not find MAC address property: %ld\n",
d05a9ed5c3a773 Robert Hancock      2019-06-06  2070  			 PTR_ERR(mac_addr));
                                                                         ^^^^^^^^^^^^^^^^^
mac_addr isn't an error pointer.

411b125c6ace1f Michael Walle       2021-04-06  2071  		axienet_set_mac_address(ndev, NULL);
8a3b7a252dca9f Daniel Borkmann     2012-01-19  2072  	}
8a3b7a252dca9f Daniel Borkmann     2012-01-19  2073  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org 

--Y/WcH0a6A93yCHGr
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
Xn36NOxWpAh9/nOZA5U9Msl7RQcZMsSLngHXz8vilqBekrfj/3AjdaqEAQE9esXUpUZMYfiQ
S1L6Zgg2O1jKcwT40Go4x4zibsXBfLgqMVxbRnW7qXxO1AhtLXS4QpYfw64JLCWHzNHuLJwI
Wcc0Wl3yY14m+s5+TnCkgtWo8Wy/VaUz44apsDCjelYNIVboobpYyOVk6nmKhVw4T91elyB4
Rug0sejwAtvGeu28WDudQmho5WKWBojQ9NFS5O7zzDXNoHUNUU4Xgji0ZhMV80hBhX/6pg09
yrVOqqtxemaSHmmG7CLYvuuwWmm2PETMkI4pn0lupCLvopZZkhlZmzGlabABxryhJAsTom6T
pSDuN0l2enaxpPtVNCrxxeJDuYJbiIYti1LxZ8qebN/RKE1D0ng62T/vzjmdzNGXPcHr69M+
jYia/FpfofWtcSOLvtXqPotEtvlwmvlVoKw0Xgc+oLzh+9SOV1PH2zym69WQNWiUilzSI2ww
ehzgCw6z/j1Zpbjk9f4d/y6KQRG4Khspeu/e0aVwg7CVrkdXl2jzCKTfqaO5C0sqg9STGTzN
ePgaXw4YXXLUtl5PrxHiKTXobdCXO/lWBmi21rWFhsu7ORJhrqhWWrPN1eYldXd4esbTJBpf
kod/Hx5vPx9Mn/ht76zDUdNlzLvWZVld/MoGXIoO948Q1STx6E5rrGJu5W/tkHJpsW1hJwPZ
KrnZdi9Cek4ggkZJapM0pGhP/8mIsk07/oQrDV+4M7VVw68JIimyEi8+edd4ogh+H0/nD2C4
mQ0gxvCvGbzp6BNewchUuL/NFybTe4Y2GGmFOV+yRhIzJ0CwfBqSjdi7KYKdMZOuGjKvBKur
KapWpi6wv94Coqv4B4+JQDrFhvHScySM7/vAW96Eld5VYTzmEF+FXusligYdWrybHmcMQwnS
CAtb/wxbb2d4HvpehR42Rry6mZgZHDxco1PPTB313OCjE/QG3VxCb3uTSy+0k/dLtkvTL7LP
8BolpJ7pT9hLRnEh5UIJJoUjIuv6bUaaiCKBQw5nBtV1oaEz6zyehy9dTcsaBlz0lBLG+3IV
sK9AicHHnGY3HS+DiXSf+j/Y9g7bF/ABAA==

--Y/WcH0a6A93yCHGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

_______________________________________________
kbuild mailing list -- kbuild@lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org

--Y/WcH0a6A93yCHGr--
