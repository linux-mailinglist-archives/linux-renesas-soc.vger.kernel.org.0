Return-Path: <linux-renesas-soc+bounces-16247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C788A98811
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 13:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EF9A1B64BF9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 11:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52B71E0DE4;
	Wed, 23 Apr 2025 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDZ+i7DP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741FE1CBA02
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Apr 2025 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406201; cv=none; b=Hanxfvv8cJ/YD3tjCClMv8fqjOivUxh9uUoX8VbqB3HXg1S2fw1V8Ub0KQCJa3MFUO6BJcZjbq5PuYz908RPJW+cYbV3iEtMpt75oXSUTm+WCpWkoKchbv5QDa/9Nmt9n1rGuSIDKK+hGi8/ZTkGz4VmLFHmcDrYe2STDhqjmaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406201; c=relaxed/simple;
	bh=bINoK2LI96zsFIKtFNyBGZ4P6V9C2+f5De6fx/FDkX8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oTRDJdzzzJwrIaAik8VRBDcVFhu3fMVtSHvaY1/jD08KNfNTJJwai9rbR9bjWNLewlvsCdniftfMYRfMSZ0y5LApbjwvC5T4l0m3RDUOB/B8+T7EzwN2MKm2TkqUAQoFNoc+wA2FVrvA7+12J4mJetprPfhMuGt6J+nPkko3ujQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDZ+i7DP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745406199; x=1776942199;
  h=date:from:to:cc:subject:message-id;
  bh=bINoK2LI96zsFIKtFNyBGZ4P6V9C2+f5De6fx/FDkX8=;
  b=iDZ+i7DPVxzdxJPwqbqroXmGan0LtCRNKT0Uy+90EQUZnK6khnftxzLi
   ZvhsiIKyTC+q4zd8hul4S+59Un0JySM6fNSGJPcMbHgw1BDr05nJEItxO
   ahNB0bbY2YKsoQleiVcxgwpQrWEHQaKmoLLj25x+bXThrxOSCY6mvssRd
   jBqR3AZqMoe6yTpgPLENNB3/6YAWFkRKPq9QKdLpiLTj0/+0PB3/fWCFT
   SjFGOL2kXCNZ9zEvDRmAMSpwUp/in7dn7MiaQuhAgMYOvOUhxelGNUZvf
   nsSijEoUeAFJJrc2npZX1ANlVddzF1X7X1S+ni3KCaiUfv9VFkaMcaCrr
   Q==;
X-CSE-ConnectionGUID: 62+xcugYQM+TKkXqyK8MhQ==
X-CSE-MsgGUID: 3wigHnouQP6jVEUyTAqHVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="49658516"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="49658516"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 04:03:18 -0700
X-CSE-ConnectionGUID: l7DVgwp8QYybSNZIc939pQ==
X-CSE-MsgGUID: 4TrQqwLFTpeiMYrijwurpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132275194"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Apr 2025 04:03:18 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7Xsp-0001uE-1a;
	Wed, 23 Apr 2025 11:03:15 +0000
Date: Wed, 23 Apr 2025 19:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.16] BUILD SUCCESS
 4c5e0f0c89f0c54610ab6de29b0649f799a66542
Message-ID: <202504231955.kSNttxNi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.16
branch HEAD: 4c5e0f0c89f0c54610ab6de29b0649f799a66542  arm64: dts: renesas: rzg3e-smarc-som: Enable Mali-G52

elapsed time: 1450m

