Return-Path: <linux-renesas-soc+bounces-11848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 392B6A01521
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jan 2025 15:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D62C7A181E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jan 2025 14:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13D0156C6A;
	Sat,  4 Jan 2025 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+GdR5Iw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026A53E49D
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jan 2025 14:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735999370; cv=none; b=lcZGWwNxCvPyR5ZgSY6Otvm43wqZla2l65WrOhucHfd/1xtoWhW0xMEdyVwrBHM/LQ+SAcyGAYj4+6erHqNxVbjLrwVueyj4F74QGTRTkVV2y9G01tvtwDPDNoJ8hh9o+xFRWeLy/WjwwlUJ8f9Uv/nT8D72SgSGo23PpvyQhKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735999370; c=relaxed/simple;
	bh=FQSvzAUNhdGkx3AJQ05MHGTsE4yHwJl+GrGSSUcHn84=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jfJ/Py+VEd33OQDDcsZTgh86lQyE4HGVZLL09vgMBLofGew/zuV4xZuGiZ1HhqFS0TotLlXxCuIVfupcChEb0e4cCCtApIOdnBQkRsnSgASH5prUYpQ7Y8wqcHanxhxk7tb8WsFJRYQQDPfP4Anqf9+lotYgwaTL/BX4CGwCyAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+GdR5Iw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735999369; x=1767535369;
  h=date:from:to:cc:subject:message-id;
  bh=FQSvzAUNhdGkx3AJQ05MHGTsE4yHwJl+GrGSSUcHn84=;
  b=Y+GdR5IwNMjqZq+baUkcK2Y1q6ddnaEr4ZJu4OKt1CoZ+WByBcSwHF6D
   2hbAoJ1WIwCiUnDKx9RRK1nYNqUjnYSncsIxK1JUnZ5CM8J/dIzFuAAtD
   +swWhlvpOPX4kvEe8Qfs3/aSQjTVWy66uOcZzHUG5y+05tRMvNUP+2tta
   JWDoWnkB2MkO5tUZMAOf0P3GBxew90TpWwBZlZIpQNuajrD5aikTLMpSP
   4Ro/qczFVv1nWx8D0vRoyUVFbERmOsi6X9DMgAqCf/7Awzp48viWw8zPh
   daY2akTP+2YuSmWxDFcdmPdiddQBV7eKD8xkFhHvn1MRyh/Nc5NPssh1g
   A==;
X-CSE-ConnectionGUID: 8Brl8Uh4QD+SyJ6v2c7tAA==
X-CSE-MsgGUID: wan8v9P9TgSZqJLheKBPww==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="35517050"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="35517050"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 06:02:48 -0800
X-CSE-ConnectionGUID: zA0aoeqpS9u1fUaP6yiaOw==
X-CSE-MsgGUID: K3mWfPrgR6yKqUmrHHqd8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="132858074"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jan 2025 06:02:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU4jk-000AxB-2I;
	Sat, 04 Jan 2025 14:02:44 +0000
Date: Sat, 04 Jan 2025 22:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-r9a09g057-dt-binding-defs]
 BUILD SUCCESS 3e4863d24818a41db42b4f2680715f204657839e
Message-ID: <202501042213.L2lcSJNe-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-r9a09g057-dt-binding-defs
branch HEAD: 3e4863d24818a41db42b4f2680715f204657839e  dt-bindings: pinctrl: renesas: Add alpha-numerical port support for RZ/V2H

elapsed time: 1042m

