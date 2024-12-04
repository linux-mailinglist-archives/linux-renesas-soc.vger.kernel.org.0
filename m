Return-Path: <linux-renesas-soc+bounces-10909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E82929E3DE7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 16:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61CE7B30897
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 14:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8CE203718;
	Wed,  4 Dec 2024 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NY3dUcl4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FA120ADDD
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 14:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733323741; cv=none; b=Jf+L0kKCXFxI6B7VUY3yGBFpvIGUKZ2nXloGvyd8rWQBt0VoVLiD0t8UBx+qe+eqTBwaWndi9SQUZB8G9PWqSk9/Bn1JmzeQy3aQ9JPK24TNTB2/LqLQvjkjUN/juziABXG8UgVIgmZbGWNjubBAGJh6TmGyUYbBaYTEhWPtEy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733323741; c=relaxed/simple;
	bh=UNHnRrRlL9xiNOFu+pFZsgdm6QZUcNtq6dL67bk6/q4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KP30wBTCBzBrgOCIu5NmeHn9ESNt4pItXTFcDcOSJypjt0gDI4Y7uQ1c7Fv8f1tzSzZxqRCbRaaZIGGrLVoJbQ0jUyDgWwbRKNaXa0bnUfIyCk7rTsY2wBYuDuleZ9fdW0Na+YD7tTA8oPjfQCu5aP0ldoycU9anP80mIqqrEBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NY3dUcl4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733323739; x=1764859739;
  h=date:from:to:cc:subject:message-id;
  bh=UNHnRrRlL9xiNOFu+pFZsgdm6QZUcNtq6dL67bk6/q4=;
  b=NY3dUcl49Fn2voQERajZt3OFRxfcgObGTkM53YBmuMFYHmTWpNPk5RsB
   BxIUuExd+r0ETQ1Zl1EWcoh6o32gl+xhLXODA8Eg/ZCy5vJsDeFZbi0fk
   3l1vflodTJsG0FwaZZAoS/eEUcdAU/X+KjXRphCER/S/9at/S7NG6739b
   KHlD4KrB+tOcpHNwqg9+4sxuCiLRzNdilDpemEkbc5l0RrMQWMtkA+IaC
   T/jWw2GIsPrHGZ5ZIiqsKQUtNZHNtnyQdV9ZchCL9Kz5yGxnFi8WNqg86
   tpdK0mN8d5xDSrRXA0vgKadVIrWAP7r18uLmJiFTYjNfil3XlAHYojKLs
   g==;
X-CSE-ConnectionGUID: 1ttQTwBKTb+idkhV2NgpjA==
X-CSE-MsgGUID: 5CA2i4LIT36WObtJ/aWmvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44970907"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44970907"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 06:48:59 -0800
X-CSE-ConnectionGUID: Dk6/BGSCT3mxyT4t/JuZeg==
X-CSE-MsgGUID: WlaHnJ/LTFqi7kQLFQfmuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93675248"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Dec 2024 06:48:58 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIqgS-000396-0h;
	Wed, 04 Dec 2024 14:48:56 +0000
Date: Wed, 04 Dec 2024 22:45:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/overlays] BUILD SUCCESS
 bcbede4b77f674b6140af1faaab0308872bc7136
Message-ID: <202412042223.vTBVThK9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/overlays
branch HEAD: bcbede4b77f674b6140af1faaab0308872bc7136  kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used

elapsed time: 726m

