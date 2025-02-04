Return-Path: <linux-renesas-soc+bounces-12834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53567A26E97
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 10:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F0A41881E3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 09:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D0919C54B;
	Tue,  4 Feb 2025 09:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cn4yI0wu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E81207A19
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Feb 2025 09:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661745; cv=none; b=jkOOUEkH7PJCqQ0GTzM7aMdo/znPNnnssco0oub2ipJeWXQxM8kzGabZ6juI/hipxymkPCuOjQ9eR0DQaBVgtZuRbcmXo8MGxb3o418U5FNIpNeI584tfHBMxOfdFtgrcJN8AAVumrhSH5db31sJPlXdR7E+5sKCVnEkAFAvNWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661745; c=relaxed/simple;
	bh=2oc7xRAmd/X2toy5h5Xt5yZbYJ+rrosrhsztYnL+ers=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a58MlziewGITZ41gjg3v61u9eHjh0D9SMPIYFcR0q/PiBdWPP46b00T2lWpz1Ao8iwmCO7pTrnk7OiZY3HOj4hgHXLTrVrtdIX5Lhg8KF7iiPYLMgEXGERRPBZZXRTmk/nNLcakVLe1LTeQaSH0h4YPX7x6Z5Dczn0RjvFotqwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cn4yI0wu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738661743; x=1770197743;
  h=date:from:to:cc:subject:message-id;
  bh=2oc7xRAmd/X2toy5h5Xt5yZbYJ+rrosrhsztYnL+ers=;
  b=cn4yI0wuwL33eDSWI1rzisqnnD0YCHWEiaiECYtj+w8qtpb1Sp88AVlK
   PeJTpI6inUAWNIzn6FrNbQFRK9bjyuXeLWlQMaxWyR6CR/hdRRjzqHOdS
   qcPFyrVy9HDQaidBAq6GHOpOKDyg13vIEbZnTvIUnjzUnsZkHCuzBLBSw
   YLxvKtme0U/41TBDeE0rU0ZVL4dKAh15NkzHIhUbwH2X26743QqhLm9Ss
   wscgTNCsUpI+UiAzME9dXKoznOkg8brdzGrrXayfL8Wzc1s7U4zZwEk6G
   lFOEVIieLZ+w4XBQDPYGV4ZLPH7V7F/Upa7DF6nKOcVgnmGVDos65yfuU
   Q==;
X-CSE-ConnectionGUID: NGP0KQ85SgG5dg9MPjc2Yg==
X-CSE-MsgGUID: utny85koQhmianHihqJHHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39059678"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="39059678"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 01:35:41 -0800
X-CSE-ConnectionGUID: jhHEEjxeQxCgbjBB9Bc8Yw==
X-CSE-MsgGUID: LoANOWqKTauPpLBqs0Hhnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="111089614"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Feb 2025 01:35:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfFLF-000sH9-3D;
	Tue, 04 Feb 2025 09:35:37 +0000
Date: Tue, 04 Feb 2025 17:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v6.15] BUILD
 SUCCESS 8e19d037c9cd0a6af3f619b5c03b9e2c01d6175d
Message-ID: <202502041758.5XZXKCuk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.15
branch HEAD: 8e19d037c9cd0a6af3f619b5c03b9e2c01d6175d  dt-bindings: soc: renesas: Add RZ/G3E variant SYS binding

elapsed time: 1300m

