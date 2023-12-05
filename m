Return-Path: <linux-renesas-soc+bounces-714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 573BC804FDF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 11:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C987281036
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 10:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A074B5D5;
	Tue,  5 Dec 2023 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHvrewWb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 319B5A0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Dec 2023 02:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701771053; x=1733307053;
  h=date:from:to:cc:subject:message-id;
  bh=l1aBwMuV9HHuv3pJUdjLvjjB5WMrr9iL2bAXcChu/7w=;
  b=gHvrewWbFy4oOtLyHNCiqGghvjVfP+EbQDHhwTKz478MRI2Hyfes00eU
   eHgNwOn0kr+fzNVKVAWjLLR84iCIuIB+MKoZRbs0EFWBYI3X6fA7sqxGx
   Xgm4mIvynDp/+kJiJH3oB3VNvMhZ8Q11k2WLfhBAPoe8Y1fHCu8cyBoUs
   aB/chDS72CGDgV/jTkNLb3Zlp9ILkxVc9+JMfWUMwniKyMVWKa7J+r8la
   YRwrZyX1R388gJXgZY8XOQMXm3EHLGxihdVVGMLxLmwox8xlNkxBxGppz
   we4YS+ODX0Vi0caDU7ZDpZDpGV+pSZQWgK+hHt52Yrwk95afl9ljSU7uo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="374059850"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="374059850"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 02:10:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="944208087"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="944208087"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Dec 2023 02:10:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rASO9-0008jb-06;
	Tue, 05 Dec 2023 10:10:49 +0000
Date: Tue, 05 Dec 2023 18:09:55 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 0d6b47644d4f0e784fa633859acc89075fba26cb
Message-ID: <202312051853.UV8bcNKm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 0d6b47644d4f0e784fa633859acc89075fba26cb  Merge tag 'v6.7-rc4' into renesas-devel

elapsed time: 1468m

