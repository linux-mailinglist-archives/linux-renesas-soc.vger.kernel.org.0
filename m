Return-Path: <linux-renesas-soc+bounces-19082-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC93AF71B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 13:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B3281889771
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 11:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61F91EC014;
	Thu,  3 Jul 2025 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJp/brjE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8683D2D12F1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Jul 2025 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540901; cv=none; b=XCSYhYRIFuTZDl4qllMX1R2Ha6OvkwZNNQ8a5xh6fQec1AL4n5/bqnn+EtnaP+Hn8+MguIulbOEL/V5oBf9M4ZlLBkUUehS/9rJ2o6cjyEOJKVumIXBSqWbV1TegpdSCSR5SmMcAJpKoFcGHgV8NXwSl5u0Ik0QY8QFLIC0S6gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540901; c=relaxed/simple;
	bh=Czlmv4w9sqJqFFSU04iM7+F98Yh0yGLQgaz9Zxp5IsQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K7r+7SS61qXxBYvnAxZbLFKPMgGPFfunikdySegWJef3rHWbyFLt6KkoluUXCvjr1Zd0QiBb2flzrCte23tFcIzHbhNTo/eNA4a3807SRYElf9oa1V0V7F8aPIZ6M/il5sCfy9MhbRM1gNso5i2t2EhfvzHUK0a4Va28IL35U7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJp/brjE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751540899; x=1783076899;
  h=date:from:to:cc:subject:message-id;
  bh=Czlmv4w9sqJqFFSU04iM7+F98Yh0yGLQgaz9Zxp5IsQ=;
  b=jJp/brjEIVQ4ZjEjwZkdaMwWHNbtF2aB1RO/dOAu4wSLLPtTTD9Vf4cR
   xoOXzV3R1DClOx4zRExl5eHQeKbTErWAUAfU3d+D9jVFH7ggmmIg3OiNS
   EDrejGdXBI3OZku1xxYNeiR2thWMbpyaQDZRzm/0PcD/gJ2ZiybbmJRjq
   s72PNsqRbu7JWJhC4PLTkelJgTSSuRe9ECsfQxDwzm9o8tBKK2p9oROD/
   Rxe5Eoy6KTF/71egnH/KwhsWUXQLABamr/pxgFHQ2LfcifVd9EsIf7bN5
   Wy4b/vu/biA7lFvTSzCu7j7pyYdPB74baZ8ComHDtE2IajKpRILddfjCa
   Q==;
X-CSE-ConnectionGUID: gQJBiBUGT52jGf7awJsWtQ==
X-CSE-MsgGUID: 2AeYR4qYSluguXDYdUQCNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53957247"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53957247"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 04:08:19 -0700
X-CSE-ConnectionGUID: ke23rTDMSeGZ6AaLffYQVw==
X-CSE-MsgGUID: +OF6oLmgTwGEdQ1+VCQLSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="185288335"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jul 2025 04:08:17 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXHnb-0001lF-1v;
	Thu, 03 Jul 2025 11:08:15 +0000
Date: Thu, 03 Jul 2025 19:07:30 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-r9a09g057-dt-binding-defs]
 BUILD SUCCESS 5e4e8c1415c181ce311a0b5936ef301edd57c5d1
Message-ID: <202507031918.6WKFhuba-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-r9a09g057-dt-binding-defs
branch HEAD: 5e4e8c1415c181ce311a0b5936ef301edd57c5d1  dt-bindings: clock: renesas,r9a09g056/57-cpg: Add XSPI core clock

elapsed time: 857m

