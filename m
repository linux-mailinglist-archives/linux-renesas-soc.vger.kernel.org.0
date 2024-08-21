Return-Path: <linux-renesas-soc+bounces-7963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1BD9592A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 04:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B6DCB248CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 02:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603D18120C;
	Wed, 21 Aug 2024 02:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzOQTylr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684F7132106
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2024 02:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724206505; cv=none; b=Zf/v3PBVwKRMhBjcToAffi4H/ouQ/JDzyw5pP9oDqD0/H+q1CzGOMuq7rQaM0zZHf7n1xEffmVZhzG8CKCaooOA6SVEDU+cSwsQt4E7m68zEptMmZAPJEf0owb1QxyRzh0qSLYiPe7iFLmDOIID2fjbafsAnUSWQMnzrhridv9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724206505; c=relaxed/simple;
	bh=wFzag9gR1bBqwqompoBUVgiWYVpwEo6m6u1sHi4R/kc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qLhoLCgexLMD3CEtBLPbtNLOQlF9ORkuRQwuFrXB/opCQ2QEo6Gt+vnHiJNtKP2war1969kkuRixkPoXPjPAIP/7AbdncnF7YhOYAFm5YEy+Lb3SGiXgC9Y7S2jIKYUWS07N0tRUKvaJRfSNlTnpLOXqmp8WQuqDUS2SGes77HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzOQTylr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724206504; x=1755742504;
  h=date:from:to:cc:subject:message-id;
  bh=wFzag9gR1bBqwqompoBUVgiWYVpwEo6m6u1sHi4R/kc=;
  b=ZzOQTylr09Wy9sN6KwvLhtGMxheLIKqrJLH1Nyt50Lzd0HalPYY/HELz
   6mE73bVOPhS25NFXbTZrNH5x6FMYxKNQRV8ZFAm0YUXxfuiAhzhXr2HZG
   4s2Hl0JRCZB6i5qCLHhyQKbj1MZhfn/aTq+eucp8TltH1OUTzNJuM/iCV
   MXYBgQecPxO8Ylx/MiF0vJTdkG1y5g2Uqzluy47CUvtHPKAaYdJvupTFW
   ZMQ04kt9bB1X+cKSIHs2Fs8mX1yxjAHAN/plYWYcI6a7uBuQ7n9TDcZii
   b77vLuNkITwkgKeuQ4PKojKUJh9oxVAZY3dnpEPvsn94I3rno9ar8p4X5
   Q==;
X-CSE-ConnectionGUID: guaAMrjNTTqRalIBiRy1FQ==
X-CSE-MsgGUID: j8/1fQOdRxOBBBmFxzXSjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22679104"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="22679104"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 19:15:03 -0700
X-CSE-ConnectionGUID: gXnnUtnfRQqheTEJlO4axw==
X-CSE-MsgGUID: kzhukLfATZGDUrwD4I7HWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="84122186"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Aug 2024 19:15:01 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgasF-000Amy-11;
	Wed, 21 Aug 2024 02:14:59 +0000
Date: Wed, 21 Aug 2024 10:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 120c2833b72f4bdbd67ea2cf70b9d96d1c235717
Message-ID: <202408211049.8EiZdsAr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 120c2833b72f4bdbd67ea2cf70b9d96d1c235717  clk: renesas: r8a779h0: Add CANFD clock

elapsed time: 800m