configs tested: 246
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250203    gcc-13.2.0
arc                   randconfig-001-20250204    gcc-13.2.0
arc                   randconfig-002-20250203    gcc-13.2.0
arc                   randconfig-002-20250204    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                   milbeaut_m10v_defconfig    clang-21
arm                       netwinder_defconfig    clang-21
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250203    clang-18
arm                   randconfig-001-20250204    gcc-13.2.0
arm                   randconfig-002-20250203    gcc-14.2.0
arm                   randconfig-002-20250204    gcc-13.2.0
arm                   randconfig-003-20250203    clang-18
arm                   randconfig-003-20250204    gcc-13.2.0
arm                   randconfig-004-20250203    gcc-14.2.0
arm                   randconfig-004-20250204    gcc-13.2.0
arm                         vf610m4_defconfig    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250203    gcc-14.2.0
arm64                 randconfig-001-20250204    gcc-13.2.0
arm64                 randconfig-002-20250203    gcc-14.2.0
arm64                 randconfig-002-20250204    gcc-13.2.0
arm64                 randconfig-003-20250203    gcc-14.2.0
arm64                 randconfig-003-20250204    gcc-13.2.0
arm64                 randconfig-004-20250203    gcc-14.2.0
arm64                 randconfig-004-20250204    gcc-13.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250203    gcc-14.2.0
csky                  randconfig-001-20250204    gcc-14.2.0
csky                  randconfig-002-20250203    gcc-14.2.0
csky                  randconfig-002-20250204    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250203    clang-21
hexagon               randconfig-001-20250204    gcc-14.2.0
hexagon               randconfig-002-20250203    clang-21
hexagon               randconfig-002-20250204    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250203    gcc-12
i386        buildonly-randconfig-001-20250204    gcc-12
i386        buildonly-randconfig-002-20250203    gcc-12
i386        buildonly-randconfig-002-20250204    gcc-12
i386        buildonly-randconfig-003-20250203    clang-19
i386        buildonly-randconfig-003-20250204    gcc-12
i386        buildonly-randconfig-004-20250203    gcc-12
i386        buildonly-randconfig-004-20250204    gcc-12
i386        buildonly-randconfig-005-20250203    clang-19
i386        buildonly-randconfig-005-20250204    gcc-12
i386        buildonly-randconfig-006-20250203    gcc-12
i386        buildonly-randconfig-006-20250204    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250204    clang-19
i386                  randconfig-002-20250204    clang-19
i386                  randconfig-003-20250204    clang-19
i386                  randconfig-004-20250204    clang-19
i386                  randconfig-005-20250204    clang-19
i386                  randconfig-006-20250204    clang-19
i386                  randconfig-007-20250204    clang-19
i386                  randconfig-011-20250204    clang-19
i386                  randconfig-012-20250204    clang-19
i386                  randconfig-013-20250204    clang-19
i386                  randconfig-014-20250204    clang-19
i386                  randconfig-015-20250204    clang-19
i386                  randconfig-016-20250204    clang-19
i386                  randconfig-017-20250204    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250203    gcc-14.2.0
loongarch             randconfig-001-20250204    gcc-14.2.0
loongarch             randconfig-002-20250203    gcc-14.2.0
loongarch             randconfig-002-20250204    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          multi_defconfig    clang-21
m68k                        mvme16x_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip32_defconfig    gcc-14.2.0
mips                        omega2p_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250203    gcc-14.2.0
nios2                 randconfig-001-20250204    gcc-14.2.0
nios2                 randconfig-002-20250203    gcc-14.2.0
nios2                 randconfig-002-20250204    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250203    gcc-14.2.0
parisc                randconfig-001-20250204    gcc-14.2.0
parisc                randconfig-002-20250203    gcc-14.2.0
parisc                randconfig-002-20250204    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-21
powerpc                     kmeter1_defconfig    clang-21
powerpc               mpc834x_itxgp_defconfig    clang-21
powerpc                 mpc837x_rdb_defconfig    clang-21
powerpc                      pasemi_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250203    clang-21
powerpc               randconfig-001-20250204    gcc-14.2.0
powerpc               randconfig-002-20250203    clang-16
powerpc               randconfig-002-20250204    gcc-14.2.0
powerpc               randconfig-003-20250203    gcc-14.2.0
powerpc               randconfig-003-20250204    gcc-14.2.0
powerpc64             randconfig-001-20250203    gcc-14.2.0
powerpc64             randconfig-002-20250203    clang-18
powerpc64             randconfig-002-20250204    gcc-14.2.0
powerpc64             randconfig-003-20250203    gcc-14.2.0
powerpc64             randconfig-003-20250204    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250203    clang-16
riscv                 randconfig-001-20250204    gcc-14.2.0
riscv                 randconfig-002-20250203    gcc-14.2.0
riscv                 randconfig-002-20250204    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250203    clang-19
s390                  randconfig-001-20250204    gcc-14.2.0
s390                  randconfig-002-20250203    clang-21
s390                  randconfig-002-20250204    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250203    gcc-14.2.0
sh                    randconfig-001-20250204    gcc-14.2.0
sh                    randconfig-002-20250203    gcc-14.2.0
sh                    randconfig-002-20250204    gcc-14.2.0
sh                           se7750_defconfig    clang-21
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                          urquell_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250203    gcc-14.2.0
sparc                 randconfig-001-20250204    gcc-14.2.0
sparc                 randconfig-002-20250203    gcc-14.2.0
sparc                 randconfig-002-20250204    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250203    gcc-14.2.0
sparc64               randconfig-001-20250204    gcc-14.2.0
sparc64               randconfig-002-20250203    gcc-14.2.0
sparc64               randconfig-002-20250204    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250203    gcc-12
um                    randconfig-001-20250204    gcc-14.2.0
um                    randconfig-002-20250203    clang-18
um                    randconfig-002-20250204    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250203    clang-19
x86_64      buildonly-randconfig-001-20250204    clang-19
x86_64      buildonly-randconfig-002-20250203    gcc-12
x86_64      buildonly-randconfig-002-20250204    clang-19
x86_64      buildonly-randconfig-003-20250203    gcc-12
x86_64      buildonly-randconfig-003-20250204    clang-19
x86_64      buildonly-randconfig-004-20250203    clang-19
x86_64      buildonly-randconfig-004-20250204    clang-19
x86_64      buildonly-randconfig-005-20250203    gcc-12
x86_64      buildonly-randconfig-005-20250204    clang-19
x86_64      buildonly-randconfig-006-20250203    gcc-12
x86_64      buildonly-randconfig-006-20250204    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250204    clang-19
x86_64                randconfig-002-20250204    clang-19
x86_64                randconfig-003-20250204    clang-19
x86_64                randconfig-004-20250204    clang-19
x86_64                randconfig-005-20250204    clang-19
x86_64                randconfig-006-20250204    clang-19
x86_64                randconfig-007-20250204    clang-19
x86_64                randconfig-008-20250204    clang-19
x86_64                randconfig-071-20250204    gcc-12
x86_64                randconfig-072-20250204    gcc-12
x86_64                randconfig-073-20250204    gcc-12
x86_64                randconfig-074-20250204    gcc-12
x86_64                randconfig-075-20250204    gcc-12
x86_64                randconfig-076-20250204    gcc-12
x86_64                randconfig-077-20250204    gcc-12
x86_64                randconfig-078-20250204    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-21
xtensa                randconfig-001-20250203    gcc-14.2.0
xtensa                randconfig-001-20250204    gcc-14.2.0
xtensa                randconfig-002-20250203    gcc-14.2.0
xtensa                randconfig-002-20250204    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

