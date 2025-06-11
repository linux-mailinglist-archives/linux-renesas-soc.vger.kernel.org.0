Return-Path: <linux-renesas-soc+bounces-18107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC96AD58DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 16:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5B857A3664
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 14:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D18D26A0C7;
	Wed, 11 Jun 2025 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XczdDoz5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728F71865FA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 14:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749652560; cv=none; b=fY9T2CsZq8EO1G+tH31jRcVZlTSgHcgiGACaSYSmCEFnKy6R3WQdqODcX5HivJJE24EV7s+LbX0ntss0F2XD/Ino3q1Dsk+qAob2hyHV7/BQW+ujipqBbUnYOXyYbNdirZxlw1TnuBB+Z4Ta4/8rQXrr+kvd/rz6rk9PodHF+ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749652560; c=relaxed/simple;
	bh=PAVUPzsE6r6mEPuWwe67uZbApAQ1nJJYcQVH3nUj14c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ufgAG+6XhyXSORT0B1PuJKcS9oRPStd6YynYZr9BUcczOKriJ/eExpY1bM1WKiiHNMiJFbxfxLvFjKPCSIcY8uIkWQPBKCo1DJZ7cdaxONvCiansOziZUrHa11MS27PzVMsaFcDfisoambKw+n8FDPdJW6iCD0uEIjvFLHShbhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XczdDoz5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749652558; x=1781188558;
  h=date:from:to:cc:subject:message-id;
  bh=PAVUPzsE6r6mEPuWwe67uZbApAQ1nJJYcQVH3nUj14c=;
  b=XczdDoz5xi1IN2R1QVUBhoeViCDEyg0I9EvtPXX4CvnaCmdanTXwdTo4
   Yuvg7pvgQIjTtSf/pWCXroJ9tofDS2AXgFii7mqYHiFzcJPEQlVu6CDbB
   IwGD7YjKPYKuLwroOtvFomJcEtqSh83E+OCp87gX8bOCHbdY+uldlUdGC
   CKaFRUxBFULTw93lbsmpQ9zxrksJakka+2JTA/o98nxB2ABKHzUkerXVx
   I0dnGgpBOwAaiiwJ2Vmgxn5iFkeLWEKW8LeoyDNNlLhe5SHSNmhX2h+qo
   Jdx62mq4l4sCOLjG5sc4hA2zvlNpLcPnedcjZmNX0wqiZcD/ltAucYSBM
   w==;
X-CSE-ConnectionGUID: k0fsTDRqSWCK2WHR/1xyiQ==
X-CSE-MsgGUID: ye9biJTvQ7C0LpAPO/5G0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51898595"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="51898595"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 07:35:57 -0700
X-CSE-ConnectionGUID: EHHC3ystQ26peQ7ANbgaZQ==
X-CSE-MsgGUID: bPwNO/+iSHy5V3vEK9Fjkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="148118053"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jun 2025 07:35:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPMYU-000AZu-1q;
	Wed, 11 Jun 2025 14:35:54 +0000
Date: Wed, 11 Jun 2025 22:35:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 516f3fe5e7ef0f5b962ef9147639bf6a80504ded
Message-ID: <202506112209.ifEpnWqi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 516f3fe5e7ef0f5b962ef9147639bf6a80504ded  [LOCAL] riscv: rzfive: defconfig: Update rzfive_defconfig

elapsed time: 1455m

