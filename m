Return-Path: <linux-renesas-soc+bounces-20458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB10B24984
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 14:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D626566DB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 12:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBE322083;
	Wed, 13 Aug 2025 12:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPqTcxS1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154D780C02
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 12:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755088225; cv=none; b=X+ZrSL/Tk99oJfsoYLCdU0FxZQL2mtK/kIbXERYgKJRCMs4bdoa00CDzUQal5piVX9MhJt0gNM7xtRngWc9oNt0pTj7D0EUyPfAOn54SJ8qTngfWCBOkOs0mJVqVkyGpYMWLeBFHQMuZxBCVAZ+06cBDhtHNjrT/biiNkT2OjLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755088225; c=relaxed/simple;
	bh=bllPesacPeBWzIOd8GQgwvNZN7U40E90GdwHTDkufjA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hcbBjK1dsPUHrCralqd7JBp14+xatf43aotWO0lheSUogJ7BRHus5myfh6pVEKtkaRG8QOZTRIddg3uS1WhpnORZ5h97GjYcqZ/1e5mqomb7zp0AkiZwW9avMT0UfkthDiP9OwBC5XJthnDzOTZPGV1sbApFU30KNUq3VswtPng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPqTcxS1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755088224; x=1786624224;
  h=date:from:to:cc:subject:message-id;
  bh=bllPesacPeBWzIOd8GQgwvNZN7U40E90GdwHTDkufjA=;
  b=BPqTcxS1+s34S6SFVMNqXu4klUqAuW4oGGduVzegXXxLaOtCqtysrie3
   O/NhUfB2n4Q8TQJWoNkMOJWSSJyv1N41htvpKSfJvJ8x86uOY/uy9E9PI
   EknhJbn9lhifdAL/iwg32R3OEnYYzfmFP7/ZPQ2g9+iSQt0o/R6bJ5iFk
   Fv/9Se2g1Eu8IJDM4FOaVRgocGOZdgpTm8PZF0m1KTrRrKu+Hl8Oyc36E
   y6wyBnLOPZoWujFPT7bnX7kR7rNd6V8aztGoqUEWg2455I8vTqufuS5N4
   SbW+K2R+r//N8xIzk8S+CnA8BxWgnWN02D4sD1vzyUpinKUKkPuUG3Viq
   w==;
X-CSE-ConnectionGUID: 7Oh0MCOEQ9Cw0J7r8Lvl0w==
X-CSE-MsgGUID: q+oSzvolQM6rntJV+di/zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67653958"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="67653958"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 05:30:23 -0700
X-CSE-ConnectionGUID: P/MvET4TTJSJvjjII1D4og==
X-CSE-MsgGUID: Tx7WAMY3QmOdKmiGJ/csrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="165644525"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 13 Aug 2025 05:30:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umAbz-0009t0-0x;
	Wed, 13 Aug 2025 12:30:04 +0000
Date: Wed, 13 Aug 2025 20:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 9eb40bb26aceab8a978403bf501af1f6b154276c
Message-ID: <202508132035.BDvvV6gZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: 9eb40bb26aceab8a978403bf501af1f6b154276c  pinctrl: renesas: rzt2h: Add support for RZ/N2H

elapsed time: 1314m

