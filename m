Return-Path: <linux-renesas-soc+bounces-3488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4BB872DA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 04:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7541280C32
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 03:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9089A14AB2;
	Wed,  6 Mar 2024 03:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNkoI5+j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635BF79E4
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Mar 2024 03:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709696833; cv=none; b=iTDz5T5AMTKmnpYlIzDnz0qN+yyvawtEQrxHCtvx96FYDN67ndhthvbzFHQylQRYuhkxjuxliFXANViCFTJPNnoZ+mU+AQl6VFb00MW0OMAXLnvESzxX3JxCnCtv5HUQMPlnZExYdWyXfCrxxR3joFim+vCRKydNacCmCUXG3Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709696833; c=relaxed/simple;
	bh=I3JkK+SNSj8FKDhxv2y/kcw0/b6b0IYk+MHRuWMdDgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=apHagCRqg3y1NKtw6E+HEQ+D5mULGe002imsKUKxMYm/F4p935ZYC53GBn3WTasS2WVJQJcBjo0CMRfpeu1oEIyoQS1UagL8KcTclXYNm6O6+n5hSXheQYE7Qm41OyYtRoRRnykd2NxwMlfLOtlVS14WNiWoYo31iHskhT1cGIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNkoI5+j; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709696831; x=1741232831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I3JkK+SNSj8FKDhxv2y/kcw0/b6b0IYk+MHRuWMdDgg=;
  b=UNkoI5+jPKD1UxtXSHcbD6qYCsQfaYaCBaOq07wj9wgyglvrHIscQ/Di
   f/SxKDfJU5PLavOoqhYsgO+9O7OT9IUZD8O5jzVDFHA3lgYCDvgqJyrG3
   HecenDVtfn7i+bMamoAHgL9MOIb3qiRFZfddklqoZLH73Y03ALblCl9Bh
   ez2lkXhKlntR01h6PaexdG/NH5VaoWMfthzzFEZLUu7YtvOQeg+RjKd1T
   QQiGWlSDhiow24lyjcCCHCTjkDC20iwq66bDUrb93ygja3UB2honoqnbZ
   z1jMefwyybUiRPz9sFljIxlH7YGNR16bTuaJ8MLpAMfonvLYMcscv0ANq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15701623"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="15701623"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 19:47:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9585054"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2024 19:47:09 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhiFG-0003sz-0L;
	Wed, 06 Mar 2024 03:47:06 +0000
Date: Wed, 6 Mar 2024 11:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 34/52]
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:3: error: field designator
 'lanes' does not refer to any field in type 'const struct qmp_phy_cfg'
Message-ID: <202403061131.zzApAwRB-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240306/202403061131.zzApAwRB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061131.zzApAwRB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061131.zzApAwRB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/phy/qualcomm/phy-qcom-qmp-usb.c:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/phy/qualcomm/phy-qcom-qmp-usb.c:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/phy/qualcomm/phy-qcom-qmp-usb.c:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/phy/qualcomm/phy-qcom-qmp-usb.c:16:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/phy/qualcomm/phy-qcom-qmp-usb.c:1340:3: error: field designator 'lanes' does not refer to any field in type 'const struct qmp_phy_cfg'
    1340 |         .lanes                  = 1,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.


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

