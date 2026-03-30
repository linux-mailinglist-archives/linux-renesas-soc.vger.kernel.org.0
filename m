Return-Path: <linux-renesas-soc+bounces-30612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PYSLxHzymlaBwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 00:02:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EC0361B97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 00:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E94330175E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 22:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17933A782B;
	Mon, 30 Mar 2026 22:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3qAk3db"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CC4393DC0;
	Mon, 30 Mar 2026 22:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774908175; cv=none; b=JZkzx7E2f0Kp8Cz4srWrVNM2FSQCh3F7LdtFV9OLQRE6k4w/GLJOhn1UOMoS8pRRUoc7sNN2j3oXH4KBHekqAbdCwpm0gWwL7pxubX3pZLThF9dzS0KHuX3BebnPbPMILOZYZcCHG8qX8jUEpt/+WNTmkNiLTc1xLFZ4Q3ojfdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774908175; c=relaxed/simple;
	bh=0a/qTJ6Z6SLzYReYiecSbgx8In0wkAtWXm6TRVfoSvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fezGdsDI69JneeZMsK8YZm9z9nKonQ2ZcXEBvQTDzbK2/lu9cHJHMNwJlS9/qSd1O1XBE2hyE5CHMNgGnQJ8YP3/67QaeGuz3JDHMg0Y8x8+NNIEIjcJNKmj9m9XQh2OeUK5mgVrG0KNj58MIQF1I1RYRQaAJ13nhVTKEjcBsr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3qAk3db; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774908174; x=1806444174;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0a/qTJ6Z6SLzYReYiecSbgx8In0wkAtWXm6TRVfoSvY=;
  b=T3qAk3dbYN4z5fuR6iBhwXzLg89ylG2cJGCaXhTgi0YLpLnTv7gpEbF0
   nlzVJT27m/QIokrc9spT2MJ7+TSUbaw/fUKgfnInNapvx8vh2fGc4sxId
   wPgf+lKMPpqAS4TSg3f/pfs7N+RCSGl3603XI9gOGBufkrueMz42991cL
   /LrfgVQoMAEbC0aIHMDma18hb7P6ZG4Ov0/GjHtEsSt+Y7rFRDP/Uqk3M
   75+Xo8smwZFGPgkyo8XWxH1wutYaM/OY/1zKqqF60ASutD0geZC7tNMCf
   PZGB6Sj0HZbAj4aGQA7lX6323IzTFuBKHpb+n8LlzN/HqO2U0zIdCvNp2
   w==;
X-CSE-ConnectionGUID: E25wVTJTT2W1uecRbdNsYQ==
X-CSE-MsgGUID: uCucRZF1RJyHdRpSLawXXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86530364"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="86530364"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 15:02:53 -0700
X-CSE-ConnectionGUID: 4F9eCnT+T2S7Jx4SnsHesA==
X-CSE-MsgGUID: Jp+P6fSSR+KZjuQgYb8ZkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="230980195"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Mar 2026 15:02:49 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Kh4-000000001ll-1KrN;
	Mon, 30 Mar 2026 22:02:46 +0000
Date: Tue, 31 Mar 2026 06:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Ke <make24@iscas.ac.cn>, yoshihiro.shimoda.uh@renesas.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	niklas.soderlund+renesas@ragnatech.se, michael.dege@renesas.com,
	nikita.yoush@cogentembedded.com, yury.norov@gmail.com,
	geert+renesas@glider.be
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: renesas: rswitch: Fix memory leak in
 rswitch_phy_device_init()
