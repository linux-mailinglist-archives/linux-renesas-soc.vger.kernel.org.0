Return-Path: <linux-renesas-soc+bounces-18325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C01AD9C20
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Jun 2025 12:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49B2C3BA6C9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Jun 2025 10:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA6F249EB;
	Sat, 14 Jun 2025 10:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkC0Zqwe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8DA175A5
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Jun 2025 10:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749897328; cv=none; b=lZmxQgd53FnwIQJ8tsjHcC6dlYXSHBBmEpvHWUohp/kTjFBjQKP8IWe2/s9DXyVFGtGvkh4ty5bkurXs18F8bvP2XuQ6ea9L+ndce+KFp8ev9co+um9Jp0Hv4evbUnKfsBVM7tytKYhCXk7TWcBK8uEDl5QUGRlboAIbV/IL9yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749897328; c=relaxed/simple;
	bh=dYcJzwhxGXGxWJxmIiLMCCLB0lpsFffkRmKMWGGtnfE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ugv5q7sG9MxkXKIUCMwt69UDzsTFJw/M4vA2PatPdHIs6yF3yODglXGI82dld5WCtkkgXPYmuWfKYchkzqsJ5kcOWW1oUMxK5JdlmcYRmLNeNTSB7/0eRrcrammmYZmU6OYRyFVrKRNeT3cHQFI6jMf7rWWTwcPO1ERtqdO1CFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkC0Zqwe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749897327; x=1781433327;
  h=date:from:to:cc:subject:message-id;
  bh=dYcJzwhxGXGxWJxmIiLMCCLB0lpsFffkRmKMWGGtnfE=;
  b=DkC0ZqweGWO/TeusFBZRTGG6B/t1BYRWow8MAYiEbHzbOFMxNI20L7ab
   m6QBqLwoWv1wAKDVCq2suAtqazx3wPnWIdpLFmCVXXbs9hX7/CQDu2PmG
   4tLYIGkejrOTgBnhLKNPlRJl7LMyEXfJuZCEz9OoAzr+yxxhOEooRElSO
   GCprJ/Drj7pXAYK3TbgeAf7Ryy6ZdU7Vcz0lFRUlf/j2NPQqsZNaWdUq0
   t8pMthhoQK2UluNB053+yppqaKaFGJUQwCQ1dFxshvacclAwNAsbnqhVu
   Ddr30yYWgMwCX9pAGVOg2jYFhVQ2LqizXk5eUAtBX7m+/kWxLg4ZV1GEb
   Q==;
X-CSE-ConnectionGUID: tumB+IbhR6WMRecC01WneQ==
X-CSE-MsgGUID: sbyLVX9aSBClAnX6VtifsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55906427"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="55906427"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 03:35:26 -0700
X-CSE-ConnectionGUID: K5UGX8o0QXO/vCvn+vHqNw==
X-CSE-MsgGUID: ZyplfmrNQYySJQbyzIRFiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="147904674"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jun 2025 03:35:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQOEM-000DS2-2e;
	Sat, 14 Jun 2025 10:35:22 +0000
Date: Sat, 14 Jun 2025 18:34:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 09e64eca56664bce82634990ef18b3e422f7da5c
Message-ID: <202506141825.KqSvOjQS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 09e64eca56664bce82634990ef18b3e422f7da5c  Merge branches 'renesas-drivers-for-v6.17', 'renesas-dts-for-v6.17' and 'renesas-r9a09g087-dt-binding-defs' into renesas-next

elapsed time: 1464m

configs tested: 117
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250613    gcc-12.4.0
arc                   randconfig-002-20250613    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                       imx_v4_v5_defconfig    clang-21
arm                   randconfig-001-20250613    clang-21
arm                   randconfig-002-20250613    clang-20
arm                   randconfig-003-20250613    gcc-8.5.0
arm                   randconfig-004-20250613    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250613    gcc-15.1.0
arm64                 randconfig-002-20250613    clang-21
arm64                 randconfig-003-20250613    clang-21
arm64                 randconfig-004-20250613    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250613    gcc-15.1.0
csky                  randconfig-002-20250613    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250613    clang-21
hexagon               randconfig-002-20250613    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250613    gcc-12
i386        buildonly-randconfig-002-20250613    gcc-11
i386        buildonly-randconfig-003-20250613    gcc-12
i386        buildonly-randconfig-004-20250613    clang-20
i386        buildonly-randconfig-005-20250613    clang-20
i386        buildonly-randconfig-006-20250613    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250613    gcc-15.1.0
loongarch             randconfig-002-20250613    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                          amiga_defconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
mips                           mtx1_defconfig    clang-21
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250613    gcc-11.5.0
nios2                 randconfig-002-20250613    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250613    gcc-8.5.0
parisc                randconfig-002-20250613    gcc-13.3.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250613    clang-21
powerpc               randconfig-002-20250613    gcc-8.5.0
powerpc               randconfig-003-20250613    gcc-9.3.0
powerpc64             randconfig-001-20250613    gcc-8.5.0
powerpc64             randconfig-002-20250613    gcc-8.5.0
powerpc64             randconfig-003-20250613    gcc-10.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250613    gcc-8.5.0
riscv                 randconfig-002-20250613    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250613    clang-21
s390                  randconfig-002-20250613    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                    randconfig-001-20250613    gcc-15.1.0
sh                    randconfig-002-20250613    gcc-15.1.0
sh                           se7722_defconfig    gcc-15.1.0
sh                           se7780_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250613    gcc-10.3.0
sparc                 randconfig-002-20250613    gcc-13.3.0
sparc64               randconfig-001-20250613    gcc-15.1.0
sparc64               randconfig-002-20250613    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250613    gcc-12
um                    randconfig-002-20250613    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250613    clang-20
x86_64      buildonly-randconfig-002-20250613    gcc-12
x86_64      buildonly-randconfig-003-20250613    gcc-12
x86_64      buildonly-randconfig-004-20250613    gcc-12
x86_64      buildonly-randconfig-005-20250613    clang-20
x86_64      buildonly-randconfig-006-20250613    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250613    gcc-8.5.0
xtensa                randconfig-002-20250613    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

