Return-Path: <linux-renesas-soc+bounces-1080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C33813B25
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 20:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C34092848BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 19:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23BA6A006;
	Thu, 14 Dec 2023 19:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eh8hgm6b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A7D697BC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 19:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702583892; x=1734119892;
  h=date:from:to:cc:subject:message-id;
  bh=bRYMZmj9NmFnOxyzl4NwS/pIbwmdEf6xh/LEVtG00C4=;
  b=Eh8hgm6bOk3dQh8IHaPUSdn2a25/+X1NYJbZfhcotnxUvTOnsCclzVTw
   Boa/yHv/NhK2Ln3JOBMoIuTfYus+rP3d5WVw5viWyp3mHGJJLjJmriEoJ
   I9HatMf25PS23PACP1IDTZW1yRhd9jC3zWNBZ2OI3OptIwOP4gfFtchaT
   h0lgXaMsNoSxxmT/PLoxuMxUdcX3ZOkTnn3M6Diu2xX9QtcT9w8btoUfE
   nx0jJeNzBEIIvzZ49ZbE8P6CL55t5YLTVsFl75enukw//Oqee/gG8kfnt
   Oh8lhqPOawiXgAMIcahmZySz0JI6wBoGlSmkLtHH6CdVgCAou5Rkdfz6H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="481370904"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="481370904"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 11:58:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="840395870"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="840395870"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Dec 2023 11:58:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDrqS-000MX4-0u;
	Thu, 14 Dec 2023 19:58:08 +0000
Date: Fri, 15 Dec 2023 03:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.8] BUILD SUCCESS
 31b2daea07643d8b83d62c670c76d95acca84f06
Message-ID: <202312150347.CCjw23bS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.8
branch HEAD: 31b2daea07643d8b83d62c670c76d95acca84f06  soc: renesas: Make RZ/Five depend on !DMA_DIRECT_REMAP

elapsed time: 1471m

configs tested: 199
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231214   gcc  
arc                   randconfig-002-20231214   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                               allnoconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                      footbridge_defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                       imx_v6_v7_defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                   randconfig-001-20231214   gcc  
arm                   randconfig-002-20231214   gcc  
arm                   randconfig-003-20231214   gcc  
arm                   randconfig-004-20231214   gcc  
arm                           stm32_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231214   gcc  
arm64                 randconfig-002-20231214   gcc  
arm64                 randconfig-003-20231214   gcc  
arm64                 randconfig-004-20231214   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231214   gcc  
csky                  randconfig-002-20231214   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231214   gcc  
i386         buildonly-randconfig-002-20231214   gcc  
i386         buildonly-randconfig-003-20231214   gcc  
i386         buildonly-randconfig-004-20231214   gcc  
i386         buildonly-randconfig-005-20231214   gcc  
i386         buildonly-randconfig-006-20231214   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231214   gcc  
i386                  randconfig-002-20231214   gcc  
i386                  randconfig-003-20231214   gcc  
i386                  randconfig-004-20231214   gcc  
i386                  randconfig-005-20231214   gcc  
i386                  randconfig-006-20231214   gcc  
i386                  randconfig-011-20231214   clang
i386                  randconfig-012-20231214   clang
i386                  randconfig-013-20231214   clang
i386                  randconfig-014-20231214   clang
i386                  randconfig-015-20231214   clang
i386                  randconfig-016-20231214   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231214   gcc  
loongarch             randconfig-002-20231214   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231214   gcc  
nios2                 randconfig-002-20231214   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231214   gcc  
parisc                randconfig-002-20231214   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                 linkstation_defconfig   gcc  
powerpc                      makalu_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc               randconfig-001-20231214   gcc  
powerpc               randconfig-002-20231214   gcc  
powerpc               randconfig-003-20231214   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
powerpc64             randconfig-001-20231214   gcc  
powerpc64             randconfig-002-20231214   gcc  
powerpc64             randconfig-003-20231214   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20231214   gcc  
riscv                 randconfig-002-20231214   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20231214   gcc  
sh                    randconfig-002-20231214   gcc  
sh                          rsk7203_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231214   gcc  
sparc64               randconfig-002-20231214   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231214   gcc  
um                    randconfig-002-20231214   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231214   gcc  
x86_64       buildonly-randconfig-002-20231214   gcc  
x86_64       buildonly-randconfig-003-20231214   gcc  
x86_64       buildonly-randconfig-004-20231214   gcc  
x86_64       buildonly-randconfig-005-20231214   gcc  
x86_64       buildonly-randconfig-006-20231214   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20231214   gcc  
x86_64                randconfig-012-20231214   gcc  
x86_64                randconfig-013-20231214   gcc  
x86_64                randconfig-014-20231214   gcc  
x86_64                randconfig-015-20231214   gcc  
x86_64                randconfig-016-20231214   gcc  
x86_64                randconfig-071-20231214   gcc  
x86_64                randconfig-072-20231214   gcc  
x86_64                randconfig-073-20231214   gcc  
x86_64                randconfig-074-20231214   gcc  
x86_64                randconfig-075-20231214   gcc  
x86_64                randconfig-076-20231214   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20231214   gcc  
xtensa                randconfig-002-20231214   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

