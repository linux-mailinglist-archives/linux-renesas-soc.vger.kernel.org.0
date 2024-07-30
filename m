Return-Path: <linux-renesas-soc+bounces-7613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8159406A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 06:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 549E4B2212E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 04:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41765146D75;
	Tue, 30 Jul 2024 04:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwbJ+dIh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C8D13B780
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 04:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722314966; cv=none; b=H/q9ovOUSaNh+9OvYg/SyFY0bl4dVHucNAV7bHCk5nEh2UalwV0H5ICZbASdru+VLxGy56Vz6penmXJmC0jhgLhqNIH4ZswooiRi1axKguzSpKLtxhoHxpnXDKbPmAH9jLvcvPXp6J9Il4/VHCibwty1vzQYK0vvS+vQejsaLHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722314966; c=relaxed/simple;
	bh=sfl4TyZRfnKWhP/Mo1lzSEb6hL0sEtKBglSGNC6xGyI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FwNGPTRAK4eAM6nzS6ikEivfCdqxLYTWABiYfrwrt+lzhlKJbk9HWVBCql2zcwVHb0j7wTTVqFh4e6E0F6XM6yOumCQtSfYLAP63Y32G8V9mhJP5ZdWdYy3qek5roLBQVfTU+PkpZo4NdGpnvRb8HwwEWSX/8XV7j3lWhv/9VSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwbJ+dIh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722314964; x=1753850964;
  h=date:from:to:cc:subject:message-id;
  bh=sfl4TyZRfnKWhP/Mo1lzSEb6hL0sEtKBglSGNC6xGyI=;
  b=dwbJ+dIhpClUN563eYmVo1cNRo8r3gTIlvv/WVhLG/4CsY4E4fcI3RWn
   xoYNjJ34WZFIRvKrUbnchcyjzArvl7Mub1vOgy2ra0CapDjKCLMYZ6KUm
   T1Ex1/l1e1yVFYg0Hjh+xz5e1t4NBKcZp8IOwQ3/W0+QHFgXwwc/TpbTv
   qOs9k+yR6kDSHK/HgCKt4zN2lCasqQNGxgqxISf7F32QUelruwTxCT/Vp
   VbcKYnGsxzYZT/eueOeVyYvpDGkr2Gv/HllvV/rRc3b3EOia1J+ZNC+WB
   AqyUGT150NjtRnOaO7u8UPVIO6Z97WXk5hng2spHnGu/l8uUhxs9FX7gz
   A==;
X-CSE-ConnectionGUID: JZQW7BooT8KBTtT5YRn8ag==
X-CSE-MsgGUID: D7FlOA3eS+iapVO5JMhWVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20289224"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="20289224"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 21:49:23 -0700
X-CSE-ConnectionGUID: 1ZK+i4i4QBOPH3mlMbeXog==
X-CSE-MsgGUID: +ETjaVy8RtG8+8dVz3ks3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="77430884"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jul 2024 21:49:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYenY-000sVM-09;
	Tue, 30 Jul 2024 04:49:20 +0000
Date: Tue, 30 Jul 2024 12:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 ec3912ab0d30fad9309ef77b614908f673e51c48
Message-ID: <202407301231.U8wo7psY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: ec3912ab0d30fad9309ef77b614908f673e51c48  Merge branches 'renesas-arm-defconfig-for-v6.12', 'renesas-dt-bindings-for-v6.12' and 'renesas-dts-for-v6.12' into renesas-next

elapsed time: 1022m

