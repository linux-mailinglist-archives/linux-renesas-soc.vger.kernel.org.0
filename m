Return-Path: <linux-renesas-soc+bounces-1425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0A6828977
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jan 2024 16:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8B4D28815F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jan 2024 15:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06013A8C2;
	Tue,  9 Jan 2024 15:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvWkMyrU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D683A8C0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jan 2024 15:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704815562; x=1736351562;
  h=date:from:to:cc:subject:message-id;
  bh=qBjYGLKxotLrxSFMwAHCypFbGfvSHgbfErko6PcGsIs=;
  b=cvWkMyrUc9q1syStO1wGpBPaA+ULpebm6P0YfZ9pKIfPHdEbiKr9uVHy
   SbK30QIUQtnTvge3YZ4TZWZVknRibX6ddMSTSNfHHBXAAcO/K3zdb1Els
   Ky46fuhigElVvZHs+M5PT0hjqeBixpv4XUlqiuS8oboWVOtnZPvsMtago
   2trevcB2SLu5OSh/grKiss4DozQdL+AoLmKoS8oF8Wici59kXWJo/nCY5
   doBxEAdDskP/Wo3Jr/ZoKqKX9cJfe1gAV4HaFh8VMFCWSkn2owHBsWMmC
   5ytQUS6b0TSNesN0nQzA5YA9EY6ckK3v6qp0+nerPfuYEwalZ0l1zgGra
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="16828507"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="16828507"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 07:52:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="816011886"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="816011886"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 09 Jan 2024 07:52:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNEP7-00060W-25;
	Tue, 09 Jan 2024 15:52:37 +0000
Date: Tue, 09 Jan 2024 23:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/v4m-gray-hawk-single-v1] BUILD
 SUCCESS 3ed2bd5eb0f538b360ce6cdb238f9a59894c4c3a
Message-ID: <202401092301.IILUgq3N-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/v4m-gray-hawk-single-v1
branch HEAD: 3ed2bd5eb0f538b360ce6cdb238f9a59894c4c3a  [POSTPONE until after v6.8-rc1] dt-bindings: serial: renesas,hscif: Document r8a779h0 bindings

elapsed time: 1446m

configs tested: 207
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
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240109   gcc  
arc                   randconfig-002-20240109   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   clang
arm                           h3600_defconfig   gcc  
arm                   randconfig-001-20240109   clang
arm                   randconfig-002-20240109   clang
arm                   randconfig-003-20240109   clang
arm                   randconfig-004-20240109   clang
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240109   clang
arm64                 randconfig-002-20240109   clang
arm64                 randconfig-003-20240109   clang
arm64                 randconfig-004-20240109   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240109   gcc  
csky                  randconfig-002-20240109   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240109   clang
hexagon               randconfig-002-20240109   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240109   clang
i386         buildonly-randconfig-002-20240109   clang
i386         buildonly-randconfig-003-20240109   clang
i386         buildonly-randconfig-004-20240109   clang
i386         buildonly-randconfig-005-20240109   clang
i386         buildonly-randconfig-006-20240109   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240109   clang
i386                  randconfig-002-20240109   clang
i386                  randconfig-003-20240109   clang
i386                  randconfig-004-20240109   clang
i386                  randconfig-005-20240109   clang
i386                  randconfig-006-20240109   clang
i386                  randconfig-011-20240109   gcc  
i386                  randconfig-012-20240109   gcc  
i386                  randconfig-013-20240109   gcc  
i386                  randconfig-014-20240109   gcc  
i386                  randconfig-015-20240109   gcc  
i386                  randconfig-016-20240109   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240109   gcc  
loongarch             randconfig-002-20240109   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240109   gcc  
nios2                 randconfig-002-20240109   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240109   gcc  
parisc                randconfig-002-20240109   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc               randconfig-001-20240109   clang
powerpc               randconfig-002-20240109   clang
powerpc               randconfig-003-20240109   clang
powerpc                     redwood_defconfig   gcc  
powerpc                    socrates_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64                        alldefconfig   gcc  
powerpc64             randconfig-001-20240109   clang
powerpc64             randconfig-002-20240109   clang
powerpc64             randconfig-003-20240109   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240109   clang
riscv                 randconfig-002-20240109   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240109   gcc  
s390                  randconfig-002-20240109   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20240109   gcc  
sh                    randconfig-002-20240109   gcc  
sh                             sh03_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240109   gcc  
sparc64               randconfig-002-20240109   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240109   clang
um                    randconfig-002-20240109   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240109   clang
x86_64       buildonly-randconfig-002-20240109   clang
x86_64       buildonly-randconfig-003-20240109   clang
x86_64       buildonly-randconfig-004-20240109   clang
x86_64       buildonly-randconfig-005-20240109   clang
x86_64       buildonly-randconfig-006-20240109   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20240109   gcc  
x86_64                randconfig-002-20240109   gcc  
x86_64                randconfig-003-20240109   gcc  
x86_64                randconfig-004-20240109   gcc  
x86_64                randconfig-005-20240109   gcc  
x86_64                randconfig-006-20240109   gcc  
x86_64                randconfig-011-20240109   clang
x86_64                randconfig-012-20240109   clang
x86_64                randconfig-013-20240109   clang
x86_64                randconfig-014-20240109   clang
x86_64                randconfig-015-20240109   clang
x86_64                randconfig-016-20240109   clang
x86_64                randconfig-071-20240109   clang
x86_64                randconfig-072-20240109   clang
x86_64                randconfig-073-20240109   clang
x86_64                randconfig-074-20240109   clang
x86_64                randconfig-075-20240109   clang
x86_64                randconfig-076-20240109   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240109   gcc  
xtensa                randconfig-002-20240109   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

