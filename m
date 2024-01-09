Return-Path: <linux-renesas-soc+bounces-1421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D15A9828396
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jan 2024 10:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 567811F28B35
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jan 2024 09:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB97358AE;
	Tue,  9 Jan 2024 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZcM/sgl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B68831A7E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jan 2024 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704794341; x=1736330341;
  h=date:from:to:cc:subject:message-id;
  bh=Qr5zaKtW9Dg20i/K8miC5TAEkiXSiFE5FKoKsMUlFEE=;
  b=eZcM/sgl6Vqf2Viw2U7+9WHC/ld07UqLNb/pfsO3ZSFTA2p8l8Dznnmm
   0dgVYMToQ8LeJJfARU7zxOkyvko/Bidp2chY5Dn+fMYLzlg/7LOgSgJds
   4wuOHJ7jIUV4l+e8ybKopwXZtUlATDRVR8xdX0P7rSTgDHCVAMR45Bu7y
   A6Vir6WFEh5WkfZ25y7ym9Grai8sA+GgXKE4G8h1uH3cCDmgtrF6rCB64
   fu5iZcgnd8AdZaHl1iE6z2N2SyVU7qqhp3/i2syFIgHgb4l7TUq7j7M2g
   hF8idDBF1F/CMpvcHbWUFm86mUz4Ms9fgF2RhMtPqpxVDMgn6aZnCbc9E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11495943"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="11495943"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 01:59:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="925192715"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="925192715"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jan 2024 01:58:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rN8sp-0005iC-1l;
	Tue, 09 Jan 2024 09:58:55 +0000
Date: Tue, 09 Jan 2024 17:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 6789dc4e85595424b3dd2b1b11d6da32ff4a4149
Message-ID: <202401091758.f1NnkJ1h-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 6789dc4e85595424b3dd2b1b11d6da32ff4a4149  Merge tag 'v6.7' into renesas-devel

elapsed time: 1454m

configs tested: 230
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240108   gcc  
arc                   randconfig-001-20240109   gcc  
arc                   randconfig-002-20240108   gcc  
arc                   randconfig-002-20240109   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   clang
arm                           h3600_defconfig   gcc  
arm                   randconfig-001-20240108   gcc  
arm                   randconfig-002-20240108   gcc  
arm                   randconfig-003-20240108   gcc  
arm                   randconfig-004-20240108   gcc  
arm                        shmobile_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240108   gcc  
arm64                 randconfig-002-20240108   gcc  
arm64                 randconfig-003-20240108   gcc  
arm64                 randconfig-004-20240108   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240108   gcc  
csky                  randconfig-001-20240109   gcc  
csky                  randconfig-002-20240108   gcc  
csky                  randconfig-002-20240109   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240108   gcc  
i386         buildonly-randconfig-002-20240108   gcc  
i386         buildonly-randconfig-003-20240108   gcc  
i386         buildonly-randconfig-004-20240108   gcc  
i386         buildonly-randconfig-005-20240108   gcc  
i386         buildonly-randconfig-006-20240108   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240108   gcc  
i386                  randconfig-002-20240108   gcc  
i386                  randconfig-003-20240108   gcc  
i386                  randconfig-004-20240108   gcc  
i386                  randconfig-005-20240108   gcc  
i386                  randconfig-006-20240108   gcc  
i386                  randconfig-011-20240108   clang
i386                  randconfig-012-20240108   clang
i386                  randconfig-013-20240108   clang
i386                  randconfig-014-20240108   clang
i386                  randconfig-015-20240108   clang
i386                  randconfig-016-20240108   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240108   gcc  
loongarch             randconfig-001-20240109   gcc  
loongarch             randconfig-002-20240108   gcc  
loongarch             randconfig-002-20240109   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
mips                   sb1250_swarm_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240108   gcc  
nios2                 randconfig-001-20240109   gcc  
nios2                 randconfig-002-20240108   gcc  
nios2                 randconfig-002-20240109   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240108   gcc  
parisc                randconfig-001-20240109   gcc  
parisc                randconfig-002-20240108   gcc  
parisc                randconfig-002-20240109   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      cm5200_defconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc               randconfig-001-20240108   gcc  
powerpc               randconfig-002-20240108   gcc  
powerpc               randconfig-003-20240108   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240108   gcc  
powerpc64             randconfig-002-20240108   gcc  
powerpc64             randconfig-003-20240108   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240108   gcc  
riscv                 randconfig-002-20240108   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240109   gcc  
s390                  randconfig-002-20240109   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20240108   gcc  
sh                    randconfig-001-20240109   gcc  
sh                    randconfig-002-20240108   gcc  
sh                    randconfig-002-20240109   gcc  
sh                           se7343_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240108   gcc  
sparc64               randconfig-001-20240109   gcc  
sparc64               randconfig-002-20240108   gcc  
sparc64               randconfig-002-20240109   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240108   gcc  
um                    randconfig-002-20240108   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240108   gcc  
x86_64       buildonly-randconfig-001-20240109   clang
x86_64       buildonly-randconfig-002-20240108   gcc  
x86_64       buildonly-randconfig-002-20240109   clang
x86_64       buildonly-randconfig-003-20240108   gcc  
x86_64       buildonly-randconfig-003-20240109   clang
x86_64       buildonly-randconfig-004-20240108   gcc  
x86_64       buildonly-randconfig-004-20240109   clang
x86_64       buildonly-randconfig-005-20240108   gcc  
x86_64       buildonly-randconfig-005-20240109   clang
x86_64       buildonly-randconfig-006-20240108   gcc  
x86_64       buildonly-randconfig-006-20240109   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240108   gcc  
x86_64                randconfig-011-20240109   clang
x86_64                randconfig-012-20240108   gcc  
x86_64                randconfig-012-20240109   clang
x86_64                randconfig-013-20240108   gcc  
x86_64                randconfig-013-20240109   clang
x86_64                randconfig-014-20240108   gcc  
x86_64                randconfig-014-20240109   clang
x86_64                randconfig-015-20240108   gcc  
x86_64                randconfig-015-20240109   clang
x86_64                randconfig-016-20240108   gcc  
x86_64                randconfig-016-20240109   clang
x86_64                randconfig-071-20240108   gcc  
x86_64                randconfig-071-20240109   clang
x86_64                randconfig-072-20240108   gcc  
x86_64                randconfig-072-20240109   clang
x86_64                randconfig-073-20240108   gcc  
x86_64                randconfig-073-20240109   clang
x86_64                randconfig-074-20240108   gcc  
x86_64                randconfig-074-20240109   clang
x86_64                randconfig-075-20240108   gcc  
x86_64                randconfig-075-20240109   clang
x86_64                randconfig-076-20240108   gcc  
x86_64                randconfig-076-20240109   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240108   gcc  
xtensa                randconfig-001-20240109   gcc  
xtensa                randconfig-002-20240108   gcc  
xtensa                randconfig-002-20240109   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

