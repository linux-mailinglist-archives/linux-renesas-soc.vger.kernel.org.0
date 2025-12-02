Return-Path: <linux-renesas-soc+bounces-25489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98930C9B332
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 11:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27F773A40E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 10:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B022F6168;
	Tue,  2 Dec 2025 10:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Suv3AX0Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8372F6184
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Dec 2025 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764672142; cv=none; b=GAKLYfAS0Q8Zd3BqLRudHHvp0MV6UayudV/eXd9AxtcssRjy842CU6Gi1DMRCFJ2VkWteE/LbAJYMIuXsyFc/RwMjhHFz851QJy9w/YaedeTs2YZbuLlpUqhRuABMOM0tBYwn6g8RyBvo0JSV9Jaa3hzkbF2hJyoNkOaAhvyDU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764672142; c=relaxed/simple;
	bh=ZeQDA+PoxdYeJvoeWwojN5q1feMT2fMLWF/P3F44Tyw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MxSW8u8k7qB7zhoGs8OLbrdbihkfaS8ttelJrN/T3xkJbO/tYZMcB2xz+w/W0Qqo1HkfUdAcHH3hhmMeCnfRWzQkPQMpVTna3j9Hg65uk8dFD5wJh+KUEKsoNwggjt+ROwn8qdvrGEjkS9GQgQmaP2s316yZWJZsGhK0pu8lvl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Suv3AX0Y; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764672141; x=1796208141;
  h=date:from:to:cc:subject:message-id;
  bh=ZeQDA+PoxdYeJvoeWwojN5q1feMT2fMLWF/P3F44Tyw=;
  b=Suv3AX0YbxuTZi9pDyo82hVH0U3hRWsMyw+zxIPCfdwrA40PtsAOuZ63
   AHHSLJ3nwGcrcr96HBrGu3ffIYtbUkkgma+yE9o6XdCDFglepE3c9KFSz
   cxI2g3LhNvC1pszEvfXg/fIZn7XbcrAuBgmmo8BDcM4Qj70ayT8Bc30gI
   osqRCUbnSk8BN1hKVxbc/4KO8rgyj4TrIO1T0E76g/U4AUfqNQYNKL+80
   FU+auNr6mAJhQD2NrT02sWIJfRoMdfhn9pDuNdXmTbF3A4FPzK7pl7Qxf
   cYv7n4nSimdEzWQV4VnYQbNSNBMPZ8qV66+UWFMrEu/gYGYGdWZg48VKk
   g==;
X-CSE-ConnectionGUID: IPaq8AFtQxqA1zlnLmANmA==
X-CSE-MsgGUID: ObftGQGNSuK5joqAhjvqXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70250075"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="70250075"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 02:42:21 -0800
X-CSE-ConnectionGUID: W/2C9Qc2TN6MWMAhrvTNIw==
X-CSE-MsgGUID: pHaqsjP1R7C1e+jMaAthdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="194173006"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Dec 2025 02:42:19 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQNpo-000000009jb-3nsU;
	Tue, 02 Dec 2025 10:42:16 +0000
Date: Tue, 02 Dec 2025 18:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 2df3f0df906ca09bc867b1c6a6fef5323dcd5cdb
Message-ID: <202512021837.2seZPGSz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 2df3f0df906ca09bc867b1c6a6fef5323dcd5cdb  Merge branch 'renesas-dts-for-v6.20' into renesas-devel

elapsed time: 1456m

configs tested: 160
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251202    gcc-8.5.0
arc                   randconfig-002-20251202    gcc-12.5.0
arm                              alldefconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                        keystone_defconfig    gcc-15.1.0
arm                   randconfig-001-20251202    clang-17
arm                   randconfig-002-20251202    clang-22
arm                   randconfig-003-20251202    clang-22
arm                   randconfig-004-20251202    gcc-14.3.0
arm                       spear13xx_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251202    clang-22
arm64                 randconfig-002-20251202    clang-22
arm64                 randconfig-003-20251202    clang-16
arm64                 randconfig-004-20251202    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251202    gcc-13.4.0
csky                  randconfig-002-20251202    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251202    clang-22
hexagon               randconfig-002-20251202    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251202    clang-20
i386        buildonly-randconfig-002-20251202    gcc-14
i386        buildonly-randconfig-003-20251202    clang-20
i386        buildonly-randconfig-004-20251202    clang-20
i386        buildonly-randconfig-005-20251202    clang-20
i386        buildonly-randconfig-006-20251202    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251202    clang-20
i386                  randconfig-002-20251202    gcc-14
i386                  randconfig-003-20251202    gcc-14
i386                  randconfig-004-20251202    clang-20
i386                  randconfig-005-20251202    gcc-14
i386                  randconfig-006-20251202    clang-20
i386                  randconfig-007-20251202    clang-20
i386                  randconfig-011-20251202    clang-20
i386                  randconfig-012-20251202    clang-20
i386                  randconfig-013-20251202    gcc-14
i386                  randconfig-014-20251202    gcc-14
i386                  randconfig-015-20251202    gcc-14
i386                  randconfig-016-20251202    clang-20
i386                  randconfig-017-20251202    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251202    gcc-15.1.0
loongarch             randconfig-002-20251202    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251202    gcc-8.5.0
nios2                 randconfig-002-20251202    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251201    gcc-13.4.0
parisc                randconfig-002-20251201    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251201    gcc-13.4.0
powerpc               randconfig-002-20251201    gcc-10.5.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251201    gcc-14.3.0
powerpc64             randconfig-002-20251201    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251202    gcc-9.5.0
riscv                 randconfig-002-20251202    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251202    clang-17
s390                  randconfig-002-20251202    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251202    gcc-15.1.0
sh                    randconfig-002-20251202    gcc-12.5.0
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251201    gcc-8.5.0
sparc                 randconfig-002-20251201    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251201    clang-22
sparc64               randconfig-002-20251201    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251201    gcc-14
um                    randconfig-002-20251201    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251202    gcc-14
x86_64      buildonly-randconfig-002-20251202    gcc-14
x86_64      buildonly-randconfig-003-20251202    clang-20
x86_64      buildonly-randconfig-004-20251202    gcc-13
x86_64      buildonly-randconfig-005-20251202    gcc-14
x86_64      buildonly-randconfig-006-20251202    gcc-13
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251202    clang-20
x86_64                randconfig-002-20251202    clang-20
x86_64                randconfig-003-20251202    gcc-14
x86_64                randconfig-004-20251202    gcc-14
x86_64                randconfig-005-20251202    gcc-14
x86_64                randconfig-006-20251202    clang-20
x86_64                randconfig-071-20251202    clang-20
x86_64                randconfig-072-20251202    clang-20
x86_64                randconfig-073-20251202    clang-20
x86_64                randconfig-074-20251202    clang-20
x86_64                randconfig-075-20251202    clang-20
x86_64                randconfig-076-20251202    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251201    gcc-9.5.0
xtensa                randconfig-002-20251201    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

