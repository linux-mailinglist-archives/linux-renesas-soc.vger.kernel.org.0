Return-Path: <linux-renesas-soc+bounces-7351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6104931DA5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2024 01:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6E7D1C21674
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 23:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858ED22626;
	Mon, 15 Jul 2024 23:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5eB3SzL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DF4208A9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jul 2024 23:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721086423; cv=none; b=kl8/I+WobaWcTGDMZlWLhYBcI5sOGBkX7TkexuqsLpHr9rnf6DotueEaRA6FBCsDJf4yvJf9M4tY2QPL94NzukQzmnR2Idgy0wIHonnthK2IUrZ62FZI4L9yfps/s/vBc24NX2WjURnB6nu++zmSbUIGCOEN7+hOOdlszjU0nws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721086423; c=relaxed/simple;
	bh=jw/uSFeRGI9IITLBaDEFNIC4jpXncU9E3jf+kBoXhN4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZCGvHRfPDAkZXuLGKXRfpeehcbHv7weS4Jj+1fjLcYuFWAIRekf0cyP/S1eq/ytzetMPPsYJmHyPE9MQ6KbITzNoW1Up5H44CDsmmq+1yhSfyVmg6NKLtorSV3y63iCIVZGKK6356maEMQyZKOJqFzJd+WKkonc3z1eUEQNLBtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5eB3SzL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721086422; x=1752622422;
  h=date:from:to:cc:subject:message-id;
  bh=jw/uSFeRGI9IITLBaDEFNIC4jpXncU9E3jf+kBoXhN4=;
  b=i5eB3SzLKT8XwmWhthEST/Kc4JLGGcC62VlbPUpP/lktHpZmghlmpgRq
   AnAxVtLSdd4MAK5S1cWh0jOYzDi7YKfRaM12ikXEuy/VV8LsBkYjqu27o
   dkSkHy2S2KU0dxB4iFCy8MdFftzhCqD0I2QdbkheIw3ZbLZFUavrutV7K
   XNo/KVhvMc5EAKFTR9Z7TZyNo+lnAh58I118cGu3p/b5zvPJ+63qD4svw
   tBP2T4+mQPdF4p8/7CnRbGmgowP6QV2l0pIDIyVYCJMTtjllZLeuy6+SC
   dR0oCf5PU2hFo+Ac+G7eqrf9lr5VgIm9m8o7jN9q6YKGzfNxEcO4S8e4z
   g==;
X-CSE-ConnectionGUID: WbydEFpBS86+LEtsIheDew==
X-CSE-MsgGUID: 5P9WhZdXQhCLxsB+fzDaqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="22260650"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="22260650"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 16:33:41 -0700
X-CSE-ConnectionGUID: l2PjOmrIRYigMdp6tMl0jQ==
X-CSE-MsgGUID: 6pj/pC2ySMKneJ7iP+T53A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="73030311"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jul 2024 16:33:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTVCL-000eeg-1N;
	Mon, 15 Jul 2024 23:33:37 +0000
Date: Tue, 16 Jul 2024 07:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 c89619c3915a7800311b3cd881f03c952c39cb95
Message-ID: <202407160757.Aw5IsB7J-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: c89619c3915a7800311b3cd881f03c952c39cb95  Merge tag 'v6.10' into renesas-devel

elapsed time: 726m