configs tested: 191
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240821   gcc-13.2.0
arc                   randconfig-002-20240821   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                     davinci_all_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   clang-20
arm                      jornada720_defconfig   clang-20
arm                             mxs_defconfig   clang-20
arm                       netwinder_defconfig   clang-20
arm                   randconfig-001-20240821   gcc-14.1.0
arm                   randconfig-002-20240821   gcc-14.1.0
arm                   randconfig-003-20240821   clang-20
arm                   randconfig-004-20240821   gcc-14.1.0
arm                          sp7021_defconfig   clang-20
arm                           stm32_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240821   gcc-14.1.0
arm64                 randconfig-002-20240821   gcc-14.1.0
arm64                 randconfig-003-20240821   gcc-14.1.0
arm64                 randconfig-004-20240821   clang-20
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240821   gcc-14.1.0
csky                  randconfig-002-20240821   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240821   clang-20
hexagon               randconfig-002-20240821   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240820   clang-18
i386         buildonly-randconfig-001-20240821   gcc-12
i386         buildonly-randconfig-002-20240820   clang-18
i386         buildonly-randconfig-002-20240821   gcc-12
i386         buildonly-randconfig-003-20240820   clang-18
i386         buildonly-randconfig-003-20240821   gcc-12
i386         buildonly-randconfig-004-20240820   gcc-12
i386         buildonly-randconfig-004-20240821   gcc-12
i386         buildonly-randconfig-005-20240820   clang-18
i386         buildonly-randconfig-005-20240821   gcc-12
i386         buildonly-randconfig-006-20240820   clang-18
i386         buildonly-randconfig-006-20240821   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240820   clang-18
i386                  randconfig-001-20240821   gcc-12
i386                  randconfig-002-20240820   clang-18
i386                  randconfig-002-20240821   gcc-12
i386                  randconfig-003-20240820   clang-18
i386                  randconfig-003-20240821   gcc-12
i386                  randconfig-004-20240820   clang-18
i386                  randconfig-004-20240821   gcc-12
i386                  randconfig-005-20240820   clang-18
i386                  randconfig-005-20240821   gcc-12
i386                  randconfig-006-20240820   clang-18
i386                  randconfig-006-20240821   gcc-12
i386                  randconfig-011-20240820   gcc-11
i386                  randconfig-011-20240821   gcc-12
i386                  randconfig-012-20240820   gcc-12
i386                  randconfig-012-20240821   gcc-12
i386                  randconfig-013-20240820   gcc-12
i386                  randconfig-013-20240821   gcc-12
i386                  randconfig-014-20240820   gcc-12
i386                  randconfig-014-20240821   gcc-12
i386                  randconfig-015-20240820   gcc-12
i386                  randconfig-015-20240821   gcc-12
i386                  randconfig-016-20240820   clang-18
i386                  randconfig-016-20240821   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240821   gcc-14.1.0
loongarch             randconfig-002-20240821   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                       bmips_be_defconfig   clang-20
mips                          eyeq6_defconfig   clang-20
mips                      malta_kvm_defconfig   clang-20
mips                      maltaaprp_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240821   gcc-14.1.0
nios2                 randconfig-002-20240821   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240821   gcc-14.1.0
parisc                randconfig-002-20240821   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                       eiger_defconfig   clang-20
powerpc                      pcm030_defconfig   clang-20
powerpc                     rainier_defconfig   clang-20
powerpc               randconfig-001-20240821   gcc-14.1.0
powerpc               randconfig-002-20240821   clang-20
powerpc               randconfig-003-20240821   clang-20
powerpc64             randconfig-001-20240821   gcc-14.1.0
powerpc64             randconfig-002-20240821   clang-20
powerpc64             randconfig-003-20240821   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240821   gcc-14.1.0
riscv                 randconfig-002-20240821   clang-16
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240821   clang-17
s390                  randconfig-002-20240821   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240821   gcc-14.1.0
sh                    randconfig-002-20240821   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240821   gcc-14.1.0
sparc64               randconfig-002-20240821   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240821   clang-20
um                    randconfig-002-20240821   gcc-12
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240821   gcc-12
x86_64       buildonly-randconfig-002-20240821   clang-18
x86_64       buildonly-randconfig-003-20240821   gcc-12
x86_64       buildonly-randconfig-004-20240821   gcc-12
x86_64       buildonly-randconfig-005-20240821   gcc-12
x86_64       buildonly-randconfig-006-20240821   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240821   clang-18
x86_64                randconfig-002-20240821   gcc-12
x86_64                randconfig-003-20240821   clang-18
x86_64                randconfig-004-20240821   clang-18
x86_64                randconfig-005-20240821   clang-18
x86_64                randconfig-006-20240821   gcc-12
x86_64                randconfig-011-20240821   gcc-12
x86_64                randconfig-012-20240821   clang-18
x86_64                randconfig-013-20240821   clang-18
x86_64                randconfig-014-20240821   clang-18
x86_64                randconfig-015-20240821   gcc-12
x86_64                randconfig-016-20240821   clang-18
x86_64                randconfig-071-20240821   gcc-12
x86_64                randconfig-072-20240821   clang-18
x86_64                randconfig-073-20240821   gcc-12
x86_64                randconfig-074-20240821   clang-18
x86_64                randconfig-075-20240821   gcc-12
x86_64                randconfig-076-20240821   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240821   gcc-14.1.0
xtensa                randconfig-002-20240821   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