configs tested: 231
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250703    gcc-11.5.0
arc                   randconfig-001-20250703    gcc-8.5.0
arc                   randconfig-002-20250703    gcc-12.4.0
arc                   randconfig-002-20250703    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                          gemini_defconfig    gcc-15.1.0
arm                   randconfig-001-20250703    clang-21
arm                   randconfig-001-20250703    gcc-8.5.0
arm                   randconfig-002-20250703    gcc-8.5.0
arm                   randconfig-003-20250703    clang-17
arm                   randconfig-003-20250703    gcc-8.5.0
arm                   randconfig-004-20250703    clang-21
arm                   randconfig-004-20250703    gcc-8.5.0
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                            allyesconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250703    clang-21
arm64                 randconfig-001-20250703    gcc-8.5.0
arm64                 randconfig-002-20250703    gcc-14.3.0
arm64                 randconfig-002-20250703    gcc-8.5.0
arm64                 randconfig-003-20250703    clang-21
arm64                 randconfig-003-20250703    gcc-8.5.0
arm64                 randconfig-004-20250703    gcc-8.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250703    gcc-14.3.0
csky                  randconfig-001-20250703    gcc-8.5.0
csky                  randconfig-002-20250703    gcc-12.4.0
csky                  randconfig-002-20250703    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250703    clang-21
hexagon               randconfig-001-20250703    gcc-8.5.0
hexagon               randconfig-002-20250703    clang-21
hexagon               randconfig-002-20250703    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250703    clang-20
i386        buildonly-randconfig-001-20250703    gcc-12
i386        buildonly-randconfig-002-20250703    gcc-12
i386        buildonly-randconfig-003-20250703    gcc-12
i386        buildonly-randconfig-004-20250703    clang-20
i386        buildonly-randconfig-004-20250703    gcc-12
i386        buildonly-randconfig-005-20250703    gcc-12
i386        buildonly-randconfig-006-20250703    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250703    clang-20
i386                  randconfig-002-20250703    clang-20
i386                  randconfig-003-20250703    clang-20
i386                  randconfig-004-20250703    clang-20
i386                  randconfig-005-20250703    clang-20
i386                  randconfig-006-20250703    clang-20
i386                  randconfig-007-20250703    clang-20
i386                  randconfig-011-20250703    clang-20
i386                  randconfig-012-20250703    clang-20
i386                  randconfig-013-20250703    clang-20
i386                  randconfig-014-20250703    clang-20
i386                  randconfig-015-20250703    clang-20
i386                  randconfig-016-20250703    clang-20
i386                  randconfig-017-20250703    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                        allyesconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250703    gcc-15.1.0
loongarch             randconfig-001-20250703    gcc-8.5.0
loongarch             randconfig-002-20250703    gcc-15.1.0
loongarch             randconfig-002-20250703    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                           ip32_defconfig    gcc-15.1.0
mips                       rbtx49xx_defconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                            allyesconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250703    gcc-8.5.0
nios2                 randconfig-002-20250703    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250703    gcc-8.5.0
parisc                randconfig-002-20250703    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      chrp32_defconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    gcc-15.1.0
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250703    gcc-10.5.0
powerpc               randconfig-001-20250703    gcc-8.5.0
powerpc               randconfig-002-20250703    clang-21
powerpc               randconfig-002-20250703    gcc-8.5.0
powerpc               randconfig-003-20250703    gcc-8.5.0
powerpc64             randconfig-001-20250703    clang-18
powerpc64             randconfig-001-20250703    gcc-8.5.0
powerpc64             randconfig-002-20250703    clang-21
powerpc64             randconfig-002-20250703    gcc-8.5.0
powerpc64             randconfig-003-20250703    gcc-14.3.0
powerpc64             randconfig-003-20250703    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250703    gcc-12
riscv                 randconfig-001-20250703    gcc-13.3.0
riscv                 randconfig-002-20250703    gcc-12
riscv                 randconfig-002-20250703    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250703    gcc-12
s390                  randconfig-001-20250703    gcc-12.4.0
s390                  randconfig-002-20250703    clang-21
s390                  randconfig-002-20250703    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20250703    gcc-12
sh                    randconfig-001-20250703    gcc-9.3.0
sh                    randconfig-002-20250703    gcc-12
sh                    randconfig-002-20250703    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    gcc-15.1.0
sparc                 randconfig-001-20250703    gcc-12
sparc                 randconfig-001-20250703    gcc-8.5.0
sparc                 randconfig-002-20250703    gcc-12
sparc                 randconfig-002-20250703    gcc-13.3.0
sparc64                          allmodconfig    gcc-15.1.0
sparc64                          allyesconfig    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250703    gcc-12
sparc64               randconfig-001-20250703    gcc-8.5.0
sparc64               randconfig-002-20250703    gcc-12
sparc64               randconfig-002-20250703    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250703    gcc-12
um                    randconfig-002-20250703    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250703    gcc-11
x86_64      buildonly-randconfig-001-20250703    gcc-12
x86_64      buildonly-randconfig-002-20250703    gcc-12
x86_64      buildonly-randconfig-003-20250703    clang-20
x86_64      buildonly-randconfig-003-20250703    gcc-12
x86_64      buildonly-randconfig-004-20250703    clang-20
x86_64      buildonly-randconfig-004-20250703    gcc-12
x86_64      buildonly-randconfig-005-20250703    gcc-12
x86_64      buildonly-randconfig-006-20250703    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250703    clang-20
x86_64                randconfig-002-20250703    clang-20
x86_64                randconfig-003-20250703    clang-20
x86_64                randconfig-004-20250703    clang-20
x86_64                randconfig-005-20250703    clang-20
x86_64                randconfig-006-20250703    clang-20
x86_64                randconfig-007-20250703    clang-20
x86_64                randconfig-008-20250703    clang-20
x86_64                randconfig-071-20250703    gcc-12
x86_64                randconfig-072-20250703    gcc-12
x86_64                randconfig-073-20250703    gcc-12
x86_64                randconfig-074-20250703    gcc-12
x86_64                randconfig-075-20250703    gcc-12
x86_64                randconfig-076-20250703    gcc-12
x86_64                randconfig-077-20250703    gcc-12
x86_64                randconfig-078-20250703    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20250703    gcc-12
xtensa                randconfig-001-20250703    gcc-14.3.0
xtensa                randconfig-002-20250703    gcc-12
xtensa                randconfig-002-20250703    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

