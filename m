Return-Path: <linux-renesas-soc+bounces-20822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 549D4B2F019
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 09:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77C84686B07
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 07:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EB424BBE4;
	Thu, 21 Aug 2025 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSvDEKf4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A61CCEE0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755762572; cv=none; b=OgXNtPAApZ5ya2GKzkLvWfUuXCHazpn3SkOvbCjJCTOCLpOvmN98QyVIJ3boiDa+GT0e6+xizt7KCdyLmsfTVx67OZKQ/xY7AdSIGueK88JgC0U1NGcaoiO3KedohxlyYXXzSqb2MJqI/73CS/mIhfdYAWqZqcqJSDE3PVUljGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755762572; c=relaxed/simple;
	bh=5LFWkezjYdWO63zBYKL3ysD4Zu1Z0Wc4fxF/IOscrko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b/eeCH64ck2oC/X1yyLvQOV/AINej4iXdIrHbmC5RKCSfv6fWalycyWAf/nxhm6Kz58MAaxZOFU2CXT1qRTc4SgepPNuSPFWmBmcPggdbnoeg0f3k3mu6ZUVzEJnjfRmO0ymLE6JIH9tJuIoM76fRM6iRYR/yz4tPQlnmf2wXxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSvDEKf4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755762571; x=1787298571;
  h=date:from:to:cc:subject:message-id;
  bh=5LFWkezjYdWO63zBYKL3ysD4Zu1Z0Wc4fxF/IOscrko=;
  b=QSvDEKf4RszFDL7SEofmm0/QReE4HQgzSUPCFcRYPOhfzLCjvLPihrUY
   6XpRX4BzeImCWiq/H4gKnXXZRpWL14zFJsTJhvYwQ0bn61emfcP9Y2WI0
   yYNyT8IlZH3esz9inbUvx+1v4l/fP6silC9vcdAeAx2xVNCoFHxgt8ZFe
   wwiEdiaK0X2pkalY/CNrAPHZySZmmZ73Bhp2ul/FK4wGjagAB0kgDc4Zt
   C8GrP1EJRSTYzUDuGA6ddM3zyL/PORXdxlfKrzQ3g3P1u0LDtNGwuKvLV
   lyQS932DkJK+AK9Zls6TZ7vP7U3LGubzJ7Jt0xwaeoJ/oSDAeY6qm0bfy
   Q==;
X-CSE-ConnectionGUID: OQLQQSPbSHqyLSjE9+Pxwg==
X-CSE-MsgGUID: Hn3EshwvQaqS4O/vDqznNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61856576"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="61856576"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 00:49:30 -0700
X-CSE-ConnectionGUID: 2LG6nZ7NT2SYLcDNdnB8Rg==
X-CSE-MsgGUID: HAIavRoXSDOcJ/nFr2RE+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="173612753"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Aug 2025 00:49:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up035-000K3H-05;
	Thu, 21 Aug 2025 07:49:27 +0000
Date: Thu, 21 Aug 2025 15:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.18] BUILD
 SUCCESS 2da2740fb9c8e26b6b5e20d74f2ed1d49824236d
Message-ID: <202508211542.ZJSUELCj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.18
branch HEAD: 2da2740fb9c8e26b6b5e20d74f2ed1d49824236d  soc: renesas: rz-sysc: Add syscon/regmap support

elapsed time: 1458m