configs tested: 201
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                            hsdk_defconfig    gcc-13.2.0
arc                   randconfig-001-20250104    gcc-13.2.0
arc                   randconfig-002-20250104    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-20
arm                            hisi_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-19
arm                        multi_v5_defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                   randconfig-001-20250104    clang-20
arm                   randconfig-002-20250104    clang-20
arm                   randconfig-003-20250104    gcc-14.2.0
arm                   randconfig-004-20250104    gcc-14.2.0
arm                           sunxi_defconfig    gcc-13.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250104    clang-20
arm64                 randconfig-002-20250104    clang-16
arm64                 randconfig-003-20250104    gcc-14.2.0
arm64                 randconfig-004-20250104    gcc-14.2.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250104    gcc-14.2.0
csky                  randconfig-002-20250104    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250104    clang-20
hexagon               randconfig-002-20250104    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250104    clang-19
i386        buildonly-randconfig-002-20250104    gcc-12
i386        buildonly-randconfig-003-20250104    clang-19
i386        buildonly-randconfig-004-20250104    gcc-12
i386        buildonly-randconfig-005-20250104    clang-19
i386        buildonly-randconfig-006-20250104    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250104    gcc-12
i386                  randconfig-002-20250104    gcc-12
i386                  randconfig-003-20250104    gcc-12
i386                  randconfig-004-20250104    gcc-12
i386                  randconfig-005-20250104    gcc-12
i386                  randconfig-006-20250104    gcc-12
i386                  randconfig-007-20250104    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250104    gcc-14.2.0
loongarch             randconfig-002-20250104    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-13.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    gcc-13.2.0
mips                        qi_lb60_defconfig    clang-18
mips                   sb1250_swarm_defconfig    gcc-14.2.0
mips                        vocore2_defconfig    clang-15
nios2                            allmodconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                            allyesconfig    gcc-14.2.0
nios2                 randconfig-001-20250104    gcc-14.2.0
nios2                 randconfig-002-20250104    gcc-14.2.0
openrisc                         allmodconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250104    gcc-14.2.0
parisc                randconfig-002-20250104    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                  mpc885_ads_defconfig    gcc-13.2.0
powerpc                      ppc44x_defconfig    clang-20
powerpc               randconfig-001-20250104    clang-20
powerpc               randconfig-002-20250104    clang-18
powerpc               randconfig-003-20250104    gcc-14.2.0
powerpc                     redwood_defconfig    clang-20
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250104    gcc-14.2.0
powerpc64             randconfig-002-20250104    gcc-14.2.0
powerpc64             randconfig-003-20250104    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250104    gcc-11
riscv                 randconfig-001-20250104    gcc-14.2.0
riscv                 randconfig-002-20250104    clang-16
riscv                 randconfig-002-20250104    gcc-11
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250104    clang-20
s390                  randconfig-001-20250104    gcc-11
s390                  randconfig-002-20250104    clang-20
s390                  randconfig-002-20250104    gcc-11
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                          polaris_defconfig    gcc-14.2.0
sh                    randconfig-001-20250104    gcc-11
sh                    randconfig-001-20250104    gcc-14.2.0
sh                    randconfig-002-20250104    gcc-11
sh                    randconfig-002-20250104    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-13.2.0
sh                          sdk7786_defconfig    gcc-13.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-14.2.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-13.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                            allyesconfig    gcc-14.2.0
sparc                 randconfig-001-20250104    gcc-11
sparc                 randconfig-001-20250104    gcc-14.2.0
sparc                 randconfig-002-20250104    gcc-11
sparc                 randconfig-002-20250104    gcc-14.2.0
sparc64                          allmodconfig    gcc-14.2.0
sparc64                          allyesconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250104    gcc-11
sparc64               randconfig-001-20250104    gcc-14.2.0
sparc64               randconfig-002-20250104    gcc-11
sparc64               randconfig-002-20250104    gcc-14.2.0
um                               alldefconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250104    gcc-11
um                    randconfig-001-20250104    gcc-12
um                    randconfig-002-20250104    gcc-11
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250104    clang-19
x86_64      buildonly-randconfig-001-20250104    gcc-12
x86_64      buildonly-randconfig-002-20250104    clang-19
x86_64      buildonly-randconfig-003-20250104    clang-19
x86_64      buildonly-randconfig-003-20250104    gcc-12
x86_64      buildonly-randconfig-004-20250104    clang-19
x86_64      buildonly-randconfig-004-20250104    gcc-12
x86_64      buildonly-randconfig-005-20250104    clang-19
x86_64      buildonly-randconfig-006-20250104    clang-19
x86_64      buildonly-randconfig-006-20250104    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                           allyesconfig    gcc-14.2.0
xtensa                randconfig-001-20250104    gcc-11
xtensa                randconfig-001-20250104    gcc-14.2.0
xtensa                randconfig-002-20250104    gcc-11
xtensa                randconfig-002-20250104    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

