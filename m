Return-Path: <linux-renesas-soc+bounces-10788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 434179E10BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 02:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 932F2B22217
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 01:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA90C847C;
	Tue,  3 Dec 2024 01:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gbb7qj9M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FBD10F2
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 01:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733188888; cv=none; b=L4E2WRDAzR7cnnIKLmIIhHWfzHPK3jdhBIazSTuVmwYDPp1ntZAVN5rhCnR1Xn6V0YNn1iafVMDwWGywkfSjGMSGW6fwM/l+xwvFIwSfc4Ee5mohXEPn1Jvp2iWIISfD+yuj2uCEw8c4n81KYIFZMEsxjkeMMQbXj8Ku+RS77J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733188888; c=relaxed/simple;
	bh=fUVJIFeah3QX3yyun6eVtwz29XbnocT0Qe0uarnouWk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MTrTnbfJzUxiz+ctdkqPCanomStJONFjOurCyY30JBhtMyf7IHNinzsiRh8RhOR/JFXdyNh+dfC1ajSdZSoDbL6nIxiN2rVp/DgnZt9WZeyZ5SZCuj//u8O/U7IpzqSnKuvlNhl7HdNb+MwSp6DchdJ7XVA6vc5/Pi7US+BB60c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gbb7qj9M; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733188887; x=1764724887;
  h=date:from:to:cc:subject:message-id;
  bh=fUVJIFeah3QX3yyun6eVtwz29XbnocT0Qe0uarnouWk=;
  b=Gbb7qj9MEywBssdjhdV6UEEQOsxxHDkG0U8/81AKRanKzBJBKJGgkyHe
   I5Qgw6Nepjt10VHMe9ZCQkCnMFMyed60u1feyJqTK272XhPgvKH/+od0Z
   iBcoizh24TD474VBdiLfbZZmK3tAGTZ4VEfiszp+Irh/JhnmIcTGpjz9z
   FpVelupgJ8NVdKuTd51w9MYo+F5giQkh5I2SySPqgv+srXz9HU/iXxswK
   3Km+whE+K7Iz2hl4rJh4+v57qAq492borxd+OBXRd5nhJ6VgYK5uZ4viC
   9UYAuUhOpyNC8+nw8AO6s8UvM9v8Ej0mj3CSAO/cWSaLpO5zvn8AR4J1l
   w==;
X-CSE-ConnectionGUID: 1tDMpPA9R3yEpMC2ktjyyw==
X-CSE-MsgGUID: B9gNVqOZQi2SeU638UJgqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="50800139"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="50800139"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 17:21:26 -0800
X-CSE-ConnectionGUID: LIx8yAoaSnOvsdW3ELriCQ==
X-CSE-MsgGUID: ewenwC8ASp2Ki2XkLUELwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="97712352"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Dec 2024 17:21:24 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIHbM-00037R-31;
	Tue, 03 Dec 2024 01:21:20 +0000
Date: Tue, 03 Dec 2024 09:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 13e570932b98d836bddabb365b3d90d7fb0d3112
Message-ID: <202412030916.e5RfyB7W-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 13e570932b98d836bddabb365b3d90d7fb0d3112  Merge tag 'v6.13-rc1' into renesas-devel

elapsed time: 909m

