Return-Path: <linux-renesas-soc+bounces-10216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7099B6675
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 15:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B35051F210D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 14:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08CF1F5854;
	Wed, 30 Oct 2024 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mU9YzVnC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E241F4FA2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Oct 2024 14:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730299760; cv=none; b=GplgYLn6Z5IB3X3Xby/0kn+3kcYLsmUUu2Vf23QfCT1C979FtI341TyyE7P2EVvthhV6J8s+0p+C3wBLM/YQ9OlWwTaiSRwhsqP8CyGi3VFcm5tVPDLrCI5BViL7pm20sF3BA3UIh3+B0DjsbyZrftNB3u655KyUGGgkLM4uO+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730299760; c=relaxed/simple;
	bh=Na0+HlyGWWTeoBnj0ceBzWNJjqnY1oSPktwZdxusN/o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ccasUu0FtddvFemKLXCXk6gfOHsDkX4A5Ma8nJBnPN9cB8GGxcM4VMy9ZrMBWrxEK4E1USP/xqf8GYlutEdTMpJ2BVSv0EqAa9MvgwWNTp/wOIbHrkh6IRcWo/lKQIhfOWjHKDE3ug+Kx1ejBZroPuLpmYo1Dra2rlDTFH1N1do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mU9YzVnC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730299759; x=1761835759;
  h=date:from:to:cc:subject:message-id;
  bh=Na0+HlyGWWTeoBnj0ceBzWNJjqnY1oSPktwZdxusN/o=;
  b=mU9YzVnC6ZdBQTrf1IVHyVNFqIuZa0AeNhLW/lEtQFFaler5VyfJFyoA
   PfMu2mVa/ykukdUJx/bODTFZ0j5INamZkIBgMTyzvhFaYhL+yjEVEoUXe
   aU/IJi9TjuIVIk3d5u1JZedTtY1xSrfQCO98vYBjz5/4yRQKhntJjWoOq
   layTnqC5hP5C8u99pA9oG0bovY1d6sRU4r602zBi+Vj7ZPvwXCHABOk0p
   w7xc5HuSDmRyBHzc+33FnZJ66GbM2OoIChc9ammeq6lWgVxjx38jqkSDA
   pVUPLTFd2xhNG3aO6Iis4l0nuB55NSWeK7Q9uFpJGiFi8a95Is4/G5Kuw
   w==;
X-CSE-ConnectionGUID: U7fMOCzBTr+hyeM3g05aDQ==
X-CSE-MsgGUID: 9rG4CiDKQq+jlFhrwi0nzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41105974"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41105974"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 07:49:18 -0700
X-CSE-ConnectionGUID: CUIzIFqaS9GVPClLacOz0Q==
X-CSE-MsgGUID: uaDoFj8xTIqusnNm1rA1rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="82267316"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2024 07:49:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6A0X-000exU-0F;
	Wed, 30 Oct 2024 14:49:13 +0000
Date: Wed, 30 Oct 2024 22:48:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 0a37d79ad908e87d5176071762fc7211aceffe5b
Message-ID: <202410302220.Ydsi5ATM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 0a37d79ad908e87d5176071762fc7211aceffe5b  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 1339m

