Return-Path: <linux-renesas-soc+bounces-11851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDABEA01610
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jan 2025 18:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 746073A2279
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jan 2025 17:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7DB1C01;
	Sat,  4 Jan 2025 17:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NVB1uRL6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF651DDEA
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jan 2025 17:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736010247; cv=none; b=SEZli4couCsElTXWPOLQohwyk78d2viMio+esVqM93lrH1xPqPWdoE9ZjRPIJgifgr8rGy7D/vkPYzAKyZIFQSaDKD3AkjIbHz47nOqrrAGiYvByq+9j1zEYSMNLzWlhyP0m/iV14XyAIKQLK5i6ulyOptbGDhjKENt6K12fIsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736010247; c=relaxed/simple;
	bh=/gsc0yIQJ1N6JMJdF941bMlB+mp/kMGaEdfMoQgWdG8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rj0W5/afE60Vplyhta3YwS16xctCsYn0zZFovA6JMWdXkxnfjxn9WpYKqnmSxVg/fXxi9/Q/7294PxG+uKgKOeHbjuyVQj73RQSxuOhSQqgQOEJrrOhAheSy7ubZzXosSJQADXYazPsI/Azm1J1mEW0vht1HlllIOt5BPC/5Bls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NVB1uRL6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736010246; x=1767546246;
  h=date:from:to:cc:subject:message-id;
  bh=/gsc0yIQJ1N6JMJdF941bMlB+mp/kMGaEdfMoQgWdG8=;
  b=NVB1uRL6gMQeKzYDGHWElF0YcjCzKnEjKqbo+Hzv07wEa3BSv481/J/H
   xxD+eA6LeyrbikAE5mUNCBxSXsEvPuhe/wvHHG0OzoLryqQrCfR3m+MpY
   aqUPBVHWBXGjqUZxBknS/Oqe1lBFQd5x9ZVIkSTkcmTF9PDidTMzAyHe9
   mTvU9x4k6MjxG6/WnOW1Sy12SqYUOaBDxKmT479KkvU5OQMLsfB3L+IB2
   HW1MCQcApqMnyk8sqg+14vMMU30MKtNTwDSzt2lhWvxe0tiJck4ebfElX
   Mh5vtgmYxORDRjDrCNjEKYPoywnU38/HQhFLEi4hRIRXq2kg0pUa0E5L8
   g==;
X-CSE-ConnectionGUID: 5lRDnvrjQvq+I6hFTAHE8g==
X-CSE-MsgGUID: mDkdZzd9SLe3jfnbS5oOyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="36377676"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="36377676"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 09:04:05 -0800
X-CSE-ConnectionGUID: 5j8g/t+CRLmSXMfrHu9oEw==
X-CSE-MsgGUID: /07LnOwHRBOnMwnjvpK6xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106677438"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Jan 2025 09:04:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU7ZC-000B5T-0A;
	Sat, 04 Jan 2025 17:04:02 +0000
Date: Sun, 05 Jan 2025 01:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 42263f9226540847913801b22aa0b8ce7f512005
Message-ID: <202501050150.ORjtIesU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 42263f9226540847913801b22aa0b8ce7f512005  Merge branch 'renesas-dts-for-v6.14' into renesas-next

elapsed time: 1224m

