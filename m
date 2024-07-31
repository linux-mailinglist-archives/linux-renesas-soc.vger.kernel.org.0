Return-Path: <linux-renesas-soc+bounces-7662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8F7943231
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 16:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91E55284C0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 14:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479461BBBF7;
	Wed, 31 Jul 2024 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXBuRtP+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB871BBBFD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2024 14:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722436787; cv=none; b=DxfJR9rrJWXP5kxm+r7K3ektVh0aWsnsgVIuzM1EG8EqQW2r1htol1Q8Ic2bxGkg03VoiERXHNqI2j0nePZaE/B2LpRA89z7MSX6jce/4omp0EeRoz0xOXkJLv68jnxB9CAEkgX0GoGvchoHc/VQavUuAC+fgJugHE2679yutc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722436787; c=relaxed/simple;
	bh=OB+ByEwHzdX8Arsx9cvqHKRINwDKUa/tz8fTFLWHRc0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tDV/7ynCYoqS76EQq/jKiyD3da9taOmWp1G8W70M5ac6uL0Wcy30D12LwjScZNUV/nlr7yXN5SqYc6UK1E0flDwNRpDX0PsYdvaBuqM3D7wzNdu48+X69TD7Q4bxlqMR/N5Rnovt4rFKo8PlYFC4wnyL3JPwpU5vBVGFhmqqY7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXBuRtP+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722436785; x=1753972785;
  h=date:from:to:cc:subject:message-id;
  bh=OB+ByEwHzdX8Arsx9cvqHKRINwDKUa/tz8fTFLWHRc0=;
  b=aXBuRtP+qnkZinmKnunatFX+Nf8vG4FZU+onLVEeP1DFjOF0/ZXGfpON
   ymH6R9CIJvX/bn67Kud4mEWoT17wb0MsWmhy6JgI/84RCIPqb1jEIrouf
   IRvbiMnqlGPRHrumff1B8xanb6TJSOEqu/qcU+1QngVJyNUUJv8gnkUqP
   tJF11d3jsa/xKPBIiNh3tBR0IZRHllNRlsecoJFaPBjRICAgDv27ZEjnJ
   dRPuXgK0Ww1Iz7hhyq/MtpkwyOhVZfGxB/QXhJ9WZjbPHFFCLPkd+HBVd
   HopXV+PKcH1+Eel4y2/tte3E7ScSwak4Ujwh4f7Zc0p+yepfGd90A4FXW
   w==;
X-CSE-ConnectionGUID: RtFIdQMASeSp+2Bl73pAQw==
X-CSE-MsgGUID: OV+pE9QKQmi95E60wmqQpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20167270"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="20167270"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 07:39:44 -0700
X-CSE-ConnectionGUID: Mzi+FSn0RHS+qg4Y/qP1kw==
X-CSE-MsgGUID: S0Ur+EkdS3KPLkGEc4EBrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="92230445"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Jul 2024 07:39:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZAUO-000uSc-1t;
	Wed, 31 Jul 2024 14:39:40 +0000
Date: Wed, 31 Jul 2024 22:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/overlays] BUILD SUCCESS
 79666920df07d1a526173dfeec9999def3f7cef6
Message-ID: <202407312255.x7MFh4Bu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/overlays
branch HEAD: 79666920df07d1a526173dfeec9999def3f7cef6  kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used

elapsed time: 1448m

