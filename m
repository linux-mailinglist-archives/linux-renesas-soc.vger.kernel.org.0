Return-Path: <linux-renesas-soc+bounces-17541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A84AC4C11
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 12:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11CF2189D43C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 10:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEBF25524C;
	Tue, 27 May 2025 10:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpvrUtGN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BC62405F6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 10:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748340779; cv=none; b=DEPhbhZV6vasHdzNTVfhYKS+AWBIDmKKi9mv9lr5KUARYmujz5KqLXDDm5z7spkgzdmxOMYOzYDfOfv7Sw/dbaSKUYlbQEH73Ztn320HuOFkCAVCgk6uTLtqWyfIZvoRc7o3IM42uPgt6WEcGP4gdm1G5siYww5Sk88D1XhRU3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748340779; c=relaxed/simple;
	bh=0o01WYSUKnERA2ruqUJyoxudRrJh3a7B0epDCwIuyn4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rE2UAEC+zirtGyk/xjxmk+klXUkKwbhaP03oEa8C3rm9AzUbBuGXwmi/jnzICxp28r2waDPmioLtqQVb9Z8XFDXUviKaugbuhsXX6MyMYw8ULBKc9nnI1D5tyVkTCW7jI7KPfhd76ImsXp6jwdWH2yon5IJuzUfyPwFxJiLjrz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpvrUtGN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748340778; x=1779876778;
  h=date:from:to:cc:subject:message-id;
  bh=0o01WYSUKnERA2ruqUJyoxudRrJh3a7B0epDCwIuyn4=;
  b=jpvrUtGN9W/8i1DnfaZ51l6b7BaDiV0Vy14DaohoVNugUvDIkogtZc1s
   2zGTnhwpAiToKovWus4n3FsAtDvF6EcISgmCsKDv/KkcroiahrupONg/n
   QVJfIMPJ210t3UeUBgTV5J7xzx+FkdsWVQ3hYRkoSI5X4B+/MN6uSG96p
   j1gAak+SbDC1gkGVWhIKa8Aevet/l+qt/2s2rwalvQeOsz6WwI1wDFuYF
   5bz3opwmyCoFE5jJO9vFFAJFSs23Jvxu8stdLYTbzqQHUz8v/rjkM+JP4
   CvioQq6WocrRRiTcqd95iuqFiyaPF4q1g9t//4N0QqFB5krJ2f7JDDFH1
   g==;
X-CSE-ConnectionGUID: HvCKQuo1S0aOoTIYOIWi3A==
X-CSE-MsgGUID: 1rWb+K02SQKprZzYzFLf/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="72855775"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="72855775"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 03:12:57 -0700
X-CSE-ConnectionGUID: xfARMze5QWKYf//Rn2I3GA==
X-CSE-MsgGUID: av6VHFRATraPWb8oTB/oTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="147769845"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 May 2025 03:12:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJrIj-000T6a-1B;
	Tue, 27 May 2025 10:12:53 +0000
Date: Tue, 27 May 2025 18:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.17] BUILD SUCCESS
 a1bf6c3ef3ba1af800aa18295b0c7cbe09987536
Message-ID: <202505271809.DLTbb54a-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.17
branch HEAD: a1bf6c3ef3ba1af800aa18295b0c7cbe09987536  arm64: dts: renesas: r8a779g3-sparrow-hawk: Sort DTS

elapsed time: 1228m

configs tested: 237
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    clang-21
arc                            hsdk_defconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250527    gcc-10.5.0
arc                   randconfig-002-20250527    gcc-10.5.0
arc                    vdk_hs38_smp_defconfig    clang-21
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-21
arm                   milbeaut_m10v_defconfig    clang-21
arm                             mxs_defconfig    clang-21
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250527    clang-21
arm                   randconfig-002-20250527    gcc-7.5.0
arm                   randconfig-003-20250527    clang-19
arm                   randconfig-004-20250527    clang-21
arm                        realview_defconfig    clang-16
arm                        spear6xx_defconfig    clang-21
arm                           stm32_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250527    gcc-8.5.0
arm64                 randconfig-002-20250527    gcc-8.5.0
arm64                 randconfig-003-20250527    clang-16
arm64                 randconfig-004-20250527    gcc-6.5.0
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
i386        buildonly-randconfig-001-20250527    gcc-12
i386        buildonly-randconfig-004-20250527    clang-20
i386        buildonly-randconfig-005-20250527    gcc-11
i386        buildonly-randconfig-006-20250527    gcc-12
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
m68k                         apollo_defconfig    clang-21
m68k                                defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-21
mips                        qi_lb60_defconfig    gcc-14.2.0
mips                         rt305x_defconfig    clang-21
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
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
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
powerpc                          g5_defconfig    clang-21
powerpc                        icon_defconfig    clang-21
powerpc                   motionpro_defconfig    clang-21
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
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250526    clang-21
riscv                 randconfig-002-20250526    clang-16
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250526    clang-18
s390                  randconfig-002-20250526    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250526    gcc-11.5.0
sh                    randconfig-002-20250526    gcc-7.5.0
sh                          rsk7203_defconfig    clang-21
sh                          rsk7264_defconfig    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                           se7751_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250526    gcc-14.2.0
sparc                 randconfig-002-20250526    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250526    gcc-14.2.0
sparc64               randconfig-002-20250526    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250526    clang-21
um                    randconfig-002-20250526    gcc-12
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
x86_64                randconfig-071-20250527    clang-20
x86_64                randconfig-072-20250527    clang-20
x86_64                randconfig-073-20250527    clang-20
x86_64                randconfig-074-20250527    clang-20
x86_64                randconfig-075-20250527    clang-20
x86_64                randconfig-076-20250527    clang-20
x86_64                randconfig-077-20250527    clang-20
x86_64                randconfig-078-20250527    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    clang-21
xtensa                randconfig-001-20250526    gcc-12.4.0
xtensa                randconfig-002-20250526    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

