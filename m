Return-Path: <linux-renesas-soc+bounces-10689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 952319D9386
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 09:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6DD4B26149
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 08:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BF013C3F6;
	Tue, 26 Nov 2024 08:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cls9Y4Zi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D324D17BA0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732610831; cv=none; b=qC71NoUZo0PxujRjkAHTCDZP542hcFQpdnE/ENUhvbD8Yi4axFoRvmF9Jf8a0uX01Kdvulwf29We5NyC+wvoU+X4VoVwO9Nzdf6fPtbRa2MruhuDOPVxnttrQSCbg5PAlDV4HeUe4LSqL5B847ut6g5GDet8L3zuZQ7/cahwLLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732610831; c=relaxed/simple;
	bh=0aPaCRU2S+kYB6VEQCb8sZJOoZe4NmZbQNWeROXb99A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tPL0GI3l+ANyA/L2a/oxWtPRkj3kaUWDYBaqB2uTgj7cU2cv+CbGI+11JqUQiSPjJgtxN09wQWQybSx723U7fDMl1n0dzGNCAnxalOw5mUQZAidfjiqD8P71b66HEzVVVoDwJ0gIfthoM49uyrRQo1w44jWbuNTZxA4gv97tZu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cls9Y4Zi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732610830; x=1764146830;
  h=date:from:to:cc:subject:message-id;
  bh=0aPaCRU2S+kYB6VEQCb8sZJOoZe4NmZbQNWeROXb99A=;
  b=cls9Y4ZiPwhayuM2I+boRvknYFhv3UFLj3UYfgvE0ZO1dyHQ5W+5AY11
   2y4fa5YngMbzfxObkzI9IBC2NxKuvum6G+Z0Ny70gpCJKvjkHdMxEIoQw
   431XCaEkTtkqdFfXsMcoSPbJIGAJgeKOIR7rJOtyTYuObKjmh+eqyfWKJ
   Xqg2VXD/qQfETf0hpL31X5i8WyFPNDQH77PhBbYhH4ew5zKG7DcwMhsUT
   L/VHhB9q3HQQaHmvZxtvq8uG+o3w6sdtJypCGEu/nZkFW15Fi3hW3oMhu
   F/EHkC4+rLJXmA9EAfpEvMZsV563hvCVVoQussIg16QVi/R5rLqhX2ymm
   g==;
X-CSE-ConnectionGUID: xgc1qsFNSB2U/R3VJum9pQ==
X-CSE-MsgGUID: knw/EVC+TLGdy4lXUPFBBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32703918"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="32703918"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 00:47:09 -0800
X-CSE-ConnectionGUID: GKCG570YQyWKF1F6Wl4Zkw==
X-CSE-MsgGUID: dKjghN1JRjmZeykBAnUc1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="91350952"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Nov 2024 00:47:08 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFrDu-0007BJ-08;
	Tue, 26 Nov 2024 08:47:06 +0000
Date: Tue, 26 Nov 2024 16:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 cc0e1c730755617c39faa59c79aa40e03aecbb15
Message-ID: <202411261627.X0iAsIKJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: cc0e1c730755617c39faa59c79aa40e03aecbb15  Merge tag 'v6.12' into renesas-devel

elapsed time: 981m