configs tested: 240
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250812    gcc-8.5.0
arc                   randconfig-001-20250813    clang-22
arc                   randconfig-002-20250812    gcc-12.5.0
arc                   randconfig-002-20250813    clang-22
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   randconfig-001-20250812    clang-22
arm                   randconfig-001-20250813    clang-22
arm                   randconfig-002-20250812    clang-22
arm                   randconfig-002-20250813    clang-22
arm                   randconfig-003-20250812    gcc-14.3.0
arm                   randconfig-003-20250813    clang-22
arm                   randconfig-004-20250812    gcc-10.5.0
arm                   randconfig-004-20250813    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250812    gcc-8.5.0
arm64                 randconfig-001-20250813    clang-22
arm64                 randconfig-002-20250812    gcc-8.5.0
arm64                 randconfig-002-20250813    clang-22
arm64                 randconfig-003-20250812    gcc-14.3.0
arm64                 randconfig-003-20250813    clang-22
arm64                 randconfig-004-20250812    gcc-8.5.0
arm64                 randconfig-004-20250813    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250812    gcc-13.4.0
csky                  randconfig-001-20250813    clang-20
csky                  randconfig-002-20250812    gcc-10.5.0
csky                  randconfig-002-20250813    clang-20
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250812    clang-22
hexagon               randconfig-001-20250813    clang-20
hexagon               randconfig-002-20250812    clang-22
hexagon               randconfig-002-20250813    clang-20
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250812    gcc-12
i386        buildonly-randconfig-001-20250813    gcc-11
i386        buildonly-randconfig-002-20250812    gcc-12
i386        buildonly-randconfig-002-20250813    gcc-11
i386        buildonly-randconfig-003-20250812    gcc-12
i386        buildonly-randconfig-003-20250813    gcc-11
i386        buildonly-randconfig-004-20250812    clang-20
i386        buildonly-randconfig-004-20250813    gcc-11
i386        buildonly-randconfig-005-20250812    clang-20
i386        buildonly-randconfig-005-20250813    gcc-11
i386        buildonly-randconfig-006-20250812    gcc-12
i386        buildonly-randconfig-006-20250813    gcc-11
i386                                defconfig    clang-20
i386                  randconfig-001-20250813    clang-20
i386                  randconfig-002-20250813    clang-20
i386                  randconfig-003-20250813    clang-20
i386                  randconfig-004-20250813    clang-20
i386                  randconfig-005-20250813    clang-20
i386                  randconfig-006-20250813    clang-20
i386                  randconfig-007-20250813    clang-20
i386                  randconfig-011-20250813    gcc-11
i386                  randconfig-012-20250813    gcc-11
i386                  randconfig-013-20250813    gcc-11
i386                  randconfig-014-20250813    gcc-11
i386                  randconfig-015-20250813    gcc-11
i386                  randconfig-016-20250813    gcc-11
i386                  randconfig-017-20250813    gcc-11
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250812    gcc-15.1.0
loongarch             randconfig-001-20250813    clang-20
loongarch             randconfig-002-20250812    gcc-15.1.0
loongarch             randconfig-002-20250813    clang-20
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                          multi_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                           ci20_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250812    gcc-10.5.0
nios2                 randconfig-001-20250813    clang-20
nios2                 randconfig-002-20250812    gcc-11.5.0
nios2                 randconfig-002-20250813    clang-20
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250812    gcc-10.5.0
parisc                randconfig-001-20250813    clang-20
parisc                randconfig-002-20250812    gcc-14.3.0
parisc                randconfig-002-20250813    clang-20
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250812    clang-19
powerpc               randconfig-001-20250813    clang-20
powerpc               randconfig-002-20250812    clang-22
powerpc               randconfig-002-20250813    clang-20
powerpc               randconfig-003-20250812    gcc-12.5.0
powerpc               randconfig-003-20250813    clang-20
powerpc                         wii_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250812    clang-22
powerpc64             randconfig-001-20250813    clang-20
powerpc64             randconfig-002-20250812    clang-16
powerpc64             randconfig-002-20250813    clang-20
powerpc64             randconfig-003-20250812    clang-18
powerpc64             randconfig-003-20250813    clang-20
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250812    gcc-9.5.0
riscv                 randconfig-001-20250813    clang-22
riscv                 randconfig-002-20250812    gcc-8.5.0
riscv                 randconfig-002-20250813    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250812    clang-18
s390                  randconfig-001-20250813    clang-22
s390                  randconfig-002-20250812    clang-22
s390                  randconfig-002-20250813    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250812    gcc-15.1.0
sh                    randconfig-001-20250813    clang-22
sh                    randconfig-002-20250812    gcc-15.1.0
sh                    randconfig-002-20250813    clang-22
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250812    gcc-8.5.0
sparc                 randconfig-001-20250813    clang-22
sparc                 randconfig-002-20250812    gcc-8.5.0
sparc                 randconfig-002-20250813    clang-22
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250812    clang-22
sparc64               randconfig-001-20250813    clang-22
sparc64               randconfig-002-20250812    clang-22
sparc64               randconfig-002-20250813    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250812    gcc-11
um                    randconfig-001-20250813    clang-22
um                    randconfig-002-20250812    gcc-12
um                    randconfig-002-20250813    clang-22
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250812    clang-20
x86_64      buildonly-randconfig-001-20250813    clang-20
x86_64      buildonly-randconfig-002-20250812    gcc-12
x86_64      buildonly-randconfig-002-20250813    clang-20
x86_64      buildonly-randconfig-003-20250812    gcc-12
x86_64      buildonly-randconfig-003-20250813    clang-20
x86_64      buildonly-randconfig-004-20250812    gcc-12
x86_64      buildonly-randconfig-004-20250813    clang-20
x86_64      buildonly-randconfig-005-20250812    clang-20
x86_64      buildonly-randconfig-005-20250813    clang-20
x86_64      buildonly-randconfig-006-20250812    gcc-12
x86_64      buildonly-randconfig-006-20250813    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250813    gcc-12
x86_64                randconfig-002-20250813    gcc-12
x86_64                randconfig-003-20250813    gcc-12
x86_64                randconfig-004-20250813    gcc-12
x86_64                randconfig-005-20250813    gcc-12
x86_64                randconfig-006-20250813    gcc-12
x86_64                randconfig-007-20250813    gcc-12
x86_64                randconfig-008-20250813    gcc-12
x86_64                randconfig-071-20250813    clang-20
x86_64                randconfig-072-20250813    clang-20
x86_64                randconfig-073-20250813    clang-20
x86_64                randconfig-074-20250813    clang-20
x86_64                randconfig-075-20250813    clang-20
x86_64                randconfig-076-20250813    clang-20
x86_64                randconfig-077-20250813    clang-20
x86_64                randconfig-078-20250813    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250812    gcc-10.5.0
xtensa                randconfig-001-20250813    clang-22
xtensa                randconfig-002-20250812    gcc-12.5.0
xtensa                randconfig-002-20250813    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

