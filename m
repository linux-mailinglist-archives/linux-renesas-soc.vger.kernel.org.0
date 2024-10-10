Return-Path: <linux-renesas-soc+bounces-9641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A969980AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 10:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC2241C27B57
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 08:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7A914386D;
	Thu, 10 Oct 2024 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fj+KdtqI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3321BBBDD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Oct 2024 08:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549182; cv=none; b=r+3ufCSmIDfsdCpwwpTpsmLMYHlFMjpvGmsFg3dTN2ZwzHdjIZ3voDnh4PR64CDX8WEPnroJO9kxZ5sMVVtiq8hMDE7wPD1klIjP6fw9+9gWYJo5KxA/qxGwsPhIymB3EW+oPahhZOJIHCl+fceq6MhtumvlFO/VqpBzvDTv9lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549182; c=relaxed/simple;
	bh=wZg+8nHX2cRqTKfoLsd6cDAnMjfI/o+Y51hJQtivDww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GmBXUOeBWLqlHkgoyrnDuBVsAi+FlqKqOfOtfUIfNgABH4mdHWmbBIxCmj5sOqmIhS429WPTMHeIWwmbIdbgYZZc1sRvnjd9+WG10DL/egraj26TneENRrE7pkEd9UjVPLP7BrW4B5Ag4m5VdwT33v7FC1uDcCeWak1jI11lp+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fj+KdtqI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728549180; x=1760085180;
  h=date:from:to:cc:subject:message-id;
  bh=wZg+8nHX2cRqTKfoLsd6cDAnMjfI/o+Y51hJQtivDww=;
  b=fj+KdtqIn81gQ5nDr/s7uW7Py2QTG6d5HrR9XWw6pRKzs8jol8hDpYdS
   9TRjQioM/XD4FsmkOim98jQzV838mrOw3eLEuT5Wge/sBQnhzJR5cMXa4
   AcAMG0VaO+5QqadlwWy/yHT3515XhPqTKAb9D+ECR6l5POkhd0QmkPdIN
   N7AAomFqxijra+Gh2gh2A7MocOUYC7+IZrxl+pMWJs3UGUnXG2yCUbenw
   uys2eniXjkXXcl7lLExtytb3DNreMJq6Ot+KgymOshcCoZKz31gI5bW/f
   01Ehu7yTXtKztwsyLwa38AYCTU2fo03aKEP5/ulas1O02xGnaAxwZcREm
   A==;
X-CSE-ConnectionGUID: BhrBVVnyT1mLEIELtZDl+w==
X-CSE-MsgGUID: XBDGy5jSS3OrhuUhg2W7Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27703049"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="27703049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 01:33:00 -0700
X-CSE-ConnectionGUID: oh8I6YLaRou8ES9iQ0sD3g==
X-CSE-MsgGUID: fns6YpROR9GEns+uoWceHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76182476"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Oct 2024 01:32:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syobQ-000ATd-27;
	Thu, 10 Oct 2024 08:32:56 +0000
Date: Thu, 10 Oct 2024 16:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.13] BUILD SUCCESS
 34e5d9ff622ea5acf36d66a71cd46a1212b1f5a1
Message-ID: <202410101617.1BDkWiCi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.13
branch HEAD: 34e5d9ff622ea5acf36d66a71cd46a1212b1f5a1  arm64: dts: renesas: r8a779h0: Add OTP_MEM node

elapsed time: 1162m

configs tested: 174
configs skipped: 72

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                          axs101_defconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241010    clang-20
arc                   randconfig-002-20241010    clang-20
arc                           tb10x_defconfig    gcc-14.1.0
arc                        vdk_hs38_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                   randconfig-001-20241010    clang-20
arm                   randconfig-002-20241010    clang-20
arm                   randconfig-003-20241010    clang-20
arm                   randconfig-004-20241010    clang-20
arm                         wpcm450_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241010    clang-20
arm64                 randconfig-002-20241010    clang-20
arm64                 randconfig-003-20241010    clang-20
arm64                 randconfig-004-20241010    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241010    clang-20
csky                  randconfig-002-20241010    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241010    clang-20
hexagon               randconfig-002-20241010    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241010    clang-18
i386        buildonly-randconfig-002-20241010    clang-18
i386        buildonly-randconfig-003-20241010    clang-18
i386        buildonly-randconfig-004-20241010    clang-18
i386        buildonly-randconfig-005-20241010    clang-18
i386        buildonly-randconfig-006-20241010    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241010    clang-18
i386                  randconfig-002-20241010    clang-18
i386                  randconfig-003-20241010    clang-18
i386                  randconfig-004-20241010    clang-18
i386                  randconfig-005-20241010    clang-18
i386                  randconfig-006-20241010    clang-18
i386                  randconfig-011-20241010    clang-18
i386                  randconfig-012-20241010    clang-18
i386                  randconfig-013-20241010    clang-18
i386                  randconfig-014-20241010    clang-18
i386                  randconfig-015-20241010    clang-18
i386                  randconfig-016-20241010    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241010    clang-20
loongarch             randconfig-002-20241010    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ci20_defconfig    gcc-14.1.0
mips                     cu1830-neo_defconfig    gcc-14.1.0
mips                          malta_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241010    clang-20
nios2                 randconfig-002-20241010    clang-20
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241010    clang-20
parisc                randconfig-002-20241010    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                     mpc83xx_defconfig    gcc-14.1.0
powerpc                      ppc6xx_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241010    clang-20
powerpc               randconfig-002-20241010    clang-20
powerpc               randconfig-003-20241010    clang-20
powerpc                     tqm8541_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241010    clang-20
powerpc64             randconfig-002-20241010    clang-20
powerpc64             randconfig-003-20241010    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.1.0
riscv                 randconfig-001-20241010    clang-20
riscv                 randconfig-002-20241010    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241010    clang-20
s390                  randconfig-002-20241010    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.1.0
sh                            hp6xx_defconfig    gcc-14.1.0
sh                    randconfig-001-20241010    clang-20
sh                    randconfig-002-20241010    clang-20
sh                   sh7770_generic_defconfig    gcc-14.1.0
sh                        sh7785lcr_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241010    clang-20
sparc64               randconfig-002-20241010    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241010    clang-20
um                    randconfig-002-20241010    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241010    gcc-12
x86_64      buildonly-randconfig-002-20241010    gcc-12
x86_64      buildonly-randconfig-003-20241010    gcc-12
x86_64      buildonly-randconfig-004-20241010    gcc-12
x86_64      buildonly-randconfig-005-20241010    gcc-12
x86_64      buildonly-randconfig-006-20241010    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241010    gcc-12
x86_64                randconfig-002-20241010    gcc-12
x86_64                randconfig-003-20241010    gcc-12
x86_64                randconfig-004-20241010    gcc-12
x86_64                randconfig-005-20241010    gcc-12
x86_64                randconfig-006-20241010    gcc-12
x86_64                randconfig-011-20241010    gcc-12
x86_64                randconfig-012-20241010    gcc-12
x86_64                randconfig-013-20241010    gcc-12
x86_64                randconfig-014-20241010    gcc-12
x86_64                randconfig-015-20241010    gcc-12
x86_64                randconfig-016-20241010    gcc-12
x86_64                randconfig-071-20241010    gcc-12
x86_64                randconfig-072-20241010    gcc-12
x86_64                randconfig-073-20241010    gcc-12
x86_64                randconfig-074-20241010    gcc-12
x86_64                randconfig-075-20241010    gcc-12
x86_64                randconfig-076-20241010    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241010    clang-20
xtensa                randconfig-002-20241010    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

