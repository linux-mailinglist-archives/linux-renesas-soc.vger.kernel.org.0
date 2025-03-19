Return-Path: <linux-renesas-soc+bounces-14637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6D7A692FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Mar 2025 16:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11A9B465500
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Mar 2025 15:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB791957FF;
	Wed, 19 Mar 2025 15:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nX3I6/yD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6AB1DF24D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Mar 2025 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396632; cv=none; b=FV9YQaPAM00VRZ0laRpkwuY1tj8lgq9eWFO4cGT3gGYBuGToWlXPrxRc3WPr/jfOsK72wenVxOlXzkovP1aWgVHsZ2iGdLNphmKJdO2M1afLhTyDYor0E6wJAJgbU29VeatWECslM3C4IMIbqKR6FErdGmC4q5v8ePbiui/OkHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396632; c=relaxed/simple;
	bh=X8D/cZ/m403F0Sq7Sb6QeKlFWVhFvMtrkc9MYtTQXJg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i1wbf6YQ8b8eiL03YDLiWyxIgTd0cimTVYPeT41eooEPid1bAl3l3YyZt8/uVz92EiWqDNCHNUl8+zCCkS58pKXGa8rJ0cjcrsCLVMile+ec6d/ZAF12+dH6MFL3e0iNp28S5YXewAbsYoYlwyOTUbRNkbLk/4S/z/XmHikSY8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nX3I6/yD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742396631; x=1773932631;
  h=date:from:to:cc:subject:message-id;
  bh=X8D/cZ/m403F0Sq7Sb6QeKlFWVhFvMtrkc9MYtTQXJg=;
  b=nX3I6/yDbgsgaGUJZ31xLG1EOjP6LLS7M6YFRAQtyKqB00uEkAt/rS66
   Jaq3cIz0QKmer2IwrS6/qpe7/kWls/K7wogSvXISMty6L/ZUQF1z5WXcs
   9fzZpHTRQhlzttUZQn4bESo7ZJnfOQpmFDacwpPrtBZnDCJ+gIG40L9Wc
   q1Hv2FuJ/wIF16WNNcdCPRCMJ5bmUsaVm71capXtz004/3aTp6CwPobvg
   GmNGVuLYfzxMFU0DU+3VogXuGTJp6Dml5wMrcrdhaMrB+6Ak50kic1ycg
   xH59T9Eq0yRRI4xpg6bHib2pXkN6Ni2m97a+ZOkjXvuz5gB47ubybMXKd
   w==;
X-CSE-ConnectionGUID: 1KIOLxABQTCJJj4LTudY+A==
X-CSE-MsgGUID: 6fPk6l3OS36AYONt4ISzQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="54262236"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="54262236"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 08:03:50 -0700
X-CSE-ConnectionGUID: Zk29EDzTTU2cfAxBkW2SLQ==
X-CSE-MsgGUID: H5yQxReETFqgRhTXLLGiXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="123588077"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 Mar 2025 08:03:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuuxO-000FCH-25;
	Wed, 19 Mar 2025 15:03:46 +0000
Date: Wed, 19 Mar 2025 23:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.16] BUILD SUCCESS
 d6def20625e52e64f829c733ff41b8e755f7d192
Message-ID: <202503192314.VLtgcjAw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.16
branch HEAD: d6def20625e52e64f829c733ff41b8e755f7d192  clk: renesas: r9a09g057: Add clock and reset entries for GE3D

elapsed time: 1446m

