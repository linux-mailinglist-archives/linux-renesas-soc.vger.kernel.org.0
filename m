Return-Path: <linux-renesas-soc+bounces-12286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43464A17514
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2025 00:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF324188A2F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 23:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBCB1F03F5;
	Mon, 20 Jan 2025 23:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGXIWtPH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7351F03F1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 23:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737416906; cv=none; b=mIe+oUSGph8+ZOtPrrywmRzSK/hAYuoaL1ID/HrWHAygE4Fa3O4tvEN7lTpUM489ioJzMLqTM6p0nuVd8xUnQuNRi8wiPlnnlfGmhhuN7BvmGWsdPpX7+vdtEeAtreSN+/NxV6iN/9j/Hu+7ybkFootso8pMxXqiOCUfSDkvIqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737416906; c=relaxed/simple;
	bh=ELBLphhOtiek2qyqIGl9wHSmclz54fHCFcDtutzZJtI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RWTSrwyFxN9pPU6ZgZtJpJ3ZN3ktfOjVexKvO/iTooks98BrBjT/4Z0KwY582vEQNnNF6jSVL8hJYHfnfCx3FNXvg6dSAJG8d8xXxdAF80AbLxW8NdPouk0zha/AhXTkrRe8a78jNDdjFGJncgyPmN2sDc8RtO1crjkKnHm+fH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGXIWtPH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737416905; x=1768952905;
  h=date:from:to:cc:subject:message-id;
  bh=ELBLphhOtiek2qyqIGl9wHSmclz54fHCFcDtutzZJtI=;
  b=nGXIWtPH3cFcaQ6IF035go7hqSLxHZ0a5OYUdU6MQ34bC0lrcHLh3G9t
   iwOnpgXh+iHszh+fBjnGt+Lm//LwqeKj5frClB4W/AvffJ0aXe/c8cGrb
   pVETClAukCSPu2Ja/l/0sLl1U4PUiLrslaJ+l9G/A0ZSOfoJuKH80Q+Kp
   BbzfP06XjdWT5vMgkNXxaxduQx9F7omPCdWv+DfrSbVs0vC/NpIl2meI7
   ATWKH2hClOAv4qeAeV/+bdEctyFnc8XHE2rVA44iyUvbtWStHQa2sD8Cs
   8q8ve/uId9h5r7FvaVy2ZVm079sMWyIefJmOXAOQVyz+1eDZaIbr9LTA3
   w==;
X-CSE-ConnectionGUID: kId8HVg5QPG2AGO1zQnFbA==
X-CSE-MsgGUID: F3Y9i0QiS4CLh/wiudg8fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37979201"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="37979201"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 15:48:24 -0800
X-CSE-ConnectionGUID: XnXIDnhqR6GqEDo+HOxRww==
X-CSE-MsgGUID: +kJYdh3eTf2HGCc0Qvkd5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="111628491"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jan 2025 15:48:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta1VF-000XMZ-0t;
	Mon, 20 Jan 2025 23:48:21 +0000
Date: Tue, 21 Jan 2025 07:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 e317cfbf2d8f94bebb8e896c517e71ec1b53a7d9
Message-ID: <202501210755.aWFuPfi7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: e317cfbf2d8f94bebb8e896c517e71ec1b53a7d9  Merge branch 'renesas-dts-for-v6.15' into renesas-devel

elapsed time: 862m

configs tested: 126
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250120    gcc-13.2.0
arc                   randconfig-002-20250120    gcc-13.2.0
arc                           tb10x_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-17
arm                            mmp2_defconfig    gcc-14.2.0
arm                   randconfig-001-20250120    clang-20
arm                   randconfig-002-20250120    clang-20
arm                   randconfig-003-20250120    clang-20
arm                   randconfig-004-20250120    clang-19
arm                        shmobile_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250120    gcc-14.2.0
arm64                 randconfig-002-20250120    clang-20
arm64                 randconfig-003-20250120    clang-19
arm64                 randconfig-004-20250120    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250120    gcc-14.2.0
csky                  randconfig-002-20250120    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250120    clang-20
hexagon               randconfig-002-20250120    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250120    gcc-11
i386        buildonly-randconfig-002-20250120    clang-19
i386        buildonly-randconfig-003-20250120    gcc-12
i386        buildonly-randconfig-004-20250120    gcc-12
i386        buildonly-randconfig-005-20250120    clang-19
i386        buildonly-randconfig-006-20250120    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250120    gcc-14.2.0
loongarch             randconfig-002-20250120    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250120    gcc-14.2.0
nios2                 randconfig-002-20250120    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250120    gcc-14.2.0
parisc                randconfig-002-20250120    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      chrp32_defconfig    clang-20
powerpc                      cm5200_defconfig    clang-20
powerpc                          g5_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250120    clang-20
powerpc               randconfig-002-20250120    clang-20
powerpc               randconfig-003-20250120    clang-20
powerpc64             randconfig-001-20250120    clang-19
powerpc64             randconfig-002-20250120    clang-17
powerpc64             randconfig-003-20250120    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250120    clang-20
riscv                 randconfig-002-20250120    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250120    gcc-14.2.0
s390                  randconfig-002-20250120    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                    randconfig-001-20250120    gcc-14.2.0
sh                    randconfig-002-20250120    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250120    gcc-14.2.0
sparc                 randconfig-002-20250120    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250120    gcc-14.2.0
sparc64               randconfig-002-20250120    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250120    clang-15
um                    randconfig-002-20250120    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250120    clang-19
x86_64      buildonly-randconfig-002-20250120    clang-19
x86_64      buildonly-randconfig-003-20250120    gcc-12
x86_64      buildonly-randconfig-004-20250120    clang-19
x86_64      buildonly-randconfig-005-20250120    clang-19
x86_64      buildonly-randconfig-006-20250120    gcc-11
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250120    gcc-14.2.0
xtensa                randconfig-002-20250120    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

