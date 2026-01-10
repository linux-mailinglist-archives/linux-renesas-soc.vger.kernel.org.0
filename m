Return-Path: <linux-renesas-soc+bounces-26565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3714D0D615
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Jan 2026 13:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5ECB9301585F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Jan 2026 12:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E742FD1B5;
	Sat, 10 Jan 2026 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4AA2DCj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA35258CE7
	for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Jan 2026 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768048858; cv=none; b=OUrgkxlnVW8P8WhyVk+jE1wUkGNQyCBu5GkK/Mu+maphjRA96YUMUzZ8Op8kbi2Tw4hxMqB7630GOMkDZdO3HIgVb4umZbW7d5gROVcnVOZhr0RvOtQL565RhEJNm2FLk8YJeyuwnyn7HieT8OA4uAYLzpVmvyx6tuqx3W5xD+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768048858; c=relaxed/simple;
	bh=cWCBEASGJOc5CJNkMnh6wpWFmbbR6bXbbR8Ybylr+Ww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TyY+LtM12rGbt6nF52PHnDtybJUxyoWHKvbpb3RZGKvtZTWOzfCBcnBidA4daB0BtOhNZrJS9oOLYZUDOvhT5UUQJ/QRMYNmU15T+9mwpxi1Yejbq1d4sDvSLu59jqGlIz96dTEs90OHCcT0NiZVn4TL4x7siZrAJnko5ZTPFqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4AA2DCj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768048857; x=1799584857;
  h=date:from:to:cc:subject:message-id;
  bh=cWCBEASGJOc5CJNkMnh6wpWFmbbR6bXbbR8Ybylr+Ww=;
  b=g4AA2DCjlURg47m3Y+hvRTAFBdaV343/VtOyvZUU7ZZLTMQMo5oDzMHP
   o7X23X44pxCMhdKNh20mUPV8rXEwTw7skeOmjl+oCRHe9fb5hbN4j5jKl
   sYTO4U0a4JXOR0tGdlm3hhvyl+NUUz3550d/VAILDIptSyF1xaLYzAiWZ
   AEyLGZw+MXhIgHx5Z/LfzOPgKv0o85EAmW5OsqLVtktBPV5uu10f+rETO
   mt7FKJADvriZe0Ck7zxDT8p749sU79h8IgE9pz01WN9XdWOsQK7VAuYFI
   2rJhX9lBldEhnID26LHo1HcmComGflAZYJyutIHPAKpwadCPGyhlkRaR2
   A==;
X-CSE-ConnectionGUID: ebKy/WX+R8+khKYsV85YOg==
X-CSE-MsgGUID: IrIxpbmSTgmNcNdnqMRltw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="86824944"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="86824944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 04:40:57 -0800
X-CSE-ConnectionGUID: GjMELc60QIWz+obqgXMTFg==
X-CSE-MsgGUID: ADspd1qBTbCHjGbSA6/YvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="227020555"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jan 2026 04:40:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veYGy-000000008ee-2Txu;
	Sat, 10 Jan 2026 12:40:52 +0000
Date: Sat, 10 Jan 2026 20:40:01 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 1f142f5212598e85adba4906e96225598faa20b6
Message-ID: <202601102054.zVyUu7vZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 1f142f5212598e85adba4906e96225598faa20b6  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1502m