Message-ID: <202603310514.S572gcNU-lkp@intel.com>
References: <20260330073541.2871414-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330073541.2871414-1-make24@iscas.ac.cn>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30612-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[iscas.ac.cn,renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ragnatech.se,cogentembedded.com,gmail.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 56EC0361B97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main linus/master v7.0-rc6 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Ke/net-renesas-rswitch-Fix-memory-leak-in-rswitch_phy_device_init/20260330-214200
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260330073541.2871414-1-make24%40iscas.ac.cn
patch subject: [PATCH] net: renesas: rswitch: Fix memory leak in rswitch_phy_device_init()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260331/202603310514.S572gcNU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310514.S572gcNU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310514.S572gcNU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/renesas/rswitch_main.c:1480:2: warning: variable 'phydev' is uninitialized when used here [-Wuninitialized]
    1480 |         phydev->mac_managed_pm = true;
         |         ^~~~~~
   drivers/net/ethernet/renesas/rswitch_main.c:1462:27: note: initialize the variable 'phydev' to silence this warning
    1462 |         struct phy_device *phydev, *tmp_phydev;
         |                                  ^
         |                                   = NULL
   1 warning generated.


vim +/phydev +1480 drivers/net/ethernet/renesas/rswitch_main.c

3590918b5d07aa drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2022-10-31  1459  
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1460  static int rswitch_phy_device_init(struct rswitch_device *rdev)
3590918b5d07aa drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2022-10-31  1461  {
142f4caaa41b9c drivers/net/ethernet/renesas/rswitch_main.c Ma Ke             2026-03-30  1462  	struct phy_device *phydev, *tmp_phydev;
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1463  	struct device_node *phy;
0df024d0f1d3e5 drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1464  	int err = -ENOENT;
3590918b5d07aa drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2022-10-31  1465  
b46f1e5793298c drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1466  	if (!rdev->np_port)
3590918b5d07aa drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2022-10-31  1467  		return -ENODEV;
3590918b5d07aa drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2022-10-31  1468  
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1469  	phy = of_parse_phandle(rdev->np_port, "phy-handle", 0);
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1470  	if (!phy)
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1471  		return -ENODEV;
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1472  
0df024d0f1d3e5 drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1473  	/* Set phydev->host_interfaces before calling of_phy_connect() to
0df024d0f1d3e5 drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1474  	 * configure the PHY with the information of host_interfaces.
0df024d0f1d3e5 drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1475  	 */
142f4caaa41b9c drivers/net/ethernet/renesas/rswitch_main.c Ma Ke             2026-03-30  1476  	tmp_phydev = of_phy_find_device(phy);
142f4caaa41b9c drivers/net/ethernet/renesas/rswitch_main.c Ma Ke             2026-03-30  1477  	if (!tmp_phydev)
0df024d0f1d3e5 drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1478  		goto out;
142f4caaa41b9c drivers/net/ethernet/renesas/rswitch_main.c Ma Ke             2026-03-30  1479  	__set_bit(rdev->etha->phy_interface, tmp_phydev->host_interfaces);
35b78409e1c7ff drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-10-17 @1480  	phydev->mac_managed_pm = true;
0df024d0f1d3e5 drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1481  
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1482  	phydev = of_phy_connect(rdev->ndev, phy, rswitch_adjust_link, 0,
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1483  				rdev->etha->phy_interface);
142f4caaa41b9c drivers/net/ethernet/renesas/rswitch_main.c Ma Ke             2026-03-30  1484  
142f4caaa41b9c drivers/net/ethernet/renesas/rswitch_main.c Ma Ke             2026-03-30  1485  	/* Release the temporary reference obtained by of_phy_find_device() */
142f4caaa41b9c drivers/net/ethernet/renesas/rswitch_main.c Ma Ke             2026-03-30  1486  	phy_device_free(tmp_phydev);
142f4caaa41b9c drivers/net/ethernet/renesas/rswitch_main.c Ma Ke             2026-03-30  1487  
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1488  	if (!phydev)
0df024d0f1d3e5 drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1489  		goto out;
3590918b5d07aa drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2022-10-31  1490  
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1491  	phy_set_max_speed(phydev, SPEED_2500);
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1492  	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1493  	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_10baseT_Full_BIT);
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1494  	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_100baseT_Half_BIT);
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1495  	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_1000baseT_Half_BIT);
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1496  	rswitch_phy_remove_link_mode(rdev, phydev);
3590918b5d07aa drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2022-10-31  1497  
c16a5033f77b9e drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1498  	phy_attached_info(phydev);
3590918b5d07aa drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2022-10-31  1499  
0df024d0f1d3e5 drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1500  	err = 0;
0df024d0f1d3e5 drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1501  out:
0df024d0f1d3e5 drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1502  	of_node_put(phy);
0df024d0f1d3e5 drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1503  
0df024d0f1d3e5 drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2023-02-01  1504  	return err;
3590918b5d07aa drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2022-10-31  1505  }
3590918b5d07aa drivers/net/ethernet/renesas/rswitch.c      Yoshihiro Shimoda 2022-10-31  1506  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

