Return-Path: <linux-renesas-soc+bounces-3146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C1586228F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Feb 2024 04:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D594C1C21635
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Feb 2024 03:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCEF51FAA;
	Sat, 24 Feb 2024 03:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEqFRhh+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F2D1378
	for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Feb 2024 03:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708747115; cv=none; b=a/Ij/FsdIisMfchxw63pcvIbr38jkId8/LDUTp3fWje/FfKTuk9X72nrxgVe5rkBUS/yP2c2/MOEHrcIrAl8qn8+8wNVRxK3lHoYaguWky4d715fLjD2lwC0zmtL6fX8Wlek0C+jr2/vxJ5lJ0cVwoKRfUa//buwRmk69KzcOh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708747115; c=relaxed/simple;
	bh=iMCDd5yZmzdoQSkBdW/+Ikh771PaO4HhNRXUSmdIkNQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a2YHxTK7fVQqcKzG0StHI+E3IhLveRQVj7ze9+QT6Pwkyd4dOSop7tom9/206tgSNScq15RP/8NaJuD9cAsvnlUVOXfPCfJSPkvt8DkPn0B3zDtwMONb/mPVH7jgMQKVs9Q58oYQloLVSKrPH8VFK9vDC0oGdWZLF2MwtaoKfhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEqFRhh+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708747114; x=1740283114;
  h=date:from:to:cc:subject:message-id;
  bh=iMCDd5yZmzdoQSkBdW/+Ikh771PaO4HhNRXUSmdIkNQ=;
  b=gEqFRhh++mrkYxEYFT+rwLVf+RLn6PGQ8c76NR0Mp3X5yHUkYqhJ+ZQ+
   r8C8OcdsGeCMHUv+/MU9eFLF5j3vVrckvNiyjRRwVfBJkvq9555ySo2Dy
   J57PRFKah32VA0EjeiP0Hp+P5irxKnGMfYmF9N9NNk3cRIwAesFe+FBMC
   qEV1dzhTHUSejpGJUMXv61KEarMmiQNoxVWvR/u282nguFzcrwTF2SCE+
   ANihUM5amR2r6KHOXwDcATuxXK6piDCeZjAekTEu0lEAP79s4/B6sDmOE
   o0d7gtXzTIeVe2UjrCAqAXuTFfz9fCCzkrG6ESPqkkW2ede8GzZBM5m4M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="25563284"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="25563284"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 19:58:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6531021"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Feb 2024 19:58:33 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdjBF-0008Bo-09;
	Sat, 24 Feb 2024 03:58:29 +0000
Date: Sat, 24 Feb 2024 11:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.9] BUILD SUCCESS
 eaa5907bcc7611c7a07e994a69a905deca34a9b6
Message-ID: <202402241138.4OtKQL9r-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.9
branch HEAD: eaa5907bcc7611c7a07e994a69a905deca34a9b6  arm64: dts: renesas: rzg2l-smarc: Enable DU and link with DSI

elapsed time: 973m

configs tested: 156
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
arc                                 defconfig   gcc  
arc                   randconfig-001-20240224   gcc  
arc                   randconfig-002-20240224   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   gcc  
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                   randconfig-001-20240224   gcc  
arm                   randconfig-002-20240224   gcc  
arm                   randconfig-003-20240224   gcc  
arm                   randconfig-004-20240224   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240224   gcc  
arm64                 randconfig-002-20240224   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240224   gcc  
csky                  randconfig-002-20240224   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-002-20240224   clang
i386         buildonly-randconfig-005-20240224   clang
i386         buildonly-randconfig-006-20240224   clang
i386                                defconfig   clang
i386                  randconfig-002-20240224   clang
i386                  randconfig-003-20240224   clang
i386                  randconfig-013-20240224   clang
i386                  randconfig-014-20240224   clang
i386                  randconfig-015-20240224   clang
i386                  randconfig-016-20240224   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240224   gcc  
loongarch             randconfig-002-20240224   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                           ip28_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240224   gcc  
nios2                 randconfig-002-20240224   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240224   gcc  
parisc                randconfig-002-20240224   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ksi8560_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc64             randconfig-001-20240224   gcc  
powerpc64             randconfig-003-20240224   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240224   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240224   gcc  
s390                  randconfig-002-20240224   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                    randconfig-001-20240224   gcc  
sh                    randconfig-002-20240224   gcc  
sh                          rsk7201_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240224   gcc  
sparc64               randconfig-002-20240224   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240224   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240224   clang
x86_64       buildonly-randconfig-002-20240224   clang
x86_64       buildonly-randconfig-003-20240224   clang
x86_64       buildonly-randconfig-004-20240224   clang
x86_64       buildonly-randconfig-005-20240224   clang
x86_64       buildonly-randconfig-006-20240224   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240224   clang
x86_64                randconfig-003-20240224   clang
x86_64                randconfig-006-20240224   clang
x86_64                randconfig-014-20240224   clang
x86_64                randconfig-015-20240224   clang
x86_64                randconfig-016-20240224   clang
x86_64                randconfig-072-20240224   clang
x86_64                randconfig-073-20240224   clang
x86_64                randconfig-076-20240224   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240224   gcc  
xtensa                randconfig-002-20240224   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

