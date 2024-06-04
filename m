Return-Path: <linux-renesas-soc+bounces-5799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF1A8FA9CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 07:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7AC91C21658
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 05:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC5814039E;
	Tue,  4 Jun 2024 05:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSqfMy0l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E84477A1E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Jun 2024 05:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717477940; cv=none; b=XFBPWqwtOJsZN1Hr/ZTHS5yiZBhyg+h+MKih0LwgMThZv7HNY5hUmP4fgIlUtOpk2M0yjzaqQWhSZU1jCPALzo8bFrXQkzimjMl09mNqmdo/tKQBy7jix8X8LRoS9TjuCPgEtT1EENXQfjaB2QV8RuNhlFj3o+xow8ByLuQyAoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717477940; c=relaxed/simple;
	bh=5gSfBX6jbGk96FR7vxk1HhDBeFx8leEEiz1lWFHLrr0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G0wPnjEyoSPd9y34vZr5Plr8ABE5N5gXQpTFVppCnTLDECTXfK7b4GB0IX+hU5nOl1nvUTaCGqDDpgBo5Zx0lSDflBSVUSFzY0lxI6U7bPhXjr0MbtsO0cX5s9JqKgbrrQCMws7ftb2m113sF3nkplOFkxU5e0L9t+/mTH8hG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSqfMy0l; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717477938; x=1749013938;
  h=date:from:to:cc:subject:message-id;
  bh=5gSfBX6jbGk96FR7vxk1HhDBeFx8leEEiz1lWFHLrr0=;
  b=iSqfMy0lVek0Hru5CzmmIV7ZU21DUm42q6cOBJZ/bKLRS05df/1aYqfF
   +oVCHhtPIVST9vCxPtleffM/zkz3pcv6i1tQ514M1bzcwJgQgk+RbpCsL
   ROnJ3WL95KCj4DSJ47cWH7oGq/VNS/5oKBOAR4FquUFqG9Vdt0kI2RMtg
   QbhSMzUh/+f2IS6ZEEVpHXJ41GfRi13EeGhkyi0KL9VDvPfXyI1MyC47T
   TeC3hJQ4XDHNLhUEyZYC9WOHz7c1FF1gsguVXTmjw681sEINV0UNezG2O
   UNu4DlHKSr+SglI+RfAYzqxD4BrFSUzILW916LWurIejoZaeoDs61Z78l
   A==;
X-CSE-ConnectionGUID: vDb7V9NJQxqMQqlmqP5EeA==
X-CSE-MsgGUID: 2A/CTtLRSEWJwoqYGVrzrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24657055"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="24657055"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 22:12:17 -0700
X-CSE-ConnectionGUID: dWxs0cVZSJSnBm2auYllIg==
X-CSE-MsgGUID: ez54yTUnQMaSD3xfWCWAOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="42191595"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Jun 2024 22:12:16 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEMSz-000Maj-2i;
	Tue, 04 Jun 2024 05:12:13 +0000
Date: Tue, 04 Jun 2024 13:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.11] BUILD SUCCESS
 f6e32aa9693e7f0748087e49484d97808f1bbc98
Message-ID: <202406041353.J4WEM7Sa-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.11
branch HEAD: f6e32aa9693e7f0748087e49484d97808f1bbc98  arm64: dts: renesas: r9a08g045: Update fallback string for SDHI nodes

elapsed time: 1173m

configs tested: 118
configs skipped: 102

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240603   gcc  
arc                   randconfig-002-20240603   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240603   gcc  
arm                   randconfig-002-20240603   gcc  
arm                   randconfig-003-20240603   gcc  
arm                   randconfig-004-20240603   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240603   gcc  
arm64                 randconfig-002-20240603   gcc  
arm64                 randconfig-004-20240603   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240603   gcc  
csky                  randconfig-002-20240603   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                                defconfig   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240603   gcc  
loongarch             randconfig-002-20240603   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240603   gcc  
nios2                 randconfig-002-20240603   gcc  
openrisc                         allmodconfig   gcc  
parisc                randconfig-001-20240603   gcc  
parisc                randconfig-002-20240603   gcc  
powerpc                          allyesconfig   clang
powerpc                       holly_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc               randconfig-001-20240603   gcc  
powerpc               randconfig-002-20240603   gcc  
powerpc               randconfig-003-20240603   gcc  
powerpc64             randconfig-001-20240603   gcc  
powerpc64             randconfig-002-20240603   gcc  
riscv                            allmodconfig   clang
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20240603   gcc  
sh                    randconfig-002-20240603   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240603   gcc  
sparc64               randconfig-002-20240603   gcc  
um                               alldefconfig   clang
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-002-20240603   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240604   clang
x86_64       buildonly-randconfig-002-20240604   clang
x86_64       buildonly-randconfig-004-20240604   clang
x86_64       buildonly-randconfig-006-20240604   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240604   clang
x86_64                randconfig-011-20240604   clang
x86_64                randconfig-012-20240604   clang
x86_64                randconfig-013-20240604   clang
x86_64                randconfig-014-20240604   clang
x86_64                randconfig-015-20240604   clang
x86_64                randconfig-016-20240604   clang
x86_64                randconfig-071-20240604   clang
x86_64                randconfig-074-20240604   clang
x86_64                randconfig-075-20240604   clang
x86_64                randconfig-076-20240604   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240603   gcc  
xtensa                randconfig-002-20240603   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