configs tested: 232
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240731   gcc-13.2.0
arc                   randconfig-002-20240731   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-14.1.0
arm                         lpc18xx_defconfig   gcc-14.1.0
arm                          pxa910_defconfig   gcc-14.1.0
arm                   randconfig-001-20240731   gcc-13.2.0
arm                   randconfig-001-20240731   gcc-14.1.0
arm                   randconfig-002-20240731   clang-20
arm                   randconfig-002-20240731   gcc-13.2.0
arm                   randconfig-003-20240731   clang-20
arm                   randconfig-003-20240731   gcc-13.2.0
arm                   randconfig-004-20240731   gcc-13.2.0
arm                   randconfig-004-20240731   gcc-14.1.0
arm                        shmobile_defconfig   gcc-14.1.0
arm                           tegra_defconfig   gcc-14.1.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240731   clang-15
arm64                 randconfig-001-20240731   gcc-13.2.0
arm64                 randconfig-002-20240731   clang-20
arm64                 randconfig-002-20240731   gcc-13.2.0
arm64                 randconfig-003-20240731   gcc-13.2.0
arm64                 randconfig-003-20240731   gcc-14.1.0
arm64                 randconfig-004-20240731   clang-20
arm64                 randconfig-004-20240731   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240731   gcc-13.2.0
csky                  randconfig-001-20240731   gcc-14.1.0
csky                  randconfig-002-20240731   gcc-13.2.0
csky                  randconfig-002-20240731   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240731   clang-16
hexagon               randconfig-002-20240731   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240731   clang-18
i386         buildonly-randconfig-002-20240731   clang-18
i386         buildonly-randconfig-003-20240731   clang-18
i386         buildonly-randconfig-004-20240731   clang-18
i386         buildonly-randconfig-004-20240731   gcc-13
i386         buildonly-randconfig-005-20240731   clang-18
i386         buildonly-randconfig-006-20240731   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240731   clang-18
i386                  randconfig-001-20240731   gcc-13
i386                  randconfig-002-20240731   clang-18
i386                  randconfig-003-20240731   clang-18
i386                  randconfig-004-20240731   clang-18
i386                  randconfig-005-20240731   clang-18
i386                  randconfig-005-20240731   gcc-13
i386                  randconfig-006-20240731   clang-18
i386                  randconfig-011-20240731   clang-18
i386                  randconfig-011-20240731   gcc-12
i386                  randconfig-012-20240731   clang-18
i386                  randconfig-012-20240731   gcc-13
i386                  randconfig-013-20240731   clang-18
i386                  randconfig-014-20240731   clang-18
i386                  randconfig-014-20240731   gcc-8
i386                  randconfig-015-20240731   clang-18
i386                  randconfig-015-20240731   gcc-10
i386                  randconfig-016-20240731   clang-18
i386                  randconfig-016-20240731   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240731   gcc-13.2.0
loongarch             randconfig-001-20240731   gcc-14.1.0
loongarch             randconfig-002-20240731   gcc-13.2.0
loongarch             randconfig-002-20240731   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         amcore_defconfig   gcc-14.1.0
m68k                          amiga_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                          multi_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                       bmips_be_defconfig   gcc-14.1.0
mips                  decstation_64_defconfig   gcc-14.1.0
mips                           ip22_defconfig   gcc-14.1.0
mips                      loongson3_defconfig   gcc-14.1.0
mips                         rt305x_defconfig   gcc-14.1.0
nios2                            alldefconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240731   gcc-13.2.0
nios2                 randconfig-001-20240731   gcc-14.1.0
nios2                 randconfig-002-20240731   gcc-13.2.0
nios2                 randconfig-002-20240731   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240731   gcc-13.2.0
parisc                randconfig-001-20240731   gcc-14.1.0
parisc                randconfig-002-20240731   gcc-13.2.0
parisc                randconfig-002-20240731   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                    adder875_defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     mpc83xx_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240731   clang-20
powerpc               randconfig-002-20240731   gcc-13.2.0
powerpc               randconfig-002-20240731   gcc-14.1.0
powerpc               randconfig-003-20240731   clang-20
powerpc               randconfig-003-20240731   gcc-13.2.0
powerpc                     tqm5200_defconfig   gcc-14.1.0
powerpc                     tqm8541_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240731   clang-20
powerpc64             randconfig-001-20240731   gcc-13.2.0
powerpc64             randconfig-002-20240731   clang-15
powerpc64             randconfig-002-20240731   gcc-13.2.0
powerpc64             randconfig-003-20240731   clang-20
powerpc64             randconfig-003-20240731   gcc-13.2.0
riscv                            alldefconfig   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240731   clang-20
riscv                 randconfig-001-20240731   gcc-13.2.0
riscv                 randconfig-002-20240731   clang-15
riscv                 randconfig-002-20240731   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240731   gcc-13.2.0
s390                  randconfig-001-20240731   gcc-14.1.0
s390                  randconfig-002-20240731   gcc-13.2.0
s390                  randconfig-002-20240731   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7705_defconfig   gcc-14.1.0
sh                          kfr2r09_defconfig   gcc-14.1.0
sh                          landisk_defconfig   gcc-14.1.0
sh                    randconfig-001-20240731   gcc-13.2.0
sh                    randconfig-001-20240731   gcc-14.1.0
sh                    randconfig-002-20240731   gcc-13.2.0
sh                    randconfig-002-20240731   gcc-14.1.0
sh                   rts7751r2dplus_defconfig   gcc-14.1.0
sh                        sh7763rdp_defconfig   gcc-14.1.0
sh                            shmin_defconfig   gcc-14.1.0
sh                          urquell_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240731   gcc-13.2.0
sparc64               randconfig-001-20240731   gcc-14.1.0
sparc64               randconfig-002-20240731   gcc-13.2.0
sparc64               randconfig-002-20240731   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240731   clang-20
um                    randconfig-001-20240731   gcc-13.2.0
um                    randconfig-002-20240731   clang-20
um                    randconfig-002-20240731   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240731   gcc-13
x86_64       buildonly-randconfig-002-20240731   gcc-13
x86_64       buildonly-randconfig-003-20240731   gcc-13
x86_64       buildonly-randconfig-004-20240731   gcc-13
x86_64       buildonly-randconfig-005-20240731   gcc-13
x86_64       buildonly-randconfig-006-20240731   gcc-13
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240731   gcc-13
x86_64                randconfig-002-20240731   gcc-13
x86_64                randconfig-003-20240731   gcc-13
x86_64                randconfig-004-20240731   gcc-13
x86_64                randconfig-005-20240731   gcc-13
x86_64                randconfig-006-20240731   gcc-13
x86_64                randconfig-011-20240731   gcc-13
x86_64                randconfig-012-20240731   gcc-13
x86_64                randconfig-013-20240731   gcc-13
x86_64                randconfig-014-20240731   gcc-13
x86_64                randconfig-015-20240731   gcc-13
x86_64                randconfig-016-20240731   gcc-13
x86_64                randconfig-071-20240731   gcc-13
x86_64                randconfig-072-20240731   gcc-13
x86_64                randconfig-073-20240731   gcc-13
x86_64                randconfig-074-20240731   gcc-13
x86_64                randconfig-075-20240731   gcc-13
x86_64                randconfig-076-20240731   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                          iss_defconfig   gcc-14.1.0
xtensa                  nommu_kc705_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240731   gcc-13.2.0
xtensa                randconfig-001-20240731   gcc-14.1.0
xtensa                randconfig-002-20240731   gcc-13.2.0
xtensa                randconfig-002-20240731   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

