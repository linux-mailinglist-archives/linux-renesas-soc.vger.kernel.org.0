Return-Path: <linux-renesas-soc+bounces-17526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C62AC49ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 10:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6487617A90F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 08:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D66248F42;
	Tue, 27 May 2025 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1p4m0Lq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6E81FC7C5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748333509; cv=none; b=tRwY4PGzYBH5K5YkbXfdVhgy2CeUZ/4KlXknY20q/HtjBU+ddNH3WpyxSUKPGwK0ywD70m7ZaRVQ/48C5CCgn8gYTzr2j1rf0BjvvprqAEO2Fvpua9I8sil9bizZTFgm8u4tWwc18ZCRCxCQomd4h38/ZyoLwrSOtHVHcRlbSfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748333509; c=relaxed/simple;
	bh=ZX/UkOvBrXouv/Gj2UEYFRnFjfnaqUD/oOadFf+zmu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qzPEAxsVNuEkHhL2GKz2KdWAxyMiZzMbw5hApN5wYsW9UfQW8L4t+6iyzBNO22mBBWb8Nas7nRwct6/QCnXObAPHc6x2dnxVdvk5Klu8FZPTYjq+5tTcoj+b3jm31Xbayhd0JsTy8aCu3v9s5G9S7TyK+xTlHCOBwoVowSiP1bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1p4m0Lq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748333507; x=1779869507;
  h=date:from:to:cc:subject:message-id;
  bh=ZX/UkOvBrXouv/Gj2UEYFRnFjfnaqUD/oOadFf+zmu4=;
  b=Q1p4m0Lq/iV5QJO/UQA3wCqFPglOIks2PK/wOcVEdZjJMV5eau1Zugp4
   fSIgkHNjaUAN7BXBOcly35IyCOy97JeEWU50futqrTalCDmQB2KrmHKvu
   5H3aRWNI5+w8vizvQOYiBMTX6mGKX0am3HETvazkof0ky0A889S3L8lmO
   fYbPF+KWt+k2yLIBveki/1vaQCl6fU/fvND0h5RYIadQRQcG74Aa0+l76
   rK73RMWPq7ylCVfa4omDGks6RNxWxcOPWDFkqiGTjLTrXXOSZzkWcpdKP
   1RUyRhK1IjUa2xCVYpa2pkKbfvyzudqSMAI0nh5MnOtmBqoO4rvIhgVpk
   A==;
X-CSE-ConnectionGUID: weAVXr0lTFeS8xqAk7Unbw==
X-CSE-MsgGUID: qj5T9w8yRsW+WH8ijAPAqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="53966648"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="53966648"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 01:11:46 -0700
X-CSE-ConnectionGUID: Qo4wWde5TteqPGI6TvietQ==
X-CSE-MsgGUID: up3zjV8fRkKsr6OxQ5a4iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="143682531"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 May 2025 01:11:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJpPS-000T18-2i;
	Tue, 27 May 2025 08:11:42 +0000
Date: Tue, 27 May 2025 16:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 192a806c62c2d24a9848779a561bb79ac95ca5f1
Message-ID: <202505271647.zTo4nsjk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 192a806c62c2d24a9848779a561bb79ac95ca5f1  Merge tag 'v6.15' into topic/renesas-defconfig

elapsed time: 1106m

