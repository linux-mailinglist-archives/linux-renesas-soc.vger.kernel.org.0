Return-Path: <linux-renesas-soc+bounces-1620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA573832A40
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jan 2024 14:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 249631F21B98
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jan 2024 13:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A94B524A8;
	Fri, 19 Jan 2024 13:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g9sPbnPs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2667F524C8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2024 13:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705670468; cv=none; b=McOh7GV0yhQgamva5+pZFWR8YUUu2MKFy7vy6zCkC+S6JiNnXjo/YH4I/ODSWoC9jT9c43jVnljyPjHt96u0YXNN/chlRM+eKb/hrxlDmA0RrtajKL/RV496RBpVonDaQOR/5IFL7iZnU170+85r+akAilZoYjP02mF7M7qP3eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705670468; c=relaxed/simple;
	bh=KdYG7V2H20g69rN0i/Y8z6flRE5A0us4AicD9E+QBJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dVizsDu0qDwZTjtCG4+PXMu3NILiDc6EdbuCMEUGx3zYx3VnVwcQ5LaO5vRNq14aP1LB35p393VwKyBkEHXRUOLJr9AhrYrwxhOxR/qlQTUC1FEPbTb9fSjhN+Rrop/JVHoeKQchMz663BjtpVi7X+1rbN7PNgnjHFQRTKXVd14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g9sPbnPs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705670465; x=1737206465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KdYG7V2H20g69rN0i/Y8z6flRE5A0us4AicD9E+QBJQ=;
  b=g9sPbnPsmv8JFPS+gdWCHAGCpXBZVf0MZeo0Fahoh7rBBNcChxieQGCV
   rHn0YqY9QjxKlraW0wYhNe3UlVhdGdWShbYn5Kdm+tiYTJJlUzEK6xVAt
   89CAUFwUg6BJhemQ20rEuTmjsUU4k7JwY2/QgA+/HYaozlOQ3GnjmnQtu
   riXZQ52IeF2nd78+pVrUHXRBB2oXXPZIBuvR+s7pXOgJJsF+NtRP/B3Aj
   qa0ImEAmwiGRTxYxUNYs8ol2cReK73tGs5JplWe1n5YDV+kJi9ZMXI14s
   gwbD/D19ElABmz+s1rOgIBOKTRqvP99KxnOddnsdf3qI+8s8bXpvUrNik
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="8116324"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="8116324"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 05:21:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="572496"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jan 2024 05:21:02 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQonr-00045U-2G;
	Fri, 19 Jan 2024 13:20:59 +0000
Date: Fri, 19 Jan 2024 21:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Simon Horman <simon.horman@corigine.com>
Subject: [geert-renesas-drivers:topic/renesas-bsp-rebase-v6.1 17/22]
 drivers/net/can/rcar/rcar_canfd.c:1852:59: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202401192114.sNB5eWkI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-bsp-rebase-v6.1
