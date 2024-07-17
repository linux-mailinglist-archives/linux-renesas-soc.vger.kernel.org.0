Return-Path: <linux-renesas-soc+bounces-7384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88001933573
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2024 04:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ED0B1F22785
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2024 02:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC74320F;
	Wed, 17 Jul 2024 02:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USlWT3PW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F074320B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jul 2024 02:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721183557; cv=none; b=hSC3PKWECws3x6Vr7o+O2BPdpylgwzCCBKxPA1pitnF/5etbT6NWRfHOvsZO6tBGk0Xc3NFhQ+reWIyff2akW+1Mh6tX4uJ25NRMICHXrOaeioHJWjJIECQujnZ7hV6tDjrZwCb+05bKDoSPP7l+0H7z/JJG6Rd+mLFbAS7Dq2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721183557; c=relaxed/simple;
	bh=ZIkRezmrCSVH4J+zQUJOSfvXU8iSoXerULQafn2+QmM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rh4jVMTWpihaGnZykQyIzqDJFKayZWwtwS07s/y14o+IxrWNYQpgHx579+GQU83NBpfhgCA8FPg7hJ5bN4J0z1QZoX36Hbggywkj8cIGaJAsW1QDLO7XQyu8+dj6ZMQCQBxVVKiWA+CU7i9NlkVE59QgdS0NHH2/pmBDurSfYyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USlWT3PW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721183555; x=1752719555;
  h=date:from:to:cc:subject:message-id;
  bh=ZIkRezmrCSVH4J+zQUJOSfvXU8iSoXerULQafn2+QmM=;
  b=USlWT3PWIn+HnvWE39ILUHN3qQbwJKxStOe8Z5FqKkrDymX/Cy64wXHl
   nXWQ9XNsaZVj/EKL+C5fychS+GPyc0lhKxBgGeTsL3RDZUNkSQ3AK0slw
   TiIN3ULlFLVoZ67k7WdIdFMuoxh/6TcXe9S3gM6E1IRZ7OveQc7tuk9i/
   f1uL58Gmaa4ueDeRZI5HW3Kohzm8V8LYvX2CxbO9sgH6KU+AvviaXT5F4
   ruHGga/WIKnW4NMoh+0MFTpbBqpl40fzNIGIoXPPc3VlVw8RdhvQd/ueH
   nrtJljwinBG5G7CzwKgY5G6b1jYK0o7QzFtjbvEJJdgohUCSmCRWz/K2r
   A==;
X-CSE-ConnectionGUID: SIN+FLXqR7WnoFF992GhtQ==
X-CSE-MsgGUID: e06dEfl5RLyLbfzO4cTqyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18278236"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="18278236"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 19:32:35 -0700
X-CSE-ConnectionGUID: 3T3JP0WSS8m62bbe7lhknA==
X-CSE-MsgGUID: /6Pug5i1R6y1UyX8vl/CAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="50961128"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Jul 2024 19:32:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTuT0-000fto-2y;
	Wed, 17 Jul 2024 02:32:30 +0000
Date: Wed, 17 Jul 2024 10:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: 
 [geert-renesas-drivers:topic/rcar4-fractional-pll-improvements-v1] BUILD
 REGRESSION f5a672b0ed67fa75083e13e5f82832cbe7a55e20
Message-ID: <202407171003.VwQmqLaA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar4-fractional-pll-improvements-v1
branch HEAD: f5a672b0ed67fa75083e13e5f82832cbe7a55e20  clk: renesas: rcar-gen4: Remove unused fixed PLL clock types

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202407170431.6qjpdi1L-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202407170751.LGZlPmUL-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

rcar-gen4-cpg.c:(.text+0x126): undefined reference to `__udivdi3'
rcar-gen4-cpg.c:(.text+0x29a): undefined reference to `__aeabi_uldivmod'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-001-20240717
|   `-- rcar-gen4-cpg.c:(.text):undefined-reference-to-__aeabi_uldivmod
|-- m68k-allyesconfig
|   `-- rcar-gen4-cpg.c:(.text):undefined-reference-to-__udivdi3
`-- xtensa-randconfig-002-20240717
    `-- rcar-gen4-cpg.c:(.text):undefined-reference-to-__udivdi3