configs tested: 275
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250422    gcc-8.5.0
arc                   randconfig-001-20250423    gcc-14.2.0
arc                   randconfig-002-20250422    gcc-14.2.0
arc                   randconfig-002-20250423    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-21
arm                          pxa3xx_defconfig    clang-21
arm                   randconfig-001-20250422    gcc-8.5.0
arm                   randconfig-001-20250423    gcc-14.2.0
arm                   randconfig-002-20250422    gcc-8.5.0
arm                   randconfig-002-20250423    gcc-14.2.0
arm                   randconfig-003-20250422    gcc-7.5.0
arm                   randconfig-003-20250423    gcc-14.2.0
arm                   randconfig-004-20250422    gcc-7.5.0
arm                   randconfig-004-20250423    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250422    gcc-6.5.0
arm64                 randconfig-001-20250423    gcc-14.2.0
arm64                 randconfig-002-20250422    clang-21
arm64                 randconfig-002-20250423    gcc-14.2.0
arm64                 randconfig-003-20250422    clang-18
arm64                 randconfig-003-20250423    gcc-14.2.0
arm64                 randconfig-004-20250422    gcc-8.5.0
arm64                 randconfig-004-20250423    gcc-14.2.0
csky                             allmodconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                             allyesconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250422    gcc-10.5.0
csky                  randconfig-001-20250423    gcc-7.5.0
csky                  randconfig-002-20250422    gcc-14.2.0
csky                  randconfig-002-20250423    gcc-7.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250422    clang-21
hexagon               randconfig-001-20250423    gcc-7.5.0
hexagon               randconfig-002-20250422    clang-21
hexagon               randconfig-002-20250423    gcc-7.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250422    clang-20
i386        buildonly-randconfig-001-20250423    gcc-12
i386        buildonly-randconfig-002-20250422    clang-20
i386        buildonly-randconfig-002-20250423    gcc-12
i386        buildonly-randconfig-003-20250422    gcc-12
i386        buildonly-randconfig-003-20250423    gcc-12
i386        buildonly-randconfig-004-20250422    gcc-12
i386        buildonly-randconfig-004-20250423    gcc-12
i386        buildonly-randconfig-005-20250422    clang-20
i386        buildonly-randconfig-005-20250423    gcc-12
i386        buildonly-randconfig-006-20250422    clang-20
i386        buildonly-randconfig-006-20250423    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250423    gcc-12
i386                  randconfig-002-20250423    gcc-12
i386                  randconfig-003-20250423    gcc-12
i386                  randconfig-004-20250423    gcc-12
i386                  randconfig-005-20250423    gcc-12
i386                  randconfig-006-20250423    gcc-12
i386                  randconfig-007-20250423    gcc-12
i386                  randconfig-011-20250423    clang-20
i386                  randconfig-012-20250423    clang-20
i386                  randconfig-013-20250423    clang-20
i386                  randconfig-014-20250423    clang-20
i386                  randconfig-015-20250423    clang-20
i386                  randconfig-016-20250423    clang-20
i386                  randconfig-017-20250423    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                        allyesconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250422    gcc-14.2.0
loongarch             randconfig-001-20250423    gcc-7.5.0
loongarch             randconfig-002-20250422    gcc-14.2.0
loongarch             randconfig-002-20250423    gcc-7.5.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    clang-21
m68k                                defconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.1.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                             allmodconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    gcc-14.2.0
nios2                            allmodconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                            allyesconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250422    gcc-10.5.0
nios2                 randconfig-001-20250423    gcc-7.5.0
nios2                 randconfig-002-20250422    gcc-14.2.0
nios2                 randconfig-002-20250423    gcc-7.5.0
openrisc                         alldefconfig    clang-21
openrisc                         allmodconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250422    gcc-7.5.0
parisc                randconfig-001-20250423    gcc-7.5.0
parisc                randconfig-002-20250422    gcc-11.5.0
parisc                randconfig-002-20250423    gcc-7.5.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    clang-21
powerpc                      katmai_defconfig    clang-21
powerpc                   lite5200b_defconfig    clang-21
powerpc               randconfig-001-20250422    clang-21
powerpc               randconfig-001-20250423    gcc-7.5.0
powerpc               randconfig-002-20250422    gcc-6.5.0
powerpc               randconfig-002-20250423    gcc-7.5.0
powerpc               randconfig-003-20250422    clang-16
powerpc               randconfig-003-20250423    gcc-7.5.0
powerpc                     sequoia_defconfig    clang-21
powerpc                     tqm8540_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20250422    clang-21
powerpc64             randconfig-001-20250423    gcc-7.5.0
powerpc64             randconfig-002-20250422    gcc-6.5.0
powerpc64             randconfig-002-20250423    gcc-7.5.0
powerpc64             randconfig-003-20250422    gcc-6.5.0
powerpc64             randconfig-003-20250423    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-21
riscv                 randconfig-001-20250422    clang-21
riscv                 randconfig-001-20250423    gcc-12
riscv                 randconfig-002-20250422    gcc-14.2.0
riscv                 randconfig-002-20250423    gcc-12
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250422    gcc-7.5.0
s390                  randconfig-001-20250423    gcc-12
s390                  randconfig-002-20250422    clang-21
s390                  randconfig-002-20250423    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.1.0
sh                    randconfig-001-20250422    gcc-14.2.0
sh                    randconfig-001-20250423    gcc-12
sh                    randconfig-002-20250422    gcc-6.5.0
sh                    randconfig-002-20250423    gcc-12
sh                          rsk7201_defconfig    gcc-14.1.0
sh                           se7619_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                            allyesconfig    gcc-14.2.0
sparc                 randconfig-001-20250422    gcc-10.3.0
sparc                 randconfig-001-20250423    gcc-12
sparc                 randconfig-002-20250422    gcc-6.5.0
sparc                 randconfig-002-20250423    gcc-12
sparc                       sparc64_defconfig    clang-21
sparc64                          allmodconfig    gcc-14.2.0
sparc64                          allyesconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250422    gcc-7.5.0
sparc64               randconfig-001-20250423    gcc-12
sparc64               randconfig-002-20250422    gcc-13.3.0
sparc64               randconfig-002-20250423    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250422    gcc-12
um                    randconfig-001-20250423    gcc-12
um                    randconfig-002-20250422    gcc-12
um                    randconfig-002-20250423    gcc-12
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250422    gcc-12
x86_64      buildonly-randconfig-001-20250423    gcc-12
x86_64      buildonly-randconfig-002-20250422    clang-20
x86_64      buildonly-randconfig-002-20250423    gcc-12
x86_64      buildonly-randconfig-003-20250422    gcc-12
x86_64      buildonly-randconfig-003-20250423    gcc-12
x86_64      buildonly-randconfig-004-20250422    gcc-12
x86_64      buildonly-randconfig-004-20250423    gcc-12
x86_64      buildonly-randconfig-005-20250422    clang-20
x86_64      buildonly-randconfig-005-20250423    gcc-12
x86_64      buildonly-randconfig-006-20250422    clang-20
x86_64      buildonly-randconfig-006-20250423    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250423    clang-20
x86_64                randconfig-002-20250423    clang-20
x86_64                randconfig-003-20250423    clang-20
x86_64                randconfig-004-20250423    clang-20
x86_64                randconfig-005-20250423    clang-20
x86_64                randconfig-006-20250423    clang-20
x86_64                randconfig-007-20250423    clang-20
x86_64                randconfig-008-20250423    clang-20
x86_64                randconfig-071-20250423    gcc-12
x86_64                randconfig-072-20250423    gcc-12
x86_64                randconfig-073-20250423    gcc-12
x86_64                randconfig-074-20250423    gcc-12
x86_64                randconfig-075-20250423    gcc-12
x86_64                randconfig-076-20250423    gcc-12
x86_64                randconfig-077-20250423    gcc-12
x86_64                randconfig-078-20250423    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                           allyesconfig    gcc-14.2.0
xtensa                randconfig-001-20250422    gcc-14.2.0
xtensa                randconfig-001-20250423    gcc-12
xtensa                randconfig-002-20250422    gcc-9.3.0
xtensa                randconfig-002-20250423    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

