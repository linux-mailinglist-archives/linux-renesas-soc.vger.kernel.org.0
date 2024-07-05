Return-Path: <linux-renesas-soc+bounces-7129-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFDF928C1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2024 18:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0A791C21EF1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2024 16:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E0F145B10;
	Fri,  5 Jul 2024 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mu2RBTrG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651362B9B9
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jul 2024 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720196040; cv=none; b=OogZ5UF2NsMgWDQIH3RgOm1Uxq4YidGB85opEbcQ1024rLtod0NdPzJOw4WLwf42Oc3LZCK3551mg9A/iPwT28sTJh60i/mv6B9raI+dxcVQxHPSUKVvViJvVG7zlp5dTcJI53QS6STLh0oVUO9r2mKMamn2c8DQtWJOjkW1GdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720196040; c=relaxed/simple;
	bh=ZKhL9rtiL46SWZwkZxyQB80neG6YGfneHGj0shcN044=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t7Rv/gQnXX7rp+jFtZxtWv2eErYSjKlFW94oBXzwBpUG7S1R07x12zw6P0zeozBbRy9mdVUAEWxBnf5N0KfCpyo7Bv/sWn4jjeE7Ey4h1Ip6MgioMQXmg5vLHMHsV4+eaCbSLtBDOzvd8fsumHUMBNrmaT74SZeZDPd7+fbxdFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mu2RBTrG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720196038; x=1751732038;
  h=date:from:to:cc:subject:message-id;
  bh=ZKhL9rtiL46SWZwkZxyQB80neG6YGfneHGj0shcN044=;
  b=mu2RBTrGoVij4uyJjyLo8dlpWoeoyPWwmmwX6871STVO2GsDF6JnQPBI
   PXC+U8nSopHpqBP/g1XX8iHYp8KNJlxdmSg85x9ZcmMISX+gvROxaXqPM
   y3HHVhF7EBLTJkv2OzLQzkb5Ng2GQZ+76pfUNRRwvACi7fy3/AYIYecCC
   PbZKmU0IBJ/7JyCbEa2S9nD0DpnTzy7ZCbl8yHHpwCooX93tP0wjCrsK3
   Ksj2GtLZ/AvcQPTkkiq7fi0Du5Fa4pXRyLfhADarwnaMscZe14XBhLqpt
   DUn9AfpVTKDPmhTrGOZN5V8tyKbaCRdUt1JwMgqXTB7Tvsi3zauZrkfZe
   g==;
X-CSE-ConnectionGUID: gBUZbDqSRKOYtuMKwXLEAg==
X-CSE-MsgGUID: 7xX1LzlJTZG065AP5K/tyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28883917"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="28883917"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 09:13:58 -0700
X-CSE-ConnectionGUID: bG3mpOY7RiS4hrcVx4z7hQ==
X-CSE-MsgGUID: Fz6gh1NmTgW1Fja3FC1QVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="46800953"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jul 2024 09:13:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPlZK-000SZW-1k;
	Fri, 05 Jul 2024 16:13:54 +0000
Date: Sat, 06 Jul 2024 00:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 2453e858e945e5e2fa8da9fde8584995e7dd17d1
Message-ID: <202407060006.zqFC5SSs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: 2453e858e945e5e2fa8da9fde8584995e7dd17d1  pinctrl: renesas: rzg2l: Support output enable on RZ/G2L

elapsed time: 1333m

