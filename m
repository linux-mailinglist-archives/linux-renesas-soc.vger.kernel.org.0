Return-Path: <linux-renesas-soc+bounces-7964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE344959342
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 05:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68B5C1F245AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 03:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E74342A82;
	Wed, 21 Aug 2024 03:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWZKEpaG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB483FD4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Aug 2024 03:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724210169; cv=none; b=LuYGlfS7B3tG8IVRRH8VaFMI0YFNMpWvdywMgfuPdFuaAlkM4zeItkrnJn/383YWHnnY6fdTOiWgBhfGekBovoPjqc6tf45Dbt52g8N5C5rA2DO13belCA4aHqF+fW/4RoN1/KWXY7AmiZl5GfnL9TSLQxISKeIcEUyUEydDAkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724210169; c=relaxed/simple;
	bh=t93f31dMB1D8O+ehWc72N9vmVrmt4p4jEXWJPbkJf/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cmbgvi2Diamo+qkI5y85daN+WF6um7wDgnN3+h6wJZ5RSloIhAz/vfUkJ0uadIGrNhfukN/C3gLaPCK/46w4HyN8AbBhJm6QSHPoYpYHD+PUfdsADZmZXrSg+gnhIL2zpOd6EJEWW9/Rnmel37QsuT0O4gQIgtXzYDkkldeJMNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWZKEpaG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724210165; x=1755746165;
  h=date:from:to:cc:subject:message-id;
  bh=t93f31dMB1D8O+ehWc72N9vmVrmt4p4jEXWJPbkJf/w=;
  b=LWZKEpaG1ipbS5X1tKGDaeO9Mg3pyplmVzgu5cT7R26HcTgRK8BicvWO
   37fSse7/Ugl0ZybN2M/BL7OSqf02/nUPtcV9/id+1TlF2wNcjAr+L0tv3
   5d0ywKNoL3fTJG/5BCib0GGl2lwzm4ThJtVZxJ0INyQNLBjyzMd8YneVF
   rnVdLt1oS8ruHvb+WwON5vqKaKIPoQ/I2DFXTO0OYIjFIH+PGl5/pTkXd
   fBv7I3tb+8TNi2SKAwwdKq3YR54QkJLN65HdNoQLAx7Dzhibc2VMBo1ub
   IJecQ+EAkQGfGMsCse3CMLEF6VtxcTMeu1nQZv2fjzhOlYIi2uUABMqFG
   g==;
X-CSE-ConnectionGUID: HF/U6a4XSA6PMaMWaIMCCg==
X-CSE-MsgGUID: y8mdncflROGQGaXSM+PewQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26304040"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="26304040"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 20:16:05 -0700
X-CSE-ConnectionGUID: GuajjxbPQXeRmELVIpJy/Q==
X-CSE-MsgGUID: H1fI1aloQryB8Ywm8Z/YMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="65831644"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Aug 2024 20:16:04 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgbpJ-000Apu-1s;
	Wed, 21 Aug 2024 03:16:01 +0000
Date: Wed, 21 Aug 2024 11:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 d5dfb18787de3fed9937b7287786e134358febef
Message-ID: <202408211119.HcapFHL9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: d5dfb18787de3fed9937b7287786e134358febef  Merge branch 'renesas-dts-for-v6.12' into renesas-next

elapsed time: 1091m

