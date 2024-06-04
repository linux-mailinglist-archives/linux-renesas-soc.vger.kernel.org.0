Return-Path: <linux-renesas-soc+bounces-5802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF568FAB8B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 09:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 716D61C20B65
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 07:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C2E13790F;
	Tue,  4 Jun 2024 07:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwkYcUnO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84072209B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Jun 2024 07:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717484880; cv=none; b=mxN2RgszF7o8SRvocmd9HvUi2G3u9/cd9tasEclswxXQSN3819SRknwQOhssSvLM+wI7075xx0cn5m+QLPxeJt7pPxS0nW1J7sKOgFWsIXgmj0ip9q+xJ1vnDBPOe9+xWVuDQFPHh4mcBcJBdMoxmrww9m9/UHvstKD6E2eDem4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717484880; c=relaxed/simple;
	bh=WsejYSNg0dNeV4OBbZjQKqEeDt6h14CT2B4+X6l9F5I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VJ/aCNv2PLHvbVOvLn2OQ2yQ3alB/bMU211P6GmAK5qXLoV0ATdraQOUq66NR0QsrVRlUZGM8FlGpnjARSR7kEAyn9tWGXEEij9OZy8lPBKnZAURzMIIdN4XvxqT3WSQJoIKodGo1VDewslOPDYIgidnk1VGvRagBCREuMmveCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwkYcUnO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717484878; x=1749020878;
  h=date:from:to:cc:subject:message-id;
  bh=WsejYSNg0dNeV4OBbZjQKqEeDt6h14CT2B4+X6l9F5I=;
  b=SwkYcUnOioqjwqNMGs7sIu1qhSZH0nJuRc5vav4awmfBVQ6PQoqxgBCf
   0xE1QUts+u19ZyPItY0y0SOHKxq7IrCBEFU7GdB45Z2KuIcfyTWvvB+dK
   3q7nF3cnpTUn67vcAFOaaQ++mExwe88zu1sCnxE82/SlNuDeJzaLQ+g/R
   FMvNFUNj2yqNE0BTZKUVgyNrx3oz5lLg1+WlxpvIDPkNFF8WEBL4W7I7m
   AWxxZ79qzAEAkmqZRh2eKXC3zbVxYBtS0S0NCpxlwPAXVRlyUaWZey0gs
   l85IBst93hE0H756PyAkJLQfuvn+zOOZgbFZ+VHC03yN6IfJUTbCBAFXe
   g==;
X-CSE-ConnectionGUID: KJAK1OibS4SH7Bo6GO9Lbw==
X-CSE-MsgGUID: 67vFN9EZTziYNPfmhtj3cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25120057"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="25120057"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 00:07:57 -0700
X-CSE-ConnectionGUID: wmN9fZY6TTWSaPw/fWNGcw==
X-CSE-MsgGUID: M/zfPHHCR4K2H2ySReg5zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="42069598"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 04 Jun 2024 00:07:56 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEOGv-000MgW-2z;
	Tue, 04 Jun 2024 07:07:53 +0000
Date: Tue, 04 Jun 2024 15:07:37 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.11] BUILD SUCCESS
 b86c2b1ce7a33250b0e164cf0f85a3356ee04a88
Message-ID: <202406041535.NPTMU6pH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.11
branch HEAD: b86c2b1ce7a33250b0e164cf0f85a3356ee04a88  clk: renesas: rcar-gen2: Use DEFINE_SPINLOCK() for static spinlock

elapsed time: 1289m