configs tested: 228
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250526    gcc-15.1.0
arc                   randconfig-002-20250526    gcc-15.1.0
arc                    vdk_hs38_smp_defconfig    clang-21
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-21
arm                   milbeaut_m10v_defconfig    clang-19
arm                             mxs_defconfig    clang-21
arm                   randconfig-001-20250526    gcc-6.5.0
arm                   randconfig-002-20250526    clang-21
arm                   randconfig-003-20250526    gcc-7.5.0
arm                   randconfig-004-20250526    gcc-7.5.0
arm                        spear6xx_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250526    clang-21
arm64                 randconfig-002-20250526    clang-19
arm64                 randconfig-003-20250526    clang-20
arm64                 randconfig-004-20250526    gcc-5.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250526    gcc-9.3.0
csky                  randconfig-001-20250527    gcc-14.2.0
csky                  randconfig-002-20250526    gcc-15.1.0
csky                  randconfig-002-20250527    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250526    clang-19
hexagon               randconfig-001-20250527    gcc-14.2.0
hexagon               randconfig-002-20250526    clang-21
hexagon               randconfig-002-20250527    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250526    gcc-12
i386        buildonly-randconfig-002-20250526    clang-20
i386        buildonly-randconfig-003-20250526    clang-20
i386        buildonly-randconfig-004-20250526    gcc-12
i386        buildonly-randconfig-005-20250526    clang-20
i386        buildonly-randconfig-006-20250526    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250527    clang-20
i386                  randconfig-002-20250527    clang-20
i386                  randconfig-003-20250527    clang-20
i386                  randconfig-004-20250527    clang-20
i386                  randconfig-005-20250527    clang-20
i386                  randconfig-006-20250527    clang-20
i386                  randconfig-007-20250527    clang-20
i386                  randconfig-011-20250527    gcc-12
i386                  randconfig-012-20250527    gcc-12
i386                  randconfig-013-20250527    gcc-12
i386                  randconfig-014-20250527    gcc-12
i386                  randconfig-015-20250527    gcc-12
i386                  randconfig-016-20250527    gcc-12
i386                  randconfig-017-20250527    gcc-12
loongarch                        alldefconfig    clang-21
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250526    gcc-15.1.0
loongarch             randconfig-001-20250527    gcc-14.2.0
loongarch             randconfig-002-20250526    gcc-15.1.0
loongarch             randconfig-002-20250527    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         apollo_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250526    gcc-5.5.0
nios2                 randconfig-001-20250527    gcc-14.2.0
nios2                 randconfig-002-20250526    gcc-9.3.0
nios2                 randconfig-002-20250527    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250526    gcc-6.5.0
parisc                randconfig-001-20250527    gcc-14.2.0
parisc                randconfig-002-20250526    gcc-8.5.0
parisc                randconfig-002-20250527    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    clang-21
powerpc                      cm5200_defconfig    clang-21
powerpc                       ebony_defconfig    clang-21
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                  mpc866_ads_defconfig    gcc-14.2.0
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250526    clang-21
powerpc               randconfig-001-20250527    gcc-14.2.0
powerpc               randconfig-002-20250526    clang-18
powerpc               randconfig-002-20250527    gcc-14.2.0
powerpc               randconfig-003-20250526    clang-21
powerpc               randconfig-003-20250527    gcc-14.2.0
powerpc                     redwood_defconfig    clang-21
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250526    gcc-7.5.0
powerpc64             randconfig-001-20250527    gcc-14.2.0
powerpc64             randconfig-002-20250526    gcc-7.5.0
powerpc64             randconfig-002-20250527    gcc-14.2.0
powerpc64             randconfig-003-20250526    clang-21
powerpc64             randconfig-003-20250527    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250526    clang-21
riscv                 randconfig-002-20250526    clang-16
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250526    clang-18
s390                  randconfig-002-20250526    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250526    gcc-11.5.0
sh                    randconfig-002-20250526    gcc-7.5.0
sh                          rsk7203_defconfig    clang-21
sh                           se7705_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250526    gcc-14.2.0
sparc                 randconfig-002-20250526    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250526    gcc-14.2.0
sparc64               randconfig-002-20250526    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250526    clang-21
um                    randconfig-002-20250526    gcc-12
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250526    gcc-12
x86_64      buildonly-randconfig-002-20250526    gcc-12
x86_64      buildonly-randconfig-003-20250526    clang-20
x86_64      buildonly-randconfig-004-20250526    gcc-12
x86_64      buildonly-randconfig-005-20250526    gcc-12
x86_64      buildonly-randconfig-006-20250526    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250527    clang-20
x86_64                randconfig-002-20250527    clang-20
x86_64                randconfig-003-20250527    clang-20
x86_64                randconfig-004-20250527    clang-20
x86_64                randconfig-005-20250527    clang-20
x86_64                randconfig-006-20250527    clang-20
x86_64                randconfig-007-20250527    clang-20
x86_64                randconfig-008-20250527    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250526    gcc-12.4.0
xtensa                randconfig-002-20250526    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