configs tested: 235
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    gcc-15.1.0
arc                            hsdk_defconfig    clang-21
arc                        nsim_700_defconfig    clang-21
arc                   randconfig-001-20250611    gcc-12.4.0
arc                   randconfig-002-20250611    gcc-12.4.0
arc                   randconfig-002-20250611    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-15.1.0
arm                          exynos_defconfig    clang-21
arm                      footbridge_defconfig    gcc-12
arm                       multi_v4t_defconfig    gcc-12
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                          pxa3xx_defconfig    clang-21
arm                             pxa_defconfig    gcc-12
arm                   randconfig-001-20250611    gcc-11.5.0
arm                   randconfig-001-20250611    gcc-12.4.0
arm                   randconfig-002-20250611    clang-21
arm                   randconfig-002-20250611    gcc-12.4.0
arm                   randconfig-003-20250611    gcc-12.4.0
arm                   randconfig-003-20250611    gcc-13.3.0
arm                   randconfig-004-20250611    gcc-12.4.0
arm                   randconfig-004-20250611    gcc-13.3.0
arm                         socfpga_defconfig    clang-21
arm                          sp7021_defconfig    clang-21
arm                        spear3xx_defconfig    gcc-12
arm                           stm32_defconfig    gcc-15.1.0
arm                         wpcm450_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250611    gcc-12.4.0
arm64                 randconfig-001-20250611    gcc-8.5.0
arm64                 randconfig-002-20250611    gcc-12.4.0
arm64                 randconfig-002-20250611    gcc-9.5.0
arm64                 randconfig-003-20250611    gcc-12.4.0
arm64                 randconfig-003-20250611    gcc-13.3.0
arm64                 randconfig-004-20250611    gcc-12.4.0
arm64                 randconfig-004-20250611    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250611    gcc-8.5.0
csky                  randconfig-002-20250611    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250611    clang-21
hexagon               randconfig-001-20250611    gcc-8.5.0
hexagon               randconfig-002-20250611    clang-21
hexagon               randconfig-002-20250611    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250611    clang-20
i386        buildonly-randconfig-001-20250611    gcc-12
i386        buildonly-randconfig-002-20250611    clang-20
i386        buildonly-randconfig-002-20250611    gcc-12
i386        buildonly-randconfig-003-20250611    clang-20
i386        buildonly-randconfig-004-20250611    clang-20
i386        buildonly-randconfig-004-20250611    gcc-12
i386        buildonly-randconfig-005-20250611    clang-20
i386        buildonly-randconfig-005-20250611    gcc-11
i386        buildonly-randconfig-006-20250611    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250611    clang-20
i386                  randconfig-002-20250611    clang-20
i386                  randconfig-003-20250611    clang-20
i386                  randconfig-004-20250611    clang-20
i386                  randconfig-005-20250611    clang-20
i386                  randconfig-006-20250611    clang-20
i386                  randconfig-007-20250611    clang-20
i386                  randconfig-011-20250611    gcc-12
i386                  randconfig-012-20250611    gcc-12
i386                  randconfig-013-20250611    gcc-12
i386                  randconfig-014-20250611    gcc-12
i386                  randconfig-015-20250611    gcc-12
i386                  randconfig-016-20250611    gcc-12
i386                  randconfig-017-20250611    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250611    gcc-8.5.0
loongarch             randconfig-002-20250611    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         apollo_defconfig    clang-21
m68k                                defconfig    gcc-15.1.0
m68k                            mac_defconfig    gcc-15.1.0
m68k                        mvme147_defconfig    gcc-12
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    clang-21
mips                           mtx1_defconfig    clang-21
mips                        qi_lb60_defconfig    clang-21
mips                         rt305x_defconfig    clang-21
mips                         rt305x_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250611    gcc-8.5.0
nios2                 randconfig-002-20250611    gcc-8.5.0
nios2                 randconfig-002-20250611    gcc-9.3.0
openrisc                          allnoconfig    clang-21
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                           alldefconfig    clang-21
parisc                            allnoconfig    clang-21
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250611    gcc-8.5.0
parisc                randconfig-002-20250611    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                        cell_defconfig    gcc-15.1.0
powerpc                       ebony_defconfig    clang-21
powerpc                      ep88xc_defconfig    clang-21
powerpc                       holly_defconfig    clang-21
powerpc                      katmai_defconfig    clang-21
powerpc                  mpc866_ads_defconfig    clang-21
powerpc               randconfig-001-20250611    gcc-8.5.0
powerpc               randconfig-002-20250611    gcc-13.3.0
powerpc               randconfig-002-20250611    gcc-8.5.0
powerpc               randconfig-003-20250611    clang-21
powerpc               randconfig-003-20250611    gcc-8.5.0
powerpc64             randconfig-001-20250611    clang-21
powerpc64             randconfig-001-20250611    gcc-8.5.0
powerpc64             randconfig-002-20250611    clang-21
powerpc64             randconfig-002-20250611    gcc-8.5.0
riscv                            alldefconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250611    clang-21
riscv                 randconfig-001-20250611    gcc-15.1.0
riscv                 randconfig-002-20250611    clang-19
riscv                 randconfig-002-20250611    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250611    gcc-15.1.0
s390                  randconfig-002-20250611    gcc-11.5.0
s390                  randconfig-002-20250611    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                          landisk_defconfig    clang-21
sh                          polaris_defconfig    clang-21
sh                    randconfig-001-20250611    gcc-15.1.0
sh                    randconfig-002-20250611    gcc-15.1.0
sh                           sh2007_defconfig    clang-21
sh                            titan_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250611    gcc-11.5.0
sparc                 randconfig-001-20250611    gcc-15.1.0
sparc                 randconfig-002-20250611    gcc-15.1.0
sparc                 randconfig-002-20250611    gcc-8.5.0
sparc                       sparc32_defconfig    clang-21
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250611    gcc-15.1.0
sparc64               randconfig-001-20250611    gcc-8.5.0
sparc64               randconfig-002-20250611    gcc-13.3.0
sparc64               randconfig-002-20250611    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250611    clang-21
um                    randconfig-001-20250611    gcc-15.1.0
um                    randconfig-002-20250611    clang-19
um                    randconfig-002-20250611    gcc-15.1.0
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250611    clang-20
x86_64      buildonly-randconfig-001-20250611    gcc-12
x86_64      buildonly-randconfig-002-20250611    clang-20
x86_64      buildonly-randconfig-003-20250611    clang-20
x86_64      buildonly-randconfig-004-20250611    clang-20
x86_64      buildonly-randconfig-004-20250611    gcc-12
x86_64      buildonly-randconfig-005-20250611    clang-20
x86_64      buildonly-randconfig-005-20250611    gcc-12
x86_64      buildonly-randconfig-006-20250611    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250611    clang-20
x86_64                randconfig-002-20250611    clang-20
x86_64                randconfig-003-20250611    clang-20
x86_64                randconfig-004-20250611    clang-20
x86_64                randconfig-005-20250611    clang-20
x86_64                randconfig-006-20250611    clang-20
x86_64                randconfig-007-20250611    clang-20
x86_64                randconfig-008-20250611    clang-20
x86_64                randconfig-071-20250611    gcc-12
x86_64                randconfig-072-20250611    gcc-12
x86_64                randconfig-073-20250611    gcc-12
x86_64                randconfig-074-20250611    gcc-12
x86_64                randconfig-075-20250611    gcc-12
x86_64                randconfig-076-20250611    gcc-12
x86_64                randconfig-077-20250611    gcc-12
x86_64                randconfig-078-20250611    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  nommu_kc705_defconfig    clang-21
xtensa                randconfig-001-20250611    gcc-13.3.0
xtensa                randconfig-001-20250611    gcc-15.1.0
xtensa                randconfig-002-20250611    gcc-10.5.0
xtensa                randconfig-002-20250611    gcc-15.1.0
xtensa                    smp_lx200_defconfig    gcc-12
xtensa                         virt_defconfig    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

