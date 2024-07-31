Return-Path: <linux-renesas-soc+bounces-7663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1340094324E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 16:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3726A1C24408
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 14:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC301BBBDA;
	Wed, 31 Jul 2024 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ly+pFn6Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B794F1BBBD9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2024 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722436907; cv=none; b=UbSvcxrM453aTXQZYj32+oE+zEHBX0wXbaUP/2fOLVfBZz+YaBArA8yKNSChBvOjxJ5duhqkg8lQp0JpAXSjy6co622u6O72uVlR8dcHW8QwapZW6ZDj7Xvs76+GsNPlILxpn9ncV1FFx7EhRC1bWwL1Np8rsCeI4n9PVl4S9Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722436907; c=relaxed/simple;
	bh=/j871pr/yXoLpy9xlsr1NAZ+jUjjIuf7gXrW8r/2+1M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rlMMu0Dc9VMSwsobLTdmldQif++vqXsUee9JBtBf1KyfqvajZN17B6eLT7uHKPqZnS2Ddvzzd/kEROJwTFDucVmYqSyImNfNL7SyrlFQiTP4i6UQgsJP1uKkeQhbBy86jCwH5uREoeYkrZRkmDmFHFTCfsoQ6uKeTMk9NIBBN/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ly+pFn6Q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722436905; x=1753972905;
  h=date:from:to:cc:subject:message-id;
  bh=/j871pr/yXoLpy9xlsr1NAZ+jUjjIuf7gXrW8r/2+1M=;
  b=ly+pFn6QwsYsc2RkmXRamKWzIIeJscuk/Lsh19bFT0nwmjgjvzfJBQjk
   RbaHHl4qEB/bgFMs8wgZajf63E0DoBZjfCN4LUkvlPguf61SlvfP3To+V
   ZcCzmVLT5gnyvHMYBXmN27c3qJQ1dAE87/ta+HUq/AATKuFeOOjT4HIK4
   kd/7X6hguMAauZJG6KotUVj7HRAnWPbxvPNUCkAfmvjPK1HD9l23bggs5
   5zs4uJy5gEAzhQcKfYCmMIWFQ2BUdUHqmaOgY+BqWrY0COwV1zo6aSEBr
   QfohS1+zjcEsACxoJIdxpnNmgX8ODdZ2KcShXoKmC5eKUSeRNt8eDx08h
   A==;
X-CSE-ConnectionGUID: Fd2AjLY5T522Nsa4Kg4LDw==
X-CSE-MsgGUID: kWaCPS2LQqSRtcK3iivN5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24083624"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="24083624"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 07:41:44 -0700
X-CSE-ConnectionGUID: OfKWzBd+TuKB0/OhwDg1wQ==
X-CSE-MsgGUID: 75G+b8sATfOwgU9nL8IJfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="55508396"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Jul 2024 07:41:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZAWK-000uT8-2K;
	Wed, 31 Jul 2024 14:41:40 +0000
Date: Wed, 31 Jul 2024 22:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 81e5e311d34699d21655a78c3a15398aff274dc6
Message-ID: <202407312238.07Q0U97c-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 81e5e311d34699d21655a78c3a15398aff274dc6  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 1451m

