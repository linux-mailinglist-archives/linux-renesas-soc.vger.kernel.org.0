Return-Path: <linux-renesas-soc+bounces-14586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B107A673B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 13:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15AC83B9B05
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 12:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A34B20C02E;
	Tue, 18 Mar 2025 12:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bS6VkIvD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A3C20B819
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 12:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742300353; cv=none; b=tD4B0A0shR4UOqmU9vcEQ1y6q+28OfNPfMMCv/kFL6qWD1sheDZ+LsXXg9FFcBbiWPxmdUDoccebSeOSAtz2H4HlZAbrTqe4o8XwB/zfLScW8gwKxw4Hk74kd7AKXyDKrCh1CIgKm9fMQg9ejqEYRs6fkMKr6z3V0z9wpLsWOsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742300353; c=relaxed/simple;
	bh=nCWtj+zELkSwYPq5KoJOziSq9NlomsclCz5m9Toix/Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N2g5iSY8Z649a1M8mAbaKYXc1sbVHum29GWW/2GQQ3v410UihS8C+21EVelMirVJU5LSOMKWjvchaansuEii0vfJxejzFAvxKZGxo2/455K5wHlt6P1+9/U77gdqBZQPe0qWm8S7j/T2/Dp0NoiYrVvrc8YWLcbiFxHyd9rU6l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bS6VkIvD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742300351; x=1773836351;
  h=date:from:to:cc:subject:message-id;
  bh=nCWtj+zELkSwYPq5KoJOziSq9NlomsclCz5m9Toix/Y=;
  b=bS6VkIvD9EEFbCxRZVvxpSSV9vozmENzj67kwwDZHSJcY76lyL5Iv7cK
   8CXQEIRYvsRyAiGPGaBCLfaxaU6ERlXgoGZzzWloUa0LYEkGEzqZfBDVw
   mY2mrkQNqg7PlQxs/0Q8xlbPlUMThkXia2GeQ1VNzy64MfPA67lmwUQpZ
   I4yh1YgjzaWfkgWgk8GHApkO5y2sqFPrBGYE3IfLtCecynjXefdG8tpZa
   JJV4C7lKOR/HLSfJuXtnv48aiOf3cOhVGFo0WwRQvWNTsOJuKbzeDlJ6j
   Kd2cf7Bm0j+0ke3OyWJArtpfGxCZpqTZmIBdiJYjN4VIDbKJr9FGKnLLD
   g==;
X-CSE-ConnectionGUID: dkz7nzL3TN6CgxgWBJ9QdA==
X-CSE-MsgGUID: sp17cgnhS2OJI3BqGHSFvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43626834"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="43626834"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 05:19:10 -0700
X-CSE-ConnectionGUID: zYTxnyMYTLiP2pB6M+HFbA==
X-CSE-MsgGUID: qZRkK7YvQWySiS3Wc2UDwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="122217927"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Mar 2025 05:19:09 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuVuU-000Djj-2z;
	Tue, 18 Mar 2025 12:19:06 +0000
Date: Tue, 18 Mar 2025 20:18:28 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.16] BUILD SUCCESS
 4c78b0707043146e31671548c813f07ddddd24f7