configs tested: 190
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241030    gcc-14.1.0
arc                   randconfig-002-20241030    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                         axm55xx_defconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                         lpc32xx_defconfig    clang-20
arm                   randconfig-001-20241030    gcc-14.1.0
arm                   randconfig-002-20241030    gcc-14.1.0
arm                   randconfig-003-20241030    gcc-14.1.0
arm                   randconfig-004-20241030    gcc-14.1.0
arm                        realview_defconfig    clang-20
arm                       spear13xx_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241030    gcc-14.1.0
arm64                 randconfig-002-20241030    gcc-14.1.0
arm64                 randconfig-003-20241030    gcc-14.1.0
arm64                 randconfig-004-20241030    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241030    gcc-14.1.0
csky                  randconfig-002-20241030    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241030    gcc-14.1.0
hexagon               randconfig-002-20241030    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241030    gcc-12
i386        buildonly-randconfig-002-20241030    gcc-12
i386        buildonly-randconfig-003-20241030    gcc-12
i386        buildonly-randconfig-004-20241030    gcc-12
i386        buildonly-randconfig-005-20241030    gcc-12
i386        buildonly-randconfig-006-20241030    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241030    gcc-12
i386                  randconfig-002-20241030    gcc-12
i386                  randconfig-003-20241030    gcc-12
i386                  randconfig-004-20241030    gcc-12
i386                  randconfig-005-20241030    gcc-12
i386                  randconfig-006-20241030    gcc-12
i386                  randconfig-011-20241030    gcc-12
i386                  randconfig-012-20241030    gcc-12
i386                  randconfig-013-20241030    gcc-12
i386                  randconfig-014-20241030    gcc-12
i386                  randconfig-015-20241030    gcc-12
i386                  randconfig-016-20241030    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241030    gcc-14.1.0
loongarch             randconfig-002-20241030    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ip30_defconfig    clang-20
mips                          rb532_defconfig    clang-20
nios2                         3c120_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241030    gcc-14.1.0
nios2                 randconfig-002-20241030    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241030    gcc-14.1.0
parisc                randconfig-002-20241030    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      arches_defconfig    clang-20
powerpc                   bluestone_defconfig    clang-20
powerpc                 canyonlands_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                     mpc83xx_defconfig    clang-20
powerpc                     rainier_defconfig    clang-20
powerpc               randconfig-001-20241030    gcc-14.1.0
powerpc               randconfig-002-20241030    gcc-14.1.0
powerpc               randconfig-003-20241030    gcc-14.1.0
powerpc64             randconfig-001-20241030    gcc-14.1.0
powerpc64             randconfig-002-20241030    gcc-14.1.0
powerpc64             randconfig-003-20241030    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241030    gcc-14.1.0
riscv                 randconfig-002-20241030    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241030    gcc-14.1.0
s390                  randconfig-002-20241030    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                            migor_defconfig    clang-20
sh                    randconfig-001-20241030    gcc-14.1.0
sh                    randconfig-002-20241030    gcc-14.1.0
sh                           se7343_defconfig    clang-20
sh                           sh2007_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241030    gcc-14.1.0
sparc64               randconfig-002-20241030    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241030    gcc-14.1.0
um                    randconfig-002-20241030    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241030    gcc-12
x86_64      buildonly-randconfig-002-20241030    gcc-12
x86_64      buildonly-randconfig-003-20241030    gcc-12
x86_64      buildonly-randconfig-004-20241030    gcc-12
x86_64      buildonly-randconfig-005-20241030    gcc-12
x86_64      buildonly-randconfig-006-20241030    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241030    gcc-12
x86_64                randconfig-002-20241030    gcc-12
x86_64                randconfig-003-20241030    gcc-12
x86_64                randconfig-004-20241030    gcc-12
x86_64                randconfig-005-20241030    gcc-12
x86_64                randconfig-006-20241030    gcc-12
x86_64                randconfig-011-20241030    gcc-12
x86_64                randconfig-012-20241030    gcc-12
x86_64                randconfig-013-20241030    gcc-12
x86_64                randconfig-014-20241030    gcc-12
x86_64                randconfig-015-20241030    gcc-12
x86_64                randconfig-016-20241030    gcc-12
x86_64                randconfig-071-20241030    gcc-12
x86_64                randconfig-072-20241030    gcc-12
x86_64                randconfig-073-20241030    gcc-12
x86_64                randconfig-074-20241030    gcc-12
x86_64                randconfig-075-20241030    gcc-12
x86_64                randconfig-076-20241030    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241030    gcc-14.1.0
xtensa                randconfig-002-20241030    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

