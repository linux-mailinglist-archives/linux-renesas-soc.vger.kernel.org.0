Return-Path: <linux-renesas-soc+bounces-23842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC087C1A223
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 13:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 763CB403061
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 12:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60463376B9;
	Wed, 29 Oct 2025 12:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnHg3hjw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F29214A64
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761739589; cv=none; b=ABdH3SJLYxusUX4z9TwkMj9UgNBwTwzTpp6CD5RzaFBXQfSzkNw2J5/zFmXrlA06y9DAsn91ldxKfjp+3HAeWjH3Nju7gGkaNHWf6OwO4NaRLLE3VSjnfaAsx0FPH4X5+r5cJgpWnCNq21wQ4Krp2XF8T/qzYFjw1Kpr6PHyIHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761739589; c=relaxed/simple;
	bh=FIcru4Wt1to0hjnupa2bUNoZAll3VvgnNpM6hwyt+DU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GaT4Ay8I1Ho/bLywBP/4U1AAsDzUFOnz0yJSrrs4iIXSx/GstRz3stQCjaODi/8Dt81VFcdprHib1i+HrgFtxyH82AayxEmX+0uJKy2LqCBk0p++veFWIrFac4aqX638dBW3UDryCRK7XexFTG8LIOmFQyzSPlcDPoXbKY8ClXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnHg3hjw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761739588; x=1793275588;
  h=date:from:to:cc:subject:message-id;
  bh=FIcru4Wt1to0hjnupa2bUNoZAll3VvgnNpM6hwyt+DU=;
  b=WnHg3hjwb+FyeseRDivasK9qPRefSviRvp8MyZOXB4X6lK6Zsh9we/L7
   35SLi8ZoykThEM6HT4ySWXSo3QR2da4WatVhIQ2Cgw2KSzZIXKwcIo3SB
   +e3yPZqlNjmi1bIRXCzK31I+GdlzPASmS9O03ouNA6I3yWPp2liPeC6KB
   8CA5LyaiU6TxbZPpOP2QC2C+9/h0rjJtmXRDSrgVagoXIjI2feR1ypQrf
   +44I1qrJD+HHd2S7YNVMsi0g21yfgMI48jYTYaBhoCIyYPdMQh6WRrP3n
   1DZ4im9n+WwTi6SgfiZT/SOd4OpIj0c8jIFw9QBZyY3Dk9qSdFiFhiFWK
   A==;
X-CSE-ConnectionGUID: 3+61n7Z4RAa9bX24++N4CA==
X-CSE-MsgGUID: 5hJEobmiQ8u/EOOaPceSlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67695021"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67695021"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 05:06:28 -0700
X-CSE-ConnectionGUID: GWyDsAQ+RcGfe52faNSWXw==
X-CSE-MsgGUID: UJMFh2vlRmWwEYWfqmuiCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="189710091"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 05:06:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE4wZ-000Ka3-2q;
	Wed, 29 Oct 2025 12:06:23 +0000
Date: Wed, 29 Oct 2025 20:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 73eaa91f30569c8aead72e85f704fe56b81f0943
Message-ID: <202510292043.UofS9Ypg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 73eaa91f30569c8aead72e85f704fe56b81f0943  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

elapsed time: 1149m