configs tested: 283
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arc                        nsimosci_defconfig   gcc-13.2.0
arc                   randconfig-001-20240715   gcc-13.2.0
arc                   randconfig-001-20240716   gcc-13.2.0
arc                   randconfig-002-20240715   gcc-13.2.0
arc                   randconfig-002-20240716   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                        clps711x_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                           imxrt_defconfig   gcc-13.2.0
arm                      jornada720_defconfig   gcc-13.2.0
arm                         nhk8815_defconfig   gcc-13.2.0
arm                          pxa3xx_defconfig   gcc-13.2.0
arm                             pxa_defconfig   gcc-13.2.0
arm                   randconfig-001-20240715   gcc-14.1.0
arm                   randconfig-001-20240716   gcc-13.2.0
arm                   randconfig-002-20240715   gcc-14.1.0
arm                   randconfig-002-20240716   gcc-13.2.0
arm                   randconfig-003-20240715   gcc-14.1.0
arm                   randconfig-003-20240716   gcc-13.2.0
arm                   randconfig-004-20240715   clang-19
arm                   randconfig-004-20240716   gcc-13.2.0
arm                        shmobile_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240715   clang-19
arm64                 randconfig-001-20240716   gcc-13.2.0
arm64                 randconfig-002-20240715   clang-19
arm64                 randconfig-002-20240716   gcc-13.2.0
arm64                 randconfig-003-20240715   clang-19
arm64                 randconfig-003-20240716   gcc-13.2.0
arm64                 randconfig-004-20240715   clang-19
arm64                 randconfig-004-20240716   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240715   gcc-14.1.0
csky                  randconfig-001-20240716   gcc-13.2.0
csky                  randconfig-002-20240715   gcc-14.1.0
csky                  randconfig-002-20240716   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240715   clang-19
hexagon               randconfig-002-20240715   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240715   clang-18
i386         buildonly-randconfig-001-20240716   clang-18
i386         buildonly-randconfig-002-20240715   clang-18
i386         buildonly-randconfig-002-20240716   clang-18
i386         buildonly-randconfig-003-20240715   gcc-13
i386         buildonly-randconfig-003-20240716   clang-18
i386         buildonly-randconfig-004-20240715   gcc-12
i386         buildonly-randconfig-004-20240716   clang-18
i386         buildonly-randconfig-005-20240715   clang-18
i386         buildonly-randconfig-005-20240716   clang-18
i386         buildonly-randconfig-006-20240715   gcc-13
i386         buildonly-randconfig-006-20240716   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240715   gcc-13
i386                  randconfig-001-20240716   clang-18
i386                  randconfig-002-20240715   clang-18
i386                  randconfig-002-20240716   clang-18
i386                  randconfig-003-20240715   clang-18
i386                  randconfig-003-20240716   clang-18
i386                  randconfig-004-20240715   gcc-13
i386                  randconfig-004-20240716   clang-18
i386                  randconfig-005-20240715   gcc-13
i386                  randconfig-005-20240716   clang-18
i386                  randconfig-006-20240715   gcc-13
i386                  randconfig-006-20240716   clang-18
i386                  randconfig-011-20240715   gcc-9
i386                  randconfig-011-20240716   clang-18
i386                  randconfig-012-20240715   gcc-13
i386                  randconfig-012-20240716   clang-18
i386                  randconfig-013-20240715   gcc-7
i386                  randconfig-013-20240716   clang-18
i386                  randconfig-014-20240715   clang-18
i386                  randconfig-014-20240716   clang-18
i386                  randconfig-015-20240715   clang-18
i386                  randconfig-015-20240716   clang-18
i386                  randconfig-016-20240715   clang-18
i386                  randconfig-016-20240716   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240715   gcc-14.1.0
loongarch             randconfig-001-20240716   gcc-13.2.0
loongarch             randconfig-002-20240715   gcc-14.1.0
loongarch             randconfig-002-20240716   gcc-13.2.0
m68k                             alldefconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5475evb_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
microblaze                      mmu_defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                          ath25_defconfig   gcc-13.2.0
mips                     cu1830-neo_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240715   gcc-14.1.0
nios2                 randconfig-001-20240716   gcc-13.2.0
nios2                 randconfig-002-20240715   gcc-14.1.0
nios2                 randconfig-002-20240716   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240715   gcc-14.1.0
parisc                randconfig-001-20240716   gcc-13.2.0
parisc                randconfig-002-20240715   gcc-14.1.0
parisc                randconfig-002-20240716   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                    adder875_defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      arches_defconfig   gcc-13.2.0
powerpc                   microwatt_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   gcc-13.2.0
powerpc                      pcm030_defconfig   gcc-13.2.0
powerpc                      pmac32_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240715   clang-17
powerpc               randconfig-001-20240716   gcc-13.2.0
powerpc               randconfig-002-20240715   clang-19
powerpc               randconfig-002-20240716   gcc-13.2.0
powerpc               randconfig-003-20240715   gcc-14.1.0
powerpc               randconfig-003-20240716   gcc-13.2.0
powerpc64             randconfig-001-20240715   clang-14
powerpc64             randconfig-001-20240716   gcc-13.2.0
powerpc64             randconfig-002-20240715   gcc-14.1.0
powerpc64             randconfig-002-20240716   gcc-13.2.0
powerpc64             randconfig-003-20240715   gcc-14.1.0
powerpc64             randconfig-003-20240716   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240715   gcc-14.1.0
riscv                 randconfig-001-20240716   gcc-13.2.0
riscv                 randconfig-002-20240715   gcc-14.1.0
riscv                 randconfig-002-20240716   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240715   gcc-14.1.0
s390                  randconfig-001-20240716   gcc-13.2.0
s390                  randconfig-002-20240715   gcc-14.1.0
s390                  randconfig-002-20240716   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                        apsh4ad0a_defconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                               j2_defconfig   gcc-13.2.0
sh                    randconfig-001-20240715   gcc-14.1.0
sh                    randconfig-001-20240716   gcc-13.2.0
sh                    randconfig-002-20240715   gcc-14.1.0
sh                    randconfig-002-20240716   gcc-13.2.0
sh                           se7751_defconfig   gcc-13.2.0
sh                   secureedge5410_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-13.2.0
sh                            shmin_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc                            alldefconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc64_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240715   gcc-14.1.0
sparc64               randconfig-001-20240716   gcc-13.2.0
sparc64               randconfig-002-20240715   gcc-14.1.0
sparc64               randconfig-002-20240716   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240715   gcc-12
um                    randconfig-001-20240716   gcc-13.2.0
um                    randconfig-002-20240715   clang-19
um                    randconfig-002-20240716   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240715   clang-18
x86_64       buildonly-randconfig-001-20240716   gcc-13
x86_64       buildonly-randconfig-002-20240715   gcc-13
x86_64       buildonly-randconfig-002-20240716   gcc-13
x86_64       buildonly-randconfig-003-20240715   clang-18
x86_64       buildonly-randconfig-003-20240716   gcc-13
x86_64       buildonly-randconfig-004-20240715   gcc-13
x86_64       buildonly-randconfig-004-20240716   gcc-13
x86_64       buildonly-randconfig-005-20240715   gcc-13
x86_64       buildonly-randconfig-005-20240716   gcc-13
x86_64       buildonly-randconfig-006-20240715   gcc-8
x86_64       buildonly-randconfig-006-20240716   gcc-13
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240715   gcc-9
x86_64                randconfig-001-20240716   gcc-13
x86_64                randconfig-002-20240715   gcc-7
x86_64                randconfig-002-20240716   gcc-13
x86_64                randconfig-003-20240715   clang-18
x86_64                randconfig-003-20240716   gcc-13
x86_64                randconfig-004-20240715   clang-18
x86_64                randconfig-004-20240716   gcc-13
x86_64                randconfig-005-20240715   gcc-11
x86_64                randconfig-005-20240716   gcc-13
x86_64                randconfig-006-20240715   clang-18
x86_64                randconfig-006-20240716   gcc-13
x86_64                randconfig-011-20240715   gcc-12
x86_64                randconfig-011-20240716   gcc-13
x86_64                randconfig-012-20240715   clang-18
x86_64                randconfig-012-20240716   gcc-13
x86_64                randconfig-013-20240715   clang-18
x86_64                randconfig-013-20240716   gcc-13
x86_64                randconfig-014-20240715   gcc-12
x86_64                randconfig-014-20240716   gcc-13
x86_64                randconfig-015-20240715   gcc-10
x86_64                randconfig-015-20240716   gcc-13
x86_64                randconfig-016-20240715   gcc-10
x86_64                randconfig-016-20240716   gcc-13
x86_64                randconfig-071-20240715   gcc-13
x86_64                randconfig-071-20240716   gcc-13
x86_64                randconfig-072-20240715   gcc-13
x86_64                randconfig-072-20240716   gcc-13
x86_64                randconfig-073-20240716   gcc-13
x86_64                randconfig-074-20240716   gcc-13
x86_64                randconfig-075-20240716   gcc-13
x86_64                randconfig-076-20240716   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240716   gcc-13.2.0
xtensa                randconfig-002-20240715   gcc-14.1.0
xtensa                randconfig-002-20240716   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