configs tested: 183
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                            randconfig-001    clang-20
arc                   randconfig-001-20241204    clang-14
arc                            randconfig-002    clang-20
arc                   randconfig-002-20241204    clang-14
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g4_defconfig    clang-20
arm                         at91_dt_defconfig    clang-20
arm                     davinci_all_defconfig    clang-20
arm                          ep93xx_defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-20
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                        keystone_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-20
arm                          moxart_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                          pxa3xx_defconfig    clang-15
arm                          pxa3xx_defconfig    gcc-14.2.0
arm                            qcom_defconfig    clang-15
arm                            qcom_defconfig    clang-20
arm                            randconfig-001    clang-20
arm                   randconfig-001-20241204    clang-14
arm                            randconfig-002    clang-20
arm                   randconfig-002-20241204    clang-14
arm                            randconfig-003    clang-20
arm                   randconfig-003-20241204    clang-14
arm                            randconfig-004    clang-20
arm                   randconfig-004-20241204    clang-14
arm                             rpc_defconfig    gcc-14.2.0
arm                        shmobile_defconfig    clang-18
arm                        shmobile_defconfig    gcc-14.2.0
arm                          sp7021_defconfig    clang-20
arm                           spitz_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                          randconfig-001    clang-20
arm64                 randconfig-001-20241204    clang-14
arm64                          randconfig-002    clang-20
arm64                 randconfig-002-20241204    clang-14
arm64                          randconfig-003    clang-20
arm64                 randconfig-003-20241204    clang-14
arm64                          randconfig-004    clang-20
arm64                 randconfig-004-20241204    clang-14
csky                             alldefconfig    clang-20
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386                 buildonly-randconfig-001    gcc-12
i386        buildonly-randconfig-001-20241204    gcc-12
i386                 buildonly-randconfig-002    gcc-12
i386        buildonly-randconfig-002-20241204    gcc-12
i386                 buildonly-randconfig-003    gcc-12
i386        buildonly-randconfig-003-20241204    gcc-12
i386                 buildonly-randconfig-004    gcc-12
i386        buildonly-randconfig-004-20241204    gcc-12
i386                 buildonly-randconfig-005    gcc-12
i386        buildonly-randconfig-005-20241204    gcc-12
i386                 buildonly-randconfig-006    gcc-12
i386        buildonly-randconfig-006-20241204    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    clang-18
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    clang-18
m68k                          atari_defconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
m68k                            q40_defconfig    clang-15
microblaze                       alldefconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-20
mips                          ath79_defconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-18
mips                           ci20_defconfig    clang-18
mips                          eyeq5_defconfig    gcc-14.2.0
mips                          eyeq6_defconfig    clang-20
mips                          eyeq6_defconfig    gcc-14.2.0
mips                           ip22_defconfig    clang-15
mips                           ip22_defconfig    gcc-14.2.0
mips                           ip28_defconfig    gcc-14.2.0
mips                           ip32_defconfig    gcc-14.2.0
mips                           jazz_defconfig    clang-20
mips                     loongson1b_defconfig    clang-15
mips                          rb532_defconfig    clang-18
mips                         rt305x_defconfig    clang-20
mips                        vocore2_defconfig    clang-15
mips                           xway_defconfig    clang-20
nios2                         10m50_defconfig    gcc-14.2.0
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                       virt_defconfig    clang-20
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    clang-15
powerpc                    adder875_defconfig    clang-15
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    clang-15
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    clang-20
powerpc                 linkstation_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    clang-18
powerpc                   motionpro_defconfig    gcc-14.2.0
powerpc                 mpc8313_rdb_defconfig    clang-20
powerpc                 mpc8315_rdb_defconfig    clang-15
powerpc                  mpc866_ads_defconfig    clang-20
powerpc                  mpc885_ads_defconfig    clang-20
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc                     ppa8548_defconfig    clang-20
powerpc                     skiroot_defconfig    gcc-14.2.0
powerpc                  storcenter_defconfig    clang-15
powerpc                     stx_gp3_defconfig    clang-20
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-20
powerpc                         wii_defconfig    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                    nommu_k210_defconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    clang-20
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                          landisk_defconfig    clang-20
sh                          rsk7264_defconfig    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                          sdk7786_defconfig    clang-20
sh                           se7343_defconfig    clang-20
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7712_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                           se7751_defconfig    clang-20
sh                           se7780_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    clang-20
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                            shmin_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc                       sparc64_defconfig    clang-15
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                             i386_defconfig    gcc-14.2.0
um                           x86_64_defconfig    gcc-14.2.0
x86_64      buildonly-randconfig-001-20241204    clang-19
x86_64      buildonly-randconfig-002-20241204    clang-19
x86_64      buildonly-randconfig-003-20241204    clang-19
x86_64      buildonly-randconfig-004-20241204    clang-19
x86_64      buildonly-randconfig-005-20241204    clang-19
x86_64      buildonly-randconfig-006-20241204    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  nommu_kc705_defconfig    clang-20
xtensa                    smp_lx200_defconfig    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