configs tested: 203
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251029    clang-22
arc                   randconfig-001-20251029    gcc-15.1.0
arc                   randconfig-002-20251029    clang-22
arc                   randconfig-002-20251029    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                        clps711x_defconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20251029    clang-22
arm                   randconfig-001-20251029    gcc-8.5.0
arm                   randconfig-002-20251029    clang-22
arm                   randconfig-003-20251029    clang-22
arm                   randconfig-004-20251029    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                            allyesconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251029    gcc-11.5.0
arm64                 randconfig-001-20251029    gcc-12.5.0
arm64                 randconfig-002-20251029    clang-22
arm64                 randconfig-002-20251029    gcc-11.5.0
arm64                 randconfig-003-20251029    gcc-11.5.0
arm64                 randconfig-003-20251029    gcc-13.4.0
arm64                 randconfig-004-20251029    gcc-11.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251029    gcc-11.5.0
csky                  randconfig-001-20251029    gcc-9.5.0
csky                  randconfig-002-20251029    gcc-11.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251029    clang-20
hexagon               randconfig-001-20251029    clang-22
hexagon               randconfig-002-20251029    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251029    gcc-14
i386        buildonly-randconfig-002-20251029    gcc-14
i386        buildonly-randconfig-003-20251029    clang-20
i386        buildonly-randconfig-003-20251029    gcc-14
i386        buildonly-randconfig-004-20251029    gcc-14
i386        buildonly-randconfig-005-20251029    gcc-14
i386        buildonly-randconfig-006-20251029    gcc-14
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251029    clang-20
i386                  randconfig-002-20251029    clang-20
i386                  randconfig-003-20251029    clang-20
i386                  randconfig-004-20251029    clang-20
i386                  randconfig-005-20251029    clang-20
i386                  randconfig-006-20251029    clang-20
i386                  randconfig-007-20251029    clang-20
i386                  randconfig-011-20251029    gcc-14
i386                  randconfig-012-20251029    gcc-14
i386                  randconfig-013-20251029    gcc-14
i386                  randconfig-014-20251029    gcc-14
i386                  randconfig-015-20251029    gcc-14
i386                  randconfig-016-20251029    gcc-14
i386                  randconfig-017-20251029    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                        allyesconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251029    clang-22
loongarch             randconfig-002-20251029    clang-22
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251029    clang-22
nios2                 randconfig-001-20251029    gcc-11.5.0
nios2                 randconfig-002-20251029    clang-22
nios2                 randconfig-002-20251029    gcc-9.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251029    gcc-12.5.0
parisc                randconfig-001-20251029    gcc-8.5.0
parisc                randconfig-002-20251029    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      katmai_defconfig    gcc-15.1.0
powerpc                     mpc83xx_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251029    clang-22
powerpc               randconfig-001-20251029    gcc-8.5.0
powerpc               randconfig-002-20251029    gcc-12.5.0
powerpc               randconfig-002-20251029    gcc-8.5.0
powerpc64             randconfig-001-20251029    clang-22
powerpc64             randconfig-001-20251029    gcc-8.5.0
powerpc64             randconfig-002-20251029    clang-22
powerpc64             randconfig-002-20251029    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251029    clang-20
riscv                 randconfig-002-20251029    clang-20
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251029    clang-20
s390                  randconfig-002-20251029    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                          landisk_defconfig    gcc-15.1.0
sh                    randconfig-001-20251029    clang-20
sh                    randconfig-002-20251029    clang-20
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251029    gcc-8.5.0
sparc                 randconfig-002-20251029    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251029    clang-20
sparc64               randconfig-002-20251029    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251029    clang-22
um                    randconfig-002-20251029    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251029    clang-20
x86_64      buildonly-randconfig-002-20251029    clang-20
x86_64      buildonly-randconfig-003-20251029    clang-20
x86_64      buildonly-randconfig-004-20251029    clang-20
x86_64      buildonly-randconfig-005-20251029    clang-20
x86_64      buildonly-randconfig-006-20251029    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251029    gcc-12
x86_64                randconfig-002-20251029    gcc-12
x86_64                randconfig-003-20251029    gcc-12
x86_64                randconfig-004-20251029    gcc-12
x86_64                randconfig-005-20251029    gcc-12
x86_64                randconfig-006-20251029    gcc-12
x86_64                randconfig-011-20251029    gcc-13
x86_64                randconfig-012-20251029    gcc-13
x86_64                randconfig-013-20251029    gcc-13
x86_64                randconfig-014-20251029    gcc-13
x86_64                randconfig-015-20251029    gcc-13
x86_64                randconfig-016-20251029    gcc-13
x86_64                randconfig-071-20251029    clang-20
x86_64                randconfig-072-20251029    clang-20
x86_64                randconfig-073-20251029    clang-20
x86_64                randconfig-074-20251029    clang-20
x86_64                randconfig-075-20251029    clang-20
x86_64                randconfig-076-20251029    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251029    gcc-8.5.0
xtensa                randconfig-002-20251029    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

