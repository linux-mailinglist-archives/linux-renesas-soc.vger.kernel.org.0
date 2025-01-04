Return-Path: <linux-renesas-soc+bounces-11852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7178A01615
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jan 2025 18:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E39531883A5A
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jan 2025 17:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4311BD9F5;
	Sat,  4 Jan 2025 17:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g4ewvQQp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AAC1DDEA
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jan 2025 17:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736010849; cv=none; b=df3tMZDD0oXY68SrVytowwXaRWlj4Qu0TcJKX4FOSUSajL8TLxzFiRar8FSkDEADlZ1uMmOhGEXQVrxK5g9J88/FM49vZX0BZm9mWRXLCVGE4x9MPqSRFNe+Vo91vNM3+hJgUgmihoWun46+dO1RFYArqsTM1AF/JDlCPF8hqEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736010849; c=relaxed/simple;
	bh=ekB9rnXJ01VDjKjyvoZ41bKNmKqnzyxDqq4Zk0IpjZY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hPjlehf/XgZRdVC0wGdTluV941HuAwGWTzrVJAwJFRvjmX81bBAc5UYnpkqzpiK2sa+WK4/dcajovyKsW6ztHLEYtYibF1747xIAtFuNGzPetnh/rwpiPzWrmHJmfTBQns7Cn9QKLH9/tG3Vtm+XLJ0BJTIYhUeXe+SDiDNeEbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g4ewvQQp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736010847; x=1767546847;
  h=date:from:to:cc:subject:message-id;
  bh=ekB9rnXJ01VDjKjyvoZ41bKNmKqnzyxDqq4Zk0IpjZY=;
  b=g4ewvQQp5VYQJ8OpxMiAmIIAjhnfL8PhSeeZfkUGwuhKz6B1Q7RKYkzF
   ks7ON1M0Ar4VPDODgHO8jtsCuhxbtFMLxYm0UB1g24UlGnbn8Q2Mc8ubn
   dDWbtWuRZbsFKAoSXPha7h06BkZ9iJL8LRVr22yiBkBHLRlSxEkIa4Ky8
   dxOG/LqCkoxnPFkDXZunqXGwzpHuqoYKGwwrPuGTmFwy4wq/GzEzjmguw
   VXasNyxOlM4D4phs6hNV1to0liANRSVI6NwjcfdOF58gc5KSScqhSoZrA
   wXqtfFwxaBEhCGop2NUUonxI+sbCEifppjRgt470+FnzY9q4iAHKIHFYQ
   A==;
X-CSE-ConnectionGUID: qzoiFPjkQ8WGg83gYKLJmA==
X-CSE-MsgGUID: iQ0vj9/EQdys9QBZzeXMHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="61594461"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="61594461"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 09:14:06 -0800
X-CSE-ConnectionGUID: EcUh85p5TuO5ro1uqMn2ug==
X-CSE-MsgGUID: 0RuWS0/9Ru2juFOzRBUHpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="107017525"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jan 2025 09:14:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU7is-000B5h-2T;
	Sat, 04 Jan 2025 17:14:02 +0000
Date: Sun, 05 Jan 2025 01:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.14] BUILD SUCCESS
 43938ef238451458a9dfaf8820f02aac36f59b3c
Message-ID: <202501050100.ACmL8Zcc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.14
branch HEAD: 43938ef238451458a9dfaf8820f02aac36f59b3c  arm64: dts: renesas: r8a779g0: Add VSPX instances

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20250104
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
|   `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|-- arm64-randconfig-052-20250104
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
|   `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|-- arm64-randconfig-053-20250104
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
|   `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
|-- arm64-randconfig-054-20250104
|   |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
|   `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)
`-- arm64-randconfig-055-20250104
    |-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:soc-i2c-clock-generator:failed-to-match-any-schema-with-compatible:renesas-5l35023
    `-- arch-arm64-boot-dts-renesas-r9a08g045s33-smarc.dtb:ssi-100a8c00:Unevaluated-properties-are-not-allowed-(-compatible-was-unexpected)

elapsed time: 1233m

configs tested: 237
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
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
arm                        clps711x_defconfig    clang-19
arm                                 defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-20
arm                   randconfig-001-20250104    clang-20
arm                   randconfig-002-20250104    clang-20
arm                   randconfig-003-20250104    gcc-14.2.0
arm                   randconfig-004-20250104    gcc-14.2.0
arm                           sunxi_defconfig    gcc-13.2.0
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
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250104    clang-20
hexagon               randconfig-002-20250104    clang-20
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
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
m68k                        stmark2_defconfig    gcc-13.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                         db1xxx_defconfig    gcc-13.2.0
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
powerpc                   currituck_defconfig    clang-17
powerpc                          g5_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    clang-18
powerpc                  mpc885_ads_defconfig    gcc-13.2.0
powerpc                      pmac32_defconfig    clang-20
powerpc               randconfig-001-20250104    clang-20
powerpc               randconfig-002-20250104    clang-18
powerpc               randconfig-003-20250104    gcc-14.2.0
powerpc                     tqm8541_defconfig    clang-15
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
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
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
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250104    gcc-11
sh                    randconfig-001-20250104    gcc-14.2.0
sh                    randconfig-002-20250104    gcc-11
sh                    randconfig-002-20250104    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-13.2.0
sh                          sdk7786_defconfig    gcc-13.2.0
sh                           se7343_defconfig    gcc-14.2.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-13.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            alldefconfig    gcc-14.2.0
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
um                               allyesconfig    clang-20
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
x86_64                              defconfig    clang-19
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
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

