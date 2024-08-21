Return-Path: <linux-renesas-soc+bounces-7966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B8A959428
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 07:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB04E1C211FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 05:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871BF16B39E;
	Wed, 21 Aug 2024 05:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NOfshs9Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF7716BE16
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2024 05:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724218633; cv=none; b=gG66xrcNQIsiEJO39uNgZwJN7oeTAHki0kfr+69HjFo8RrLcD8fm+j0IqHInvvjtiTYnjwRkm5bxnZYmgaYLoqqRphVj+6IbQr2CG3dD2SwU1vXnwx0fmyXH0W0lD727me35jEtqhmujMmd0HIQ9AJjolAnxfVuCkTKxFgSrH20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724218633; c=relaxed/simple;
	bh=Y5+IhO9FsO9zfT6iiZpi+MePQ+bPY8dKLKc/9iI1Bkg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QHwPIJLGWOPkhUvtMI5p/G+Spw3hTqaLTTpTq2MqJMVP9RGwGdYill8StaAcqdS2NqnSqSt5aIttnoFCSctbC/diVzNDHxb25/NNka09+a12HZkZB6qkuZI+vLtTdrXQd0WH5O+GsOaw/yLbIQ0ZO6eHK2qz6B0iLK1NbLKjiDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NOfshs9Q; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724218631; x=1755754631;
  h=date:from:to:cc:subject:message-id;
  bh=Y5+IhO9FsO9zfT6iiZpi+MePQ+bPY8dKLKc/9iI1Bkg=;
  b=NOfshs9QgZnGZ+6nUE/pmD1aE3E4VukJzsSwGXHgyyx/wiMUtKhbn+in
   RQWxqRodvLJfBoqOK+Vzs8/gq325vFon/7cqswVSbxOfC05hlBnc53F+/
   CF1wPbDEO8gHkLUim12RyMX9ajnbOvZOHZsok4opfN1Bx31D2yKIJ8PT3
   ZVWlSZmpBpxy6QGUe4lVjA6kxWkqZ1BJ3X3qZyocyc4DmzK/zsluMpUvh
   X7V1oZ230g8tZW+0CjOJyY0wIETLvJZzLpmAxGJbOnV+bOKEKlnA+A8KU
   O+2vIfdsKQ03Lu+qYqrVqaqzQulb67ocg+rRyk5XyW6hvrBsY0a1fFTbp
   A==;
X-CSE-ConnectionGUID: W5it2p4pR+SjiATiZ/SDiA==
X-CSE-MsgGUID: 73MfP8H1SImp5wQSHhp5wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22365848"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22365848"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 22:37:10 -0700
X-CSE-ConnectionGUID: 9el2sqnRRVyCtYtS5Q1p9A==
X-CSE-MsgGUID: 49elNJthQTmrP33oyavVXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65179981"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Aug 2024 22:37:08 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sge1q-000Aw2-0N;
	Wed, 21 Aug 2024 05:37:06 +0000
Date: Wed, 21 Aug 2024 13:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 09cb3ecc5ef26efc05134b8f95bab802b036094c
Message-ID: <202408211332.k7IOYu0F-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 09cb3ecc5ef26efc05134b8f95bab802b036094c  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 1002m

