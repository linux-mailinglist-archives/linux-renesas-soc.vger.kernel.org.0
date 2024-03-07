Return-Path: <linux-renesas-soc+bounces-3579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CA4875A2A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 23:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D37671C215DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 22:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879A513E7E8;
	Thu,  7 Mar 2024 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhXro9SM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8EE13A25F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Mar 2024 22:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709850027; cv=none; b=A6LJzbr6PIveRi5+yZkOwKJd3hlcBMbpvqRJ8Aa8k38nqNW3PInhYL6Xz+gai7GOcHGdsLR/vzk1NjjTOA3cNVOJ5jJCNPBR79X5t/lFctsxmKINT2KFtDzR2BMQgnfI0sCPrwPS7y24GohX9niAOfY8NaK2v0/O1tY6+oYOEJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709850027; c=relaxed/simple;
	bh=KHOTKfrdd0Wb5k5a7/uVFqhc4C/lQboL8/vbtsUuqC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qQxMoAZlUPJZdWBzrH7xC9paoP7IjUNKYRspQld695hap17QvjEl1C0ogTycnEU0qGq/dfZNlkV0+bp+EP+QaxD8mwDPzS1IpvEoK2VKrpk3nlYXkues7XPY/8vOQ9M1ohEpxHsjBN5n7CPVKJWbyJiCVPSrXY9S4Jy4aVO8xE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhXro9SM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709850026; x=1741386026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KHOTKfrdd0Wb5k5a7/uVFqhc4C/lQboL8/vbtsUuqC0=;
  b=WhXro9SMBGSqpJSGxtli5Km/0BZzhm80wtPnpo4noZPmLG49HnGaLV0n
   mo2LgClMrOLXKmA9E9j1MYHNGDNV/urJS2S+sByaF5CcBSowrSyFnDQOz
   cfqy9s5nH1B8z4WnpwNqrtq88qnMLa4eJzvUBPFql7GzqpcRqbBSzSeou
   Q9LxpRAFBgslPmo4SGM0uD5zbnEXKlFklclIHceUhp6gSkhvYyBaPw7vf
   s2sVJQsn0PU4+mU9Zr7hAzLxLspQLXQ4KWVMVGUaFZl2tulKvgg0yVj2o
   TGsA689yqznpwbKwOWfuFyeWXaLWrbNDwMU+uS2aCk40vwKuZGOFO27Nl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="8370610"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="8370610"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 14:20:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="10150165"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Mar 2024 14:20:23 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riM68-0005lD-2h;
	Thu, 07 Mar 2024 22:20:20 +0000
Date: Fri, 8 Mar 2024 06:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 34/52]
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:10: error: 'const struct
 qmp_phy_cfg' has no member named 'lanes'
Message-ID: <202403080611.8hvVkUTE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   0a76003de2b9029d5898c23d23ddbb90f5a74580
commit: 98177a93f8e405ce41969db23f5bf4766aa6a1f4 [34/52] Merge remote-tracking branch 'phy/next' into renesas-drivers
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240308/202403080611.8hvVkUTE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080611.8hvVkUTE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080611.8hvVkUTE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:10: error: 'const struct qmp_phy_cfg' has no member named 'lanes'
    1340 |         .lanes                  = 1,
         |          ^~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:35: warning: initialization of 'const struct qmp_usb_offsets *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1340 |         .lanes                  = 1,
         |                                   ^
   drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:35: note: (near initialization for 'ipq6018_usb3phy_cfg.offsets')
   drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1342:35: warning: initialized field overwritten [-Woverride-init]
    1342 |         .offsets                = &qmp_usb_offsets_v3,
         |                                   ^
   drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1342:35: note: (near initialization for 'ipq6018_usb3phy_cfg.offsets')


vim +1340 drivers/phy/qualcomm/phy-qcom-qmp-usb.c

2daa9555ba9858c Abel Vesa        2023-12-07  1338  
62a5df451ab9114 Mantas Pucka     2024-01-23  1339  static const struct qmp_phy_cfg ipq6018_usb3phy_cfg = {
62a5df451ab9114 Mantas Pucka     2024-01-23 @1340  	.lanes			= 1,
62a5df451ab9114 Mantas Pucka     2024-01-23  1341  
d4c08d8b23b2280 Dmitry Baryshkov 2024-02-13  1342  	.offsets		= &qmp_usb_offsets_v3,
62a5df451ab9114 Mantas Pucka     2024-01-23  1343  
62a5df451ab9114 Mantas Pucka     2024-01-23  1344  	.serdes_tbl		= ipq9574_usb3_serdes_tbl,
62a5df451ab9114 Mantas Pucka     2024-01-23  1345  	.serdes_tbl_num		= ARRAY_SIZE(ipq9574_usb3_serdes_tbl),
62a5df451ab9114 Mantas Pucka     2024-01-23  1346  	.tx_tbl			= msm8996_usb3_tx_tbl,
62a5df451ab9114 Mantas Pucka     2024-01-23  1347  	.tx_tbl_num		= ARRAY_SIZE(msm8996_usb3_tx_tbl),
62a5df451ab9114 Mantas Pucka     2024-01-23  1348  	.rx_tbl			= ipq8074_usb3_rx_tbl,
62a5df451ab9114 Mantas Pucka     2024-01-23  1349  	.rx_tbl_num		= ARRAY_SIZE(ipq8074_usb3_rx_tbl),
62a5df451ab9114 Mantas Pucka     2024-01-23  1350  	.pcs_tbl		= ipq8074_usb3_pcs_tbl,
62a5df451ab9114 Mantas Pucka     2024-01-23  1351  	.pcs_tbl_num		= ARRAY_SIZE(ipq8074_usb3_pcs_tbl),
62a5df451ab9114 Mantas Pucka     2024-01-23  1352  	.vreg_list		= qmp_phy_vreg_l,
62a5df451ab9114 Mantas Pucka     2024-01-23  1353  	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
62a5df451ab9114 Mantas Pucka     2024-01-23  1354  	.regs			= qmp_v3_usb3phy_regs_layout,
62a5df451ab9114 Mantas Pucka     2024-01-23  1355  };
62a5df451ab9114 Mantas Pucka     2024-01-23  1356  

:::::: The code at line 1340 was first introduced by commit
:::::: 62a5df451ab911421da96655fcc4d1e269ff6e2f phy: qcom-qmp-usb: fix serdes init sequence for IPQ6018

:::::: TO: Mantas Pucka <mantas@8devices.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