configs tested: 202
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    gcc-14.2.0
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                     haps_hs_smp_defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241126    gcc-14.2.0
arc                   randconfig-002-20241126    gcc-14.2.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    gcc-13.2.0
arm                      integrator_defconfig    gcc-13.2.0
arm                      integrator_defconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    clang-14
arm                       multi_v4t_defconfig    gcc-13.2.0
arm                       multi_v4t_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-13.2.0
arm                             mxs_defconfig    gcc-14.2.0
arm                   randconfig-001-20241126    gcc-14.2.0
arm                   randconfig-002-20241126    gcc-14.2.0
arm                   randconfig-003-20241126    gcc-14.2.0
arm                   randconfig-004-20241126    gcc-14.2.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm                           sama7_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    clang-14
arm64                 randconfig-001-20241126    gcc-14.2.0
arm64                 randconfig-002-20241126    gcc-14.2.0
arm64                 randconfig-003-20241126    gcc-14.2.0
arm64                 randconfig-004-20241126    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241126    gcc-14.2.0
csky                  randconfig-002-20241126    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241126    gcc-14.2.0
hexagon               randconfig-002-20241126    gcc-14.2.0
i386        buildonly-randconfig-001-20241126    gcc-12
i386        buildonly-randconfig-002-20241126    gcc-12
i386        buildonly-randconfig-003-20241126    gcc-12
i386        buildonly-randconfig-004-20241126    gcc-12
i386        buildonly-randconfig-005-20241126    gcc-12
i386        buildonly-randconfig-006-20241126    gcc-12
i386                  randconfig-001-20241126    gcc-12
i386                  randconfig-002-20241126    gcc-12
i386                  randconfig-003-20241126    gcc-12
i386                  randconfig-004-20241126    gcc-12
i386                  randconfig-005-20241126    gcc-12
i386                  randconfig-006-20241126    gcc-12
i386                  randconfig-011-20241126    gcc-12
i386                  randconfig-012-20241126    gcc-12
i386                  randconfig-013-20241126    gcc-12
i386                  randconfig-014-20241126    gcc-12
i386                  randconfig-015-20241126    gcc-12
i386                  randconfig-016-20241126    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241126    gcc-14.2.0
loongarch             randconfig-002-20241126    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-13.2.0
m68k                            q40_defconfig    gcc-13.2.0
m68k                        stmark2_defconfig    gcc-13.2.0
m68k                           virt_defconfig    clang-14
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-13.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    gcc-14.2.0
mips                          eyeq6_defconfig    gcc-13.2.0
mips                           jazz_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    gcc-13.2.0
mips                      maltaaprp_defconfig    clang-14
mips                         rt305x_defconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-13.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241126    gcc-14.2.0
nios2                 randconfig-002-20241126    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241126    gcc-14.2.0
parisc                randconfig-002-20241126    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    gcc-14.2.0
powerpc                   currituck_defconfig    gcc-13.2.0
powerpc                   currituck_defconfig    gcc-14.2.0
powerpc                 linkstation_defconfig    gcc-13.2.0
powerpc                     mpc5200_defconfig    clang-14
powerpc                 mpc8313_rdb_defconfig    gcc-13.2.0
powerpc                 mpc8315_rdb_defconfig    clang-14
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241126    gcc-14.2.0
powerpc               randconfig-002-20241126    gcc-14.2.0
powerpc               randconfig-003-20241126    gcc-14.2.0
powerpc                    socrates_defconfig    gcc-13.2.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241126    gcc-14.2.0
powerpc64             randconfig-002-20241126    gcc-14.2.0
powerpc64             randconfig-003-20241126    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                 randconfig-001-20241126    gcc-14.2.0
riscv                 randconfig-002-20241126    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241126    gcc-14.2.0
s390                  randconfig-002-20241126    gcc-14.2.0
sh                               alldefconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-13.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-13.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-13.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-13.2.0
sh                    randconfig-001-20241126    gcc-14.2.0
sh                    randconfig-002-20241126    gcc-14.2.0
sh                          rsk7203_defconfig    gcc-13.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                        sh7763rdp_defconfig    gcc-13.2.0
sh                        sh7763rdp_defconfig    gcc-14.2.0
sh                            shmin_defconfig    clang-14
sh                            titan_defconfig    gcc-13.2.0
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64               randconfig-001-20241126    gcc-14.2.0
sparc64               randconfig-002-20241126    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                    randconfig-001-20241126    gcc-14.2.0
um                    randconfig-002-20241126    gcc-14.2.0
x86_64      buildonly-randconfig-001-20241126    clang-19
x86_64      buildonly-randconfig-002-20241126    clang-19
x86_64      buildonly-randconfig-003-20241126    clang-19
x86_64      buildonly-randconfig-004-20241126    clang-19
x86_64      buildonly-randconfig-005-20241126    clang-19
x86_64      buildonly-randconfig-006-20241126    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241126    clang-19
x86_64                randconfig-002-20241126    clang-19
x86_64                randconfig-003-20241126    clang-19
x86_64                randconfig-004-20241126    clang-19
x86_64                randconfig-005-20241126    clang-19
x86_64                randconfig-006-20241126    clang-19
x86_64                randconfig-011-20241126    clang-19
x86_64                randconfig-012-20241126    clang-19
x86_64                randconfig-013-20241126    clang-19
x86_64                randconfig-014-20241126    clang-19
x86_64                randconfig-015-20241126    clang-19
x86_64                randconfig-016-20241126    clang-19
x86_64                randconfig-071-20241126    clang-19
x86_64                randconfig-072-20241126    clang-19
x86_64                randconfig-073-20241126    clang-19
x86_64                randconfig-074-20241126    clang-19
x86_64                randconfig-075-20241126    clang-19
x86_64                randconfig-076-20241126    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-13.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241126    gcc-14.2.0
xtensa                randconfig-002-20241126    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

