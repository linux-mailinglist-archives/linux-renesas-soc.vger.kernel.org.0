Return-Path: <linux-renesas-soc+bounces-21511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 898AFB45E25
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 18:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EAF75C827A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 16:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C74D31D750;
	Fri,  5 Sep 2025 16:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYvHRlRj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D1031D72D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Sep 2025 16:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757089780; cv=none; b=D278dfSpW++bRvvZoMQQwcZME/Tz3HBQcU6CuTuqZCh3CW3vg4RhBbYc7Ct6ZKvO3mVVsa4keP+AmUwi4so02u8xMg8cWWESO9P6NqTXTNnLoszwn0T4Loq4J4bz3LsoqjsFE7r6cq2xUjhuLoG8GaVmJMvwBsHHc/ZBBN8k8/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757089780; c=relaxed/simple;
	bh=fB4pHfzWg6rpYqh114dGTsfWtPiNBzyWd/hpSdhzRXI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mdM+KcHeGOFGX/YqFuh4utgrT8AdElSliqitQjfimO4Lz6zysB4zkLOfVRqxGUkSf5DHhpdnjVZcRhO95CHUWtcdmbD5G2QKRpX6smHiERzeMVp8Ru2s/OSV8oyCheN/tL0Eh86t38nZ5KK5AfFG3msXbHuIfv/K3BGxfsdiMIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYvHRlRj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757089778; x=1788625778;
  h=date:from:to:cc:subject:message-id;
  bh=fB4pHfzWg6rpYqh114dGTsfWtPiNBzyWd/hpSdhzRXI=;
  b=ZYvHRlRj0lke/8dv2SxmlN52hJ9EOHDMJPGH5CUWxVQQsQ63Nwol+FjQ
   3gxEMn5S/Cs9hQjo7vxj4PSe5w/pA+02yrvKtmePGPVVciWGX3dpEyVaE
   PLV+pV9bEtXsp3sbbpj1bjC+hFPI05xsjlquW/pEX3l2+drL2doLm8Hl1
   XYHefGi07tt//7lr1h0icc2liwYO63lG1O6jMlNUr0bhwaYcB7X/761iM
   HtscYTYgx9CUqeQSXOsm3W2YgVTZDV1zrKyTCH+kpPrJWc+cD0p8Xh7FW
   aV5skTK34bsIB18xzpK4YiXs0xt2A/eS+OU2aA+nmg4PhPuOuslWJOz0Z
   Q==;
X-CSE-ConnectionGUID: gn9YBm0zQmikuh4S5LkG5A==
X-CSE-MsgGUID: nNf8eBHPRVm65nrQ0zl1EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70822958"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="70822958"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 09:29:38 -0700
X-CSE-ConnectionGUID: RcbDePZHQpCkvVJ6z5+qEA==
X-CSE-MsgGUID: nVipuDWRS2OwS71WnCmq3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="173006442"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Sep 2025 09:29:37 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuZJe-0000cn-2L;
	Fri, 05 Sep 2025 16:29:34 +0000
Date: Sat, 06 Sep 2025 00:29:20 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 fb4033e24970baa3fe10b9ce9f95f8908b72db37
Message-ID: <202509060014.GOrY6FgS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: fb4033e24970baa3fe10b9ce9f95f8908b72db37  Merge branch 'renesas-dts-for-v6.18' into renesas-next

elapsed time: 1792m

configs tested: 105
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250904    gcc-9.5.0
arc                   randconfig-002-20250904    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20250904    gcc-10.5.0
arm                   randconfig-002-20250904    gcc-13.4.0
arm                   randconfig-003-20250904    gcc-8.5.0
arm                   randconfig-004-20250904    gcc-13.4.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250904    gcc-8.5.0
arm64                 randconfig-002-20250904    gcc-8.5.0
arm64                 randconfig-003-20250904    clang-22
arm64                 randconfig-004-20250904    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250904    gcc-15.1.0
csky                  randconfig-002-20250904    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250904    clang-22
hexagon               randconfig-002-20250904    clang-20
i386                             allmodconfig    gcc-13
i386                              allnoconfig    gcc-13
i386                             allyesconfig    gcc-13
i386        buildonly-randconfig-001-20250904    clang-20
i386        buildonly-randconfig-002-20250904    gcc-12
i386        buildonly-randconfig-003-20250904    gcc-13
i386        buildonly-randconfig-004-20250904    gcc-13
i386        buildonly-randconfig-005-20250904    clang-20
i386        buildonly-randconfig-006-20250904    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250904    gcc-15.1.0
loongarch             randconfig-002-20250904    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250904    gcc-11.5.0
nios2                 randconfig-002-20250904    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20250904    gcc-8.5.0
parisc                randconfig-002-20250904    gcc-11.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250904    clang-19
powerpc               randconfig-002-20250904    gcc-13.4.0
powerpc               randconfig-003-20250904    clang-22
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250904    gcc-15.1.0
powerpc64             randconfig-002-20250904    clang-22
powerpc64             randconfig-003-20250904    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250904    gcc-8.5.0
riscv                 randconfig-002-20250904    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250904    gcc-10.5.0
s390                  randconfig-002-20250904    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250904    gcc-12.5.0
sh                    randconfig-002-20250904    gcc-10.5.0
sh                   sh7724_generic_defconfig    gcc-15.1.0
sh                            shmin_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250904    gcc-11.5.0
sparc                 randconfig-002-20250904    gcc-15.1.0
sparc64               randconfig-001-20250904    gcc-12.5.0
sparc64               randconfig-002-20250904    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-13
um                    randconfig-001-20250904    gcc-13
um                    randconfig-002-20250904    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250904    gcc-12
x86_64      buildonly-randconfig-002-20250904    clang-20
x86_64      buildonly-randconfig-003-20250904    gcc-13
x86_64      buildonly-randconfig-004-20250904    gcc-13
x86_64      buildonly-randconfig-005-20250904    gcc-13
x86_64      buildonly-randconfig-006-20250904    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250904    gcc-10.5.0
xtensa                randconfig-002-20250904    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

