Return-Path: <linux-renesas-soc+bounces-4083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E3288D5ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 06:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7762D29A069
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Mar 2024 05:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C0C10949;
	Wed, 27 Mar 2024 05:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGipuINT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1822C125C0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Mar 2024 05:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711517959; cv=none; b=VgWs0zW377NH65qE3jdYz32Jgf9ruRruP/K/6ykVZReGx4p63FkRKq4yyLeCb0Us02WLEMUiNHQC6MGOZoveij6d/n53nSFVv404Ss5M3zgeWEV6PPjbuuKHQaosm1FqG/qxTHKmRy/mrpXyQhgeQAERkhIzpwNoCsIhKO6tEcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711517959; c=relaxed/simple;
	bh=XkBBmx3Z4zBf86kZYULztK+qBoL3PRzfeuxKIfVFGbQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Erg1AFYil1L6334tMh36cKHe30Q8FCei6ucFFxxug8wi2ZpjjAlZtDtN5ow1BYlRRJ2BQp0AD8jE8OnEFnfX2Fx397VOqKP9KG37STqCLLtid505NwSzZrN6iEtbbXos5VRZEihilJHLV1Oz6VFyMpR/hYQYEt7fCVxTtshnJ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGipuINT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711517955; x=1743053955;
  h=date:from:to:cc:subject:message-id;
  bh=XkBBmx3Z4zBf86kZYULztK+qBoL3PRzfeuxKIfVFGbQ=;
  b=hGipuINTZCnWwttzo0CZnr95EEFKId9Aj94EDCGLrxpUl4Sj1zUGSq4s
   77+1btDUY0MD1wZ4UtuphSaAavxNwgoyDJaJhwUiO9vK/Hm44B3iw/GVX
   xiSCR3XqeporW1KtMN1yC+5wD1ynsSP72CaQbdxWOGhvjJLxl8zfpmwTB
   ZMYeDFCBMvHaHbdy4TZ7mjd5Ht5JmuJ+ZSPioebhb3l5ZqvAKmDcdOhqD
   R8V0RJLeSm+5lBtP71qukjVHd6aZiIDIhz+liYUi3BLMK42tA0IE6OTYh
   YOiRiTSrGRC8laqrM5lg8LvNPBPAMuMolfaUe1ao3AzjoMkd1aG1+Z4sq
   g==;
X-CSE-ConnectionGUID: jOTOOI7yRXenF55vdkaZLg==
X-CSE-MsgGUID: R1kz1mDYQ++Pwo0/G0MAyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17143287"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="17143287"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 22:39:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="20906638"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Mar 2024 22:39:16 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpM0G-0000nU-2w;
	Wed, 27 Mar 2024 05:39:12 +0000
Date: Wed, 27 Mar 2024 13:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 5e36d764b5dfcddd54895d9b6dc392eaaba17d6a
Message-ID: <202403271343.kzPviUGr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 5e36d764b5dfcddd54895d9b6dc392eaaba17d6a  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202403271050.wRQduzP2-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202403271144.JmvFogog-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3548:10: error: 'sas_ata_sdev_attr_group' undeclared here (not in a function)
drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:3548:3: error: use of undeclared identifier 'sas_ata_sdev_attr_group'
drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:2933:10: error: 'sas_ata_sdev_attr_group' undeclared here (not in a function)
drivers/scsi/isci/init.c:153:3: error: 'sas_ata_sdev_attr_group' undeclared here (not in a function); did you mean 'ata_dev_iter_mode'?
drivers/scsi/isci/init.c:153:3: error: use of undeclared identifier 'sas_ata_sdev_attr_group'
drivers/scsi/mvsas/mv_init.c:768:3: error: 'sas_ata_sdev_attr_group' undeclared here (not in a function); did you mean 'mvst_sdev_groups'?
drivers/scsi/pm8001/pm8001_ctl.c:1044:3: error: 'sas_ata_sdev_attr_group' undeclared here (not in a function); did you mean 'pm8001_host_attr_group'?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-defconfig
|   |-- drivers-scsi-hisi_sas-hisi_sas_v2_hw.c:error:sas_ata_sdev_attr_group-undeclared-here-(not-in-a-function)
|   `-- drivers-scsi-hisi_sas-hisi_sas_v3_hw.c:error:sas_ata_sdev_attr_group-undeclared-here-(not-in-a-function)
`-- i386-buildonly-randconfig-002-20240327
    |-- drivers-scsi-isci-init.c:error:sas_ata_sdev_attr_group-undeclared-here-(not-in-a-function)
    |-- drivers-scsi-mvsas-mv_init.c:error:sas_ata_sdev_attr_group-undeclared-here-(not-in-a-function)
    `-- drivers-scsi-pm8001-pm8001_ctl.c:error:sas_ata_sdev_attr_group-undeclared-here-(not-in-a-function)
clang_recent_errors
|-- i386-buildonly-randconfig-003-20240327
|   `-- drivers-scsi-hisi_sas-hisi_sas_v2_hw.c:error:use-of-undeclared-identifier-sas_ata_sdev_attr_group
`-- x86_64-rhel-8.3-rust
    `-- drivers-scsi-isci-init.c:error:use-of-undeclared-identifier-sas_ata_sdev_attr_group