head:   f23d103b0a307c5339994c410f09ac77b374629a
commit: a7e448b5460131be0eab090896030c6259b32375 [17/22] can: rcar_canfd: Add transceiver support
config: powerpc-randconfig-r113-20240119 (https://download.01.org/0day-ci/archive/20240119/202401192114.sNB5eWkI-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240119/202401192114.sNB5eWkI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401192114.sNB5eWkI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/can/rcar/rcar_canfd.c:1852:59: sparse: sparse: Using plain integer as NULL pointer

vim +1852 drivers/net/can/rcar/rcar_canfd.c

  1849	
  1850	static int rcar_canfd_probe(struct platform_device *pdev)
  1851	{
> 1852		struct phy *transceivers[RCANFD_NUM_CHANNELS] = { 0, };
  1853		const struct rcar_canfd_hw_info *info;
  1854		struct device *dev = &pdev->dev;
  1855		void __iomem *addr;
  1856		u32 sts, ch, fcan_freq;
  1857		struct rcar_canfd_global *gpriv;
  1858		struct device_node *of_child;
  1859		unsigned long channels_mask = 0;
  1860		int err, ch_irq, g_irq;
  1861		int g_err_irq, g_recc_irq;
  1862		bool fdmode = true;			/* CAN FD only mode - default */
  1863		char name[9] = "channelX";
  1864		int i;
  1865	
  1866		info = of_device_get_match_data(dev);
  1867	
  1868		if (of_property_read_bool(dev->of_node, "renesas,no-can-fd"))
  1869			fdmode = false;			/* Classical CAN only mode */
  1870	
  1871		for (i = 0; i < info->max_channels; ++i) {
  1872			name[7] = '0' + i;
  1873			of_child = of_get_child_by_name(dev->of_node, name);
  1874			if (of_child && of_device_is_available(of_child)) {
  1875				channels_mask |= BIT(i);
  1876				transceivers[i] = devm_of_phy_optional_get(dev,
  1877								of_child, NULL);
  1878			}
  1879			of_node_put(of_child);
  1880			if (IS_ERR(transceivers[i]))
  1881				return PTR_ERR(transceivers[i]);
  1882		}
  1883	
  1884		if (info->shared_global_irqs) {
  1885			ch_irq = platform_get_irq_byname_optional(pdev, "ch_int");
  1886			if (ch_irq < 0) {
  1887				/* For backward compatibility get irq by index */
  1888				ch_irq = platform_get_irq(pdev, 0);
  1889				if (ch_irq < 0)
  1890					return ch_irq;
  1891			}
  1892	
  1893			g_irq = platform_get_irq_byname_optional(pdev, "g_int");
  1894			if (g_irq < 0) {
  1895				/* For backward compatibility get irq by index */
  1896				g_irq = platform_get_irq(pdev, 1);
  1897				if (g_irq < 0)
  1898					return g_irq;
  1899			}
  1900		} else {
  1901			g_err_irq = platform_get_irq_byname(pdev, "g_err");
  1902			if (g_err_irq < 0)
  1903				return g_err_irq;
  1904	
  1905			g_recc_irq = platform_get_irq_byname(pdev, "g_recc");
  1906			if (g_recc_irq < 0)
  1907				return g_recc_irq;
  1908		}
  1909	
  1910		/* Global controller context */
  1911		gpriv = devm_kzalloc(dev, sizeof(*gpriv), GFP_KERNEL);
  1912		if (!gpriv)
  1913			return -ENOMEM;
  1914	
  1915		gpriv->pdev = pdev;
  1916		gpriv->channels_mask = channels_mask;
  1917		gpriv->fdmode = fdmode;
  1918		gpriv->info = info;
  1919	
  1920		gpriv->rstc1 = devm_reset_control_get_optional_exclusive(dev, "rstp_n");
  1921		if (IS_ERR(gpriv->rstc1))
  1922			return dev_err_probe(dev, PTR_ERR(gpriv->rstc1),
  1923					     "failed to get rstp_n\n");
  1924	
  1925		gpriv->rstc2 = devm_reset_control_get_optional_exclusive(dev, "rstc_n");
  1926		if (IS_ERR(gpriv->rstc2))
  1927			return dev_err_probe(dev, PTR_ERR(gpriv->rstc2),
  1928					     "failed to get rstc_n\n");
  1929	
  1930		/* Peripheral clock */
  1931		gpriv->clkp = devm_clk_get(dev, "fck");
  1932		if (IS_ERR(gpriv->clkp))
  1933			return dev_err_probe(dev, PTR_ERR(gpriv->clkp),
  1934					     "cannot get peripheral clock\n");
  1935	
  1936		/* fCAN clock: Pick External clock. If not available fallback to
  1937		 * CANFD clock
  1938		 */
  1939		gpriv->can_clk = devm_clk_get(dev, "can_clk");
  1940		if (IS_ERR(gpriv->can_clk) || (clk_get_rate(gpriv->can_clk) == 0)) {
  1941			gpriv->can_clk = devm_clk_get(dev, "canfd");
  1942			if (IS_ERR(gpriv->can_clk))
  1943				return dev_err_probe(dev, PTR_ERR(gpriv->can_clk),
  1944						     "cannot get canfd clock\n");
  1945	
  1946			gpriv->fcan = RCANFD_CANFDCLK;
  1947	
  1948		} else {
  1949			gpriv->fcan = RCANFD_EXTCLK;
  1950		}
  1951		fcan_freq = clk_get_rate(gpriv->can_clk);
  1952	
  1953		if (gpriv->fcan == RCANFD_CANFDCLK)
  1954			/* CANFD clock is further divided by (1/2) within the IP */
  1955			fcan_freq /= info->postdiv;
  1956	
  1957		addr = devm_platform_ioremap_resource(pdev, 0);
  1958		if (IS_ERR(addr)) {
  1959			err = PTR_ERR(addr);
  1960			goto fail_dev;
  1961		}
  1962		gpriv->base = addr;
  1963	
  1964		/* Request IRQ that's common for both channels */
  1965		if (info->shared_global_irqs) {
  1966			err = devm_request_irq(dev, ch_irq,
  1967					       rcar_canfd_channel_interrupt, 0,
  1968					       "canfd.ch_int", gpriv);
  1969			if (err) {
  1970				dev_err(dev, "devm_request_irq(%d) failed, error %d\n",
  1971					ch_irq, err);
  1972				goto fail_dev;
  1973			}
  1974	
  1975			err = devm_request_irq(dev, g_irq, rcar_canfd_global_interrupt,
  1976					       0, "canfd.g_int", gpriv);
  1977			if (err) {
  1978				dev_err(dev, "devm_request_irq(%d) failed, error %d\n",
  1979					g_irq, err);
  1980				goto fail_dev;
  1981			}
  1982		} else {
  1983			err = devm_request_irq(dev, g_recc_irq,
  1984					       rcar_canfd_global_receive_fifo_interrupt, 0,
  1985					       "canfd.g_recc", gpriv);
  1986	
  1987			if (err) {
  1988				dev_err(dev, "devm_request_irq(%d) failed, error %d\n",
  1989					g_recc_irq, err);
  1990				goto fail_dev;
  1991			}
  1992	
  1993			err = devm_request_irq(dev, g_err_irq,
  1994					       rcar_canfd_global_err_interrupt, 0,
  1995					       "canfd.g_err", gpriv);
  1996			if (err) {
  1997				dev_err(dev, "devm_request_irq(%d) failed, error %d\n",
  1998					g_err_irq, err);
  1999				goto fail_dev;
  2000			}
  2001		}
  2002	
  2003		err = reset_control_reset(gpriv->rstc1);
  2004		if (err)
  2005			goto fail_dev;
  2006		err = reset_control_reset(gpriv->rstc2);
  2007		if (err) {
  2008			reset_control_assert(gpriv->rstc1);
  2009			goto fail_dev;
  2010		}
  2011	
  2012		/* Enable peripheral clock for register access */
  2013		err = clk_prepare_enable(gpriv->clkp);
  2014		if (err) {
  2015			dev_err(dev, "failed to enable peripheral clock, error %d\n",
  2016				err);
  2017			goto fail_reset;
  2018		}
  2019	
  2020		err = rcar_canfd_reset_controller(gpriv);
  2021		if (err) {
  2022			dev_err(dev, "reset controller failed\n");
  2023			goto fail_clk;
  2024		}
  2025	
  2026		/* Controller in Global reset & Channel reset mode */
  2027		rcar_canfd_configure_controller(gpriv);
  2028	
  2029		/* Configure per channel attributes */
  2030		for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels) {
  2031			/* Configure Channel's Rx fifo */
  2032			rcar_canfd_configure_rx(gpriv, ch);
  2033	
  2034			/* Configure Channel's Tx (Common) fifo */
  2035			rcar_canfd_configure_tx(gpriv, ch);
  2036	
  2037			/* Configure receive rules */
  2038			rcar_canfd_configure_afl_rules(gpriv, ch);
  2039		}
  2040	
  2041		/* Configure common interrupts */
  2042		rcar_canfd_enable_global_interrupts(gpriv);
  2043	
  2044		/* Start Global operation mode */
  2045		rcar_canfd_update_bit(gpriv->base, RCANFD_GCTR, RCANFD_GCTR_GMDC_MASK,
  2046				      RCANFD_GCTR_GMDC_GOPM);
  2047	
  2048		/* Verify mode change */
  2049		err = readl_poll_timeout((gpriv->base + RCANFD_GSTS), sts,
  2050					 !(sts & RCANFD_GSTS_GNOPM), 2, 500000);
  2051		if (err) {
  2052			dev_err(dev, "global operational mode failed\n");
  2053			goto fail_mode;
  2054		}
  2055	
  2056		for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels) {
  2057			err = rcar_canfd_channel_probe(gpriv, ch, fcan_freq,
  2058						       transceivers[ch]);
  2059			if (err)
  2060				goto fail_channel;
  2061		}
  2062	
  2063		platform_set_drvdata(pdev, gpriv);
  2064		dev_info(dev, "global operational state (clk %d, fdmode %d)\n",
  2065			 gpriv->fcan, gpriv->fdmode);
  2066		return 0;
  2067	
  2068	fail_channel:
  2069		for_each_set_bit(ch, &gpriv->channels_mask, info->max_channels)
  2070			rcar_canfd_channel_remove(gpriv, ch);
  2071	fail_mode:
  2072		rcar_canfd_disable_global_interrupts(gpriv);
  2073	fail_clk:
  2074		clk_disable_unprepare(gpriv->clkp);
  2075	fail_reset:
  2076		reset_control_assert(gpriv->rstc1);
  2077		reset_control_assert(gpriv->rstc2);
  2078	fail_dev:
  2079		return err;
  2080	}
  2081	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

