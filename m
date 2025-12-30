Return-Path: <linux-renesas-soc+bounces-26172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63343CE87DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 02:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8070300F19F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 01:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239F61D5CFB;
	Tue, 30 Dec 2025 01:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjF86O5F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A402836A6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 01:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767058513; cv=none; b=vGhVZXUCpm0K7vbs9HzBI6gnIK/d10HLmLlzfmswp8chBFKvS18iVFak8a5JDbRKjKEQH52milafZgLLHPjo3FL3mRxwdMZOwxeyNOQXNe0t/urqsmoOKo0v0pffHNCQWS7nqigS9ru0feBSvvbrMT2+YUSoz1R/mL9TVX1LJfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767058513; c=relaxed/simple;
	bh=y4wlHmwIsaJasXL3KPZYu10ViVbdoLN2zVFSdVpqSxY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LJovAOxhXgRkm7zG923ZNsY/fH6hYL6AZYtEmwCIsltKZ+V7/kR6HW0+SYnFwvth+9cMd6hyEVk8A/2kXhUdiEffJGlpWehL2i9n4a8jP+ruGcYOc/PAyaXVm3OdsgPE3nfgkkHfFrotOaM6WycRZENAFZpYsiKQg2rRdrUpk/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjF86O5F; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767058511; x=1798594511;
  h=date:from:to:cc:subject:message-id;
  bh=y4wlHmwIsaJasXL3KPZYu10ViVbdoLN2zVFSdVpqSxY=;
  b=OjF86O5FV0aaXyy9LoTpGsW3/J1ZXmX8NkcNwjw6q84kabAdioI4g42V
   fT1Y+y1moMQUTHRt+p5LaMBWu3QOW/sDN3I3umYqhJeni5wJkpC8objw6
   sGK67NakNxzwBsm3FWUZa8SEpJKq2GVBOFLs3OaVHdiNVHMNMm8s1l/dR
   5YUQ3yX1SuMGShET7eTzsDJKFfn8U51g9Dlsw7Lxo3Rd3RnQMNB6D5lrP
   A65+yvL6fu0ZI3CQO6Y7Vskwg+DvsuHO5ztoRm3BS32GWfASPXDktLQEm
   76QR2gk5YXDpXI4dxsR9wGBBAhR6mWMCh5N0XiVGxIgthRL/5oDitDzXZ
   A==;
X-CSE-ConnectionGUID: Ntxp3K1mTK2GLr+MMqCi7Q==
X-CSE-MsgGUID: 7Hhd0RUTT1upScuBSXgBsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68691536"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="68691536"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 17:35:10 -0800
X-CSE-ConnectionGUID: SibFn+YJSBeqlXQwpz7JaA==
X-CSE-MsgGUID: ug31W0V3Su26B+cAUFtRqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="205960826"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Dec 2025 17:35:08 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaOde-000000008BL-1gg5;
	Tue, 30 Dec 2025 01:35:06 +0000
Date: Tue, 30 Dec 2025 09:34:38 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 984cf8aee01c791fbb82b6605e5cc1b94a1a36a5
Message-ID: <202512300933.Aof1jy6l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 984cf8aee01c791fbb82b6605e5cc1b94a1a36a5  arm64: renesas: defconfig: Refresh for v6.19-rc1

elapsed time: 849m

configs tested: 170
configs skipped: 2

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
arc                   randconfig-001-20251229    gcc-13.4.0
arc                   randconfig-002-20251229    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20251229    gcc-15.1.0
arm                   randconfig-002-20251229    gcc-12.5.0
arm                   randconfig-003-20251229    clang-22
arm                   randconfig-004-20251229    gcc-15.1.0
arm                           stm32_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251229    clang-22
arm64                 randconfig-002-20251229    clang-22
arm64                 randconfig-003-20251229    gcc-10.5.0
arm64                 randconfig-004-20251229    gcc-9.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251229    gcc-15.1.0
csky                  randconfig-002-20251229    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251229    clang-22
hexagon               randconfig-002-20251229    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251229    clang-20
i386        buildonly-randconfig-002-20251229    gcc-14
i386        buildonly-randconfig-003-20251229    gcc-13
i386        buildonly-randconfig-004-20251229    clang-20
i386        buildonly-randconfig-005-20251229    gcc-14
i386        buildonly-randconfig-006-20251229    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251229    gcc-14
i386                  randconfig-002-20251229    clang-20
i386                  randconfig-003-20251229    clang-20
i386                  randconfig-004-20251229    clang-20
i386                  randconfig-005-20251229    clang-20
i386                  randconfig-006-20251229    clang-20
i386                  randconfig-007-20251229    clang-20
i386                  randconfig-011-20251229    gcc-14
i386                  randconfig-012-20251229    gcc-14
i386                  randconfig-013-20251229    gcc-14
i386                  randconfig-014-20251229    gcc-14
i386                  randconfig-015-20251229    gcc-14
i386                  randconfig-016-20251229    gcc-14
i386                  randconfig-017-20251229    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251229    clang-18
loongarch             randconfig-002-20251229    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    clang-18
mips                        omega2p_defconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251229    gcc-11.5.0
nios2                 randconfig-002-20251229    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251229    gcc-13.4.0
parisc                randconfig-002-20251229    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251229    gcc-12.5.0
powerpc               randconfig-002-20251229    clang-18
powerpc64             randconfig-001-20251229    clang-20
powerpc64             randconfig-002-20251229    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251230    gcc-15.1.0
riscv                 randconfig-002-20251229    clang-20
riscv                 randconfig-002-20251230    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251230    gcc-14.3.0
s390                  randconfig-002-20251230    clang-22
sh                               alldefconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251230    gcc-13.4.0
sh                    randconfig-002-20251230    gcc-12.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251229    gcc-13.4.0
sparc                 randconfig-002-20251229    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251229    clang-20
sparc64               randconfig-002-20251229    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251229    gcc-14
um                    randconfig-002-20251229    clang-22
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251229    clang-20
x86_64      buildonly-randconfig-002-20251229    clang-20
x86_64      buildonly-randconfig-003-20251229    gcc-14
x86_64      buildonly-randconfig-004-20251229    clang-20
x86_64      buildonly-randconfig-005-20251229    gcc-14
x86_64      buildonly-randconfig-006-20251229    gcc-13
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251229    gcc-14
x86_64                randconfig-002-20251229    clang-20
x86_64                randconfig-003-20251229    gcc-14
x86_64                randconfig-004-20251229    clang-20
x86_64                randconfig-005-20251229    gcc-14
x86_64                randconfig-006-20251229    gcc-14
x86_64                randconfig-011-20251229    clang-20
x86_64                randconfig-012-20251229    gcc-14
x86_64                randconfig-013-20251229    clang-20
x86_64                randconfig-014-20251229    clang-20
x86_64                randconfig-015-20251229    clang-20
x86_64                randconfig-016-20251229    gcc-14
x86_64                randconfig-071-20251230    clang-20
x86_64                randconfig-072-20251229    gcc-14
x86_64                randconfig-072-20251230    clang-20
x86_64                randconfig-073-20251229    gcc-13
x86_64                randconfig-073-20251230    gcc-14
x86_64                randconfig-074-20251230    clang-20
x86_64                randconfig-075-20251230    clang-20
x86_64                randconfig-076-20251230    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251229    gcc-8.5.0
xtensa                randconfig-002-20251229    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

