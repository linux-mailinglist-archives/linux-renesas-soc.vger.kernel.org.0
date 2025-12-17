Return-Path: <linux-renesas-soc+bounces-25871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 481BECC8B18
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Dec 2025 17:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 689E7302C177
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Dec 2025 16:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16FA361DBE;
	Wed, 17 Dec 2025 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWJ3zyqX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43373361DA6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Dec 2025 16:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987257; cv=none; b=pV8OMobvS6mUXkycba/6x88mPvZiodbCGDGPtXZ1kIm2RwEm7cMFGripg7CR5FfGuAPyK+ORTDZZ69MtNGTQa1FrlGymgNIbs4fgCksBRVLF2MBDEgG4gkTpgxLFEbkzjvgU4yaKv/iV/em7ljBUH4pqCfXEvVJsCCaTsWvihAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987257; c=relaxed/simple;
	bh=YGqD/yZEpL0RccTyBo3j3mqS0Ep9D8slL76RCtPwt68=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mjpLtDNQcOhw46mF6hUSxEw5uLsXcBY3luuCJIp9ui5pZYj69Kfj/LT6ED8ZxETXWJ3s6iMZdnpxU5r0CSSgszXGiX6YKvkpyeiAbgiZz4lGDBZsjv20ZQ5KwzoYpmUdiOomP4EjV4VSSOJ1/vUi+BIkcl/zs4J0D/zK/T6FH44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWJ3zyqX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765987256; x=1797523256;
  h=date:from:to:cc:subject:message-id;
  bh=YGqD/yZEpL0RccTyBo3j3mqS0Ep9D8slL76RCtPwt68=;
  b=PWJ3zyqXFmpl/1sQgc0529RVmet+npsWIWced2EEf3FYX4cxMQR83vNG
   KJCLtdblpXyst9Tq+PQNbYdyHK8kPwb9WjB/UmPZYyGuI4ja2gxOigE+L
   rEjWoY1IJnW7bGOc7CpwJEFf5mBRyya1pkiNvC38ez1H2f/5M4nd5enTp
   yzlbWQp0iTvlULUHI1f+1wF60iuqCWl6m/7DoPgwZqaRtYMltKahCbBxI
   9yUHrs8xqF497nYktjCFHlUzSLvWW17H+TOxxJNwrx+Uqmd0D0bhMpYR2
   7bjFcqr/QEXCEgR8C+bEwJ03QguwL+fT1jOnfkyqK0VFhKhbdEr4vCWGB
   w==;
X-CSE-ConnectionGUID: 31KF9F4QTVyovHLjA6UsnQ==
X-CSE-MsgGUID: nGqbjvsrRZaGcof1d/e3Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67866768"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67866768"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 08:00:55 -0800
X-CSE-ConnectionGUID: xi2tNpexTbOAXHmkNLxbTA==
X-CSE-MsgGUID: ynNYLo8bTb6ANNAMPplGDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="197603146"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Dec 2025 08:00:55 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVtxM-000000000s9-0lOs;
	Wed, 17 Dec 2025 16:00:52 +0000
Date: Thu, 18 Dec 2025 00:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 e246cdf031272ed129c0354cc5e73aa217fd428b
Message-ID: <202512180005.6OXPZcVE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: e246cdf031272ed129c0354cc5e73aa217fd428b  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

elapsed time: 1462m

