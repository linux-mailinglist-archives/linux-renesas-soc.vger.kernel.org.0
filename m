Return-Path: <linux-renesas-soc+bounces-26708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A21C5D1C554
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 05:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 279393002D14
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 04:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162CC1F4CB3;
	Wed, 14 Jan 2026 04:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SikmE16u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087A718B0F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 04:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768364592; cv=none; b=lkVlP0eO9iILgusLOunoNnJeUeH6B1Bnpm552t2+6aLU2FX/0avyMy3LqMeNVmWud6qk1RS2A3dElFRCdSn0e3qhYCxGOW35gX5pCPSpuBouMLhT1MyCFAsayyc7QnHIVQrFb0yMlNnzU/C06nODvJtt/ybiNlAGljdgtnM/B24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768364592; c=relaxed/simple;
	bh=PWpoUFUU8XMSoCoJIg0PROGeFG7heb+ehL16nn+PxJc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=At8jMd9WAdT6Ler2m0U5GrqbVP7Zzza+qo7D9FDCfU21cPb7tvjzfeIp6cNuPQPphwnAtIqb+29KGANpWhu1hOU+NE0wkXHvaAzXJu61XghF8ymOxtN5nSXjWv+0rt1i78l4+QNpYZn++UBQt6ZHXVevWhrK7Z2P5kY+md4v99o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SikmE16u; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768364590; x=1799900590;
  h=date:from:to:cc:subject:message-id;
  bh=PWpoUFUU8XMSoCoJIg0PROGeFG7heb+ehL16nn+PxJc=;
  b=SikmE16uj/Pkfh22+zENorzRGS0SYxqVlKe7HjGfnqWpTDY9wWx7pJCX
   TuePEAc0ht+Rwljaxo5U/Txg/iLE1frwpfNZGHU1/pGOcbrJ032axnJXu
   EBSz85SxtXpE+2P1z0hyIrXVm2dE+GcMeZFjJrNjxG1X4X3y+zKQU2AHg
   mSdszwoyq0NBl/gICDpXTKjXDE7UY/xvVGdfFrRYf+8d0jXa1tt1Keddm
   cJRFmhcaf3HkPF+rK55py+cGLRQTod6e1bmoHpeBM73baK7/SLvjJCMEn
   6LTQcalEqL+UfHVkQy2rPr5+Y6g8gGKsoyp393iIdZWHXXcXco+SrUWa+
   w==;
X-CSE-ConnectionGUID: sSWQXa85QeKjneNgLWAhcg==
X-CSE-MsgGUID: Ol2fu8gsSI+QDMVQH77unA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80308559"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="80308559"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 20:23:09 -0800
X-CSE-ConnectionGUID: /ilA1sMeS1a1KiW2Uvp7kw==
X-CSE-MsgGUID: foVZ8R9tTuWpCdVW+wNwvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="203708428"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jan 2026 20:23:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfsPR-00000000Flw-2RXh;
	Wed, 14 Jan 2026 04:23:05 +0000
Date: Wed, 14 Jan 2026 12:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 3812f22df315e688c7cde26873b7518ab9e87036
Message-ID: <202601141259.4FQgQY0s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 3812f22df315e688c7cde26873b7518ab9e87036  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

elapsed time: 748m