configs tested: 284
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
arc                          axs103_defconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20231204   gcc  
arc                   randconfig-001-20231205   gcc  
arc                   randconfig-002-20231204   gcc  
arc                   randconfig-002-20231205   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                         at91_dt_defconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   clang
arm                          ep93xx_defconfig   clang
arm                          exynos_defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                            hisi_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                   milbeaut_m10v_defconfig   clang
arm                         mv78xx0_defconfig   clang
arm                   randconfig-001-20231204   clang
arm                   randconfig-001-20231205   gcc  
arm                   randconfig-002-20231204   clang
arm                   randconfig-002-20231205   gcc  
arm                   randconfig-003-20231204   clang
arm                   randconfig-003-20231205   gcc  
arm                   randconfig-004-20231204   clang
arm                   randconfig-004-20231205   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231204   clang
arm64                 randconfig-001-20231205   gcc  
arm64                 randconfig-002-20231204   clang
arm64                 randconfig-002-20231205   gcc  
arm64                 randconfig-003-20231204   clang
arm64                 randconfig-003-20231205   gcc  
arm64                 randconfig-004-20231204   clang
arm64                 randconfig-004-20231205   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231204   gcc  
csky                  randconfig-001-20231205   gcc  
csky                  randconfig-002-20231204   gcc  
csky                  randconfig-002-20231205   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231204   clang
hexagon               randconfig-002-20231204   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231204   clang
i386         buildonly-randconfig-002-20231204   clang
i386         buildonly-randconfig-003-20231204   clang
i386         buildonly-randconfig-004-20231204   clang
i386         buildonly-randconfig-005-20231204   clang
i386         buildonly-randconfig-006-20231204   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231204   clang
i386                  randconfig-002-20231204   clang
i386                  randconfig-003-20231204   clang
i386                  randconfig-004-20231204   clang
i386                  randconfig-005-20231204   clang
i386                  randconfig-006-20231204   clang
i386                  randconfig-011-20231204   gcc  
i386                  randconfig-011-20231205   clang
i386                  randconfig-012-20231204   gcc  
i386                  randconfig-012-20231205   clang
i386                  randconfig-013-20231204   gcc  
i386                  randconfig-013-20231205   clang
i386                  randconfig-014-20231204   gcc  
i386                  randconfig-014-20231205   clang
i386                  randconfig-015-20231204   gcc  
i386                  randconfig-015-20231205   clang
i386                  randconfig-016-20231204   gcc  
i386                  randconfig-016-20231205   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231204   gcc  
loongarch             randconfig-001-20231205   gcc  
loongarch             randconfig-002-20231204   gcc  
loongarch             randconfig-002-20231205   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                      maltaaprp_defconfig   clang
mips                         rt305x_defconfig   gcc  
mips                           xway_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231204   gcc  
nios2                 randconfig-001-20231205   gcc  
nios2                 randconfig-002-20231204   gcc  
nios2                 randconfig-002-20231205   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20231204   gcc  
parisc                randconfig-001-20231205   gcc  
parisc                randconfig-002-20231204   gcc  
parisc                randconfig-002-20231205   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc               randconfig-001-20231204   clang
powerpc               randconfig-001-20231205   gcc  
powerpc               randconfig-002-20231204   clang
powerpc               randconfig-002-20231205   gcc  
powerpc               randconfig-003-20231204   clang
powerpc               randconfig-003-20231205   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc                     tqm8555_defconfig   gcc  
powerpc                      tqm8xx_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20231204   clang
powerpc64             randconfig-001-20231205   gcc  
powerpc64             randconfig-002-20231204   clang
powerpc64             randconfig-002-20231205   gcc  
powerpc64             randconfig-003-20231204   clang
powerpc64             randconfig-003-20231205   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231204   clang
riscv                 randconfig-001-20231205   gcc  
riscv                 randconfig-002-20231204   clang
riscv                 randconfig-002-20231205   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231204   gcc  
s390                  randconfig-002-20231204   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20231204   gcc  
sh                    randconfig-001-20231205   gcc  
sh                    randconfig-002-20231204   gcc  
sh                    randconfig-002-20231205   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231204   gcc  
sparc64               randconfig-001-20231205   gcc  
sparc64               randconfig-002-20231204   gcc  
sparc64               randconfig-002-20231205   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231204   clang
um                    randconfig-001-20231205   gcc  
um                    randconfig-002-20231204   clang
um                    randconfig-002-20231205   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231204   clang
x86_64       buildonly-randconfig-001-20231205   gcc  
x86_64       buildonly-randconfig-002-20231204   clang
x86_64       buildonly-randconfig-002-20231205   gcc  
x86_64       buildonly-randconfig-003-20231204   clang
x86_64       buildonly-randconfig-003-20231205   gcc  
x86_64       buildonly-randconfig-004-20231204   clang
x86_64       buildonly-randconfig-004-20231205   gcc  
x86_64       buildonly-randconfig-005-20231204   clang
x86_64       buildonly-randconfig-005-20231205   gcc  
x86_64       buildonly-randconfig-006-20231204   clang
x86_64       buildonly-randconfig-006-20231205   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231204   gcc  
x86_64                randconfig-002-20231204   gcc  
x86_64                randconfig-003-20231204   gcc  
x86_64                randconfig-004-20231204   gcc  
x86_64                randconfig-005-20231204   gcc  
x86_64                randconfig-006-20231204   gcc  
x86_64                randconfig-011-20231204   clang
x86_64                randconfig-011-20231205   gcc  
x86_64                randconfig-012-20231204   clang
x86_64                randconfig-012-20231205   gcc  
x86_64                randconfig-013-20231204   clang
x86_64                randconfig-013-20231205   gcc  
x86_64                randconfig-014-20231204   clang
x86_64                randconfig-014-20231205   gcc  
x86_64                randconfig-015-20231204   clang
x86_64                randconfig-015-20231205   gcc  
x86_64                randconfig-016-20231204   clang
x86_64                randconfig-016-20231205   gcc  
x86_64                randconfig-071-20231204   clang
x86_64                randconfig-071-20231205   gcc  
x86_64                randconfig-072-20231204   clang
x86_64                randconfig-072-20231205   gcc  
x86_64                randconfig-073-20231204   clang
x86_64                randconfig-073-20231205   gcc  
x86_64                randconfig-074-20231204   clang
x86_64                randconfig-074-20231205   gcc  
x86_64                randconfig-075-20231204   clang
x86_64                randconfig-075-20231205   gcc  
x86_64                randconfig-076-20231204   clang
x86_64                randconfig-076-20231205   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231204   gcc  
xtensa                randconfig-001-20231205   gcc  
xtensa                randconfig-002-20231204   gcc  
xtensa                randconfig-002-20231205   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

