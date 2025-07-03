Return-Path: <linux-renesas-soc+bounces-19107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0523AF7CA3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 17:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 525AE3BAF41
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 15:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7900B1E4928;
	Thu,  3 Jul 2025 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsQ5b4Xc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC57F23BE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Jul 2025 15:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557123; cv=none; b=j0u1lZ9TLRTcEV8EZFa33zUBVLUKFCb3NBj+fCj7m763FpK03CHBMNCji7c3saPvtmRPlcGH7mdyih5hMuhwYrKtUfoYA74gzjIQI+7n0Qf5V/Wbk7EOjk+E875NH71z1+d5u7+bmdo0/Vp1I3Acg8ccVCww2qWrwCvrEZPl2YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557123; c=relaxed/simple;
	bh=JZfQZDEQ0JNQQFMFHSHLui09GHNCoA31fOU3WozWUCY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=senEoyjfv/Z9zmw0/HnUzdoUnQKAGSI4ubEYBeFJupYl5onTJILq0vFYdaLuTycMQ+ry/UDMWsX3fXSSDXAT59FCmetR+9KrquT0FArBeU4oWu9m6ugeJ5EtEC+R055rVXhNuCfxn7ewWsQSJFFw1OkZUc9nzgdeOdjzP6Y7VRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsQ5b4Xc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751557122; x=1783093122;
  h=date:from:to:cc:subject:message-id;
  bh=JZfQZDEQ0JNQQFMFHSHLui09GHNCoA31fOU3WozWUCY=;
  b=gsQ5b4XcKSpeHnlmoS2RaMYG8/U2g3De36g5N9oeSWMKo1WSd9RjFFYE
   ik5fM63NS6BUMbvo0L1hGpPOFIiyJU9N9Od9LEbot8gNKEGtczQ3HJRt1
   fXBD7An+9lC5ZslQAbnnAWeBB0HSJlMB1rsDeXvEERUs4b7PDwG8DiTi6
   LrWXw9Gb52qmPNJjPCmEVpmdVM682at5N3Iau7QvaoOl3bBwqmUCq5l5W
   0k79iLOipsbypbVx+9v1Wxkq0bu3kSr+BNmn28Kn2ObMn8YwDyxL+EMng
   9WTf2zaoAj8Y/J00/M0gnb67AxtS6dijuuXhvv1sWahvIIkRToScH6Qhe
   A==;
X-CSE-ConnectionGUID: OMgXjcLeTTGDznmXmh5vpg==
X-CSE-MsgGUID: b2Co/y26TueRvpoyio3qgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53756763"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53756763"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 08:38:42 -0700
X-CSE-ConnectionGUID: vlrkhuUtS6KR78jzE/ZH8g==
X-CSE-MsgGUID: aVTiwvg5TR+cJU7ae7Xs9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="158960038"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Jul 2025 08:38:41 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXM1G-0002jn-0E;
	Thu, 03 Jul 2025 15:38:38 +0000
Date: Thu, 03 Jul 2025 23:37:58 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-r9a09g087-dt-binding-defs]
 BUILD SUCCESS 2a76193f7cc03de5b2745d069926ebc431dd5ba4
Message-ID: <202507032346.vN5DR7p9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-r9a09g087-dt-binding-defs
branch HEAD: 2a76193f7cc03de5b2745d069926ebc431dd5ba4  dt-bindings: clock: renesas,r9a09g077/87: Add SDHI_CLKHS clock ID

elapsed time: 1128m

configs tested: 118
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250703    gcc-11.5.0
arc                   randconfig-002-20250703    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                      footbridge_defconfig    clang-17
arm                         mv78xx0_defconfig    clang-19
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20250703    clang-21
arm                   randconfig-002-20250703    gcc-6.5.0
arm                   randconfig-003-20250703    clang-17
arm                   randconfig-004-20250703    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250703    clang-21
arm64                 randconfig-002-20250703    gcc-14.3.0
arm64                 randconfig-003-20250703    clang-21
arm64                 randconfig-004-20250703    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250703    gcc-14.3.0
csky                  randconfig-002-20250703    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250703    clang-21
hexagon               randconfig-002-20250703    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250703    clang-20
i386        buildonly-randconfig-002-20250703    gcc-12
i386        buildonly-randconfig-003-20250703    gcc-12
i386        buildonly-randconfig-004-20250703    clang-20
i386        buildonly-randconfig-005-20250703    gcc-12
i386        buildonly-randconfig-006-20250703    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250703    gcc-15.1.0
loongarch             randconfig-002-20250703    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250703    gcc-6.5.0
nios2                 randconfig-002-20250703    gcc-6.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250703    gcc-5.5.0
parisc                randconfig-002-20250703    gcc-6.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250703    gcc-10.5.0
powerpc               randconfig-002-20250703    clang-21
powerpc               randconfig-003-20250703    gcc-5.5.0
powerpc64             randconfig-001-20250703    clang-18
powerpc64             randconfig-002-20250703    clang-21
powerpc64             randconfig-003-20250703    gcc-14.3.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250703    gcc-13.3.0
riscv                 randconfig-002-20250703    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250703    gcc-12.4.0
s390                  randconfig-002-20250703    clang-21
sh                               alldefconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250703    gcc-9.3.0
sh                    randconfig-002-20250703    gcc-5.5.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250703    gcc-6.5.0
sparc                 randconfig-002-20250703    gcc-13.3.0
sparc64               randconfig-001-20250703    gcc-5.5.0
sparc64               randconfig-002-20250703    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250703    gcc-12
um                    randconfig-002-20250703    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250703    gcc-11
x86_64      buildonly-randconfig-002-20250703    gcc-12
x86_64      buildonly-randconfig-003-20250703    clang-20
x86_64      buildonly-randconfig-004-20250703    clang-20
x86_64      buildonly-randconfig-005-20250703    gcc-12
x86_64      buildonly-randconfig-006-20250703    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250703    gcc-14.3.0
xtensa                randconfig-002-20250703    gcc-6.5.0
xtensa                         virt_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