Message-ID: <202503182012.r9fgUOQl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.16
branch HEAD: 4c78b0707043146e31671548c813f07ddddd24f7  arm64: dts: renesas: Remove undocumented compatible micron,mt25qu512a

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dtb: ufs@e6860000: Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
    arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: mmc@15c00000: compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: mmc@15c10000: compatible: 'oneOf' conditional failed, one must be fixed:
    arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: mmc@15c20000: compatible: 'oneOf' conditional failed, one must be fixed:

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20250318
|   |-- arch-arm64-boot-dts-renesas-r8a779f4-s4sk.dtb:ufs-e6860000:Unevaluated-properties-are-not-allowed-(-nvmem-cell-names-nvmem-cells-were-unexpected)
|   |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:mmc-15c00000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:mmc-15c10000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   `-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:mmc-15c20000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|-- arm64-randconfig-053-20250318
|   |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:mmc-15c00000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:mmc-15c10000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   `-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:mmc-15c20000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|-- arm64-randconfig-054-20250318
|   |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:mmc-15c00000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:mmc-15c10000:compatible:oneOf-conditional-failed-one-must-be-fixed:
|   `-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:mmc-15c20000:compatible:oneOf-conditional-failed-one-must-be-fixed:
`-- arm64-randconfig-055-20250318
    |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:mmc-15c00000:compatible:oneOf-conditional-failed-one-must-be-fixed:
    |-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:mmc-15c10000:compatible:oneOf-conditional-failed-one-must-be-fixed:
    `-- arch-arm64-boot-dts-renesas-r9a09g047e57-smarc.dtb:mmc-15c20000:compatible:oneOf-conditional-failed-one-must-be-fixed:

elapsed time: 1461m

configs tested: 140
configs skipped: 121

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.2.0
alpha                  allyesconfig    clang-19
alpha                     defconfig    gcc-14.2.0
arc                    allmodconfig    clang-19
arc                     allnoconfig    gcc-14.2.0
arc                    allyesconfig    clang-19
arc                       defconfig    gcc-14.2.0
arm                    allmodconfig    clang-19
arm                    allmodconfig    gcc-13.3.0
arm                     allnoconfig    clang-21
arm                     allnoconfig    gcc-14.2.0
arm                    allyesconfig    clang-19
arm                    allyesconfig    gcc-14.2.0
arm                       defconfig    gcc-14.2.0
arm            integrator_defconfig    gcc-14.2.0
arm              mvebu_v7_defconfig    clang-21
arm                pxa3xx_defconfig    gcc-14.2.0
arm         randconfig-001-20250317    gcc-14.2.0
arm         randconfig-002-20250317    gcc-14.2.0
arm         randconfig-003-20250317    gcc-14.2.0
arm         randconfig-004-20250317    clang-21
arm               socfpga_defconfig    gcc-14.2.0
arm               vf610m4_defconfig    gcc-14.2.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-14.2.0
arm64                   allnoconfig    gcc-8.5.0
arm64                     defconfig    gcc-14.2.0
arm64       randconfig-001-20250317    gcc-14.2.0
arm64       randconfig-002-20250317    gcc-14.2.0
arm64       randconfig-003-20250317    gcc-14.2.0
arm64       randconfig-004-20250317    gcc-14.2.0
csky                    allnoconfig    gcc-14.2.0
csky                      defconfig    gcc-14.2.0
csky        randconfig-001-20250318    gcc-8.5.0
csky        randconfig-002-20250318    gcc-8.5.0
hexagon                allmodconfig    clang-19
hexagon                 allnoconfig    gcc-14.2.0
hexagon                allyesconfig    clang-19
hexagon                   defconfig    gcc-14.2.0
hexagon     randconfig-001-20250318    gcc-8.5.0
hexagon     randconfig-002-20250318    gcc-8.5.0
i386                   allmodconfig    clang-20
i386                    allnoconfig    clang-20
i386                   allyesconfig    clang-20
i386                      defconfig    clang-20
i386        randconfig-001-20250318    clang-20
i386        randconfig-002-20250318    clang-20
i386        randconfig-003-20250318    clang-20
i386        randconfig-004-20250318    clang-20
i386        randconfig-005-20250318    clang-20
i386        randconfig-006-20250318    clang-20
i386        randconfig-007-20250318    clang-20
i386        randconfig-011-20250318    clang-20
i386        randconfig-012-20250318    clang-20
i386        randconfig-013-20250318    clang-20
i386        randconfig-014-20250318    clang-20
i386        randconfig-015-20250318    clang-20
i386        randconfig-016-20250318    clang-20
i386        randconfig-017-20250318    clang-20
loongarch              allmodconfig    gcc-14.2.0
loongarch               allnoconfig    gcc-14.2.0
loongarch                 defconfig    gcc-14.2.0
loongarch   randconfig-001-20250318    gcc-8.5.0
loongarch   randconfig-002-20250318    gcc-8.5.0
m68k                   allmodconfig    gcc-14.2.0
m68k                    allnoconfig    gcc-11.5.0
m68k                   allyesconfig    gcc-14.2.0
m68k                      defconfig    gcc-14.2.0
m68k              mvme147_defconfig    gcc-14.2.0
m68k                 virt_defconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze              allnoconfig    gcc-11.5.0
microblaze             allyesconfig    gcc-14.2.0
microblaze                defconfig    gcc-14.2.0
mips                    allnoconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2                     defconfig    gcc-14.2.0
nios2       randconfig-001-20250318    gcc-8.5.0
nios2       randconfig-002-20250318    gcc-8.5.0
openrisc                allnoconfig    clang-15
openrisc               allyesconfig    gcc-5.5.0
openrisc             virt_defconfig    gcc-14.2.0
parisc                 allmodconfig    gcc-5.5.0
parisc                  allnoconfig    clang-15
parisc                 allyesconfig    gcc-5.5.0
parisc      randconfig-001-20250318    gcc-8.5.0
parisc      randconfig-002-20250318    gcc-8.5.0
parisc64                  defconfig    gcc-14.2.0
powerpc                allmodconfig    gcc-5.5.0
powerpc                 allnoconfig    clang-15
powerpc                allyesconfig    gcc-5.5.0
powerpc              cell_defconfig    gcc-14.2.0
powerpc            ppc44x_defconfig    gcc-14.2.0
powerpc     randconfig-001-20250318    gcc-8.5.0
powerpc     randconfig-002-20250318    gcc-8.5.0
powerpc     randconfig-003-20250318    gcc-8.5.0
powerpc64   randconfig-001-20250318    gcc-8.5.0
powerpc64   randconfig-002-20250318    gcc-8.5.0
powerpc64   randconfig-003-20250318    gcc-8.5.0
riscv                  allmodconfig    gcc-5.5.0
riscv                   allnoconfig    clang-15
riscv                  allyesconfig    gcc-5.5.0
s390                   allmodconfig    gcc-14.2.0
s390                    allnoconfig    clang-15
s390                   allyesconfig    gcc-14.2.0
sh                     allmodconfig    gcc-14.2.0
sh                      allnoconfig    gcc-11.5.0
sh                     allyesconfig    gcc-14.2.0
sh               ecovec24_defconfig    gcc-14.2.0
sh                lboxre2_defconfig    gcc-14.2.0
sh            rts7751r2d1_defconfig    gcc-14.2.0
sh              sh7785lcr_defconfig    gcc-14.2.0
sh                    ul2_defconfig    gcc-14.2.0
sparc                  allmodconfig    gcc-14.2.0
sparc                   allnoconfig    gcc-11.5.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-15
um                     allyesconfig    clang-19
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    clang-20
x86_64                        kexec    clang-20
x86_64      randconfig-001-20250318    gcc-12
x86_64      randconfig-002-20250318    gcc-12
x86_64      randconfig-003-20250318    gcc-12
x86_64      randconfig-004-20250318    gcc-12
x86_64      randconfig-005-20250318    gcc-12
x86_64      randconfig-006-20250318    gcc-12
x86_64      randconfig-007-20250318    gcc-12
x86_64      randconfig-008-20250318    gcc-12
x86_64      randconfig-071-20250318    gcc-12
x86_64      randconfig-072-20250318    gcc-12
x86_64      randconfig-073-20250318    gcc-12
x86_64      randconfig-074-20250318    gcc-12
x86_64      randconfig-075-20250318    gcc-12
x86_64      randconfig-076-20250318    gcc-12
x86_64      randconfig-077-20250318    gcc-12
x86_64      randconfig-078-20250318    gcc-12
x86_64                     rhel-9.4    clang-20
xtensa                  allnoconfig    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