configs tested: 196
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     haps_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240705   gcc-13.2.0
arc                   randconfig-002-20240705   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         axm55xx_defconfig   gcc-13.2.0
arm                     davinci_all_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-13.2.0
arm                          pxa3xx_defconfig   gcc-13.2.0
arm                   randconfig-001-20240705   gcc-13.2.0
arm                   randconfig-002-20240705   gcc-13.2.0
arm                   randconfig-003-20240705   gcc-13.2.0
arm                   randconfig-004-20240705   gcc-13.2.0
arm                          sp7021_defconfig   gcc-13.2.0
arm                           u8500_defconfig   gcc-13.2.0
arm                         vf610m4_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240705   gcc-13.2.0
arm64                 randconfig-002-20240705   gcc-13.2.0
arm64                 randconfig-003-20240705   gcc-13.2.0
arm64                 randconfig-004-20240705   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240705   gcc-13.2.0
csky                  randconfig-002-20240705   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240705   gcc-13
i386         buildonly-randconfig-002-20240705   gcc-13
i386         buildonly-randconfig-003-20240705   gcc-13
i386         buildonly-randconfig-004-20240705   gcc-13
i386         buildonly-randconfig-005-20240705   gcc-13
i386         buildonly-randconfig-006-20240705   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240705   gcc-13
i386                  randconfig-002-20240705   gcc-13
i386                  randconfig-003-20240705   gcc-13
i386                  randconfig-004-20240705   gcc-13
i386                  randconfig-005-20240705   gcc-13
i386                  randconfig-006-20240705   gcc-13
i386                  randconfig-011-20240705   gcc-13
i386                  randconfig-012-20240705   gcc-13
i386                  randconfig-013-20240705   gcc-13
i386                  randconfig-014-20240705   gcc-13
i386                  randconfig-015-20240705   gcc-13
i386                  randconfig-016-20240705   gcc-13
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240705   gcc-13.2.0
loongarch             randconfig-002-20240705   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                          hp300_defconfig   gcc-13.2.0
m68k                            mac_defconfig   gcc-13.2.0
m68k                          sun3x_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                  decstation_64_defconfig   gcc-13.2.0
mips                     decstation_defconfig   gcc-13.2.0
mips                     loongson1c_defconfig   gcc-13.2.0
mips                          rb532_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240705   gcc-13.2.0
nios2                 randconfig-002-20240705   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240705   gcc-13.2.0
parisc                randconfig-002-20240705   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   gcc-13.2.0
powerpc                    amigaone_defconfig   gcc-13.2.0
powerpc                   bluestone_defconfig   gcc-13.2.0
powerpc                      cm5200_defconfig   gcc-13.2.0
powerpc                   currituck_defconfig   gcc-13.2.0
powerpc                          g5_defconfig   gcc-13.2.0
powerpc                    ge_imp3a_defconfig   gcc-13.2.0
powerpc                  iss476-smp_defconfig   gcc-13.2.0
powerpc                 mpc8313_rdb_defconfig   gcc-13.2.0
powerpc               mpc834x_itxgp_defconfig   gcc-13.2.0
powerpc                      pasemi_defconfig   gcc-13.2.0
powerpc                      pcm030_defconfig   gcc-13.2.0
powerpc                      pmac32_defconfig   gcc-13.2.0
powerpc                     ppa8548_defconfig   gcc-13.2.0
powerpc                       ppc64_defconfig   gcc-13.2.0
powerpc                      ppc64e_defconfig   gcc-13.2.0
powerpc                     rainier_defconfig   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-13.2.0
powerpc                     tqm8548_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240705   gcc-13.2.0
powerpc64             randconfig-002-20240705   gcc-13.2.0
powerpc64             randconfig-003-20240705   gcc-13.2.0
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240705   gcc-13.2.0
riscv                 randconfig-002-20240705   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240705   gcc-13.2.0
s390                  randconfig-002-20240705   gcc-13.2.0
s390                       zfcpdump_defconfig   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                          lboxre2_defconfig   gcc-13.2.0
sh                    randconfig-001-20240705   gcc-13.2.0
sh                    randconfig-002-20240705   gcc-13.2.0
sh                   rts7751r2dplus_defconfig   gcc-13.2.0
sh                            shmin_defconfig   gcc-13.2.0
sh                          urquell_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240705   gcc-13.2.0
sparc64               randconfig-002-20240705   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240705   gcc-13.2.0
um                    randconfig-002-20240705   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240705   gcc-7
x86_64       buildonly-randconfig-002-20240705   gcc-7
x86_64       buildonly-randconfig-003-20240705   gcc-7
x86_64       buildonly-randconfig-004-20240705   gcc-7
x86_64       buildonly-randconfig-005-20240705   gcc-7
x86_64       buildonly-randconfig-006-20240705   gcc-7
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240705   gcc-7
x86_64                randconfig-002-20240705   gcc-7
x86_64                randconfig-003-20240705   gcc-7
x86_64                randconfig-004-20240705   gcc-7
x86_64                randconfig-005-20240705   gcc-7
x86_64                randconfig-006-20240705   gcc-7
x86_64                randconfig-011-20240705   gcc-7
x86_64                randconfig-012-20240705   gcc-7
x86_64                randconfig-013-20240705   gcc-7
x86_64                randconfig-014-20240705   gcc-7
x86_64                randconfig-015-20240705   gcc-7
x86_64                randconfig-016-20240705   gcc-7
x86_64                randconfig-071-20240705   gcc-7
x86_64                randconfig-072-20240705   gcc-7
x86_64                randconfig-073-20240705   gcc-7
x86_64                randconfig-074-20240705   gcc-7
x86_64                randconfig-075-20240705   gcc-7
x86_64                randconfig-076-20240705   gcc-7
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                       common_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240705   gcc-13.2.0
xtensa                randconfig-002-20240705   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

