Return-Path: <linux-renesas-soc+bounces-9319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2898D9D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 16:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85B6D1C22AA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 14:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6891D1F5B;
	Wed,  2 Oct 2024 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFnEg6xd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A6A1D1F53
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Oct 2024 14:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727878254; cv=none; b=MnHEFQtFJoX6FImowxz7VzvLRZtorPR53KtJd5H4lxdcw0HwDSdyqY5t74jIIMZbsO82lEG2Y6voM057gWkWCy4Yx5eoo7LxGlmHgm0jY2ClyUmRhv/KD76MrtPNFlLZRvKbnPzaJWl7jtPD08DCajv4C27PvAhymyJVA1p37NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727878254; c=relaxed/simple;
	bh=2tNwnGK2UnpuOQPd7UxVQWlQ2l2mvdUEHMm652IZNVE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OAOSkSAF/z6BR8A5DmXg+uwJPOChSapIU1DxbX9JCZF67cyD5ph1FYXM1gHoSeYPU6pXrqfOrOi6cMsWF197AIEJFL03fL7fqWf8BpkAymRUoYJfG32okrIWExLi8E/d44noU0ylLKmZ2Tr52pHNDG/YfA6xN44qK8HnZjqpBWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFnEg6xd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727878252; x=1759414252;
  h=date:from:to:cc:subject:message-id;
  bh=2tNwnGK2UnpuOQPd7UxVQWlQ2l2mvdUEHMm652IZNVE=;
  b=AFnEg6xdcdVsYvrFaclFlYI9PIwQPN609UCc/vsBEMdCZNoOmeX0SMAe
   T0iFGwKu9LTSdozLxHEjEmPCAnBNEam3b9fwPl9qbKxK9kjh0QhQWJHsh
   Kor6vjEKcZCDiD6ZuIaiNOmF4duhxUPGqurP9mwrLv/Zexk5LvfT1HpvH
   vwpnEyEBe0hqjNzt9hnM7e6HKtcZcBEx4r52BD55aCAEW0voGCmsNYvet
   e5Tu2ig5gbJWTsmLtKKtZ0K2a91oSQ4zZNAzndQ+3atx2X4dlVLWbDpUq
   JT9dWah2mmRkXSsmsgJFi3Zx6MILTP0DzC5K88PrKJr3CoQIHJBe01hC7
   A==;
X-CSE-ConnectionGUID: v3NhnMJaTFyB7zds/w2Xxg==
X-CSE-MsgGUID: FUhQLfKfSAmzYlUoX3ozww==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27174217"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="27174217"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 07:10:49 -0700
X-CSE-ConnectionGUID: LLhsL8MxQx2dkCtfP8x7qQ==
X-CSE-MsgGUID: 2MlBJmbSSxyYGaMaO8BN6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74824916"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Oct 2024 07:10:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw03y-000TAD-0E;
	Wed, 02 Oct 2024 14:10:46 +0000
Date: Wed, 02 Oct 2024 22:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.12-rc1]
 BUILD SUCCESS 43c950e3078c8f36ca03b1616df1ee2cfef658e0
Message-ID: <202410022205.mRtsuapk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.12-rc1
branch HEAD: 43c950e3078c8f36ca03b1616df1ee2cfef658e0  arm64: dts: renesas: white-hawk-cpu: Add overlay for CP97/98

elapsed time: 1353m