configs tested: 131
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-9.3.0
alpha                               defconfig    gcc-7.5.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.3.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250319    gcc-14.2.0
arc                   randconfig-002-20250319    gcc-14.2.0
arm                              alldefconfig    gcc-9.3.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-6.5.0
arm                         mv78xx0_defconfig    clang-19
arm                        mvebu_v7_defconfig    clang-21
arm                       netwinder_defconfig    gcc-9.3.0
arm                          pxa168_defconfig    clang-19
arm                             pxa_defconfig    gcc-8.5.0
arm                   randconfig-001-20250319    clang-18
arm                   randconfig-002-20250319    clang-21
arm                   randconfig-003-20250319    clang-20
arm                   randconfig-004-20250319    clang-16
arm                         s5pv210_defconfig    gcc-9.3.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-8.5.0
arm64                               defconfig    gcc-6.5.0
arm64                 randconfig-001-20250319    gcc-14.2.0
arm64                 randconfig-002-20250319    gcc-7.5.0
arm64                 randconfig-003-20250319    gcc-12.3.0
arm64                 randconfig-004-20250319    gcc-7.5.0
csky                              allnoconfig    gcc-9.3.0
csky                                defconfig    gcc-12.4.0
csky                  randconfig-001-20250318    gcc-14.2.0
csky                  randconfig-002-20250318    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250318    clang-21
hexagon               randconfig-002-20250318    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250318    clang-20
i386        buildonly-randconfig-002-20250318    clang-20
i386        buildonly-randconfig-003-20250318    clang-20
i386        buildonly-randconfig-004-20250318    clang-20
i386        buildonly-randconfig-005-20250318    clang-20
i386        buildonly-randconfig-006-20250318    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-13.3.0
loongarch             randconfig-001-20250318    gcc-14.2.0
loongarch             randconfig-002-20250318    gcc-14.2.0
m68k                             allmodconfig    gcc-8.5.0
m68k                              allnoconfig    gcc-5.5.0
m68k                             allyesconfig    gcc-6.5.0
m68k                                defconfig    gcc-8.5.0
microblaze                       allmodconfig    gcc-9.3.0
microblaze                        allnoconfig    gcc-11.5.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-10.5.0
mips                      maltasmvp_defconfig    gcc-6.5.0
mips                       rbtx49xx_defconfig    gcc-7.5.0
nios2                             allnoconfig    gcc-8.5.0
nios2                 randconfig-001-20250318    gcc-9.3.0
nios2                 randconfig-002-20250318    gcc-5.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-5.5.0
parisc                            allnoconfig    gcc-10.5.0
parisc                           allyesconfig    gcc-9.3.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250318    gcc-8.5.0
parisc                randconfig-002-20250318    gcc-14.2.0
powerpc                          allmodconfig    gcc-10.5.0
powerpc                           allnoconfig    gcc-8.5.0
powerpc                          allyesconfig    clang-21
powerpc                     ksi8560_defconfig    gcc-9.3.0
powerpc                      pcm030_defconfig    clang-15
powerpc                      ppc6xx_defconfig    gcc-6.5.0
powerpc               randconfig-001-20250318    clang-21
powerpc               randconfig-002-20250318    clang-21
powerpc               randconfig-003-20250318    gcc-14.2.0
powerpc64             randconfig-001-20250318    clang-21
powerpc64             randconfig-002-20250318    gcc-14.2.0
powerpc64             randconfig-003-20250318    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-7.5.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250318    clang-21
riscv                 randconfig-002-20250318    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-13.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250318    clang-15
s390                  randconfig-002-20250318    gcc-12.4.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-10.5.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-11.5.0
sh                    randconfig-001-20250318    gcc-14.2.0
sh                    randconfig-002-20250318    gcc-7.5.0
sparc                            allmodconfig    gcc-6.5.0
sparc                             allnoconfig    gcc-6.5.0
sparc                 randconfig-001-20250318    gcc-14.2.0
sparc                 randconfig-002-20250318    gcc-14.2.0
sparc64                             defconfig    gcc-10.5.0
sparc64               randconfig-001-20250318    gcc-11.5.0
sparc64               randconfig-002-20250318    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250318    clang-21
um                    randconfig-002-20250318    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250318    clang-20
x86_64      buildonly-randconfig-002-20250318    clang-20
x86_64      buildonly-randconfig-003-20250318    clang-20
x86_64      buildonly-randconfig-004-20250318    clang-20
x86_64      buildonly-randconfig-005-20250318    gcc-12
x86_64      buildonly-randconfig-006-20250318    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250318    gcc-14.2.0
xtensa                randconfig-002-20250318    gcc-7.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

