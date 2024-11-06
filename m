Return-Path: <linux-renesas-soc+bounces-10377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A719BF89C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 22:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D59C0283BAD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 21:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749BB204958;
	Wed,  6 Nov 2024 21:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHW0xPti"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E0B20CCE3
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 21:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730929303; cv=none; b=N6y+VQSTPXL7W2GzBPpT0FEyBCI+Q8bMEgV2hU3G2ISuuMSFjZxFHmUSONX1yH8SE8D9XafqHBJzakWZhXwuSYtGcuxIxLt5y28Oup7je9QUfmpQXTOH/3I2rK8m0b8f8Xgvg4D51K1zz9otMho5fx0+zSyaDyAW+KH9U+FFMp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730929303; c=relaxed/simple;
	bh=e1Cz4k14h6F4XOgY4ZXIcFCdNtJArqHRsDgjmiNolxY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lYoHlMa3CmCrYY5gZuMctSo5VELz/MnJiifd4tb7WFtTiZzoWzxBUgpQN4PUW4+AbkYDne7Ooscxp27DHr8i1fg2SLYv8KYJ+qMGlf0Z8dKWco/NzUH9sL8d+w+2//HhQy8P0VomDrhCXjepCVjRcKKVZGncEVQZ0NHD/hxLdHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHW0xPti; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730929301; x=1762465301;
  h=date:from:to:cc:subject:message-id;
  bh=e1Cz4k14h6F4XOgY4ZXIcFCdNtJArqHRsDgjmiNolxY=;
  b=aHW0xPtisnV/n5Ia1SBms/eCs7xId71VY80dTUIrzIeLTssmCbZbiiG7
   dcOGEdaN8+Du1RLqPxH/6TgZKGinCkwfjdlU0yHu4N4eo/O7zQYe3BO4p
   VAqpKe2RMpIxj5Uew+OWN1zCONxmI20uFrjnA/qnU+wgDrKU4jS2PPIFx
   5AiLbczse9wBVbpKgfF+P+qpZvhioCXSiBWILNxQq3dYwIdZ2OynH8Ibo
   nRhqcZTWTiMoS7uxG3POiJjlOcgDDUPr3ATT/UBDbazWy+qX22/1nC986
   +zv6eCAs3h4QLN9gvbarK8/HIaYZxdzCOgZqAG1Sl/23Xyvwqpkq6VHyP
   g==;
X-CSE-ConnectionGUID: yru9h462QXSqKg8kTeZFkg==
X-CSE-MsgGUID: vAa7hlSTSz6iUcDVLB2i6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48211153"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48211153"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 13:41:40 -0800
X-CSE-ConnectionGUID: HpAIwO9sSJaOeF1CynOGFA==
X-CSE-MsgGUID: m4YF12IrSV2NT1G/2WPQkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="84879506"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Nov 2024 13:41:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8nmR-000pS2-15;
	Wed, 06 Nov 2024 21:41:35 +0000
Date: Thu, 07 Nov 2024 05:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 3b42450ce1771c7b11d8f3563f4bbfe9b8d26611
Message-ID: <202411070543.8NARnur6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 3b42450ce1771c7b11d8f3563f4bbfe9b8d26611  clk: renesas: vbattb: Add VBATTB clock driver

elapsed time: 805m