configs tested: 167
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240731   gcc-13.2.0
arc                   randconfig-002-20240731   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                     am200epdkit_defconfig   gcc-14.1.0
arm                       aspeed_g4_defconfig   clang-20
arm                                 defconfig   clang-14
arm                          moxart_defconfig   gcc-14.1.0
arm                       netwinder_defconfig   gcc-14.1.0
arm                   randconfig-001-20240731   gcc-14.1.0
arm                   randconfig-002-20240731   clang-20
arm                   randconfig-003-20240731   clang-20
arm                   randconfig-004-20240731   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240731   clang-15
arm64                 randconfig-002-20240731   clang-20
arm64                 randconfig-003-20240731   gcc-14.1.0
arm64                 randconfig-004-20240731   clang-20
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240731   gcc-14.1.0
csky                  randconfig-002-20240731   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   clang-20
hexagon               randconfig-001-20240731   clang-16
hexagon               randconfig-002-20240731   clang-20
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240731   clang-18
i386         buildonly-randconfig-002-20240731   clang-18
i386         buildonly-randconfig-003-20240731   clang-18
i386         buildonly-randconfig-004-20240731   gcc-13
i386         buildonly-randconfig-005-20240731   clang-18
i386         buildonly-randconfig-006-20240731   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240731   gcc-13
i386                  randconfig-002-20240731   clang-18
i386                  randconfig-003-20240731   clang-18
i386                  randconfig-004-20240731   clang-18
i386                  randconfig-005-20240731   gcc-13
i386                  randconfig-006-20240731   clang-18
i386                  randconfig-011-20240731   gcc-12
i386                  randconfig-012-20240731   gcc-13
i386                  randconfig-013-20240731   clang-18
i386                  randconfig-014-20240731   gcc-8
i386                  randconfig-015-20240731   gcc-10
i386                  randconfig-016-20240731   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240731   gcc-14.1.0
loongarch             randconfig-002-20240731   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                        m5272c3_defconfig   gcc-14.1.0
m68k                        mvme16x_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240731   gcc-14.1.0
nios2                 randconfig-002-20240731   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240731   gcc-14.1.0
parisc                randconfig-002-20240731   gcc-14.1.0
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                   bluestone_defconfig   clang-20
powerpc                          g5_defconfig   gcc-14.1.0
powerpc                   lite5200b_defconfig   clang-14
powerpc                     mpc5200_defconfig   clang-14
powerpc               randconfig-002-20240731   gcc-14.1.0
powerpc               randconfig-003-20240731   clang-20
powerpc64             randconfig-001-20240731   clang-20
powerpc64             randconfig-002-20240731   clang-15
powerpc64             randconfig-003-20240731   clang-20
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240731   clang-20
riscv                 randconfig-002-20240731   clang-15
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240731   gcc-14.1.0
s390                  randconfig-002-20240731   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-14.1.0
sh                            migor_defconfig   gcc-14.1.0
sh                    randconfig-001-20240731   gcc-14.1.0
sh                    randconfig-002-20240731   gcc-14.1.0
sh                          rsk7201_defconfig   gcc-14.1.0
sh                           se7712_defconfig   gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240731   gcc-14.1.0
sparc64               randconfig-002-20240731   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240731   clang-20
um                    randconfig-002-20240731   clang-20
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240731   gcc-13
x86_64       buildonly-randconfig-002-20240731   gcc-13
x86_64       buildonly-randconfig-003-20240731   clang-18
x86_64       buildonly-randconfig-004-20240731   gcc-13
x86_64       buildonly-randconfig-005-20240731   gcc-13
x86_64       buildonly-randconfig-006-20240731   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240731   gcc-12
x86_64                randconfig-002-20240731   gcc-12
x86_64                randconfig-003-20240731   clang-18
x86_64                randconfig-004-20240731   gcc-10
x86_64                randconfig-005-20240731   gcc-13
x86_64                randconfig-006-20240731   clang-18
x86_64                randconfig-011-20240731   clang-18
x86_64                randconfig-012-20240731   clang-18
x86_64                randconfig-013-20240731   gcc-7
x86_64                randconfig-014-20240731   clang-18
x86_64                randconfig-015-20240731   clang-18
x86_64                randconfig-016-20240731   clang-18
x86_64                randconfig-071-20240731   clang-18
x86_64                randconfig-072-20240731   gcc-13
x86_64                randconfig-073-20240731   clang-18
x86_64                randconfig-074-20240731   clang-18
x86_64                randconfig-075-20240731   clang-18
x86_64                randconfig-076-20240731   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240731   gcc-14.1.0
xtensa                randconfig-002-20240731   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