configs tested: 257
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20250820    gcc-8.5.0
arc                   randconfig-001-20250821    clang-22
arc                   randconfig-002-20250820    gcc-11.5.0
arc                   randconfig-002-20250821    clang-22
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                       imx_v6_v7_defconfig    clang-22
arm                   randconfig-001-20250820    gcc-8.5.0
arm                   randconfig-001-20250821    clang-22
arm                   randconfig-002-20250820    gcc-15.1.0
arm                   randconfig-002-20250821    clang-22
arm                   randconfig-003-20250820    gcc-13.4.0
arm                   randconfig-003-20250821    clang-22
arm                   randconfig-004-20250820    clang-22
arm                   randconfig-004-20250821    clang-22
arm                           stm32_defconfig    clang-22
arm                           u8500_defconfig    gcc-15.1.0
arm                        vexpress_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250820    gcc-14.3.0
arm64                 randconfig-001-20250821    clang-22
arm64                 randconfig-002-20250820    gcc-14.3.0
arm64                 randconfig-002-20250821    clang-22
arm64                 randconfig-003-20250820    gcc-8.5.0
arm64                 randconfig-003-20250821    clang-22
arm64                 randconfig-004-20250820    gcc-14.3.0
arm64                 randconfig-004-20250821    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250820    gcc-15.1.0
csky                  randconfig-001-20250821    clang-22
csky                  randconfig-002-20250820    gcc-9.5.0
csky                  randconfig-002-20250821    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250820    clang-22
hexagon               randconfig-001-20250821    clang-22
hexagon               randconfig-002-20250820    clang-22
hexagon               randconfig-002-20250821    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250820    clang-20
i386        buildonly-randconfig-001-20250821    gcc-12
i386        buildonly-randconfig-002-20250820    gcc-12
i386        buildonly-randconfig-002-20250821    gcc-12
i386        buildonly-randconfig-003-20250820    gcc-12
i386        buildonly-randconfig-003-20250821    gcc-12
i386        buildonly-randconfig-004-20250820    clang-20
i386        buildonly-randconfig-004-20250821    gcc-12
i386        buildonly-randconfig-005-20250820    gcc-12
i386        buildonly-randconfig-005-20250821    gcc-12
i386        buildonly-randconfig-006-20250820    gcc-11
i386        buildonly-randconfig-006-20250821    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250821    gcc-11
i386                  randconfig-002-20250821    gcc-11
i386                  randconfig-003-20250821    gcc-11
i386                  randconfig-004-20250821    gcc-11
i386                  randconfig-005-20250821    gcc-11
i386                  randconfig-006-20250821    gcc-11
i386                  randconfig-007-20250821    gcc-11
i386                  randconfig-011-20250821    gcc-12
i386                  randconfig-012-20250821    gcc-12
i386                  randconfig-013-20250821    gcc-12
i386                  randconfig-014-20250821    gcc-12
i386                  randconfig-015-20250821    gcc-12
i386                  randconfig-016-20250821    gcc-12
i386                  randconfig-017-20250821    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250820    clang-18
loongarch             randconfig-001-20250821    clang-22
loongarch             randconfig-002-20250820    clang-22
loongarch             randconfig-002-20250821    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                   sb1250_swarm_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250820    gcc-11.5.0
nios2                 randconfig-001-20250821    clang-22
nios2                 randconfig-002-20250820    gcc-10.5.0
nios2                 randconfig-002-20250821    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250820    gcc-8.5.0
parisc                randconfig-001-20250821    clang-22
parisc                randconfig-002-20250820    gcc-13.4.0
parisc                randconfig-002-20250821    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               mpc834x_itxgp_defconfig    clang-22
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc                      ppc44x_defconfig    clang-22
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250820    gcc-12.5.0
powerpc               randconfig-001-20250821    clang-22
powerpc               randconfig-002-20250820    gcc-8.5.0
powerpc               randconfig-002-20250821    clang-22
powerpc               randconfig-003-20250820    gcc-13.4.0
powerpc               randconfig-003-20250821    clang-22
powerpc                     skiroot_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250820    clang-22
powerpc64             randconfig-002-20250820    clang-22
powerpc64             randconfig-002-20250821    clang-22
powerpc64             randconfig-003-20250820    gcc-15.1.0
powerpc64             randconfig-003-20250821    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250820    clang-20
riscv                 randconfig-001-20250821    clang-18
riscv                 randconfig-002-20250820    clang-22
riscv                 randconfig-002-20250821    clang-18
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250820    clang-18
s390                  randconfig-001-20250821    clang-18
s390                  randconfig-002-20250820    clang-22
s390                  randconfig-002-20250821    clang-18
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    clang-22
sh                    randconfig-001-20250820    gcc-15.1.0
sh                    randconfig-001-20250821    clang-18
sh                    randconfig-002-20250820    gcc-15.1.0
sh                    randconfig-002-20250821    clang-18
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250820    gcc-8.5.0
sparc                 randconfig-001-20250821    clang-18
sparc                 randconfig-002-20250820    gcc-12.5.0
sparc                 randconfig-002-20250821    clang-18
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250820    clang-22
sparc64               randconfig-001-20250821    clang-18
sparc64               randconfig-002-20250820    clang-22
sparc64               randconfig-002-20250821    clang-18
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250820    gcc-12
um                    randconfig-001-20250821    clang-18
um                    randconfig-002-20250820    gcc-12
um                    randconfig-002-20250821    clang-18
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250820    clang-20
x86_64      buildonly-randconfig-001-20250821    clang-20
x86_64      buildonly-randconfig-002-20250820    gcc-11
x86_64      buildonly-randconfig-002-20250821    clang-20
x86_64      buildonly-randconfig-003-20250820    clang-20
x86_64      buildonly-randconfig-003-20250821    clang-20
x86_64      buildonly-randconfig-004-20250820    gcc-12
x86_64      buildonly-randconfig-004-20250821    clang-20
x86_64      buildonly-randconfig-005-20250820    clang-20
x86_64      buildonly-randconfig-005-20250821    clang-20
x86_64      buildonly-randconfig-006-20250820    gcc-12
x86_64      buildonly-randconfig-006-20250821    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250821    clang-20
x86_64                randconfig-002-20250821    clang-20
x86_64                randconfig-003-20250821    clang-20
x86_64                randconfig-004-20250821    clang-20
x86_64                randconfig-005-20250821    clang-20
x86_64                randconfig-006-20250821    clang-20
x86_64                randconfig-007-20250821    clang-20
x86_64                randconfig-008-20250821    clang-20
x86_64                randconfig-071-20250821    clang-20
x86_64                randconfig-072-20250821    clang-20
x86_64                randconfig-073-20250821    clang-20
x86_64                randconfig-074-20250821    clang-20
x86_64                randconfig-075-20250821    clang-20
x86_64                randconfig-076-20250821    clang-20
x86_64                randconfig-077-20250821    clang-20
x86_64                randconfig-078-20250821    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250820    gcc-8.5.0
xtensa                randconfig-001-20250821    clang-18
xtensa                randconfig-002-20250820    gcc-8.5.0
xtensa                randconfig-002-20250821    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