configs tested: 205
configs skipped: 21

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241202    gcc-13.2.0
arc                   randconfig-001-20241202    gcc-14.2.0
arc                   randconfig-001-20241203    clang-20
arc                   randconfig-002-20241202    gcc-13.2.0
arc                   randconfig-002-20241202    gcc-14.2.0
arc                   randconfig-002-20241203    clang-20
arc                        vdk_hs38_defconfig    clang-14
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    gcc-14.2.0
arm                          exynos_defconfig    clang-17
arm                           imxrt_defconfig    clang-20
arm                        keystone_defconfig    clang-20
arm                            mps2_defconfig    clang-20
arm                         mv78xx0_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                          pxa168_defconfig    clang-20
arm                          pxa168_defconfig    gcc-14.2.0
arm                          pxa3xx_defconfig    clang-20
arm                   randconfig-001-20241202    gcc-14.2.0
arm                   randconfig-001-20241203    clang-20
arm                   randconfig-002-20241202    clang-20
arm                   randconfig-002-20241202    gcc-14.2.0
arm                   randconfig-002-20241203    clang-20
arm                   randconfig-003-20241202    gcc-14.2.0
arm                   randconfig-003-20241203    clang-20
arm                   randconfig-004-20241202    clang-20
arm                   randconfig-004-20241202    gcc-14.2.0
arm                   randconfig-004-20241203    clang-20
arm                         s5pv210_defconfig    clang-14
arm                         socfpga_defconfig    clang-20
arm                        spear6xx_defconfig    clang-14
arm                        spear6xx_defconfig    clang-20
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241202    gcc-14.2.0
arm64                 randconfig-001-20241203    clang-20
arm64                 randconfig-002-20241202    gcc-14.2.0
arm64                 randconfig-002-20241203    clang-20
arm64                 randconfig-003-20241202    gcc-14.2.0
arm64                 randconfig-003-20241203    clang-20
arm64                 randconfig-004-20241202    clang-14
arm64                 randconfig-004-20241202    gcc-14.2.0
arm64                 randconfig-004-20241203    clang-20
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386        buildonly-randconfig-001-20241202    clang-19
i386        buildonly-randconfig-001-20241202    gcc-12
i386        buildonly-randconfig-001-20241203    clang-19
i386        buildonly-randconfig-002-20241202    clang-19
i386        buildonly-randconfig-002-20241202    gcc-12
i386        buildonly-randconfig-002-20241203    clang-19
i386        buildonly-randconfig-003-20241202    clang-19
i386        buildonly-randconfig-003-20241202    gcc-12
i386        buildonly-randconfig-003-20241203    clang-19
i386        buildonly-randconfig-004-20241202    clang-19
i386        buildonly-randconfig-004-20241203    clang-19
i386        buildonly-randconfig-005-20241202    clang-19
i386        buildonly-randconfig-005-20241203    clang-19
i386        buildonly-randconfig-006-20241202    clang-19
i386        buildonly-randconfig-006-20241203    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-14
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-20
mips                           ip28_defconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-20
mips                        qi_lb60_defconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                         10m50_defconfig    clang-14
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                         alldefconfig    clang-20
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    clang-14
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-20
powerpc                   currituck_defconfig    clang-20
powerpc                       eiger_defconfig    gcc-14.2.0
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    clang-20
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    clang-14
powerpc                  mpc885_ads_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    clang-14
powerpc                      pasemi_defconfig    clang-20
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc                      ppc6xx_defconfig    clang-14
powerpc                     sequoia_defconfig    clang-20
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                            migor_defconfig    clang-20
sh                            migor_defconfig    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                           se7619_defconfig    clang-20
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7705_defconfig    clang-20
sh                           se7722_defconfig    gcc-14.2.0
sh                           se7780_defconfig    clang-14
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                              ul2_defconfig    clang-14
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-15
x86_64      buildonly-randconfig-001-20241202    clang-19
x86_64      buildonly-randconfig-001-20241203    gcc-11
x86_64      buildonly-randconfig-002-20241202    clang-19
x86_64      buildonly-randconfig-002-20241202    gcc-12
x86_64      buildonly-randconfig-002-20241203    gcc-11
x86_64      buildonly-randconfig-003-20241202    clang-19
x86_64      buildonly-randconfig-003-20241202    gcc-12
x86_64      buildonly-randconfig-003-20241203    gcc-11
x86_64      buildonly-randconfig-004-20241202    clang-19
x86_64      buildonly-randconfig-004-20241203    gcc-11
x86_64      buildonly-randconfig-005-20241202    clang-19
x86_64      buildonly-randconfig-005-20241202    gcc-12
x86_64      buildonly-randconfig-005-20241203    gcc-11
x86_64      buildonly-randconfig-006-20241202    clang-19
x86_64      buildonly-randconfig-006-20241202    gcc-12
x86_64      buildonly-randconfig-006-20241203    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-20
xtensa                    smp_lx200_defconfig    clang-20
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