configs tested: 291
configs skipped: 8

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
arc                            hsdk_defconfig   gcc-13.2.0
arc                   randconfig-001-20240820   gcc-13.2.0
arc                   randconfig-002-20240820   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         assabet_defconfig   gcc-13.2.0
arm                     davinci_all_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   clang-20
arm                      jornada720_defconfig   clang-20
arm                             mxs_defconfig   clang-20
arm                       netwinder_defconfig   clang-20
arm                   randconfig-001-20240820   clang-20
arm                   randconfig-001-20240820   gcc-13.2.0
arm                   randconfig-002-20240820   clang-20
arm                   randconfig-002-20240820   gcc-13.2.0
arm                   randconfig-003-20240820   clang-20
arm                   randconfig-003-20240820   gcc-13.2.0
arm                   randconfig-004-20240820   clang-20
arm                   randconfig-004-20240820   gcc-13.2.0
arm                           sama5_defconfig   gcc-13.2.0
arm                          sp7021_defconfig   clang-20
arm                           stm32_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240820   clang-20
arm64                 randconfig-001-20240820   gcc-13.2.0
arm64                 randconfig-002-20240820   clang-20
arm64                 randconfig-002-20240820   gcc-13.2.0
arm64                 randconfig-003-20240820   gcc-13.2.0
arm64                 randconfig-003-20240820   gcc-14.1.0
arm64                 randconfig-004-20240820   clang-20
arm64                 randconfig-004-20240820   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240820   gcc-13.2.0
csky                  randconfig-001-20240820   gcc-14.1.0
csky                  randconfig-002-20240820   gcc-13.2.0
csky                  randconfig-002-20240820   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240820   clang-20
hexagon               randconfig-002-20240820   clang-20
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
loongarch             randconfig-001-20240820   gcc-13.2.0
loongarch             randconfig-001-20240820   gcc-14.1.0
loongarch             randconfig-002-20240820   gcc-13.2.0
loongarch             randconfig-002-20240820   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5208evb_defconfig   gcc-13.2.0
m68k                        m5272c3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                       bmips_be_defconfig   clang-20
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                          eyeq6_defconfig   clang-20
mips                      malta_kvm_defconfig   clang-20
mips                      maltaaprp_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240820   gcc-13.2.0
nios2                 randconfig-001-20240820   gcc-14.1.0
nios2                 randconfig-002-20240820   gcc-13.2.0
nios2                 randconfig-002-20240820   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240820   gcc-13.2.0
parisc                randconfig-001-20240820   gcc-14.1.0
parisc                randconfig-002-20240820   gcc-13.2.0
parisc                randconfig-002-20240820   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                 canyonlands_defconfig   gcc-13.2.0
powerpc                       eiger_defconfig   clang-20
powerpc                     ep8248e_defconfig   gcc-13.2.0
powerpc                       maple_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   gcc-13.2.0
powerpc                 mpc832x_rdb_defconfig   gcc-13.2.0
powerpc                      pcm030_defconfig   clang-20
powerpc                      ppc64e_defconfig   gcc-13.2.0
powerpc                      ppc6xx_defconfig   gcc-13.2.0
powerpc                     rainier_defconfig   clang-20
powerpc               randconfig-003-20240820   clang-20
powerpc               randconfig-003-20240820   gcc-13.2.0
powerpc64             randconfig-001-20240820   gcc-13.2.0
powerpc64             randconfig-001-20240820   gcc-14.1.0
powerpc64             randconfig-002-20240820   clang-20
powerpc64             randconfig-002-20240820   gcc-13.2.0
powerpc64             randconfig-003-20240820   gcc-13.2.0
powerpc64             randconfig-003-20240820   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240820   clang-20
riscv                 randconfig-001-20240820   gcc-13.2.0
riscv                 randconfig-002-20240820   gcc-13.2.0
riscv                 randconfig-002-20240820   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240820   gcc-13.2.0
s390                  randconfig-001-20240820   gcc-14.1.0
s390                  randconfig-002-20240820   gcc-13.2.0
s390                  randconfig-002-20240820   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                 kfr2r09-romimage_defconfig   gcc-13.2.0
sh                    randconfig-001-20240820   gcc-13.2.0
sh                    randconfig-001-20240820   gcc-14.1.0
sh                    randconfig-002-20240820   gcc-13.2.0
sh                    randconfig-002-20240820   gcc-14.1.0
sh                           se7619_defconfig   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240820   gcc-13.2.0
sparc64               randconfig-001-20240820   gcc-14.1.0
sparc64               randconfig-002-20240820   gcc-13.2.0
sparc64               randconfig-002-20240820   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240820   gcc-12
um                    randconfig-001-20240820   gcc-13.2.0
um                    randconfig-002-20240820   clang-20
um                    randconfig-002-20240820   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240820   clang-18
x86_64       buildonly-randconfig-001-20240821   gcc-12
x86_64       buildonly-randconfig-002-20240820   clang-18
x86_64       buildonly-randconfig-002-20240820   gcc-11
x86_64       buildonly-randconfig-002-20240821   gcc-12
x86_64       buildonly-randconfig-003-20240820   clang-18
x86_64       buildonly-randconfig-003-20240821   gcc-12
x86_64       buildonly-randconfig-004-20240820   clang-18
x86_64       buildonly-randconfig-004-20240821   gcc-12
x86_64       buildonly-randconfig-005-20240820   clang-18
x86_64       buildonly-randconfig-005-20240821   gcc-12
x86_64       buildonly-randconfig-006-20240820   clang-18
x86_64       buildonly-randconfig-006-20240821   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240820   clang-18
x86_64                randconfig-001-20240820   gcc-12
x86_64                randconfig-001-20240821   gcc-12
x86_64                randconfig-002-20240820   clang-18
x86_64                randconfig-002-20240820   gcc-12
x86_64                randconfig-002-20240821   gcc-12
x86_64                randconfig-003-20240820   clang-18
x86_64                randconfig-003-20240821   gcc-12
x86_64                randconfig-004-20240820   clang-18
x86_64                randconfig-004-20240820   gcc-12
x86_64                randconfig-004-20240821   gcc-12
x86_64                randconfig-005-20240820   clang-18
x86_64                randconfig-005-20240821   gcc-12
x86_64                randconfig-006-20240820   clang-18
x86_64                randconfig-006-20240820   gcc-12
x86_64                randconfig-006-20240821   gcc-12
x86_64                randconfig-011-20240820   clang-18
x86_64                randconfig-011-20240821   gcc-12
x86_64                randconfig-012-20240820   clang-18
x86_64                randconfig-012-20240820   gcc-12
x86_64                randconfig-012-20240821   gcc-12
x86_64                randconfig-013-20240820   clang-18
x86_64                randconfig-013-20240821   gcc-12
x86_64                randconfig-014-20240820   clang-18
x86_64                randconfig-014-20240821   gcc-12
x86_64                randconfig-015-20240820   clang-18
x86_64                randconfig-015-20240820   gcc-12
x86_64                randconfig-015-20240821   gcc-12
x86_64                randconfig-016-20240820   clang-18
x86_64                randconfig-016-20240821   gcc-12
x86_64                randconfig-071-20240820   clang-18
x86_64                randconfig-071-20240820   gcc-12
x86_64                randconfig-071-20240821   gcc-12
x86_64                randconfig-072-20240820   clang-18
x86_64                randconfig-072-20240820   gcc-12
x86_64                randconfig-072-20240821   gcc-12
x86_64                randconfig-073-20240820   clang-18
x86_64                randconfig-073-20240820   gcc-12
x86_64                randconfig-073-20240821   gcc-12
x86_64                randconfig-074-20240820   clang-18
x86_64                randconfig-074-20240821   gcc-12
x86_64                randconfig-075-20240820   clang-18
x86_64                randconfig-075-20240821   gcc-12
x86_64                randconfig-076-20240820   clang-18
x86_64                randconfig-076-20240821   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240820   gcc-13.2.0
xtensa                randconfig-001-20240820   gcc-14.1.0
xtensa                randconfig-002-20240820   gcc-13.2.0
xtensa                randconfig-002-20240820   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