configs tested: 248
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260114    gcc-10.5.0
arc                   randconfig-001-20260114    gcc-8.5.0
arc                   randconfig-002-20260114    gcc-10.5.0
arc                   randconfig-002-20260114    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                         at91_dt_defconfig    clang-22
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                            dove_defconfig    gcc-15.2.0
arm                         nhk8815_defconfig    clang-22
arm                             pxa_defconfig    gcc-15.2.0
arm                   randconfig-001-20260114    clang-20
arm                   randconfig-001-20260114    gcc-10.5.0
arm                   randconfig-002-20260114    clang-22
arm                   randconfig-002-20260114    gcc-10.5.0
arm                   randconfig-003-20260114    clang-22
arm                   randconfig-003-20260114    gcc-10.5.0
arm                   randconfig-004-20260114    gcc-10.5.0
arm                           stm32_defconfig    clang-22
arm                           sunxi_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260114    clang-22
arm64                 randconfig-002-20260114    clang-22
arm64                 randconfig-003-20260114    clang-22
arm64                 randconfig-003-20260114    gcc-10.5.0
arm64                 randconfig-004-20260114    clang-18
arm64                 randconfig-004-20260114    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260114    clang-22
csky                  randconfig-001-20260114    gcc-15.2.0
csky                  randconfig-002-20260114    clang-22
csky                  randconfig-002-20260114    gcc-10.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260114    clang-22
hexagon               randconfig-002-20260114    clang-22
i386                             alldefconfig    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260114    gcc-14
i386        buildonly-randconfig-002-20260114    clang-20
i386        buildonly-randconfig-002-20260114    gcc-14
i386        buildonly-randconfig-003-20260114    gcc-14
i386        buildonly-randconfig-004-20260114    clang-20
i386        buildonly-randconfig-004-20260114    gcc-14
i386        buildonly-randconfig-005-20260114    gcc-14
i386        buildonly-randconfig-006-20260114    clang-20
i386        buildonly-randconfig-006-20260114    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260114    gcc-14
i386                  randconfig-002-20260114    gcc-14
i386                  randconfig-003-20260114    clang-20
i386                  randconfig-003-20260114    gcc-14
i386                  randconfig-004-20260114    clang-20
i386                  randconfig-004-20260114    gcc-14
i386                  randconfig-005-20260114    gcc-14
i386                  randconfig-006-20260114    gcc-14
i386                  randconfig-007-20260114    clang-20
i386                  randconfig-007-20260114    gcc-14
i386                  randconfig-011-20260114    gcc-13
i386                  randconfig-011-20260114    gcc-14
i386                  randconfig-012-20260114    gcc-14
i386                  randconfig-013-20260114    clang-20
i386                  randconfig-013-20260114    gcc-14
i386                  randconfig-014-20260114    clang-20
i386                  randconfig-014-20260114    gcc-14
i386                  randconfig-015-20260114    clang-20
i386                  randconfig-015-20260114    gcc-14
i386                  randconfig-016-20260114    clang-20
i386                  randconfig-016-20260114    gcc-14
i386                  randconfig-017-20260114    clang-20
i386                  randconfig-017-20260114    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260114    clang-22
loongarch             randconfig-001-20260114    gcc-15.2.0
loongarch             randconfig-002-20260114    clang-18
loongarch             randconfig-002-20260114    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         apollo_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      loongson3_defconfig    gcc-15.2.0
mips                      maltasmvp_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260114    clang-22
nios2                 randconfig-001-20260114    gcc-10.5.0
nios2                 randconfig-002-20260114    clang-22
nios2                 randconfig-002-20260114    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260114    gcc-10.5.0
parisc                randconfig-001-20260114    gcc-14.3.0
parisc                randconfig-002-20260114    gcc-13.4.0
parisc                randconfig-002-20260114    gcc-14.3.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                     ep8248e_defconfig    gcc-15.2.0
powerpc                  mpc866_ads_defconfig    clang-22
powerpc                     powernv_defconfig    clang-22
powerpc               randconfig-001-20260114    gcc-11.5.0
powerpc               randconfig-001-20260114    gcc-14.3.0
powerpc               randconfig-002-20260114    gcc-12.5.0
powerpc               randconfig-002-20260114    gcc-14.3.0
powerpc                    sam440ep_defconfig    clang-22
powerpc64             randconfig-001-20260114    gcc-14.3.0
powerpc64             randconfig-002-20260114    gcc-14.3.0
powerpc64             randconfig-002-20260114    gcc-8.5.0
riscv                            alldefconfig    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv             nommu_k210_sdcard_defconfig    clang-22
riscv                 randconfig-001-20260114    gcc-14.3.0
riscv                 randconfig-001-20260114    gcc-15.2.0
riscv                 randconfig-002-20260114    gcc-15.2.0
riscv                 randconfig-002-20260114    gcc-9.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260114    gcc-15.2.0
s390                  randconfig-002-20260114    gcc-15.2.0
s390                  randconfig-002-20260114    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                             espt_defconfig    gcc-15.2.0
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                          landisk_defconfig    gcc-15.2.0
sh                          lboxre2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260114    gcc-15.2.0
sh                    randconfig-002-20260114    gcc-12.5.0
sh                    randconfig-002-20260114    gcc-15.2.0
sh                          sdk7786_defconfig    gcc-15.2.0
sh                           se7619_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260114    clang-20
sparc                 randconfig-001-20260114    gcc-14.3.0
sparc                 randconfig-002-20260114    clang-20
sparc                 randconfig-002-20260114    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260114    clang-20
sparc64               randconfig-002-20260114    clang-20
sparc64               randconfig-002-20260114    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260114    clang-20
um                    randconfig-001-20260114    gcc-14
um                    randconfig-002-20260114    clang-20
um                    randconfig-002-20260114    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260114    clang-20
x86_64      buildonly-randconfig-002-20260114    clang-20
x86_64      buildonly-randconfig-002-20260114    gcc-14
x86_64      buildonly-randconfig-003-20260114    clang-20
x86_64      buildonly-randconfig-004-20260114    clang-20
x86_64      buildonly-randconfig-004-20260114    gcc-14
x86_64      buildonly-randconfig-005-20260114    clang-20
x86_64      buildonly-randconfig-005-20260114    gcc-12
x86_64      buildonly-randconfig-006-20260114    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260114    gcc-14
x86_64                randconfig-002-20260114    clang-20
x86_64                randconfig-002-20260114    gcc-14
x86_64                randconfig-003-20260114    clang-20
x86_64                randconfig-003-20260114    gcc-14
x86_64                randconfig-004-20260114    gcc-14
x86_64                randconfig-005-20260114    gcc-14
x86_64                randconfig-006-20260114    clang-20
x86_64                randconfig-006-20260114    gcc-14
x86_64                randconfig-011-20260114    gcc-14
x86_64                randconfig-012-20260114    clang-20
x86_64                randconfig-012-20260114    gcc-14
x86_64                randconfig-013-20260114    clang-20
x86_64                randconfig-013-20260114    gcc-14
x86_64                randconfig-014-20260114    gcc-14
x86_64                randconfig-015-20260114    gcc-14
x86_64                randconfig-016-20260114    gcc-14
x86_64                randconfig-071-20260114    clang-20
x86_64                randconfig-072-20260114    clang-20
x86_64                randconfig-073-20260114    clang-20
x86_64                randconfig-074-20260114    clang-20
x86_64                randconfig-075-20260114    clang-20
x86_64                randconfig-076-20260114    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                  audio_kc705_defconfig    clang-22
xtensa                randconfig-001-20260114    clang-20
xtensa                randconfig-001-20260114    gcc-10.5.0
xtensa                randconfig-002-20260114    clang-20
xtensa                randconfig-002-20260114    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