configs tested: 198
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241002    gcc-14.1.0
arc                   randconfig-002-20241002    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          moxart_defconfig    gcc-14.1.0
arm                   randconfig-001-20241002    gcc-14.1.0
arm                   randconfig-002-20241002    gcc-14.1.0
arm                   randconfig-003-20241002    gcc-14.1.0
arm                   randconfig-004-20241002    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241002    gcc-14.1.0
arm64                 randconfig-002-20241002    gcc-14.1.0
arm64                 randconfig-003-20241002    gcc-14.1.0
arm64                 randconfig-004-20241002    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241002    gcc-14.1.0
csky                  randconfig-002-20241002    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241002    gcc-14.1.0
hexagon               randconfig-002-20241002    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241002    clang-18
i386        buildonly-randconfig-002-20241002    clang-18
i386        buildonly-randconfig-003-20241002    clang-18
i386        buildonly-randconfig-003-20241002    gcc-12
i386        buildonly-randconfig-004-20241002    clang-18
i386        buildonly-randconfig-004-20241002    gcc-12
i386        buildonly-randconfig-005-20241002    clang-18
i386        buildonly-randconfig-005-20241002    gcc-12
i386        buildonly-randconfig-006-20241002    clang-18
i386        buildonly-randconfig-006-20241002    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241002    clang-18
i386                  randconfig-001-20241002    gcc-12
i386                  randconfig-002-20241002    clang-18
i386                  randconfig-002-20241002    gcc-12
i386                  randconfig-003-20241002    clang-18
i386                  randconfig-004-20241002    clang-18
i386                  randconfig-005-20241002    clang-18
i386                  randconfig-006-20241002    clang-18
i386                  randconfig-006-20241002    gcc-12
i386                  randconfig-011-20241002    clang-18
i386                  randconfig-012-20241002    clang-18
i386                  randconfig-013-20241002    clang-18
i386                  randconfig-013-20241002    gcc-12
i386                  randconfig-014-20241002    clang-18
i386                  randconfig-015-20241002    clang-18
i386                  randconfig-016-20241002    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241002    gcc-14.1.0
loongarch             randconfig-002-20241002    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                           sun3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm47xx_defconfig    gcc-14.1.0
mips                          malta_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241002    gcc-14.1.0
nios2                 randconfig-002-20241002    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241002    gcc-14.1.0
parisc                randconfig-002-20241002    gcc-14.1.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      bamboo_defconfig    gcc-14.1.0
powerpc                    mvme5100_defconfig    gcc-14.1.0
powerpc                      pcm030_defconfig    gcc-14.1.0
powerpc                      ppc6xx_defconfig    gcc-14.1.0
powerpc               randconfig-002-20241002    gcc-14.1.0
powerpc               randconfig-003-20241002    gcc-14.1.0
powerpc                     sequoia_defconfig    gcc-14.1.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241002    gcc-14.1.0
powerpc64             randconfig-002-20241002    gcc-14.1.0
powerpc64             randconfig-003-20241002    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241002    gcc-14.1.0
riscv                 randconfig-002-20241002    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241002    gcc-14.1.0
s390                  randconfig-002-20241002    gcc-14.1.0
s390                       zfcpdump_defconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20241002    gcc-14.1.0
sh                    randconfig-002-20241002    gcc-14.1.0
sh                           se7343_defconfig    gcc-14.1.0
sh                           se7780_defconfig    gcc-14.1.0
sh                             sh03_defconfig    gcc-14.1.0
sh                     sh7710voipgw_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241002    gcc-14.1.0
sparc64               randconfig-002-20241002    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241002    gcc-14.1.0
um                    randconfig-002-20241002    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241002    gcc-12
x86_64      buildonly-randconfig-002-20241002    gcc-12
x86_64      buildonly-randconfig-003-20241002    gcc-12
x86_64      buildonly-randconfig-004-20241002    gcc-12
x86_64      buildonly-randconfig-005-20241002    gcc-12
x86_64      buildonly-randconfig-006-20241002    gcc-12
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241002    gcc-12
x86_64                randconfig-002-20241002    gcc-12
x86_64                randconfig-003-20241002    gcc-12
x86_64                randconfig-004-20241002    gcc-12
x86_64                randconfig-005-20241002    gcc-12
x86_64                randconfig-006-20241002    gcc-12
x86_64                randconfig-011-20241002    gcc-12
x86_64                randconfig-012-20241002    gcc-12
x86_64                randconfig-013-20241002    gcc-12
x86_64                randconfig-014-20241002    gcc-12
x86_64                randconfig-015-20241002    gcc-12
x86_64                randconfig-016-20241002    gcc-12
x86_64                randconfig-071-20241002    gcc-12
x86_64                randconfig-072-20241002    gcc-12
x86_64                randconfig-073-20241002    gcc-12
x86_64                randconfig-074-20241002    gcc-12
x86_64                randconfig-075-20241002    gcc-12
x86_64                randconfig-076-20241002    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241002    gcc-14.1.0
xtensa                randconfig-002-20241002    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