configs tested: 212
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240603   gcc  
arc                   randconfig-001-20240604   gcc  
arc                   randconfig-002-20240603   gcc  
arc                   randconfig-002-20240604   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240603   gcc  
arm                   randconfig-002-20240603   gcc  
arm                   randconfig-002-20240604   gcc  
arm                   randconfig-003-20240603   gcc  
arm                   randconfig-004-20240603   gcc  
arm                   randconfig-004-20240604   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240603   gcc  
arm64                 randconfig-002-20240603   gcc  
arm64                 randconfig-002-20240604   gcc  
arm64                 randconfig-003-20240604   gcc  
arm64                 randconfig-004-20240603   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240603   gcc  
csky                  randconfig-001-20240604   gcc  
csky                  randconfig-002-20240603   gcc  
csky                  randconfig-002-20240604   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240603   clang
i386         buildonly-randconfig-002-20240603   clang
i386         buildonly-randconfig-003-20240603   gcc  
i386         buildonly-randconfig-004-20240603   gcc  
i386         buildonly-randconfig-005-20240603   gcc  
i386         buildonly-randconfig-006-20240603   clang
i386                                defconfig   clang
i386                  randconfig-001-20240603   clang
i386                  randconfig-002-20240603   gcc  
i386                  randconfig-003-20240603   gcc  
i386                  randconfig-004-20240603   clang
i386                  randconfig-005-20240603   clang
i386                  randconfig-006-20240603   gcc  
i386                  randconfig-011-20240603   clang
i386                  randconfig-012-20240603   clang
i386                  randconfig-013-20240603   clang
i386                  randconfig-014-20240603   clang
i386                  randconfig-015-20240603   clang
i386                  randconfig-016-20240603   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240603   gcc  
loongarch             randconfig-001-20240604   gcc  
loongarch             randconfig-002-20240603   gcc  
loongarch             randconfig-002-20240604   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240603   gcc  
nios2                 randconfig-001-20240604   gcc  
nios2                 randconfig-002-20240603   gcc  
nios2                 randconfig-002-20240604   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240603   gcc  
parisc                randconfig-001-20240604   gcc  
parisc                randconfig-002-20240603   gcc  
parisc                randconfig-002-20240604   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240603   gcc  
powerpc               randconfig-001-20240604   gcc  
powerpc               randconfig-002-20240603   gcc  
powerpc               randconfig-002-20240604   gcc  
powerpc               randconfig-003-20240603   gcc  
powerpc               randconfig-003-20240604   gcc  
powerpc64             randconfig-001-20240603   gcc  
powerpc64             randconfig-001-20240604   gcc  
powerpc64             randconfig-002-20240603   gcc  
powerpc64             randconfig-002-20240604   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240604   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240604   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20240603   gcc  
sh                    randconfig-001-20240604   gcc  
sh                    randconfig-002-20240603   gcc  
sh                    randconfig-002-20240604   gcc  
sh                           se7724_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240603   gcc  
sparc64               randconfig-001-20240604   gcc  
sparc64               randconfig-002-20240603   gcc  
sparc64               randconfig-002-20240604   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-002-20240603   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240603   gcc  
x86_64       buildonly-randconfig-001-20240604   clang
x86_64       buildonly-randconfig-002-20240603   gcc  
x86_64       buildonly-randconfig-002-20240604   clang
x86_64       buildonly-randconfig-003-20240603   gcc  
x86_64       buildonly-randconfig-003-20240604   gcc  
x86_64       buildonly-randconfig-004-20240604   clang
x86_64       buildonly-randconfig-005-20240604   gcc  
x86_64       buildonly-randconfig-006-20240603   gcc  
x86_64       buildonly-randconfig-006-20240604   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240603   gcc  
x86_64                randconfig-001-20240604   clang
x86_64                randconfig-002-20240604   gcc  
x86_64                randconfig-003-20240604   gcc  
x86_64                randconfig-004-20240603   gcc  
x86_64                randconfig-004-20240604   gcc  
x86_64                randconfig-005-20240603   gcc  
x86_64                randconfig-005-20240604   gcc  
x86_64                randconfig-006-20240603   gcc  
x86_64                randconfig-006-20240604   gcc  
x86_64                randconfig-011-20240603   gcc  
x86_64                randconfig-011-20240604   clang
x86_64                randconfig-012-20240603   gcc  
x86_64                randconfig-012-20240604   clang
x86_64                randconfig-013-20240604   clang
x86_64                randconfig-014-20240603   gcc  
x86_64                randconfig-014-20240604   clang
x86_64                randconfig-015-20240603   gcc  
x86_64                randconfig-015-20240604   clang
x86_64                randconfig-016-20240604   clang
x86_64                randconfig-071-20240604   clang
x86_64                randconfig-072-20240604   gcc  
x86_64                randconfig-073-20240604   gcc  
x86_64                randconfig-074-20240604   clang
x86_64                randconfig-075-20240603   gcc  
x86_64                randconfig-075-20240604   clang
x86_64                randconfig-076-20240603   gcc  
x86_64                randconfig-076-20240604   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240603   gcc  
xtensa                randconfig-001-20240604   gcc  
xtensa                randconfig-002-20240603   gcc  
xtensa                randconfig-002-20240604   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

