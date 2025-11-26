Return-Path: <linux-renesas-soc+bounces-25164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 031B2C89920
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 12:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 91A444E986A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 11:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D90322C88;
	Wed, 26 Nov 2025 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMlLVieF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279AC2DC79B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764157190; cv=none; b=AiJ6kJlCjEUNJTptOpREtpEYOYBzgnbymhctJV810y5ve+e0jcxOUjYnIe6HRvyttFXBunHrC6iM4tBakR1c8xLZ8HRGiLqcND0Dta2ucCDYK06o2dLQ/H9o7gtZ6vOBNBDKO0Lfyl2xArFDUiK/yS6xXgoUnjNZieA7N7/i8ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764157190; c=relaxed/simple;
	bh=WtQvn11CCsx2VD12S4OHw0WAO/JtMkdDt1z89GoRj6w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tNaN/QXG2nJHDHbsAs/DeXP3/QCATPvpZpb01dhMf2b4+HbNJNGqw6d/+n23ClHHKMyTPRyninP5YpWZwFPeAFl/JzxXPU76vDztzRd8MZ9/1LREQP8qusuZX5PBSkWC9F3IeL26gXTRD/4kPny0/SKJS9zaXeQAlhatZpGdPzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMlLVieF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764157189; x=1795693189;
  h=date:from:to:cc:subject:message-id;
  bh=WtQvn11CCsx2VD12S4OHw0WAO/JtMkdDt1z89GoRj6w=;
  b=ZMlLVieF1l2Vdua6v+OwnJMqDnRqvqGiLQ3zwiqf5wpJv+d4QBtYPGAN
   fk4ktA70TPq2kdbSTxtTOs/+p7XswRhwW3E2WapYoV0QQzdA1rRzmDy7S
   GlRPiFI3i8KEav6Tlzsv2uAV2jBlca92k9GA3+FSuVZooqNT1ec44xyV8
   lRAZ2S7rnUXn1UXGryRakI5jzu/STw1/Az0yFdmG7x/6dkfI/LEWhOtY7
   d6L9cjrnPvh1bhKde3XAMCg7FTmlEldPDes4/km8+42AL6do7zfpy+THZ
   PuHfgGMgDVQzV6MI5b4Pt636kNzoZWOx35jzEjl1vAw260jVREyZn0nDu
   g==;
X-CSE-ConnectionGUID: ylREJxQzTHOKH+lZhP9a5g==
X-CSE-MsgGUID: a6/XRYtuRGmM/9o+0gNQNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="68780143"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="68780143"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 03:39:48 -0800
X-CSE-ConnectionGUID: GExHUdylQtuOII3StYbS+w==
X-CSE-MsgGUID: BH4jmU2jThinzoUo/TjM2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="193155641"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Nov 2025 03:39:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vODs9-000000002mP-276D;
	Wed, 26 Nov 2025 11:39:45 +0000
Date: Wed, 26 Nov 2025 19:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.20] BUILD SUCCESS
 1b02c3e14757bc803c9251e630f7839dcd3836dc
Message-ID: <202511261915.GxiGa1Ia-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.20
branch HEAD: 1b02c3e14757bc803c9251e630f7839dcd3836dc  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB3.0 PHY and xHCI controller

elapsed time: 1548m

configs tested: 111
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20251125    gcc-9.5.0
arc                   randconfig-002-20251125    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                         mv78xx0_defconfig    clang-19
arm                   randconfig-001-20251125    clang-22
arm                   randconfig-002-20251125    gcc-10.5.0
arm                   randconfig-003-20251125    gcc-10.5.0
arm                   randconfig-004-20251125    gcc-8.5.0
arm                        shmobile_defconfig    gcc-15.1.0
arm                         wpcm450_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251126    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251125    clang-19
hexagon               randconfig-002-20251125    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251126    clang-20
i386        buildonly-randconfig-002-20251126    gcc-14
i386        buildonly-randconfig-003-20251126    clang-20
i386        buildonly-randconfig-006-20251126    gcc-14
i386                  randconfig-001-20251126    clang-20
i386                  randconfig-002-20251126    clang-20
i386                  randconfig-003-20251126    gcc-14
i386                  randconfig-011-20251126    gcc-14
i386                  randconfig-012-20251126    gcc-14
i386                  randconfig-013-20251126    clang-20
i386                  randconfig-014-20251126    gcc-14
i386                  randconfig-015-20251126    clang-20
i386                  randconfig-016-20251126    gcc-14
i386                  randconfig-017-20251126    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251125    gcc-15.1.0
loongarch             randconfig-002-20251125    gcc-12.5.0
m68k                             alldefconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                      maltaaprp_defconfig    clang-22
mips                        vocore2_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251125    gcc-8.5.0
nios2                 randconfig-002-20251125    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251125    gcc-13.4.0
parisc                randconfig-002-20251125    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251125    clang-19
powerpc               randconfig-002-20251125    gcc-8.5.0
powerpc64             randconfig-001-20251125    clang-16
powerpc64             randconfig-002-20251125    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251125    gcc-8.5.0
riscv                 randconfig-002-20251125    gcc-13.4.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251125    gcc-8.5.0
s390                  randconfig-002-20251125    gcc-14.3.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251125    gcc-15.1.0
sh                    randconfig-002-20251125    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251126    gcc-8.5.0
sparc                 randconfig-002-20251126    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251126    gcc-8.5.0
sparc64               randconfig-002-20251126    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251126    clang-19
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251126    clang-20
x86_64      buildonly-randconfig-002-20251126    gcc-14
x86_64      buildonly-randconfig-003-20251126    clang-20
x86_64      buildonly-randconfig-004-20251126    clang-20
x86_64      buildonly-randconfig-005-20251126    gcc-14
x86_64      buildonly-randconfig-006-20251126    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251126    clang-20
x86_64                randconfig-002-20251126    gcc-14
x86_64                randconfig-003-20251126    clang-20
x86_64                randconfig-004-20251126    gcc-14
x86_64                randconfig-005-20251126    gcc-12
x86_64                randconfig-006-20251126    clang-20
x86_64                randconfig-011-20251126    clang-20
x86_64                randconfig-012-20251126    clang-20
x86_64                randconfig-013-20251126    gcc-14
x86_64                randconfig-014-20251126    clang-20
x86_64                randconfig-015-20251126    clang-20
x86_64                randconfig-016-20251126    clang-20
x86_64                randconfig-072-20251126    gcc-14
x86_64                randconfig-074-20251126    gcc-14
x86_64                randconfig-075-20251126    clang-20
x86_64                randconfig-076-20251126    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

