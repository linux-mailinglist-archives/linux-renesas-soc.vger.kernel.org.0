Return-Path: <linux-renesas-soc+bounces-7660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BB7942D1E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 13:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07130B2404D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 11:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A7C1A8C15;
	Wed, 31 Jul 2024 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQeZYs8R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D801AC434
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2024 11:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722424776; cv=none; b=PSmTc2NNKgqA+CuXwaG4kSK/346kTKE1GlBkglhJbDnQkPu4VdqeyMfs+WH3wziJ0XzqeB8p0o5cEpG8R106BMtIc6yFFTroK2AG5whBHXPgX588wbHW+DZKt/agrgesUPO06QLQZia3zOOGAjd6f+QCo4cCnwlwlSdSmCjYqYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722424776; c=relaxed/simple;
	bh=8OrKauzN+vcwOJ3JJm/r3AYRf4lZTGHxqvgm/PzQz9I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LclX3EQYwpUiY3nJRpBr/25RLua7mv4FpUONODOBJiCp0jjd72rjeTjiq60y78bi84scoloOsaTZp7GkNFxc0bhQoUBt4PkqdZ34x183J5AySY/Uayoaak8fpHsyE3Z3QIlgoHwGEdLvAzV1EnFu0hh6P1Y5+HZ65e1VqYS379g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQeZYs8R; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722424775; x=1753960775;
  h=date:from:to:cc:subject:message-id;
  bh=8OrKauzN+vcwOJ3JJm/r3AYRf4lZTGHxqvgm/PzQz9I=;
  b=kQeZYs8R6OVcFHZ0//ew5ZyWAVYUGj6rehJvs/QTT7X4wNexXxXWUgey
   jb9xXQF7dLiSZcXbEJX0NUbbFMccVZNPg1DaknSCCISeTN0s9xiZcWBDH
   FZYQhNdZ5HpnerTfDeBQ4v9xijMN3WHMjISE6ASQsuOio3tkGhmhr7Yfo
   jbGRZm1P4xMdLzETyzUqmUAthEtZPp5d1X4Bjck1aGfLYEeeTh3zD58nf
   0maOLVsY+lnX6r6bafiMHkD1xtnl7cmQTJhIPeBOd/LKxeAXLffEp5JIe
   1dM3ZwH+PiB2OpoG8oywFHNzEK5De5LmtQsfJhrCxZO0kZER43Hb2ibSd
   w==;
X-CSE-ConnectionGUID: nYIWu6CCTJyob82I3QwkPQ==
X-CSE-MsgGUID: mnZ9Z2mdTzOhWV5zKmLniA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30876233"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="30876233"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 04:19:34 -0700
X-CSE-ConnectionGUID: 9p3H13OHRYuXWBuYlRj5Pw==
X-CSE-MsgGUID: cJGWU3TMQ0aZS1ro/oSmfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="55456345"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Jul 2024 04:19:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ7Mg-000uBM-2N;
	Wed, 31 Jul 2024 11:19:30 +0000
Date: Wed, 31 Jul 2024 19:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 983ffab6f13c324d486b1d0ffd628baa143b75e1
Message-ID: <202407311947.Nb3cFkAN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 983ffab6f13c324d486b1d0ffd628baa143b75e1  clk: renesas: r8a779h0: Add PWM clock

elapsed time: 1249m

