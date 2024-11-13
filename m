Return-Path: <linux-renesas-soc+bounces-10480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAAD9C6A0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 08:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B782B1F2148B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2024 07:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F5535885;
	Wed, 13 Nov 2024 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhRCYMQf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B319179956
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2024 07:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731483158; cv=none; b=TqKHKUaYCUIHAJdrgrBuB0Oy+Nn3YfmnWV1Sj5nTqKVsx0NY1t1ZghNa5QT6bfMJ+O/QhH2+E7aNoh1AUOVCSdWTvNXDVXFL1kvdpguur6DW1E/qChDJE/M2TaegUtXP4a8tjlfZgDwANEqmk6SgoYP/Ga2wzB/XPSsYBxi6CiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731483158; c=relaxed/simple;
	bh=GvTDJt9bWMLXUa571HCh4/CODEMOwjCtECP8v8sF+YA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TVj3ugMuDPfpRa16pxcmr/4ddKe8hWz+IT08judTmjRBgULYJq6G41PQrTQNp5jRaVVMOQ7eKbtJPkWpGwro2XI0X1P4YQc1L1eZvysQfcOsHmha+iv6SwKyP8lSiTseA/Zlemy2U/6llQZNDufzfPX4/zyf+Yfc9dCz+srGXTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhRCYMQf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731483156; x=1763019156;
  h=date:from:to:cc:subject:message-id;
  bh=GvTDJt9bWMLXUa571HCh4/CODEMOwjCtECP8v8sF+YA=;
  b=nhRCYMQfetxjN8mTpQvkcTgFC8gt09eR8t7tJW5AQNvkeplzoA81X0EZ
   u3aenx8MZ8IB+tuysN5zfe27xkysxr+EllLFe3VOfbYHC3lYG1esH2sJ8
   Bw5gbUk3SQ1efASOMnNIOlMXXsL3xT3X5kIPYb19tMqgA6gSLuRv8bBdc
   6uPrh70BXuTGne4tlZpJyM6CtEQ+qopLCIDoFXEbJavy6mpsGMtXtCij7
   TjvTkHHsmheizrepau43QjkgnlYp1j0BJE5JRl08PcbsZBD05EdfFGtbU
   soybMHB8O0aa7KyhPmTbmCASvM+i+Sz2pUMZtm60HZ6H0WvJ3WRmIf/K8
   g==;
X-CSE-ConnectionGUID: 7vor2LwKRJaQDyvYjBjk4A==
X-CSE-MsgGUID: /F9Fo78iSxiHaQokQHKJHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="18970517"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="18970517"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 23:32:35 -0800
X-CSE-ConnectionGUID: jnUxuEPQTme6M2D9Z61eZA==
X-CSE-MsgGUID: h/Q4UKD8SJa8XhwU2HDeRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="92561316"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Nov 2024 23:32:34 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB7rc-00005t-26;
	Wed, 13 Nov 2024 07:32:32 +0000
Date: Wed, 13 Nov 2024 15:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 71c3de4f5536253ebec80c9ed3a7c95eb544cfbd
Message-ID: <202411131521.UgEbBLPR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 71c3de4f5536253ebec80c9ed3a7c95eb544cfbd  [LOCAL] riscv: renesas: defconfig: Update rzfive_defconfig

elapsed time: 938m

configs tested: 121
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241113    gcc-13.2.0
arc                   randconfig-002-20241113    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241113    clang-20
arm                   randconfig-002-20241113    clang-20
arm                   randconfig-003-20241113    clang-20
arm                   randconfig-004-20241113    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241113    clang-20
arm64                 randconfig-002-20241113    gcc-14.2.0
arm64                 randconfig-003-20241113    gcc-14.2.0
arm64                 randconfig-004-20241113    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241113    gcc-14.2.0
csky                  randconfig-002-20241113    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241113    clang-14
hexagon               randconfig-002-20241113    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241113    clang-19
i386        buildonly-randconfig-002-20241113    clang-19
i386        buildonly-randconfig-003-20241113    clang-19
i386        buildonly-randconfig-004-20241113    gcc-12
i386        buildonly-randconfig-005-20241113    gcc-12
i386        buildonly-randconfig-006-20241113    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241113    gcc-12
i386                  randconfig-002-20241113    gcc-12
i386                  randconfig-003-20241113    clang-19
i386                  randconfig-004-20241113    clang-19
i386                  randconfig-005-20241113    gcc-12
i386                  randconfig-006-20241113    gcc-12
i386                  randconfig-011-20241113    clang-19
i386                  randconfig-012-20241113    gcc-12
i386                  randconfig-013-20241113    clang-19
i386                  randconfig-014-20241113    clang-19
i386                  randconfig-015-20241113    gcc-11
i386                  randconfig-016-20241113    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241113    gcc-14.2.0
loongarch             randconfig-002-20241113    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241113    gcc-14.2.0
nios2                 randconfig-002-20241113    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241113    gcc-14.2.0
parisc                randconfig-002-20241113    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc               randconfig-001-20241113    clang-20
powerpc               randconfig-002-20241113    clang-20
powerpc               randconfig-003-20241113    clang-15
powerpc64             randconfig-001-20241113    gcc-14.2.0
powerpc64             randconfig-002-20241113    clang-20
powerpc64             randconfig-003-20241113    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
riscv                 randconfig-001-20241113    gcc-14.2.0
riscv                 randconfig-002-20241113    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-20
s390                  randconfig-001-20241113    gcc-14.2.0
s390                  randconfig-002-20241113    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20241113    gcc-14.2.0
sh                    randconfig-002-20241113    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241113    gcc-14.2.0
sparc64               randconfig-002-20241113    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241113    gcc-12
um                    randconfig-002-20241113    clang-20
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-002-20241113    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241113    gcc-14.2.0
xtensa                randconfig-002-20241113    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