configs tested: 218
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
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240821   gcc-13.2.0
arc                   randconfig-002-20240821   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                     davinci_all_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   clang-20
arm                      jornada720_defconfig   clang-20
arm                             mxs_defconfig   clang-20
arm                       netwinder_defconfig   clang-20
arm                   randconfig-001-20240821   gcc-14.1.0
arm                   randconfig-002-20240821   gcc-14.1.0
arm                   randconfig-003-20240821   clang-20
arm                   randconfig-004-20240821   gcc-14.1.0
arm                          sp7021_defconfig   clang-20
arm                           stm32_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240821   gcc-14.1.0
arm64                 randconfig-002-20240821   gcc-14.1.0
arm64                 randconfig-003-20240821   gcc-14.1.0
arm64                 randconfig-004-20240821   clang-20
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240821   gcc-14.1.0
csky                  randconfig-002-20240821   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240821   clang-20
hexagon               randconfig-002-20240821   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240820   clang-18
i386         buildonly-randconfig-001-20240821   gcc-12
i386         buildonly-randconfig-002-20240820   clang-18
i386         buildonly-randconfig-002-20240821   gcc-12
i386         buildonly-randconfig-003-20240820   clang-18
i386         buildonly-randconfig-003-20240821   gcc-12
i386         buildonly-randconfig-004-20240820   gcc-12
i386         buildonly-randconfig-004-20240821   gcc-12
i386         buildonly-randconfig-005-20240820   clang-18
i386         buildonly-randconfig-005-20240821   gcc-12
i386         buildonly-randconfig-006-20240820   clang-18
i386         buildonly-randconfig-006-20240821   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240820   clang-18
i386                  randconfig-001-20240821   gcc-12
i386                  randconfig-002-20240820   clang-18
i386                  randconfig-002-20240821   gcc-12
i386                  randconfig-003-20240820   clang-18
i386                  randconfig-003-20240821   gcc-12
i386                  randconfig-004-20240820   clang-18
i386                  randconfig-004-20240821   gcc-12
i386                  randconfig-005-20240820   clang-18
i386                  randconfig-005-20240821   gcc-12
i386                  randconfig-006-20240820   clang-18
i386                  randconfig-006-20240821   gcc-12
i386                  randconfig-011-20240820   gcc-11
i386                  randconfig-011-20240821   gcc-12
i386                  randconfig-012-20240820   gcc-12
i386                  randconfig-012-20240821   gcc-12
i386                  randconfig-013-20240820   gcc-12
i386                  randconfig-013-20240821   gcc-12
i386                  randconfig-014-20240820   gcc-12
i386                  randconfig-014-20240821   gcc-12
i386                  randconfig-015-20240820   gcc-12
i386                  randconfig-015-20240821   gcc-12
i386                  randconfig-016-20240820   clang-18
i386                  randconfig-016-20240821   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240821   gcc-14.1.0
loongarch             randconfig-002-20240821   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                       bmips_be_defconfig   clang-20
mips                          eyeq6_defconfig   clang-20
mips                      malta_kvm_defconfig   clang-20
mips                      maltaaprp_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240821   gcc-14.1.0
nios2                 randconfig-002-20240821   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240821   gcc-14.1.0
parisc                randconfig-002-20240821   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                       eiger_defconfig   clang-20
powerpc                      pcm030_defconfig   clang-20
powerpc                     rainier_defconfig   clang-20
powerpc               randconfig-001-20240821   gcc-14.1.0
powerpc               randconfig-002-20240821   clang-20
powerpc64             randconfig-001-20240821   gcc-14.1.0
powerpc64             randconfig-002-20240821   clang-20
powerpc64             randconfig-003-20240821   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240821   gcc-14.1.0
riscv                 randconfig-002-20240821   clang-16
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240821   clang-17
s390                  randconfig-002-20240821   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240821   gcc-14.1.0
sh                    randconfig-002-20240821   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240821   gcc-14.1.0
sparc64               randconfig-002-20240821   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240821   clang-20
um                    randconfig-002-20240821   gcc-12
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240821   gcc-12
x86_64       buildonly-randconfig-002-20240821   clang-18
x86_64       buildonly-randconfig-002-20240821   gcc-12
x86_64       buildonly-randconfig-003-20240821   gcc-12
x86_64       buildonly-randconfig-004-20240821   gcc-12
x86_64       buildonly-randconfig-005-20240821   gcc-12
x86_64       buildonly-randconfig-006-20240821   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240821   clang-18
x86_64                randconfig-001-20240821   gcc-12
x86_64                randconfig-002-20240821   gcc-12
x86_64                randconfig-003-20240821   clang-18
x86_64                randconfig-003-20240821   gcc-12
x86_64                randconfig-004-20240821   clang-18
x86_64                randconfig-004-20240821   gcc-12
x86_64                randconfig-005-20240821   clang-18
x86_64                randconfig-005-20240821   gcc-12
x86_64                randconfig-006-20240821   gcc-12
x86_64                randconfig-011-20240821   gcc-12
x86_64                randconfig-012-20240821   clang-18
x86_64                randconfig-012-20240821   gcc-12
x86_64                randconfig-013-20240821   clang-18
x86_64                randconfig-013-20240821   gcc-12
x86_64                randconfig-014-20240821   clang-18
x86_64                randconfig-014-20240821   gcc-12
x86_64                randconfig-015-20240821   gcc-12
x86_64                randconfig-016-20240821   clang-18
x86_64                randconfig-016-20240821   gcc-12
x86_64                randconfig-071-20240821   gcc-12
x86_64                randconfig-072-20240821   clang-18
x86_64                randconfig-072-20240821   gcc-12
x86_64                randconfig-073-20240821   gcc-12
x86_64                randconfig-074-20240821   clang-18
x86_64                randconfig-074-20240821   gcc-12
x86_64                randconfig-075-20240821   gcc-12
x86_64                randconfig-076-20240821   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240821   gcc-14.1.0
xtensa                randconfig-002-20240821   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