elapsed time: 733m

configs tested: 241
configs skipped: 5

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240717   gcc-13.2.0
arc                   randconfig-002-20240717   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                           omap1_defconfig   gcc-13.3.0
arm                       omap2plus_defconfig   gcc-13.3.0
arm                          pxa910_defconfig   gcc-13.3.0
arm                   randconfig-001-20240717   gcc-13.2.0
arm                   randconfig-001-20240717   gcc-14.1.0
arm                   randconfig-002-20240717   gcc-13.2.0
arm                   randconfig-002-20240717   gcc-14.1.0
arm                   randconfig-003-20240717   gcc-13.2.0
arm                   randconfig-003-20240717   gcc-14.1.0
arm                   randconfig-004-20240717   clang-19
arm                   randconfig-004-20240717   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240717   gcc-13.2.0
arm64                 randconfig-001-20240717   gcc-14.1.0
arm64                 randconfig-002-20240717   clang-19
arm64                 randconfig-002-20240717   gcc-13.2.0
arm64                 randconfig-003-20240717   clang-16
arm64                 randconfig-003-20240717   gcc-13.2.0
arm64                 randconfig-004-20240717   clang-19
arm64                 randconfig-004-20240717   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240717   gcc-13.2.0
csky                  randconfig-001-20240717   gcc-14.1.0
csky                  randconfig-002-20240717   gcc-13.2.0
csky                  randconfig-002-20240717   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240717   clang-19
hexagon               randconfig-002-20240717   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240716   clang-18
i386         buildonly-randconfig-001-20240717   clang-18
i386         buildonly-randconfig-002-20240716   clang-18
i386         buildonly-randconfig-002-20240717   clang-18
i386         buildonly-randconfig-003-20240716   clang-18
i386         buildonly-randconfig-003-20240717   clang-18
i386         buildonly-randconfig-004-20240716   clang-18
i386         buildonly-randconfig-004-20240717   clang-18
i386         buildonly-randconfig-005-20240716   clang-18
i386         buildonly-randconfig-005-20240717   clang-18
i386         buildonly-randconfig-006-20240716   clang-18
i386         buildonly-randconfig-006-20240717   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240716   clang-18
i386                  randconfig-001-20240717   clang-18
i386                  randconfig-002-20240716   clang-18
i386                  randconfig-002-20240717   clang-18
i386                  randconfig-003-20240716   gcc-9
i386                  randconfig-003-20240717   clang-18
i386                  randconfig-004-20240716   gcc-7
i386                  randconfig-004-20240717   clang-18
i386                  randconfig-005-20240716   clang-18
i386                  randconfig-005-20240717   clang-18
i386                  randconfig-006-20240716   gcc-9
i386                  randconfig-006-20240717   clang-18
i386                  randconfig-011-20240716   gcc-8
i386                  randconfig-011-20240717   clang-18
i386                  randconfig-012-20240716   clang-18
i386                  randconfig-012-20240717   clang-18
i386                  randconfig-013-20240716   gcc-8
i386                  randconfig-013-20240717   clang-18
i386                  randconfig-014-20240716   clang-18
i386                  randconfig-014-20240717   clang-18
i386                  randconfig-015-20240716   clang-18
i386                  randconfig-015-20240717   clang-18
i386                  randconfig-016-20240716   gcc-10
i386                  randconfig-016-20240717   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240717   gcc-13.2.0
loongarch             randconfig-001-20240717   gcc-14.1.0
loongarch             randconfig-002-20240717   gcc-13.2.0
loongarch             randconfig-002-20240717   gcc-14.1.0
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
mips                           jazz_defconfig   gcc-13.3.0
mips                    maltaup_xpa_defconfig   gcc-13.3.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240717   gcc-13.2.0
nios2                 randconfig-001-20240717   gcc-14.1.0
nios2                 randconfig-002-20240717   gcc-13.2.0
nios2                 randconfig-002-20240717   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240717   gcc-13.2.0
parisc                randconfig-001-20240717   gcc-14.1.0
parisc                randconfig-002-20240717   gcc-13.2.0
parisc                randconfig-002-20240717   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                 canyonlands_defconfig   gcc-13.3.0
powerpc                      ep88xc_defconfig   gcc-13.3.0
powerpc                      pasemi_defconfig   gcc-13.3.0
powerpc               randconfig-001-20240717   clang-19
powerpc               randconfig-001-20240717   gcc-13.2.0
powerpc               randconfig-002-20240717   gcc-13.2.0
powerpc               randconfig-002-20240717   gcc-14.1.0
powerpc               randconfig-003-20240717   clang-19
powerpc               randconfig-003-20240717   gcc-13.2.0
powerpc64             randconfig-001-20240717   gcc-13.2.0
powerpc64             randconfig-001-20240717   gcc-14.1.0
powerpc64             randconfig-002-20240717   gcc-13.2.0
powerpc64             randconfig-002-20240717   gcc-14.1.0
powerpc64             randconfig-003-20240717   gcc-13.2.0
powerpc64             randconfig-003-20240717   gcc-14.1.0
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240717   clang-19
riscv                 randconfig-001-20240717   gcc-13.2.0
riscv                 randconfig-002-20240717   clang-17
riscv                 randconfig-002-20240717   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240717   gcc-13.2.0
s390                  randconfig-001-20240717   gcc-14.1.0
s390                  randconfig-002-20240717   gcc-13.2.0
s390                  randconfig-002-20240717   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7760_defconfig   gcc-13.3.0
sh                          kfr2r09_defconfig   gcc-13.3.0
sh                    randconfig-001-20240717   gcc-13.2.0
sh                    randconfig-001-20240717   gcc-14.1.0
sh                    randconfig-002-20240717   gcc-13.2.0
sh                    randconfig-002-20240717   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-13.3.0
sh                           se7343_defconfig   gcc-13.3.0
sh                           se7780_defconfig   gcc-13.3.0
sh                             sh03_defconfig   gcc-13.3.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc64_defconfig   gcc-13.3.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240717   gcc-13.2.0
sparc64               randconfig-001-20240717   gcc-14.1.0
sparc64               randconfig-002-20240717   gcc-13.2.0
sparc64               randconfig-002-20240717   gcc-14.1.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240717   gcc-13.2.0
um                    randconfig-001-20240717   gcc-8
um                    randconfig-002-20240717   gcc-13
um                    randconfig-002-20240717   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                           alldefconfig   gcc-13.3.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240717   gcc-13
x86_64       buildonly-randconfig-002-20240717   gcc-13
x86_64       buildonly-randconfig-003-20240717   gcc-13
x86_64       buildonly-randconfig-004-20240717   clang-18
x86_64       buildonly-randconfig-005-20240717   clang-18
x86_64       buildonly-randconfig-006-20240717   gcc-13
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240717   gcc-7
x86_64                randconfig-002-20240717   gcc-9
x86_64                randconfig-003-20240717   clang-18
x86_64                randconfig-004-20240717   gcc-9
x86_64                randconfig-005-20240717   clang-18
x86_64                randconfig-006-20240717   gcc-11
x86_64                randconfig-011-20240717   gcc-8
x86_64                randconfig-012-20240717   clang-18
x86_64                randconfig-013-20240717   gcc-12
x86_64                randconfig-014-20240717   gcc-10
x86_64                randconfig-015-20240717   clang-18
x86_64                randconfig-016-20240717   clang-18
x86_64                randconfig-071-20240717   gcc-12
x86_64                randconfig-072-20240717   clang-18
x86_64                randconfig-073-20240717   gcc-10
x86_64                randconfig-074-20240717   gcc-13
x86_64                randconfig-075-20240717   gcc-13
x86_64                randconfig-076-20240717   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240717   gcc-13.2.0
xtensa                randconfig-002-20240717   gcc-13.2.0
xtensa                randconfig-002-20240717   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

