Return-Path: <linux-renesas-soc+bounces-4077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B71388D4EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 04:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C6BF1C21F97
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 03:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00F021A06;
	Wed, 27 Mar 2024 03:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1hdUmOl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2643F22F0F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 03:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711508954; cv=none; b=IFCnRgRrcs/cSCbjtacWYdA28liaCjMet/Xrf/MjFF/K6jg2UkDV5QZ8LmG1QO8z/NIB2uh++VmHt2Fpvj4BuFg3soJLWM7fvK3SuPVC4oHtWz6dd5KjJBn2RtCE84z5CQMgi2kqSrVZ/lfGjoq/dxidqXZ2mHFde1hzlMiFp5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711508954; c=relaxed/simple;
	bh=PfhhUreIILRqTUhxOzhKjuD1WKCwiTFdMcN2j3wvfVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mX834Xj/ccFaob3D1tPlpCAghlqn7zCcAgRL8FXLDMvLril8ytIcoiS+hFQd+oCsr93T2bR5y3v/FXgEx0jbx+Yq+qYfbmUbAfXd3JysZE6yvZ2r8BBXEuBYnmodbL2VsvRzR7zvgm4bYLvh9095YyNZ72HJZtnk8TL0pLRv6bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1hdUmOl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711508954; x=1743044954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PfhhUreIILRqTUhxOzhKjuD1WKCwiTFdMcN2j3wvfVM=;
  b=F1hdUmOlzGEMLwyKXVohO9rG19vDDdhBMQWL0V4bxIuGQ+CnK5rVoF2k
   eUvGBAmf5BY8vCDXHciPltwUgU5TYeZNfxOJ5HA38fnigi7+MYx37uVJE
   Gd2CGusOni3B7+Q7p/TV1xWCQXVCR9cCYAh1IO9zbmeppyeG8juoriP7y
   QexA5eK2x9Fy6qYwYXj1HYdnwl3TbKOEZFAEc0Og7zslOVwpG1LOHeiI6
   pS3EJTBmHovQZRAXs4+53BZyAf4cdTnCujypYzJndcMiAYEqJTiNbktH0
   Efm5hlfpMwEEWWuo7LgcHzRtFoLsfPfbFNpLreQC+FYq+d+RFaMlGCjjN
   Q==;
X-CSE-ConnectionGUID: Edwjjk8nTBayoBc1W+vLxQ==
X-CSE-MsgGUID: ggwujTtjSp+05zhph07z9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6529452"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6529452"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 20:09:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="20875301"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Mar 2024 20:09:11 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpJf3-0000gs-19;
	Wed, 27 Mar 2024 03:09:09 +0000
Date: Wed, 27 Mar 2024 11:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master 23/30]
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3548:10: error:
 'sas_ata_sdev_attr_group' undeclared here (not in a function)
Message-ID: <202403271144.JmvFogog-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240327/202403271144.JmvFogog-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403271144.JmvFogog-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403271144.JmvFogog-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3548:10: error: 'sas_ata_sdev_attr_group' undeclared here (not in a function)
    3548 |         &sas_ata_sdev_attr_group,
         |          ^~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:2933:10: error: 'sas_ata_sdev_attr_group' undeclared here (not in a function)
    2933 |         &sas_ata_sdev_attr_group,
         |          ^~~~~~~~~~~~~~~~~~~~~~~


vim +/sas_ata_sdev_attr_group +3548 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c

62ac8ccbb819e35 Bart Van Assche 2021-10-12  3546  
a23971e8ff0c43d Igor Pylypiv    2024-03-07  3547  static const struct attribute_group *sdev_groups_v2_hw[] = {
a23971e8ff0c43d Igor Pylypiv    2024-03-07 @3548  	&sas_ata_sdev_attr_group,
a23971e8ff0c43d Igor Pylypiv    2024-03-07  3549  	NULL
a23971e8ff0c43d Igor Pylypiv    2024-03-07  3550  };
a23971e8ff0c43d Igor Pylypiv    2024-03-07  3551  

:::::: The code at line 3548 was first introduced by commit
:::::: a23971e8ff0c43d47e1772b62c2916ff0b768fca scsi: hisi_sas: Add libsas SATA sysfs attributes group

:::::: TO: Igor Pylypiv <ipylypiv@google.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