configs tested: 256
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.3.0
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsimosci_defconfig   gcc-13.2.0
arc                   randconfig-001-20240730   gcc-13.2.0
arc                   randconfig-002-20240730   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                            dove_defconfig   gcc-13.3.0
arm                            hisi_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.3.0
arm                        keystone_defconfig   gcc-13.2.0
arm                         nhk8815_defconfig   gcc-13.3.0
arm                             pxa_defconfig   gcc-13.2.0
arm                   randconfig-001-20240730   gcc-13.2.0
arm                   randconfig-001-20240730   gcc-14.1.0
arm                   randconfig-002-20240730   gcc-13.2.0
arm                   randconfig-002-20240730   gcc-14.1.0
arm                   randconfig-003-20240730   gcc-13.2.0
arm                   randconfig-003-20240730   gcc-14.1.0
arm                   randconfig-004-20240730   gcc-13.2.0
arm                   randconfig-004-20240730   gcc-14.1.0
arm                        shmobile_defconfig   gcc-13.3.0
arm                       spear13xx_defconfig   gcc-13.3.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240730   gcc-13.2.0
arm64                 randconfig-001-20240730   gcc-14.1.0
arm64                 randconfig-002-20240730   clang-20
arm64                 randconfig-002-20240730   gcc-13.2.0
arm64                 randconfig-003-20240730   clang-20
arm64                 randconfig-003-20240730   gcc-13.2.0
arm64                 randconfig-004-20240730   gcc-13.2.0
arm64                 randconfig-004-20240730   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240730   gcc-13.2.0
csky                  randconfig-001-20240730   gcc-14.1.0
csky                  randconfig-002-20240730   gcc-13.2.0
csky                  randconfig-002-20240730   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240730   clang-20
hexagon               randconfig-002-20240730   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240729   clang-18
i386         buildonly-randconfig-001-20240730   gcc-13
i386         buildonly-randconfig-002-20240729   gcc-13
i386         buildonly-randconfig-002-20240730   gcc-13
i386         buildonly-randconfig-003-20240729   clang-18
i386         buildonly-randconfig-003-20240730   gcc-13
i386         buildonly-randconfig-004-20240729   gcc-10
i386         buildonly-randconfig-004-20240730   gcc-13
i386         buildonly-randconfig-005-20240729   clang-18
i386         buildonly-randconfig-005-20240730   gcc-13
i386         buildonly-randconfig-006-20240729   gcc-8
i386         buildonly-randconfig-006-20240730   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240729   gcc-12
i386                  randconfig-001-20240730   gcc-13
i386                  randconfig-002-20240729   clang-18
i386                  randconfig-002-20240730   gcc-13
i386                  randconfig-003-20240729   gcc-10
i386                  randconfig-003-20240730   gcc-13
i386                  randconfig-004-20240729   gcc-13
i386                  randconfig-004-20240730   gcc-13
i386                  randconfig-005-20240729   gcc-8
i386                  randconfig-005-20240730   gcc-13
i386                  randconfig-006-20240729   gcc-13
i386                  randconfig-006-20240730   gcc-13
i386                  randconfig-011-20240729   gcc-13
i386                  randconfig-011-20240730   gcc-13
i386                  randconfig-012-20240729   clang-18
i386                  randconfig-012-20240730   gcc-13
i386                  randconfig-013-20240729   gcc-9
i386                  randconfig-013-20240730   gcc-13
i386                  randconfig-014-20240729   clang-18
i386                  randconfig-014-20240730   gcc-13
i386                  randconfig-015-20240729   gcc-13
i386                  randconfig-015-20240730   gcc-13
i386                  randconfig-016-20240729   clang-18
i386                  randconfig-016-20240730   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240730   gcc-13.2.0
loongarch             randconfig-001-20240730   gcc-14.1.0
loongarch             randconfig-002-20240730   gcc-13.2.0
loongarch             randconfig-002-20240730   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                     cu1000-neo_defconfig   gcc-13.2.0
mips                           gcw0_defconfig   gcc-13.2.0
mips                            gpr_defconfig   gcc-13.2.0
mips                      maltaaprp_defconfig   gcc-13.2.0
mips                        qi_lb60_defconfig   gcc-13.3.0
nios2                         10m50_defconfig   gcc-13.3.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240730   gcc-13.2.0
nios2                 randconfig-001-20240730   gcc-14.1.0
nios2                 randconfig-002-20240730   gcc-13.2.0
nios2                 randconfig-002-20240730   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc                generic-64bit_defconfig   gcc-13.3.0
parisc                randconfig-001-20240730   gcc-13.2.0
parisc                randconfig-001-20240730   gcc-14.1.0
parisc                randconfig-002-20240730   gcc-13.2.0
parisc                randconfig-002-20240730   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                 canyonlands_defconfig   gcc-13.2.0
powerpc                       eiger_defconfig   gcc-13.3.0
powerpc                 mpc834x_itx_defconfig   gcc-13.3.0
powerpc                     rainier_defconfig   gcc-13.3.0
powerpc               randconfig-002-20240730   clang-16
powerpc               randconfig-002-20240730   gcc-13.2.0
powerpc               randconfig-003-20240730   clang-20
powerpc               randconfig-003-20240730   gcc-13.2.0
powerpc                    sam440ep_defconfig   gcc-13.2.0
powerpc                     tqm5200_defconfig   gcc-13.3.0
powerpc                     tqm8541_defconfig   gcc-13.3.0
powerpc64             randconfig-001-20240730   gcc-13.2.0
powerpc64             randconfig-001-20240730   gcc-14.1.0
powerpc64             randconfig-002-20240730   clang-20
powerpc64             randconfig-002-20240730   gcc-13.2.0
powerpc64             randconfig-003-20240730   gcc-13.2.0
powerpc64             randconfig-003-20240730   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240730   clang-14
riscv                 randconfig-001-20240730   gcc-13.2.0
riscv                 randconfig-002-20240730   gcc-13.2.0
riscv                 randconfig-002-20240730   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240730   gcc-13.2.0
s390                  randconfig-001-20240730   gcc-14.1.0
s390                  randconfig-002-20240730   clang-20
s390                  randconfig-002-20240730   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                             espt_defconfig   gcc-13.2.0
sh                          polaris_defconfig   gcc-13.2.0
sh                          r7780mp_defconfig   gcc-13.2.0
sh                    randconfig-001-20240730   gcc-13.2.0
sh                    randconfig-001-20240730   gcc-14.1.0
sh                    randconfig-002-20240730   gcc-13.2.0
sh                    randconfig-002-20240730   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                          rsk7269_defconfig   gcc-13.3.0
sh                           se7721_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240730   gcc-13.2.0
sparc64               randconfig-001-20240730   gcc-14.1.0
sparc64               randconfig-002-20240730   gcc-13.2.0
sparc64               randconfig-002-20240730   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240730   gcc-13
um                    randconfig-001-20240730   gcc-13.2.0
um                    randconfig-002-20240730   clang-20
um                    randconfig-002-20240730   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240730   clang-18
x86_64       buildonly-randconfig-002-20240730   clang-18
x86_64       buildonly-randconfig-002-20240730   gcc-12
x86_64       buildonly-randconfig-003-20240730   clang-18
x86_64       buildonly-randconfig-004-20240730   clang-18
x86_64       buildonly-randconfig-004-20240730   gcc-13
x86_64       buildonly-randconfig-005-20240730   clang-18
x86_64       buildonly-randconfig-005-20240730   gcc-12
x86_64       buildonly-randconfig-006-20240730   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240730   clang-18
x86_64                randconfig-002-20240730   clang-18
x86_64                randconfig-002-20240730   gcc-13
x86_64                randconfig-003-20240730   clang-18
x86_64                randconfig-004-20240730   clang-18
x86_64                randconfig-005-20240730   clang-18
x86_64                randconfig-006-20240730   clang-18
x86_64                randconfig-011-20240730   clang-18
x86_64                randconfig-011-20240730   gcc-13
x86_64                randconfig-012-20240730   clang-18
x86_64                randconfig-013-20240730   clang-18
x86_64                randconfig-014-20240730   clang-18
x86_64                randconfig-015-20240730   clang-18
x86_64                randconfig-015-20240730   gcc-8
x86_64                randconfig-016-20240730   clang-18
x86_64                randconfig-016-20240730   gcc-13
x86_64                randconfig-071-20240730   clang-18
x86_64                randconfig-071-20240730   gcc-8
x86_64                randconfig-072-20240730   clang-18
x86_64                randconfig-073-20240730   clang-18
x86_64                randconfig-073-20240730   gcc-12
x86_64                randconfig-074-20240730   clang-18
x86_64                randconfig-075-20240730   clang-18
x86_64                randconfig-076-20240730   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240730   gcc-13.2.0
xtensa                randconfig-001-20240730   gcc-14.1.0
xtensa                randconfig-002-20240730   gcc-13.2.0
xtensa                randconfig-002-20240730   gcc-14.1.0
xtensa                    smp_lx200_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

