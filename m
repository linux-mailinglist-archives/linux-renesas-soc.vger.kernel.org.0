Return-Path: <linux-renesas-soc+bounces-10188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C1B9B4178
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 05:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4C83B2159F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2024 04:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABBE1DFE3D;
	Tue, 29 Oct 2024 04:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAic7Twa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5369BFC0B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Oct 2024 04:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730174804; cv=none; b=RrFbtTsQ8cLL/wXwqG6zF207+kAVXQ32HFafaT7qsAifHCvf109DIgfMEOfSarkDpTjAiLPQNap+pGXzDXDm90usEvzLiK6wcZUZ+hlwsngmL8tKrTYFceu3h2DfK9vpH8/IySMbVNMHdh+skM8/kZ6Smd0VNrFy7ZdG9SFmFNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730174804; c=relaxed/simple;
	bh=0rBPctU5WIhrG7p5sCKPRMGlOb/mUkpWU2FADLIysBk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bL7qi0rcGOIjmHx3Nr/TSAqc4CXnc26751G6qyXfLszvgi0089GuDFk9jRmSJVfHpnithGhlPeB85nPXhQBAnNXX9A60zI189Sg4CNXyaMoBZbZZty6d2dzPpbjqS0Vvl8ww2sw476zDfG6cOmieOBtU+ki+4+e8ru4IQiPNsTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAic7Twa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730174802; x=1761710802;
  h=date:from:to:cc:subject:message-id;
  bh=0rBPctU5WIhrG7p5sCKPRMGlOb/mUkpWU2FADLIysBk=;
  b=LAic7Twa6k47F48BS/YfxYGATMkqdGi5/btVYonHGbxja6h96QvVnwPN
   C/Q1/JJ+dfQPiSP02q2KJ/535K5goP8eAVVUBj/ouIfoKrqzzxIL9rt9H
   GoLVXaPnnF43exEsmd8iIAQdCh/9bO9G/iXlST58zmWJ1Q09ZAXgCtK6S
   GO2MlbUI8Axg2WO252wp8JPfW1eP5YmahLkTZBDti0FufiY4+lw2d4W1P
   y/ZxqDcJfq3vxOaOIczCylxbqPtKnmSC1ZR3/kp8iaashLWgFQ8I0Y86W
   iXCrzGna0g7KwTtw6ltzi1wUuuYeXlwjVmZpEhyP3qXUV1UC4k9+ig8c3
   w==;
X-CSE-ConnectionGUID: /jJkxDI0RyuxSCXAavav6Q==
X-CSE-MsgGUID: UkXVoxWiQj+okPjNUMkCKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29698288"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="29698288"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 21:06:42 -0700
X-CSE-ConnectionGUID: bMdLpEnBQ4qd36kBFYPGDg==
X-CSE-MsgGUID: JfOJyBWpRl+d2VFvknog3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="82637935"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Oct 2024 21:06:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5dV8-000dEE-1E;
	Tue, 29 Oct 2024 04:06:38 +0000
Date: Tue, 29 Oct 2024 12:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 b3ebf6f47e47249ce24d3cf5be30293e88566608
Message-ID: <202410291204.LyFXLhsc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: b3ebf6f47e47249ce24d3cf5be30293e88566608  Merge branch 'renesas-next', tag 'v6.12-rc5' into renesas-devel

elapsed time: 1011m

configs tested: 147
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241029    gcc-13.2.0
arc                   randconfig-002-20241029    gcc-13.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                   randconfig-001-20241029    gcc-14.1.0
arm                   randconfig-002-20241029    gcc-14.1.0
arm                   randconfig-003-20241029    gcc-14.1.0
arm                   randconfig-004-20241029    clang-16
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241029    clang-17
arm64                 randconfig-002-20241029    clang-20
arm64                 randconfig-003-20241029    gcc-14.1.0
arm64                 randconfig-004-20241029    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241029    gcc-14.1.0
csky                  randconfig-002-20241029    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241029    clang-20
hexagon               randconfig-002-20241029    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241029    clang-19
i386        buildonly-randconfig-002-20241029    gcc-12
i386        buildonly-randconfig-003-20241029    clang-19
i386        buildonly-randconfig-004-20241029    gcc-12
i386        buildonly-randconfig-005-20241029    clang-19
i386        buildonly-randconfig-006-20241029    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241029    gcc-12
i386                  randconfig-002-20241029    gcc-12
i386                  randconfig-003-20241029    gcc-12
i386                  randconfig-004-20241029    clang-19
i386                  randconfig-005-20241029    clang-19
i386                  randconfig-006-20241029    gcc-12
i386                  randconfig-011-20241029    gcc-12
i386                  randconfig-012-20241029    clang-19
i386                  randconfig-013-20241029    clang-19
i386                  randconfig-014-20241029    clang-19
i386                  randconfig-015-20241029    clang-19
i386                  randconfig-016-20241029    clang-19
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241029    gcc-14.1.0
loongarch             randconfig-002-20241029    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241029    gcc-14.1.0
nios2                 randconfig-002-20241029    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.1.0
parisc                randconfig-001-20241029    gcc-14.1.0
parisc                randconfig-002-20241029    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc               randconfig-001-20241029    gcc-14.1.0
powerpc               randconfig-002-20241029    clang-20
powerpc               randconfig-003-20241029    gcc-14.1.0
powerpc64             randconfig-001-20241029    gcc-14.1.0
powerpc64             randconfig-002-20241029    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241029    clang-20
riscv                 randconfig-002-20241029    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
s390                                defconfig    gcc-12
s390                  randconfig-001-20241029    gcc-14.1.0
s390                  randconfig-002-20241029    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.1.0
sh                    randconfig-001-20241029    gcc-14.1.0
sh                    randconfig-002-20241029    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.1.0
sparc64               randconfig-001-20241029    gcc-14.1.0
sparc64               randconfig-002-20241029    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-002-20241029    gcc-12
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241029    gcc-14.1.0
xtensa                randconfig-002-20241029    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

