Return-Path: <linux-renesas-soc+bounces-4076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F3088D45A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 03:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3E7C2E4C8A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 02:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC9C20334;
	Wed, 27 Mar 2024 02:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1v5vlVo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B720328
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 02:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711505114; cv=none; b=R0u45c0Mxc9opbX7LC/d86WcgdeTO5wb2BTXem1D4Mhjmdb2S7qMqmBDPuQwWnVDngyl61hQLyPe8lUah6L1KpGOC3HtAWabJx1HtxLMn68+gjR/Ce7Yrc+BnwNZ4AudH3OPBHycjNsOkTs4lgcxDHSrJQda+0D0LVWyRy7X/wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711505114; c=relaxed/simple;
	bh=zJ2pdkDq99TejjCYP2yDGfYTfThv2UjMMpR7iK6l/Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VBk4GGlvuGjPyuk/ys3o2rrFzL54TmVrwyYOcz1lWvbQPTao6V5Oz+ZsPTIy8VhzoZCS/aecvCq76SSafNkvZsinFyH16HrZ7s/azn9q6ukFW9NYeGj1dA49v58Hfmkdadv6uIIRgCibbjD1sRyYZIeG2hcf0+hpWyzlgwIA/rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1v5vlVo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711505113; x=1743041113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zJ2pdkDq99TejjCYP2yDGfYTfThv2UjMMpR7iK6l/Pw=;
  b=I1v5vlVoiZQ2irq2d2ANtpIr7zd6Zso1SoMIaIbJUrafcVGQ7CJZQD/0
   iwehYxPgxezWCfxlLQfcpw1iagnym4iGJdJMz+ImChN4Hc9dujJ0ab6SY
   rHT/j1S1GD3lyjjiV8lKe1AA2jxyw3KxI2g4LL4MrKd5oLCoLyD7XoZ1O
   1gFCOLRFn5m8azefv6o3RYDJV5UD+hbIRAz/9+AfGhv081m7w7cpSm2Hv
   Zn8lpe55QAUztsDOS2Iij3k27vc4+1oN+jaUpZ2i8DkpbkgVz3ppF04dx
   H74ZoylEmsPL8TKaa3TMJrQdEyGItfqxKBFEkMcbycT06IpNu/wfLEVQn
   A==;
X-CSE-ConnectionGUID: 3hT6rTOkSbCrqPgkcGVfrA==
X-CSE-MsgGUID: 4PPMRxvtROOq/1PQwPp4OA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="18017510"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="18017510"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 19:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="39245073"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Mar 2024 19:05:09 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpIf5-0000dq-2W;
	Wed, 27 Mar 2024 02:05:07 +0000
Date: Wed, 27 Mar 2024 10:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master 23/30]
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3548:3: error: use of undeclared
 identifier 'sas_ata_sdev_attr_group'
Message-ID: <202403271050.wRQduzP2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   5e36d764b5dfcddd54895d9b6dc392eaaba17d6a
commit: 61d4f86ef0002b12ed52d2dc7a08c23b53798766 [23/30] Revert "scsi: libsas: Define NCQ Priority sysfs attributes for SATA devices"
config: i386-buildonly-randconfig-003-20240327 (https://download.01.org/0day-ci/archive/20240327/202403271050.wRQduzP2-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403271050.wRQduzP2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403271050.wRQduzP2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3548:3: error: use of undeclared identifier 'sas_ata_sdev_attr_group'
    3548 |         &sas_ata_sdev_attr_group,
         |          ^
   1 error generated.


vim +/sas_ata_sdev_attr_group +3548 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c

62ac8ccbb819e3 Bart Van Assche 2021-10-12  3546  
a23971e8ff0c43 Igor Pylypiv    2024-03-07  3547  static const struct attribute_group *sdev_groups_v2_hw[] = {
a23971e8ff0c43 Igor Pylypiv    2024-03-07 @3548  	&sas_ata_sdev_attr_group,
a23971e8ff0c43 Igor Pylypiv    2024-03-07  3549  	NULL
a23971e8ff0c43 Igor Pylypiv    2024-03-07  3550  };
a23971e8ff0c43 Igor Pylypiv    2024-03-07  3551  

:::::: The code at line 3548 was first introduced by commit
:::::: a23971e8ff0c43d47e1772b62c2916ff0b768fca scsi: hisi_sas: Add libsas SATA sysfs attributes group

:::::: TO: Igor Pylypiv <ipylypiv@google.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

