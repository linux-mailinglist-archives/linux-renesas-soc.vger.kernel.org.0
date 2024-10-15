Return-Path: <linux-renesas-soc+bounces-9736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8164C99E356
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 12:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DE2F283308
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 10:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53277166F34;
	Tue, 15 Oct 2024 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhqYRUaX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919F44C9F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728986686; cv=none; b=QOMnSZVw/zk20Hb7jtllety+uVZdAMF2odHWBWiiJSxILZEcaFozD/iPivqy8lmiQQ9ueWdIkzF4uAnGiZh9Gh2Xho4Fl1u16h6ndhMXeXs8sy5G5W5kjEkO4/SfsHgijghDywiyJuCPlM9O6uQ16hUccxDb/3OtJTPmI1N9Sqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728986686; c=relaxed/simple;
	bh=VaouBIFi/NI++NirOuuEyCKviaTTuFNMN54ihQ/nyUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vf33rmSJXZWEuYgtThFkYWTsR8kaCpRPaSENV0MCvddLWM4z3Cb/PJzufzELJoQZfn2F1Zf8nPZfAIXiD3IvehPJb3SpJGCjxyUPdzITE8Dpe+7VANJ7v9CVHEpRMm2XR/r4itFor+LLbrq9o7WDHOrpLAiMqPU/jewEAo+kK3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhqYRUaX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728986685; x=1760522685;
  h=date:from:to:cc:subject:message-id;
  bh=VaouBIFi/NI++NirOuuEyCKviaTTuFNMN54ihQ/nyUc=;
  b=WhqYRUaXPl+MarDAh82Ddpv14++5rSYH2Y5cjG+vRmEjR0q97WW7CnzS
   BaOPdMO98fQigAy0pZWorOw6igZzAxCW2O0ZlvAKADovJiMU8qprI5wBV
   i0lldb9tMKYxpceVWLlRHLs3HpQ3eSlpD7CgqTdsV7dXX7AR/s3xdgV7f
   3WLFWYh9fVF1YYzYo+VwpflQRmybCur37bKjvuqphHZdEMh0Jx6bjeB4D
   164J49G15tGdZ/aA3z/3A/qbfuQwjwgCoOWYRBEd/c01v/Smczh44sYDK
   IXQmC9WtMd7MOA0iOHl0kQR9a+yhKXPeoWqXa073JIK05JWoBCHjx9lmJ
   w==;
X-CSE-ConnectionGUID: CFHHn96hSO6R7KQvRjZZjA==
X-CSE-MsgGUID: lbsSTe/CRMWtY6sL0x+DpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28253019"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28253019"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 03:04:44 -0700
X-CSE-ConnectionGUID: f52JANlLTSqM+BUz/NDitQ==
X-CSE-MsgGUID: TN9ZFBB2Q6irI7pMyoROmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77796185"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Oct 2024 03:04:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0ePw-000Hut-33;
	Tue, 15 Oct 2024 10:04:40 +0000
Date: Tue, 15 Oct 2024 18:04:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 5dcde519a067ac5c85c273e550dde1873e2199bf
Message-ID: <202410151826.RKJpeZEh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: 5dcde519a067ac5c85c273e550dde1873e2199bf  pinctrl: renesas: Select PINCTRL_RZG2L for RZ/V2H(P) SoC

elapsed time: 1454m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          moxart_defconfig    gcc-14.1.0
arm                        mvebu_v5_defconfig    gcc-14.1.0
arm                           spitz_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241015    clang-18
i386        buildonly-randconfig-002-20241015    clang-18
i386        buildonly-randconfig-003-20241015    clang-18
i386        buildonly-randconfig-004-20241015    clang-18
i386        buildonly-randconfig-005-20241015    clang-18
i386        buildonly-randconfig-006-20241015    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241015    clang-18
i386                  randconfig-002-20241015    clang-18
i386                  randconfig-003-20241015    clang-18
i386                  randconfig-004-20241015    clang-18
i386                  randconfig-005-20241015    clang-18
i386                  randconfig-006-20241015    clang-18
i386                  randconfig-011-20241015    clang-18
i386                  randconfig-012-20241015    clang-18
i386                  randconfig-013-20241015    clang-18
i386                  randconfig-014-20241015    clang-18
i386                  randconfig-015-20241015    clang-18
i386                  randconfig-016-20241015    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath25_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                   lite5200b_defconfig    gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig    gcc-14.1.0
powerpc                      ppc64e_defconfig    gcc-14.1.0
powerpc64                        alldefconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          sdk7780_defconfig    gcc-14.1.0
sh                             sh03_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241015    clang-18
x86_64      buildonly-randconfig-002-20241015    clang-18
x86_64      buildonly-randconfig-003-20241015    clang-18
x86_64      buildonly-randconfig-004-20241015    clang-18
x86_64      buildonly-randconfig-005-20241015    clang-18
x86_64      buildonly-randconfig-006-20241015    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241015    clang-18
x86_64                randconfig-002-20241015    clang-18
x86_64                randconfig-003-20241015    clang-18
x86_64                randconfig-004-20241015    clang-18
x86_64                randconfig-005-20241015    clang-18
x86_64                randconfig-006-20241015    clang-18
x86_64                randconfig-011-20241015    clang-18
x86_64                randconfig-012-20241015    clang-18
x86_64                randconfig-013-20241015    clang-18
x86_64                randconfig-014-20241015    clang-18
x86_64                randconfig-015-20241015    clang-18
x86_64                randconfig-016-20241015    clang-18
x86_64                randconfig-071-20241015    clang-18
x86_64                randconfig-072-20241015    clang-18
x86_64                randconfig-073-20241015    clang-18
x86_64                randconfig-074-20241015    clang-18
x86_64                randconfig-075-20241015    clang-18
x86_64                randconfig-076-20241015    clang-18
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

