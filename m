Return-Path: <linux-renesas-soc+bounces-10888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 086AA9E33FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 08:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6687167CC7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 07:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6059717C7B6;
	Wed,  4 Dec 2024 07:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXp+5bVV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7A4184
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 07:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733296757; cv=none; b=XYPCn6sMtG3J8ffxw7RztSUC4tZ5XbKcaT/QkPNncJNFVF5SjEFTU4E0e87vmKM4ElwQ7ZJHR2ndV/kp4jaosb++V9ymig7DZC7/YRIaWrDalqL7grfWgORpT2L0WrTrS2Pxx1AmeBpmM+8MnhuumvtEDOipQbPNCVbhSz7u+BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733296757; c=relaxed/simple;
	bh=VWXVNDrpmFcfdrQvYIhPYgD/coQHR1bPWKC4HCAchWU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=urCqS8u40FnoqwGE/5+h+DsRxBD/3ovRpIYNuIrjuIEc80sRoZrefJbZ8+pdBC0qf5/wLJx3TGwGRMCzT1rUydDqjhg/YpZLxuENW2pERX7QpwukUx/u21NKgpKC/XvvM+wU0pWqPtlUnPVv09IMZ4diMA1BnzuDyNJkoT6csU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXp+5bVV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733296755; x=1764832755;
  h=date:from:to:cc:subject:message-id;
  bh=VWXVNDrpmFcfdrQvYIhPYgD/coQHR1bPWKC4HCAchWU=;
  b=eXp+5bVV1rs+Rr1u4iEOARHZhs2l7jnSkspeLDxSQ7MaRqb93jXaX4+y
   mpzKDoJdwcJk++vBAf4ZH/7wAn02C14WNF5GIi10/70w/hG+Had3ucnLl
   0u9OguqwI2bYchnTwju2zud9/VTv8okpYsGw/O5kNKQoUSG+x8XKBjPw0
   f7yJeSMIxHoDyvemMCIHZLNI/MlQJs8XgWUaq6iPzaTLHee2/vSqQr5xS
   b8MSABUQzbgwU9I07lI3OiwjPbDjg+eObpdQI955vrNsvDfOrLU8XYZ0Q
   5BOU9daWQpRbYEBbg+5XirlhU4SOXCGxpkQWLY8kucM6jQlBySDQCXh4s
   Q==;
X-CSE-ConnectionGUID: /jXLNWvxQruq0FGui7TTNw==
X-CSE-MsgGUID: hJn4jCfKQN6vcv3frlr3UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44025038"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44025038"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:19:15 -0800
X-CSE-ConnectionGUID: qonk/OZsQ7WZm/oCUUazfg==
X-CSE-MsgGUID: c8sflPPrQk2dE04ZsZPjZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="98663968"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Dec 2024 23:19:14 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIjfD-0002hT-00;
	Wed, 04 Dec 2024 07:19:11 +0000
Date: Wed, 04 Dec 2024 15:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 318bf568fbcce733499dd3584c3fd7bba5cedbb7
Message-ID: <202412041550.8zE3nto8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 318bf568fbcce733499dd3584c3fd7bba5cedbb7  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1290m

configs tested: 163
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                     haps_hs_smp_defconfig    gcc-13.2.0
arc                        nsimosci_defconfig    gcc-13.2.0
arc                   randconfig-001-20241203    gcc-13.2.0
arc                   randconfig-002-20241203    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g4_defconfig    clang-20
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-20
arm                         at91_dt_defconfig    clang-20
arm                     davinci_all_defconfig    clang-20
arm                           h3600_defconfig    clang-20
arm                       imx_v6_v7_defconfig    clang-20
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-20
arm                          pxa910_defconfig    clang-20
arm                            qcom_defconfig    clang-20
arm                   randconfig-001-20241203    clang-20
arm                   randconfig-002-20241203    gcc-14.2.0
arm                   randconfig-003-20241203    clang-20
arm                   randconfig-004-20241203    clang-20
arm                        shmobile_defconfig    gcc-14.2.0
arm                         socfpga_defconfig    gcc-14.2.0
arm                          sp7021_defconfig    clang-20
arm                        spear3xx_defconfig    clang-20
arm                           spitz_defconfig    gcc-14.2.0
arm                           stm32_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241203    gcc-14.2.0
arm64                 randconfig-002-20241203    gcc-14.2.0
arm64                 randconfig-003-20241203    gcc-14.2.0
arm64                 randconfig-004-20241203    clang-20
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386                 buildonly-randconfig-001    gcc-12
i386        buildonly-randconfig-001-20241203    gcc-12
i386                 buildonly-randconfig-002    gcc-12
i386        buildonly-randconfig-002-20241203    gcc-12
i386                 buildonly-randconfig-003    gcc-12
i386        buildonly-randconfig-003-20241203    clang-19
i386                 buildonly-randconfig-004    gcc-12
i386        buildonly-randconfig-004-20241203    clang-19
i386                 buildonly-randconfig-005    gcc-12
i386        buildonly-randconfig-005-20241203    clang-19
i386                 buildonly-randconfig-006    gcc-12
i386        buildonly-randconfig-006-20241203    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-20
mips                          eyeq6_defconfig    clang-14
mips                           ip22_defconfig    gcc-14.2.0
mips                           ip32_defconfig    gcc-14.2.0
mips                         rt305x_defconfig    clang-20
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                         10m50_defconfig    gcc-14.2.0
nios2                         3c120_defconfig    gcc-14.2.0
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
powerpc                     akebono_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-20
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    clang-20
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    clang-20
powerpc                 mpc8313_rdb_defconfig    clang-20
powerpc                  mpc866_ads_defconfig    clang-20
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    clang-20
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc                     stx_gp3_defconfig    clang-20
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                    nommu_k210_defconfig    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                          landisk_defconfig    clang-20
sh                          landisk_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    clang-20
sh                          sdk7780_defconfig    gcc-14.2.0
sh                          sdk7786_defconfig    gcc-14.2.0
sh                           se7343_defconfig    gcc-14.2.0
sh                           se7619_defconfig    clang-20
sh                           se7712_defconfig    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sh                           se7751_defconfig    clang-20
sh                           se7780_defconfig    gcc-14.2.0
sh                             sh03_defconfig    clang-20
sh                            shmin_defconfig    clang-20
sh                            shmin_defconfig    gcc-14.2.0
sh                            titan_defconfig    clang-20
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               alldefconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                             i386_defconfig    gcc-14.2.0
x86_64      buildonly-randconfig-001-20241203    clang-19
x86_64      buildonly-randconfig-001-20241204    clang-19
x86_64      buildonly-randconfig-002-20241203    clang-19
x86_64      buildonly-randconfig-002-20241204    clang-19
x86_64      buildonly-randconfig-003-20241203    clang-19
x86_64      buildonly-randconfig-003-20241204    clang-19
x86_64      buildonly-randconfig-004-20241203    gcc-11
x86_64      buildonly-randconfig-004-20241204    clang-19
x86_64      buildonly-randconfig-005-20241203    gcc-12
x86_64      buildonly-randconfig-005-20241204    clang-19
x86_64      buildonly-randconfig-006-20241203    clang-19
x86_64      buildonly-randconfig-006-20241204    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  nommu_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

