Return-Path: <linux-renesas-soc+bounces-17523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E86AC47AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 07:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D8691724A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 05:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EABB1BF58;
	Tue, 27 May 2025 05:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOHt7cLP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B35A382
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 05:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748324193; cv=none; b=OjPHSZ1TfX7mgbNVIxk7xsZGduydUlB1okh3AamiXrahufjhZIkQeqc/xDkWvkdtwcze2X0KHdUCHS/5calqnjuY3AAnQmVGYqBNibItLzISn7NR1v3OQDNC+DH4ekHqLAdww5AHB51txnlxtmZUyMYZPzSZEFJw+S7c9UabW04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748324193; c=relaxed/simple;
	bh=3YXIiatEEqnw6hNpHj+2qMrq+gLn24KRctaCaaGoBUA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gMlu+jyaeju5ilouULQeridmfy9E2U+mySg4q1d5dzPKHHAdUVbkzUMgZOyXQ86Xd71Us0wFxciM+5KUMqK5omOdQKcr2EbT2WyfdWjjXXZAWrCiGgg9G1z3O4HPAPlNzzT4oytXG6EplLfTr89wRkRyq3CjTce1SKw9mHBZO3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOHt7cLP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748324192; x=1779860192;
  h=date:from:to:cc:subject:message-id;
  bh=3YXIiatEEqnw6hNpHj+2qMrq+gLn24KRctaCaaGoBUA=;
  b=JOHt7cLPmDpUErzIJyfNexfzHJYUWbstWve7B5mkzRPF91qdyhKmuRHd
   uwoIda+j4z+mueVK7EE6/sln2Z0jGYuAOHaGHBZfewg7DuJO2WFeI2b1y
   NSpCfl28AgUpQrJkKIpAc1T/Hwi/x5vzf5j0BBsJ6CeuN5eHslk8Z7OZj
   wwswNz/E5hIIGOSL1YG5X3oNeSk7zBcuTZtd0Jd8KDcsmWAc0ngzWX18k
   X7VKCATwLo6pxM43ZvqG7H6uZ5AerGqCSfL2LvA97tpSPHKaAaDlInYDF
   hbmXV/m9y5/g0/6U7l5feNoMwyph4bCOm7l1szHxTnkV40oL1wS8wLt8I
   w==;
X-CSE-ConnectionGUID: ssMEF1u9QSSuVn3ICl23xw==
X-CSE-MsgGUID: B/AU4uSmQ/SiFlRd7oIAqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="72824131"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="72824131"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 22:36:31 -0700
X-CSE-ConnectionGUID: XMUTPT6VSJ+424j/DnJnWQ==
X-CSE-MsgGUID: 2s4ljKHdT3KzopOCO3J5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="143269007"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 May 2025 22:36:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJmzD-000SuU-0W;
	Tue, 27 May 2025 05:36:27 +0000
Date: Tue, 27 May 2025 13:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-fixes-for-v6.16] BUILD SUCCESS
 f62bb41740462bf9fde4b110df5c7d3bc223fb3c
Message-ID: <202505271300.zRHaSxjY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-fixes-for-v6.16
branch HEAD: f62bb41740462bf9fde4b110df5c7d3bc223fb3c  arm64: dts: renesas: rzg3e-smarc-som: Reduce I2C2 clock frequency

elapsed time: 951m

configs tested: 189
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
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
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250527    clang-21
arm                   randconfig-002-20250527    gcc-7.5.0
arm                   randconfig-003-20250527    clang-19
arm                   randconfig-004-20250527    clang-21
arm                        realview_defconfig    clang-16
arm                           stm32_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250527    gcc-8.5.0
arm64                 randconfig-002-20250527    gcc-8.5.0
arm64                 randconfig-003-20250527    clang-16
arm64                 randconfig-004-20250527    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250526    gcc-9.3.0
csky                  randconfig-001-20250527    gcc-14.2.0
csky                  randconfig-002-20250526    gcc-15.1.0
csky                  randconfig-002-20250527    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-21
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
loongarch             randconfig-001-20250526    gcc-15.1.0
loongarch             randconfig-001-20250527    gcc-14.2.0
loongarch             randconfig-002-20250526    gcc-15.1.0
loongarch             randconfig-002-20250527    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-21
mips                         rt305x_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250526    gcc-5.5.0
nios2                 randconfig-001-20250527    gcc-14.2.0
nios2                 randconfig-002-20250526    gcc-9.3.0
nios2                 randconfig-002-20250527    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250526    gcc-6.5.0
parisc                randconfig-001-20250527    gcc-14.2.0
parisc                randconfig-002-20250526    gcc-8.5.0
parisc                randconfig-002-20250527    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    clang-21
powerpc                      cm5200_defconfig    clang-21
powerpc                   motionpro_defconfig    clang-21
powerpc                  mpc866_ads_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250526    clang-21
powerpc               randconfig-001-20250527    gcc-14.2.0
powerpc               randconfig-002-20250526    clang-18
powerpc               randconfig-002-20250527    gcc-14.2.0
powerpc               randconfig-003-20250526    clang-21
powerpc               randconfig-003-20250527    gcc-14.2.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250526    gcc-7.5.0
powerpc64             randconfig-001-20250527    gcc-14.2.0
powerpc64             randconfig-002-20250526    gcc-7.5.0
powerpc64             randconfig-002-20250527    gcc-14.2.0
powerpc64             randconfig-003-20250526    clang-21
powerpc64             randconfig-003-20250527    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
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
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250526    gcc-11.5.0
sh                    randconfig-002-20250526    gcc-7.5.0
sh                          rsk7203_defconfig    clang-21
sh                          rsk7264_defconfig    gcc-14.2.0
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
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250526    gcc-12.4.0
xtensa                randconfig-002-20250526    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

