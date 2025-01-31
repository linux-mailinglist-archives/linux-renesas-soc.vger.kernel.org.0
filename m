Return-Path: <linux-renesas-soc+bounces-12769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D1CA23900
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 03:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF997168DC6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 02:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594EC42C0B;
	Fri, 31 Jan 2025 02:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgHnONWM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB6B2563
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Jan 2025 02:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738291318; cv=none; b=SY6yu/eSObZSR15xNvuVfj8Q38L6ezbDxoEBLTUJ6EUTQMIDiE0u8y9j5S60lA2QN36wbxVyxM2KdfbwZMIybESD1yMr2IkxlSSzbGxjLaHMKKPJM/ELDIcJyrRUxm86EBcngV75/yaK5F1bFV9H2Ge4mS9ZIB4kC1C+fpIVAdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738291318; c=relaxed/simple;
	bh=rWYADhsTyGJGFhNI91/POlk/luzYUZKamuA6ZjCUXWQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P/SEk7nEltziz9BJM35f81hbWZOWRvsqkLdRswXDQULDM/UZsddH/mxQDTG6Rr6tsuJrIhJPb0mmjF+em5ebLbCmwE3FxC19n6IyzBlnFSN/3omYlvXhVtrZSL+WPMrhbG/dWH1JiL1VtB+9XxqC7aA/HspksPHTElN1gFwZkb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgHnONWM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738291316; x=1769827316;
  h=date:from:to:cc:subject:message-id;
  bh=rWYADhsTyGJGFhNI91/POlk/luzYUZKamuA6ZjCUXWQ=;
  b=JgHnONWMYlfdsATyaNLFFSMjNR2fL1ns807xSBI6up+JxypfZAE5y0S8
   7wdOGlb9Xy6GSYlGuz2oRqzQ5bp4dK7Dp2nj2dAjpG6HDAjUZLmYsWgMw
   l7ITU2gMj/OxJjrFIPLK+t8hsdqbPnAMzX/5OStIDS7XDOOdk20fVmZ8k
   b6RVtyw8Dp3d8+gJODtQxNDgzLJYAIb8xTI+YCiaqjexeG4ZemFsz52eQ
   YtpxCdvHArdkNRI0ledMrT4CsdObApWR4NdIFW0u5On1I/pL7O0iLRfvx
   XBfMWDZNlye0rwdLkSDmwQP175fzuF+RmYG55UjCkiCiDL3KFo69/zCyd
   w==;
X-CSE-ConnectionGUID: yrhSk2j9Sxi+/SNkbrWq/g==
X-CSE-MsgGUID: Kw9BwD2jRXyleX/djWeTrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38762309"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="38762309"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 18:41:55 -0800
X-CSE-ConnectionGUID: aVnVnirQR2SV3OnrlBoZjA==
X-CSE-MsgGUID: ikiK1PIKTXmxM0K1nza3aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="140399259"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jan 2025 18:41:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdgye-000ljS-1s;
	Fri, 31 Jan 2025 02:41:52 +0000
Date: Fri, 31 Jan 2025 10:41:41 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 a5826a8989992a3e29c25f38a163a1c5698e5545
Message-ID: <202501311035.MNbuXOwA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: a5826a8989992a3e29c25f38a163a1c5698e5545  Merge branch 'renesas-drivers-for-v6.15' into renesas-devel

elapsed time: 916m

configs tested: 122
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250130    gcc-13.2.0
arc                   randconfig-002-20250130    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250130    gcc-14.2.0
arm                   randconfig-002-20250130    clang-20
arm                   randconfig-003-20250130    gcc-14.2.0
arm                   randconfig-004-20250130    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250130    clang-21
arm64                 randconfig-002-20250130    gcc-14.2.0
arm64                 randconfig-003-20250130    clang-21
arm64                 randconfig-004-20250130    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250130    gcc-14.2.0
csky                  randconfig-002-20250130    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250130    clang-20
hexagon               randconfig-002-20250130    clang-20
i386                             alldefconfig    gcc-12
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250130    clang-19
i386        buildonly-randconfig-002-20250130    clang-19
i386        buildonly-randconfig-003-20250130    gcc-11
i386        buildonly-randconfig-004-20250130    gcc-12
i386        buildonly-randconfig-005-20250130    gcc-12
i386        buildonly-randconfig-006-20250130    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250130    gcc-14.2.0
loongarch             randconfig-002-20250130    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-21
mips                       bmips_be_defconfig    gcc-14.2.0
nios2                 randconfig-001-20250130    gcc-14.2.0
nios2                 randconfig-002-20250130    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250130    gcc-14.2.0
parisc                randconfig-002-20250130    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       ebony_defconfig    clang-18
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    clang-17
powerpc                      pcm030_defconfig    clang-17
powerpc                       ppc64_defconfig    clang-19
powerpc               randconfig-001-20250130    gcc-14.2.0
powerpc               randconfig-002-20250130    clang-16
powerpc               randconfig-003-20250130    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-21
powerpc64             randconfig-001-20250130    gcc-14.2.0
powerpc64             randconfig-002-20250130    clang-21
powerpc64             randconfig-003-20250130    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                    nommu_k210_defconfig    clang-15
riscv                 randconfig-001-20250131    clang-19
riscv                 randconfig-002-20250131    clang-21
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250131    clang-16
s390                  randconfig-002-20250131    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250131    gcc-14.2.0
sh                    randconfig-002-20250131    gcc-14.2.0
sh                           se7206_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250131    gcc-14.2.0
sparc                 randconfig-002-20250131    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250131    gcc-14.2.0
sparc64               randconfig-002-20250131    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250131    clang-19
um                    randconfig-002-20250131    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250130    clang-19
x86_64      buildonly-randconfig-002-20250130    gcc-12
x86_64      buildonly-randconfig-003-20250130    gcc-12
x86_64      buildonly-randconfig-004-20250130    clang-19
x86_64      buildonly-randconfig-005-20250130    gcc-12
x86_64      buildonly-randconfig-006-20250130    gcc-12
x86_64                              defconfig    gcc-11
xtensa                randconfig-001-20250131    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

