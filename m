Return-Path: <linux-renesas-soc+bounces-11754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8320C9FF2CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jan 2025 05:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED5963A2EB6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jan 2025 04:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412B7C2E0;
	Wed,  1 Jan 2025 04:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9rg5zJu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB4D1799F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jan 2025 04:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735707383; cv=none; b=XGYjAzhIQlic4hY3DMI8VYZFh9CLwty4LJO+/DmnZ6+qeQh5WkN5FEmgd84OZvOthx19DQsfWfrRo6vnDQjL44ueownToKPtpT0tmBYGFKxTI7OA2nY7Kws6WzNOf1ry6ItNN4dm1UeQo5m8CVVeIrbGeWm5Acw8tKtiq18gCPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735707383; c=relaxed/simple;
	bh=o+z+Q0jLAnQoSQfKRZK3qB8zVOWCPbF4bdtM4T1tkSE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CPIFx/mubCQ360rBA3HeGn9Jgoz7gvb+6Gj46awVUGOD6Tabz6g/gMd4lX9aneEOTFz6YSJlpwBLmaddCD+Yfa253EUdXVDmEqrJsdGGXfN4XV3xqLgdklVdsiSbRAnxr6jeiKZUMEjnOJdl9XoYzptidQziXqO0JneUgLiMG94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9rg5zJu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735707381; x=1767243381;
  h=date:from:to:cc:subject:message-id;
  bh=o+z+Q0jLAnQoSQfKRZK3qB8zVOWCPbF4bdtM4T1tkSE=;
  b=D9rg5zJulj7TC4+1MzyU2xRGruxk/eZedctYvDC2j9zASoVms5qHiwjt
   e97hehnKDCEhTMlZKNbQLKnTAitym31NwLBihKJhFF0Trd3cE4VN3gnM+
   GoHCHVvmSxTr+RbLnBLx6HOWWc3GmpBrax5bWK3ezfyE76cWu5x+AQL+i
   NkwK0D8RkkffiDmgxbeQVN27QdeXU9sptxbZsNb3/nypU236W+srznzyX
   yGh5C48NKdazQzWM5cfez9MUj00/Tt0RPS/ybgJS8KN5tRxdxVGJR8J3g
   OMZyrmdUmiLeTDqzhuecRpHp2Yuyv6lDfjYyww6NHtajRXIowu50aoh5m
   g==;
X-CSE-ConnectionGUID: UHI1YSMDQVS4eKn+q4LxIg==
X-CSE-MsgGUID: 4MQSA8MoQHO/qmOW9Zb2gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35855453"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="35855453"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 20:56:21 -0800
X-CSE-ConnectionGUID: xUz87PUvSBiwSONl5ojKGw==
X-CSE-MsgGUID: ttKCcIZYTwG7GlpKFuxcNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="101302938"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Dec 2024 20:56:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSqmH-0007dT-0l;
	Wed, 01 Jan 2025 04:56:17 +0000
Date: Wed, 01 Jan 2025 12:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 a8489445b2f972fd2f32c3bbcb77f37a15087626
Message-ID: <202501011243.LBSMuOYW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: a8489445b2f972fd2f32c3bbcb77f37a15087626  [LOCAL] riscv: renesas: defconfig: Update rzfive_defconfig

elapsed time: 754m

configs tested: 130
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20250101    gcc-13.2.0
arc                   randconfig-002-20250101    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-20
arm                           imxrt_defconfig    clang-19
arm                   randconfig-001-20250101    clang-15
arm                   randconfig-002-20250101    clang-17
arm                   randconfig-003-20250101    gcc-14.2.0
arm                   randconfig-004-20250101    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250101    clang-20
arm64                 randconfig-002-20250101    clang-20
arm64                 randconfig-003-20250101    gcc-14.2.0
arm64                 randconfig-004-20250101    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250101    gcc-14.2.0
csky                  randconfig-002-20250101    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    clang-20
hexagon               randconfig-001-20250101    clang-14
hexagon               randconfig-002-20250101    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250101    clang-19
i386        buildonly-randconfig-002-20250101    gcc-12
i386        buildonly-randconfig-003-20250101    clang-19
i386        buildonly-randconfig-004-20250101    clang-19
i386        buildonly-randconfig-005-20250101    clang-19
i386        buildonly-randconfig-006-20250101    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250101    gcc-14.2.0
loongarch             randconfig-002-20250101    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250101    gcc-14.2.0
nios2                 randconfig-002-20250101    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250101    gcc-14.2.0
parisc                randconfig-002-20250101    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                 canyonlands_defconfig    clang-19
powerpc                       ebony_defconfig    clang-18
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-20
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250101    gcc-14.2.0
powerpc               randconfig-002-20250101    clang-17
powerpc               randconfig-003-20250101    gcc-14.2.0
powerpc                        warp_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250101    clang-20
powerpc64             randconfig-002-20250101    gcc-14.2.0
powerpc64             randconfig-003-20250101    clang-17
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250101    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-002-20250101    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20250101    gcc-14.2.0
sh                    randconfig-002-20250101    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250101    gcc-14.2.0
sparc                 randconfig-002-20250101    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250101    gcc-14.2.0
sparc64               randconfig-002-20250101    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                    randconfig-001-20250101    gcc-12
um                    randconfig-002-20250101    clang-20
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250101    gcc-14.2.0
xtensa                randconfig-002-20250101    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