configs tested: 200
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251217    clang-22
arc                   randconfig-002-20251217    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                     am200epdkit_defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    clang-22
arm                   randconfig-001-20251217    clang-22
arm                   randconfig-002-20251217    clang-22
arm                   randconfig-003-20251217    clang-22
arm                   randconfig-004-20251217    clang-22
arm                           sama5_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251217    clang-22
arm64                 randconfig-002-20251217    clang-22
arm64                 randconfig-003-20251217    clang-22
arm64                 randconfig-004-20251217    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251217    clang-22
csky                  randconfig-002-20251217    clang-22
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251217    clang-22
hexagon               randconfig-001-20251217    gcc-11.5.0
hexagon               randconfig-002-20251217    clang-22
hexagon               randconfig-002-20251217    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251217    clang-20
i386        buildonly-randconfig-002-20251217    clang-20
i386        buildonly-randconfig-002-20251217    gcc-14
i386        buildonly-randconfig-003-20251217    clang-20
i386        buildonly-randconfig-003-20251217    gcc-13
i386        buildonly-randconfig-004-20251217    clang-20
i386        buildonly-randconfig-005-20251217    clang-20
i386        buildonly-randconfig-005-20251217    gcc-14
i386        buildonly-randconfig-006-20251217    clang-20
i386        buildonly-randconfig-006-20251217    gcc-14
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251217    gcc-14
i386                  randconfig-002-20251217    gcc-14
i386                  randconfig-003-20251217    gcc-14
i386                  randconfig-004-20251217    gcc-14
i386                  randconfig-005-20251217    gcc-14
i386                  randconfig-006-20251217    gcc-14
i386                  randconfig-007-20251217    gcc-14
i386                  randconfig-011-20251217    clang-20
i386                  randconfig-012-20251217    clang-20
i386                  randconfig-013-20251217    clang-20
i386                  randconfig-014-20251217    clang-20
i386                  randconfig-015-20251217    clang-20
i386                  randconfig-016-20251217    clang-20
i386                  randconfig-017-20251217    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251217    clang-22
loongarch             randconfig-001-20251217    gcc-11.5.0
loongarch             randconfig-002-20251217    clang-22
loongarch             randconfig-002-20251217    gcc-11.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                            mac_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                      maltaaprp_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251217    gcc-11.5.0
nios2                 randconfig-002-20251217    gcc-11.5.0
nios2                 randconfig-002-20251217    gcc-8.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251217    gcc-15.1.0
parisc                randconfig-001-20251217    gcc-8.5.0
parisc                randconfig-002-20251217    gcc-14.3.0
parisc                randconfig-002-20251217    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc               randconfig-001-20251217    gcc-8.5.0
powerpc               randconfig-002-20251217    clang-22
powerpc               randconfig-002-20251217    gcc-8.5.0
powerpc                     tqm8560_defconfig    clang-22
powerpc64             randconfig-001-20251217    gcc-14.3.0
powerpc64             randconfig-001-20251217    gcc-8.5.0
powerpc64             randconfig-002-20251217    clang-18
powerpc64             randconfig-002-20251217    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251217    clang-18
riscv                 randconfig-002-20251217    clang-18
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251217    clang-18
s390                  randconfig-002-20251217    clang-18
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    gcc-15.1.0
sh                    randconfig-001-20251217    clang-18
sh                    randconfig-002-20251217    clang-18
sh                           se7619_defconfig    gcc-15.1.0
sh                           se7750_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251217    gcc-15.1.0
sparc                 randconfig-002-20251217    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251217    gcc-15.1.0
sparc64               randconfig-002-20251217    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251217    gcc-15.1.0
um                    randconfig-002-20251217    gcc-15.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251217    gcc-14
x86_64      buildonly-randconfig-002-20251217    gcc-14
x86_64      buildonly-randconfig-003-20251217    gcc-14
x86_64      buildonly-randconfig-004-20251217    gcc-14
x86_64      buildonly-randconfig-005-20251217    gcc-14
x86_64      buildonly-randconfig-006-20251217    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251217    clang-20
x86_64                randconfig-002-20251217    clang-20
x86_64                randconfig-003-20251217    clang-20
x86_64                randconfig-004-20251217    clang-20
x86_64                randconfig-005-20251217    clang-20
x86_64                randconfig-006-20251217    clang-20
x86_64                randconfig-011-20251217    gcc-14
x86_64                randconfig-012-20251217    gcc-14
x86_64                randconfig-013-20251217    gcc-14
x86_64                randconfig-014-20251217    gcc-14
x86_64                randconfig-015-20251217    gcc-14
x86_64                randconfig-016-20251217    gcc-14
x86_64                randconfig-071-20251217    gcc-14
x86_64                randconfig-072-20251217    gcc-14
x86_64                randconfig-073-20251217    gcc-14
x86_64                randconfig-074-20251217    gcc-14
x86_64                randconfig-075-20251217    gcc-14
x86_64                randconfig-076-20251217    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251217    gcc-15.1.0
xtensa                randconfig-002-20251217    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

