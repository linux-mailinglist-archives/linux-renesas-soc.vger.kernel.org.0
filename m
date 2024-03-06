Return-Path: <linux-renesas-soc+bounces-3487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83627872C49
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 02:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5F161C25BDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 01:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA92ECF;
	Wed,  6 Mar 2024 01:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDaRKX1/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0D06FBD
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Mar 2024 01:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709689090; cv=none; b=B2yLvnPCaNhwTsW2ub6MkSmNBxhJcCgCajei0HurekjtOLrwg9mOmcZTz76VzMUixigYECENFMN5leEMR8CH8KxtjTLRUxmsMKy8m0NTBjMOw3QdqdA4fRrIx5KY8ghcFJJuJKtGnEOe64SZD1C7G7xdnROkbmzAE/mZMU+VksI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709689090; c=relaxed/simple;
	bh=UnSwrJy8+0X0RBT5+CdywjyF/9r19nTAiVHd/GsAsX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K4uoiusrn6zwTOLPu+dVxTqZVyDQjyRRJcWrA1TuKIrPnBx5RB/L0eEDdNjiLwh5oHfxF3CtNko2FWlJKbrg/t1ICsdAfVKI1P0lHLnw/sVe2t8R6Rar5KbWtXE+E5JNsogSzIXTCEN+fAU3PURdBbbTIbDR5YPuL6xes3de+Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDaRKX1/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709689088; x=1741225088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UnSwrJy8+0X0RBT5+CdywjyF/9r19nTAiVHd/GsAsX4=;
  b=KDaRKX1/Lr3OEnArRVa3M/+XHE/AgZjgJLkGh4lCb/ar5sJs5E2btRPk
   GnQleI6WsaFqyQAqMmcEfh9hkf2skDtYaHVE2jMYb+2bp/Ie0JBfPWO4D
   VSvriiOtrr87JzoyqeO9q3xzzdy6kcS+SCZgfwg85NISZITa63wyjfsX3
   /xjjJeSSMVB1Zl3LYKv2hNW+tt/6fPMlP610CxdjmumKADRUisVj7RQs3
   YO+f+oMDdH3s/BETiGfSfgXIGCI8X20dF7mxHd37KfYA2mqSObYgIuIPi
   8Q9o/moUvJTZxgono+86sU/sn9skKwUngA4vCi4dUY++TCMzFW6dWvliA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15425788"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="15425788"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 17:38:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9656236"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Mar 2024 17:38:07 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhgEN-0003pV-30;
	Wed, 06 Mar 2024 01:38:03 +0000
Date: Wed, 6 Mar 2024 09:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 34/52]
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:35: warning: initialization of
 'const struct qmp_usb_offsets *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202403060928.h7xXMXHi-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240306/202403060928.h7xXMXHi-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060928.h7xXMXHi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060928.h7xXMXHi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:10: error: 'const struct qmp_phy_cfg' has no member named 'lanes'
    1340 |         .lanes                  = 1,
         |          ^~~~~
>> drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:35: warning: initialization of 'const struct qmp_usb_offsets *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1340 |         .lanes                  = 1,
         |                                   ^
   drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:35: note: (near initialization for 'ipq6018_usb3phy_cfg.offsets')
   drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1342:35: warning: initialized field overwritten [-Woverride-init]
    1342 |         .offsets                = &qmp_usb_offsets_v3,
         |                                   ^
   drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1342:35: note: (near initialization for 'ipq6018_usb3phy_cfg.offsets')


vim +1340 drivers/phy/qualcomm/phy-qcom-qmp-usb.c

2daa9555ba9858 Abel Vesa        2023-12-07  1338  
62a5df451ab911 Mantas Pucka     2024-01-23  1339  static const struct qmp_phy_cfg ipq6018_usb3phy_cfg = {
62a5df451ab911 Mantas Pucka     2024-01-23 @1340  	.lanes			= 1,
62a5df451ab911 Mantas Pucka     2024-01-23  1341  
d4c08d8b23b228 Dmitry Baryshkov 2024-02-13  1342  	.offsets		= &qmp_usb_offsets_v3,
62a5df451ab911 Mantas Pucka     2024-01-23  1343  
62a5df451ab911 Mantas Pucka     2024-01-23  1344  	.serdes_tbl		= ipq9574_usb3_serdes_tbl,
62a5df451ab911 Mantas Pucka     2024-01-23  1345  	.serdes_tbl_num		= ARRAY_SIZE(ipq9574_usb3_serdes_tbl),
62a5df451ab911 Mantas Pucka     2024-01-23  1346  	.tx_tbl			= msm8996_usb3_tx_tbl,
62a5df451ab911 Mantas Pucka     2024-01-23  1347  	.tx_tbl_num		= ARRAY_SIZE(msm8996_usb3_tx_tbl),
62a5df451ab911 Mantas Pucka     2024-01-23  1348  	.rx_tbl			= ipq8074_usb3_rx_tbl,
62a5df451ab911 Mantas Pucka     2024-01-23  1349  	.rx_tbl_num		= ARRAY_SIZE(ipq8074_usb3_rx_tbl),
62a5df451ab911 Mantas Pucka     2024-01-23  1350  	.pcs_tbl		= ipq8074_usb3_pcs_tbl,
62a5df451ab911 Mantas Pucka     2024-01-23  1351  	.pcs_tbl_num		= ARRAY_SIZE(ipq8074_usb3_pcs_tbl),
62a5df451ab911 Mantas Pucka     2024-01-23  1352  	.vreg_list		= qmp_phy_vreg_l,
62a5df451ab911 Mantas Pucka     2024-01-23  1353  	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
62a5df451ab911 Mantas Pucka     2024-01-23  1354  	.regs			= qmp_v3_usb3phy_regs_layout,
62a5df451ab911 Mantas Pucka     2024-01-23  1355  };
62a5df451ab911 Mantas Pucka     2024-01-23  1356  

:::::: The code at line 1340 was first introduced by commit
:::::: 62a5df451ab911421da96655fcc4d1e269ff6e2f phy: qcom-qmp-usb: fix serdes init sequence for IPQ6018

:::::: TO: Mantas Pucka <mantas@8devices.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