elapsed time: 732m

configs tested: 179
configs skipped: 4

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240327   gcc  
arc                   randconfig-002-20240327   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20240327   clang
arm                   randconfig-002-20240327   clang
arm                   randconfig-003-20240327   clang
arm                   randconfig-004-20240327   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240327   clang
arm64                 randconfig-002-20240327   clang
arm64                 randconfig-003-20240327   gcc  
arm64                 randconfig-004-20240327   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240327   gcc  
csky                  randconfig-002-20240327   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240327   clang
hexagon               randconfig-002-20240327   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240327   gcc  
i386         buildonly-randconfig-002-20240327   gcc  
i386         buildonly-randconfig-003-20240327   clang
i386         buildonly-randconfig-004-20240327   clang
i386         buildonly-randconfig-005-20240327   clang
i386         buildonly-randconfig-006-20240327   clang
i386                                defconfig   clang
i386                  randconfig-001-20240327   gcc  
i386                  randconfig-002-20240327   gcc  
i386                  randconfig-003-20240327   clang
i386                  randconfig-004-20240327   gcc  
i386                  randconfig-005-20240327   clang
i386                  randconfig-006-20240327   gcc  
i386                  randconfig-011-20240327   gcc  
i386                  randconfig-012-20240327   clang
i386                  randconfig-013-20240327   gcc  
i386                  randconfig-014-20240327   clang
i386                  randconfig-015-20240327   gcc  
i386                  randconfig-016-20240327   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240327   gcc  
loongarch             randconfig-002-20240327   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
mips                           rs90_defconfig   gcc  
mips                         rt305x_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240327   gcc  
nios2                 randconfig-002-20240327   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240327   gcc  
parisc                randconfig-002-20240327   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc                     mpc512x_defconfig   clang
powerpc                  mpc866_ads_defconfig   clang
powerpc                      pmac32_defconfig   clang
powerpc               randconfig-001-20240327   clang
powerpc               randconfig-002-20240327   gcc  
powerpc               randconfig-003-20240327   clang
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240327   clang
powerpc64             randconfig-002-20240327   gcc  
powerpc64             randconfig-003-20240327   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240327   clang
riscv                 randconfig-002-20240327   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240327   clang
s390                  randconfig-002-20240327   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240327   gcc  
sh                    randconfig-002-20240327   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240327   gcc  
sparc64               randconfig-002-20240327   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240327   clang
um                    randconfig-002-20240327   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240327   gcc  
x86_64       buildonly-randconfig-002-20240327   gcc  
x86_64       buildonly-randconfig-003-20240327   gcc  
x86_64       buildonly-randconfig-004-20240327   clang
x86_64       buildonly-randconfig-005-20240327   gcc  
x86_64       buildonly-randconfig-006-20240327   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240327   clang
x86_64                randconfig-002-20240327   gcc  
x86_64                randconfig-003-20240327   gcc  
x86_64                randconfig-004-20240327   gcc  
x86_64                randconfig-005-20240327   clang
x86_64                randconfig-006-20240327   clang
x86_64                randconfig-011-20240327   gcc  
x86_64                randconfig-012-20240327   clang
x86_64                randconfig-013-20240327   clang
x86_64                randconfig-014-20240327   clang
x86_64                randconfig-015-20240327   clang
x86_64                randconfig-016-20240327   clang
x86_64                randconfig-071-20240327   gcc  
x86_64                randconfig-072-20240327   clang
x86_64                randconfig-073-20240327   clang
x86_64                randconfig-074-20240327   clang
x86_64                randconfig-075-20240327   clang
x86_64                randconfig-076-20240327   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240327   gcc  
xtensa                randconfig-002-20240327   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