configs tested: 233
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    clang-20
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20241106    gcc-14.2.0
arc                   randconfig-002-20241106    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-20
arm                   randconfig-001-20241106    gcc-14.2.0
arm                   randconfig-002-20241106    gcc-14.2.0
arm                   randconfig-003-20241106    gcc-14.2.0
arm                   randconfig-004-20241106    gcc-14.2.0
arm                           sama5_defconfig    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    clang-20
arm64                 randconfig-001-20241106    gcc-14.2.0
arm64                 randconfig-002-20241106    gcc-14.2.0
arm64                 randconfig-003-20241106    gcc-14.2.0
arm64                 randconfig-004-20241106    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241106    gcc-14.2.0
csky                  randconfig-002-20241106    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241106    gcc-14.2.0
hexagon               randconfig-002-20241106    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241106    gcc-12
i386        buildonly-randconfig-002-20241106    gcc-12
i386        buildonly-randconfig-003-20241106    gcc-12
i386        buildonly-randconfig-004-20241106    gcc-12
i386        buildonly-randconfig-005-20241106    gcc-12
i386        buildonly-randconfig-006-20241106    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241106    gcc-12
i386                  randconfig-002-20241106    gcc-12
i386                  randconfig-003-20241106    gcc-12
i386                  randconfig-004-20241106    gcc-12
i386                  randconfig-005-20241106    gcc-12
i386                  randconfig-006-20241106    gcc-12
i386                  randconfig-011-20241106    gcc-12
i386                  randconfig-012-20241106    gcc-12
i386                  randconfig-013-20241106    gcc-12
i386                  randconfig-014-20241106    gcc-12
i386                  randconfig-015-20241106    gcc-12
i386                  randconfig-016-20241106    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241106    gcc-14.2.0
loongarch             randconfig-002-20241106    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    clang-20
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                            gpr_defconfig    gcc-14.2.0
mips                        vocore2_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241106    gcc-14.2.0
nios2                 randconfig-002-20241106    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    clang-20
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241106    gcc-14.2.0
parisc                randconfig-002-20241106    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    gcc-14.2.0
powerpc                        cell_defconfig    clang-20
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                   currituck_defconfig    clang-20
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    clang-20
powerpc                     mpc5200_defconfig    clang-20
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc                      pasemi_defconfig    clang-20
powerpc                      ppc64e_defconfig    clang-20
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241106    gcc-14.2.0
powerpc               randconfig-002-20241106    gcc-14.2.0
powerpc               randconfig-003-20241106    gcc-14.2.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc                     tqm8555_defconfig    clang-20
powerpc                      tqm8xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241106    gcc-14.2.0
powerpc64             randconfig-002-20241106    gcc-14.2.0
powerpc64             randconfig-003-20241106    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    gcc-14.2.0
riscv                 randconfig-001-20241106    gcc-14.2.0
riscv                 randconfig-002-20241106    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241106    gcc-14.2.0
s390                  randconfig-002-20241106    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    clang-20
sh                    randconfig-001-20241106    gcc-14.2.0
sh                    randconfig-002-20241106    gcc-14.2.0
sh                           se7712_defconfig    clang-20
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    clang-20
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241106    gcc-14.2.0
sparc64               randconfig-002-20241106    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241106    gcc-14.2.0
um                    randconfig-002-20241106    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241106    gcc-11
x86_64      buildonly-randconfig-001-20241107    clang-19
x86_64      buildonly-randconfig-002-20241106    gcc-11
x86_64      buildonly-randconfig-002-20241107    clang-19
x86_64      buildonly-randconfig-003-20241106    gcc-11
x86_64      buildonly-randconfig-003-20241107    clang-19
x86_64      buildonly-randconfig-004-20241106    gcc-11
x86_64      buildonly-randconfig-004-20241107    clang-19
x86_64      buildonly-randconfig-005-20241106    gcc-11
x86_64      buildonly-randconfig-005-20241107    clang-19
x86_64      buildonly-randconfig-006-20241106    gcc-11
x86_64      buildonly-randconfig-006-20241107    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241106    gcc-11
x86_64                randconfig-001-20241107    clang-19
x86_64                randconfig-002-20241106    gcc-11
x86_64                randconfig-002-20241107    clang-19
x86_64                randconfig-003-20241106    gcc-11
x86_64                randconfig-003-20241107    clang-19
x86_64                randconfig-004-20241106    gcc-11
x86_64                randconfig-004-20241107    clang-19
x86_64                randconfig-005-20241106    gcc-11
x86_64                randconfig-005-20241107    clang-19
x86_64                randconfig-006-20241106    gcc-11
x86_64                randconfig-006-20241107    clang-19
x86_64                randconfig-011-20241106    gcc-11
x86_64                randconfig-011-20241107    clang-19
x86_64                randconfig-012-20241106    gcc-11
x86_64                randconfig-012-20241107    clang-19
x86_64                randconfig-013-20241106    gcc-11
x86_64                randconfig-013-20241107    clang-19
x86_64                randconfig-014-20241106    gcc-11
x86_64                randconfig-014-20241107    clang-19
x86_64                randconfig-015-20241106    gcc-11
x86_64                randconfig-015-20241107    clang-19
x86_64                randconfig-016-20241106    gcc-11
x86_64                randconfig-016-20241107    clang-19
x86_64                randconfig-071-20241106    gcc-11
x86_64                randconfig-071-20241107    clang-19
x86_64                randconfig-072-20241106    gcc-11
x86_64                randconfig-072-20241107    clang-19
x86_64                randconfig-073-20241106    gcc-11
x86_64                randconfig-073-20241107    clang-19
x86_64                randconfig-074-20241106    gcc-11
x86_64                randconfig-074-20241107    clang-19
x86_64                randconfig-075-20241106    gcc-11
x86_64                randconfig-075-20241107    clang-19
x86_64                randconfig-076-20241106    gcc-11
x86_64                randconfig-076-20241107    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241106    gcc-14.2.0
xtensa                randconfig-002-20241106    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