configs tested: 183
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                        nsimosci_defconfig    gcc-15.2.0
arc                 nsimosci_hs_smp_defconfig    clang-22
arc                   randconfig-001-20260110    clang-22
arc                   randconfig-002-20260110    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                         bcm2835_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    clang-22
arm                         orion5x_defconfig    clang-22
arm                   randconfig-001-20260110    clang-22
arm                   randconfig-002-20260110    clang-22
arm                   randconfig-003-20260110    clang-22
arm                   randconfig-004-20260110    clang-22
arm                        vexpress_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260110    gcc-10.5.0
arm64                 randconfig-002-20260110    gcc-10.5.0
arm64                 randconfig-003-20260110    gcc-10.5.0
arm64                 randconfig-004-20260110    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260110    gcc-10.5.0
csky                  randconfig-002-20260110    gcc-10.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260110    clang-22
hexagon               randconfig-002-20260110    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260110    gcc-14
i386        buildonly-randconfig-002-20260110    gcc-14
i386        buildonly-randconfig-003-20260110    gcc-14
i386        buildonly-randconfig-004-20260110    gcc-14
i386        buildonly-randconfig-005-20260110    gcc-14
i386        buildonly-randconfig-006-20260110    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260110    gcc-14
i386                  randconfig-002-20260110    gcc-14
i386                  randconfig-003-20260110    gcc-14
i386                  randconfig-004-20260110    gcc-14
i386                  randconfig-005-20260110    gcc-14
i386                  randconfig-006-20260110    gcc-14
i386                  randconfig-007-20260110    gcc-14
i386                  randconfig-011-20260110    gcc-14
i386                  randconfig-012-20260110    gcc-14
i386                  randconfig-013-20260110    gcc-14
i386                  randconfig-014-20260110    gcc-14
i386                  randconfig-015-20260110    gcc-14
i386                  randconfig-016-20260110    gcc-14
i386                  randconfig-017-20260110    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260110    clang-22
loongarch             randconfig-002-20260110    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          eyeq6_defconfig    gcc-15.2.0
mips                malta_qemu_32r6_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260110    clang-22
nios2                 randconfig-002-20260110    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                generic-64bit_defconfig    clang-22
parisc                randconfig-001-20260110    gcc-14.3.0
parisc                randconfig-002-20260110    gcc-14.3.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                      katmai_defconfig    clang-22
powerpc               randconfig-001-20260110    gcc-14.3.0
powerpc               randconfig-002-20260110    gcc-14.3.0
powerpc                     taishan_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260110    gcc-14.3.0
powerpc64             randconfig-002-20260110    gcc-14.3.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260110    gcc-15.2.0
riscv                 randconfig-002-20260110    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260110    gcc-15.2.0
s390                  randconfig-002-20260110    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260110    gcc-15.2.0
sh                    randconfig-002-20260110    gcc-15.2.0
sh                   rts7751r2dplus_defconfig    clang-22
sh                          sdk7786_defconfig    gcc-15.2.0
sh                           sh2007_defconfig    gcc-15.2.0
sh                        sh7785lcr_defconfig    gcc-15.2.0
sh                            titan_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260110    clang-22
sparc                 randconfig-002-20260110    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260110    clang-22
sparc64               randconfig-002-20260110    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260110    clang-22
um                    randconfig-002-20260110    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260110    gcc-14
x86_64      buildonly-randconfig-002-20260110    gcc-14
x86_64      buildonly-randconfig-003-20260110    gcc-14
x86_64      buildonly-randconfig-004-20260110    gcc-14
x86_64      buildonly-randconfig-005-20260110    gcc-14
x86_64      buildonly-randconfig-006-20260110    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260110    clang-20
x86_64                randconfig-002-20260110    clang-20
x86_64                randconfig-003-20260110    clang-20
x86_64                randconfig-004-20260110    clang-20
x86_64                randconfig-005-20260110    clang-20
x86_64                randconfig-006-20260110    clang-20
x86_64                randconfig-011-20260110    clang-20
x86_64                randconfig-012-20260110    clang-20
x86_64                randconfig-013-20260110    clang-20
x86_64                randconfig-014-20260110    clang-20
x86_64                randconfig-015-20260110    clang-20
x86_64                randconfig-016-20260110    clang-20
x86_64                randconfig-071-20260110    clang-20
x86_64                randconfig-072-20260110    clang-20
x86_64                randconfig-073-20260110    clang-20
x86_64                randconfig-074-20260110    clang-20
x86_64                randconfig-075-20260110    clang-20
x86_64                randconfig-076-20260110    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260110    clang-22
xtensa                randconfig-002-20260110    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

