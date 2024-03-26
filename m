Return-Path: <linux-renesas-soc+bounces-4057-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3321988CFDE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 22:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B63861F3CC0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 21:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F72113D528;
	Tue, 26 Mar 2024 21:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SffbYMXT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE87412AAEF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Mar 2024 21:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711488006; cv=none; b=ahZxYW1GkHiU5L/mOLGuPS1xFnITFsvp6w3EWKPhH5JfIG1Y+V5+0hzLiJ2QI1aAjlun3xWW/laj7JP5Q1l9r0KIcFymDwGZuTlbY/c1HNezoVg6vwFLTeHP5W7+u79bVCB7VhHFfeglI2bpPO3W3YiAhC6Z76v+yzPFtDtncXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711488006; c=relaxed/simple;
	bh=zD5q4nM6HKHU3iR/NIkimKiB1O7LCNJZOyv4qu18jYA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jVMbrZ0GezyqK3MnevA/V7kocHT0PAGVzQ9AvaryRWyesnQvNTbuHKK9rLoByHpp/WO7WVt3ouqTqkKcrheQ5y+jyZ1NNlLKL5A8DJkQKEZrkndHHzivZyNjlevrqB2pAFqMcg3FdoDCRwYmUe5LecviA5zaliZNmWvyNk7dAvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SffbYMXT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711488004; x=1743024004;
  h=date:from:to:cc:subject:message-id;
  bh=zD5q4nM6HKHU3iR/NIkimKiB1O7LCNJZOyv4qu18jYA=;
  b=SffbYMXTPjXyG1GQ0if7pHI1qMExzecFOtze5rMsTEctH/Dkfd1Ov4yG
   itdK3TrFl539uhzn2etRmYf3Hw0/LB3Nn+g5F5lh8+bb12jLHhjni0m5n
   f9Vt7odk+md5pJ8YlEsgqlhBnMZ3L//ZB9IME6vsBaLFi1RNCMt8BZzQM
   SDneKvgbjwPQSQcfqJbFyntaSFdObIjXnMtKgZcJJ89+Pos/5aiBmMvgo
   yZD776x2uJLY48FOjYPHhE2RWAW7abLZ1x91F9yDVPgTc6+xD9njHKw8s
   K/EZLBwwz+SlW3ZCVvrGirbSSdZxBnTpuIw/Dy5XkXIQBtnexQ3ypWQg/
   A==;
X-CSE-ConnectionGUID: 6gc/i1d7TbaV228aiEHQgw==
X-CSE-MsgGUID: euT7+WfoRYKSteRe1LQ0YA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17109397"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="17109397"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 14:20:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="16075564"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Mar 2024 14:20:01 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpED9-0000Pw-0l;
	Tue, 26 Mar 2024 21:19:59 +0000
Date: Wed, 27 Mar 2024 05:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.10] BUILD SUCCESS
 b320e8c5634ee62d4849400a9ea48542aa980758
Message-ID: <202403270517.AP1dOtiA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.10
branch HEAD: b320e8c5634ee62d4849400a9ea48542aa980758  ARM: dts: renesas: rcar-gen2: Add TMU nodes

elapsed time: 740m

configs tested: 197
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
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240327   gcc  
arc                   randconfig-002-20240327   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                   randconfig-004-20240327   gcc  
arm                          sp7021_defconfig   gcc  
arm                           spitz_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-003-20240327   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240327   gcc  
csky                  randconfig-002-20240327   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240326   gcc  
i386         buildonly-randconfig-002-20240326   clang
i386         buildonly-randconfig-003-20240326   clang
i386         buildonly-randconfig-003-20240327   clang
i386         buildonly-randconfig-004-20240326   gcc  
i386         buildonly-randconfig-004-20240327   clang
i386         buildonly-randconfig-005-20240326   gcc  
i386         buildonly-randconfig-005-20240327   clang
i386         buildonly-randconfig-006-20240326   gcc  
i386         buildonly-randconfig-006-20240327   clang
i386                                defconfig   clang
i386                  randconfig-001-20240326   gcc  
i386                  randconfig-002-20240326   gcc  
i386                  randconfig-003-20240326   gcc  
i386                  randconfig-003-20240327   clang
i386                  randconfig-004-20240326   clang
i386                  randconfig-005-20240326   gcc  
i386                  randconfig-005-20240327   clang
i386                  randconfig-006-20240326   clang
i386                  randconfig-011-20240326   clang
i386                  randconfig-012-20240326   gcc  
i386                  randconfig-012-20240327   clang
i386                  randconfig-013-20240326   clang
i386                  randconfig-014-20240326   clang
i386                  randconfig-014-20240327   clang
i386                  randconfig-015-20240326   clang
i386                  randconfig-016-20240326   clang
i386                  randconfig-016-20240327   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240327   gcc  
loongarch             randconfig-002-20240327   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240327   gcc  
nios2                 randconfig-002-20240327   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240327   gcc  
parisc                randconfig-002-20240327   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc               randconfig-002-20240327   gcc  
powerpc                    socrates_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-002-20240327   gcc  
powerpc64             randconfig-003-20240327   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240327   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240327   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240327   gcc  
sh                    randconfig-002-20240327   gcc  
sh                           se7712_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240327   gcc  
sparc64               randconfig-002-20240327   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240326   clang
x86_64       buildonly-randconfig-002-20240326   gcc  
x86_64       buildonly-randconfig-003-20240326   clang
x86_64       buildonly-randconfig-004-20240326   gcc  
x86_64       buildonly-randconfig-004-20240327   clang
x86_64       buildonly-randconfig-005-20240326   gcc  
x86_64       buildonly-randconfig-006-20240326   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240326   gcc  
x86_64                randconfig-001-20240327   clang
x86_64                randconfig-002-20240326   gcc  
x86_64                randconfig-003-20240326   gcc  
x86_64                randconfig-004-20240326   clang
x86_64                randconfig-005-20240326   gcc  
x86_64                randconfig-005-20240327   clang
x86_64                randconfig-006-20240326   clang
x86_64                randconfig-006-20240327   clang
x86_64                randconfig-011-20240326   gcc  
x86_64                randconfig-012-20240326   clang
x86_64                randconfig-012-20240327   clang
x86_64                randconfig-013-20240326   gcc  
x86_64                randconfig-013-20240327   clang
x86_64                randconfig-014-20240326   gcc  
x86_64                randconfig-014-20240327   clang
x86_64                randconfig-015-20240326   clang
x86_64                randconfig-015-20240327   clang
x86_64                randconfig-016-20240326   clang
x86_64                randconfig-016-20240327   clang
x86_64                randconfig-071-20240326   clang
x86_64                randconfig-072-20240326   gcc  
x86_64                randconfig-072-20240327   clang
x86_64                randconfig-073-20240326   gcc  
x86_64                randconfig-073-20240327   clang
x86_64                randconfig-074-20240326   gcc  
x86_64                randconfig-074-20240327   clang
x86_64                randconfig-075-20240326   gcc  
x86_64                randconfig-075-20240327   clang
x86_64                randconfig-076-20240326   gcc  
x86_64                randconfig-076-20240327   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240327   gcc  
xtensa                randconfig-002-20240327   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