configs tested: 224
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250104    gcc-13.2.0
arc                   randconfig-002-20250104    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-20
arm                            hisi_defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                   randconfig-001-20250104    clang-20
arm                   randconfig-002-20250104    clang-20
arm                   randconfig-003-20250104    gcc-14.2.0
arm                   randconfig-004-20250104    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250104    clang-20
arm64                 randconfig-002-20250104    clang-16
arm64                 randconfig-003-20250104    gcc-14.2.0
arm64                 randconfig-004-20250104    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250104    gcc-14.2.0
csky                  randconfig-002-20250104    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250104    clang-20
hexagon               randconfig-002-20250104    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250104    clang-19
i386        buildonly-randconfig-002-20250104    gcc-12
i386        buildonly-randconfig-003-20250104    clang-19
i386        buildonly-randconfig-004-20250104    gcc-12
i386        buildonly-randconfig-005-20250104    clang-19
i386        buildonly-randconfig-006-20250104    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250104    gcc-12
i386                  randconfig-002-20250104    gcc-12
i386                  randconfig-003-20250104    gcc-12
i386                  randconfig-004-20250104    gcc-12
i386                  randconfig-005-20250104    gcc-12
i386                  randconfig-006-20250104    gcc-12
i386                  randconfig-007-20250104    gcc-12
i386                  randconfig-011-20250104    gcc-12
i386                  randconfig-012-20250104    gcc-12
i386                  randconfig-013-20250104    gcc-12
i386                  randconfig-014-20250104    gcc-12
i386                  randconfig-015-20250104    gcc-12
i386                  randconfig-016-20250104    gcc-12
i386                  randconfig-017-20250104    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250104    gcc-14.2.0
loongarch             randconfig-002-20250104    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-20
mips                        qi_lb60_defconfig    clang-18
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                            allmodconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                            allyesconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250104    gcc-14.2.0
nios2                 randconfig-002-20250104    gcc-14.2.0
openrisc                         allmodconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250104    gcc-14.2.0
parisc                randconfig-002-20250104    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                  mpc885_ads_defconfig    clang-18
powerpc               randconfig-001-20250104    clang-20
powerpc               randconfig-002-20250104    clang-18
powerpc               randconfig-003-20250104    gcc-14.2.0
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250104    gcc-14.2.0
powerpc64             randconfig-002-20250104    gcc-14.2.0
powerpc64             randconfig-003-20250104    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250104    gcc-11
riscv                 randconfig-001-20250104    gcc-14.2.0
riscv                 randconfig-002-20250104    clang-16
riscv                 randconfig-002-20250104    gcc-11
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250104    clang-20
s390                  randconfig-001-20250104    gcc-11
s390                  randconfig-002-20250104    clang-20
s390                  randconfig-002-20250104    gcc-11
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                    randconfig-001-20250104    gcc-11
sh                    randconfig-001-20250104    gcc-14.2.0
sh                    randconfig-002-20250104    gcc-11
sh                    randconfig-002-20250104    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                          sdk7786_defconfig    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-14.2.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                            allyesconfig    gcc-14.2.0
sparc                 randconfig-001-20250104    gcc-11
sparc                 randconfig-001-20250104    gcc-14.2.0
sparc                 randconfig-002-20250104    gcc-11
sparc                 randconfig-002-20250104    gcc-14.2.0
sparc64                          allmodconfig    gcc-14.2.0
sparc64                          allyesconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250104    gcc-11
sparc64               randconfig-001-20250104    gcc-14.2.0
sparc64               randconfig-002-20250104    gcc-11
sparc64               randconfig-002-20250104    gcc-14.2.0
um                               alldefconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250104    gcc-11
um                    randconfig-001-20250104    gcc-12
um                    randconfig-002-20250104    gcc-11
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250104    clang-19
x86_64      buildonly-randconfig-001-20250104    gcc-12
x86_64      buildonly-randconfig-002-20250104    clang-19
x86_64      buildonly-randconfig-003-20250104    clang-19
x86_64      buildonly-randconfig-003-20250104    gcc-12
x86_64      buildonly-randconfig-004-20250104    clang-19
x86_64      buildonly-randconfig-004-20250104    gcc-12
x86_64      buildonly-randconfig-005-20250104    clang-19
x86_64      buildonly-randconfig-006-20250104    clang-19
x86_64      buildonly-randconfig-006-20250104    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250104    clang-19
x86_64                randconfig-002-20250104    clang-19
x86_64                randconfig-003-20250104    clang-19
x86_64                randconfig-004-20250104    clang-19
x86_64                randconfig-005-20250104    clang-19
x86_64                randconfig-006-20250104    clang-19
x86_64                randconfig-007-20250104    clang-19
x86_64                randconfig-008-20250104    clang-19
x86_64                randconfig-071-20250104    gcc-11
x86_64                randconfig-072-20250104    gcc-11
x86_64                randconfig-073-20250104    gcc-11
x86_64                randconfig-074-20250104    gcc-11
x86_64                randconfig-075-20250104    gcc-11
x86_64                randconfig-076-20250104    gcc-11
x86_64                randconfig-077-20250104    gcc-11
x86_64                randconfig-078-20250104    gcc-11
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                           allyesconfig    gcc-14.2.0
xtensa                randconfig-001-20250104    gcc-11
xtensa                randconfig-001-20250104    gcc-14.2.0
xtensa                randconfig-002-20250104    gcc-11
xtensa                randconfig-002-20250104    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