configs tested: 221
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240731   gcc-13.2.0
arc                   randconfig-002-20240731   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-14.1.0
arm                         lpc18xx_defconfig   gcc-14.1.0
arm                          pxa910_defconfig   gcc-14.1.0
arm                   randconfig-001-20240731   gcc-13.2.0
arm                   randconfig-001-20240731   gcc-14.1.0
arm                   randconfig-002-20240731   clang-20
arm                   randconfig-002-20240731   gcc-13.2.0
arm                   randconfig-003-20240731   clang-20
arm                   randconfig-003-20240731   gcc-13.2.0
arm                   randconfig-004-20240731   gcc-13.2.0
arm                   randconfig-004-20240731   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240731   clang-15
arm64                 randconfig-001-20240731   gcc-13.2.0
arm64                 randconfig-002-20240731   clang-20
arm64                 randconfig-002-20240731   gcc-13.2.0
arm64                 randconfig-003-20240731   gcc-13.2.0
arm64                 randconfig-003-20240731   gcc-14.1.0
arm64                 randconfig-004-20240731   clang-20
arm64                 randconfig-004-20240731   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240731   gcc-13.2.0
csky                  randconfig-001-20240731   gcc-14.1.0
csky                  randconfig-002-20240731   gcc-13.2.0
csky                  randconfig-002-20240731   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240731   clang-16
hexagon               randconfig-002-20240731   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240731   clang-18
i386         buildonly-randconfig-002-20240731   clang-18
i386         buildonly-randconfig-003-20240731   clang-18
i386         buildonly-randconfig-004-20240731   clang-18
i386         buildonly-randconfig-004-20240731   gcc-13
i386         buildonly-randconfig-005-20240731   clang-18
i386         buildonly-randconfig-006-20240731   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240731   clang-18
i386                  randconfig-001-20240731   gcc-13
i386                  randconfig-002-20240731   clang-18
i386                  randconfig-003-20240731   clang-18
i386                  randconfig-004-20240731   clang-18
i386                  randconfig-005-20240731   clang-18
i386                  randconfig-005-20240731   gcc-13
i386                  randconfig-006-20240731   clang-18
i386                  randconfig-011-20240731   clang-18
i386                  randconfig-011-20240731   gcc-12
i386                  randconfig-012-20240731   clang-18
i386                  randconfig-012-20240731   gcc-13
i386                  randconfig-013-20240731   clang-18
i386                  randconfig-014-20240731   clang-18
i386                  randconfig-014-20240731   gcc-8
i386                  randconfig-015-20240731   clang-18
i386                  randconfig-015-20240731   gcc-10
i386                  randconfig-016-20240731   clang-18
i386                  randconfig-016-20240731   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240731   gcc-13.2.0
loongarch             randconfig-001-20240731   gcc-14.1.0
loongarch             randconfig-002-20240731   gcc-13.2.0
loongarch             randconfig-002-20240731   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                          multi_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                      loongson3_defconfig   gcc-14.1.0
nios2                            alldefconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240731   gcc-13.2.0
nios2                 randconfig-001-20240731   gcc-14.1.0
nios2                 randconfig-002-20240731   gcc-13.2.0
nios2                 randconfig-002-20240731   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240731   gcc-13.2.0
parisc                randconfig-001-20240731   gcc-14.1.0
parisc                randconfig-002-20240731   gcc-13.2.0
parisc                randconfig-002-20240731   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc               randconfig-001-20240731   clang-20
powerpc               randconfig-002-20240731   gcc-13.2.0
powerpc               randconfig-002-20240731   gcc-14.1.0
powerpc               randconfig-003-20240731   clang-20
powerpc               randconfig-003-20240731   gcc-13.2.0
powerpc                     tqm5200_defconfig   gcc-14.1.0
powerpc                     tqm8541_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240731   clang-20
powerpc64             randconfig-001-20240731   gcc-13.2.0
powerpc64             randconfig-002-20240731   clang-15
powerpc64             randconfig-002-20240731   gcc-13.2.0
powerpc64             randconfig-003-20240731   clang-20
powerpc64             randconfig-003-20240731   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240731   clang-20
riscv                 randconfig-001-20240731   gcc-13.2.0
riscv                 randconfig-002-20240731   clang-15
riscv                 randconfig-002-20240731   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240731   gcc-13.2.0
s390                  randconfig-001-20240731   gcc-14.1.0
s390                  randconfig-002-20240731   gcc-13.2.0
s390                  randconfig-002-20240731   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7705_defconfig   gcc-14.1.0
sh                          kfr2r09_defconfig   gcc-14.1.0
sh                          landisk_defconfig   gcc-14.1.0
sh                    randconfig-001-20240731   gcc-13.2.0
sh                    randconfig-001-20240731   gcc-14.1.0
sh                    randconfig-002-20240731   gcc-13.2.0
sh                    randconfig-002-20240731   gcc-14.1.0
sh                        sh7763rdp_defconfig   gcc-14.1.0
sh                          urquell_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240731   gcc-13.2.0
sparc64               randconfig-001-20240731   gcc-14.1.0
sparc64               randconfig-002-20240731   gcc-13.2.0
sparc64               randconfig-002-20240731   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240731   clang-20
um                    randconfig-001-20240731   gcc-13.2.0
um                    randconfig-002-20240731   clang-20
um                    randconfig-002-20240731   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240731   gcc-13
x86_64       buildonly-randconfig-002-20240731   gcc-13
x86_64       buildonly-randconfig-003-20240731   gcc-13
x86_64       buildonly-randconfig-004-20240731   gcc-13
x86_64       buildonly-randconfig-005-20240731   gcc-13
x86_64       buildonly-randconfig-006-20240731   gcc-13
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240731   gcc-13
x86_64                randconfig-002-20240731   gcc-13
x86_64                randconfig-003-20240731   gcc-13
x86_64                randconfig-004-20240731   gcc-13
x86_64                randconfig-005-20240731   gcc-13
x86_64                randconfig-006-20240731   gcc-13
x86_64                randconfig-011-20240731   gcc-13
x86_64                randconfig-012-20240731   gcc-13
x86_64                randconfig-013-20240731   gcc-13
x86_64                randconfig-014-20240731   gcc-13
x86_64                randconfig-015-20240731   gcc-13
x86_64                randconfig-016-20240731   gcc-13
x86_64                randconfig-071-20240731   gcc-13
x86_64                randconfig-072-20240731   gcc-13
x86_64                randconfig-073-20240731   gcc-13
x86_64                randconfig-074-20240731   gcc-13
x86_64                randconfig-075-20240731   gcc-13
x86_64                randconfig-076-20240731   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                          iss_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240731   gcc-13.2.0
xtensa                randconfig-001-20240731   gcc-14.1.0
xtensa                randconfig-002-20240731   gcc-13.2.0
xtensa                randconfig-002-20240731   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

