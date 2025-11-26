Return-Path: <linux-renesas-soc+bounces-25179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BEFC89F4A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 14:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F83C3A8D0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 13:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FAB26F299;
	Wed, 26 Nov 2025 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WU2mWHXf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4E121CC51
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162897; cv=none; b=p+47Lzc8xig2WkOpR0o2RA7SHpbrD0JVwB0pt8whIMQdwd7mjaBetrD32eZHZ6G3RZa9yX90EK7eWe0J/3BHuZaMvSUIQoqfKUV07cV2jP+1f1iN8GxOQJ7il/keTFhtWpnbW/IvK5QfA9IChvD8gxHp/VAPHpo4drKOGl8SCwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162897; c=relaxed/simple;
	bh=fB82xdoKV2jtAJ5doLzOzggmN/LY3EBEmpV3AsjaYjY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GMEXAy4l+f7ahHu0/fpitZIwsuYb7AHo8mo1ZybMGwi0d6vMtsPKO+7Tztd9ShJuBAY+4/IgF6jvYIyxd3gjxQK2p4tdkxpqSOh7yT5mxw3h3Aspe/z/ihm20IZvXhPQ7yup0h8JO3GIdxlIUDc6puNAWvreAU2pRF7Kzn6SmGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WU2mWHXf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764162895; x=1795698895;
  h=date:from:to:cc:subject:message-id;
  bh=fB82xdoKV2jtAJ5doLzOzggmN/LY3EBEmpV3AsjaYjY=;
  b=WU2mWHXf83OjP1T9N6Hkx647cb1KXkVWPrC8Eto+0OVtqAKHRhN0nat6
   XIKzP8+bbgg7N7KkOXpwgCNuFQhkl7L4SxMs3r/vFFTq59j8cubyMpxa4
   n3ZwwbJYpV29ky0vVUIMwFepJE4wt7AWVnhcPZ7sAJ1uo+bTG561zI1sp
   1f+uZkrUDfoTtWcS6OLaZU4P/lIlHJLw+74zCEfs7YEcnKLe59qfQCwD7
   GlZhC4zc1lflAX7cLsQm4Ekr/u0/m5faoVq4GMh6lRn1m0XPyNaaEsehm
   crcm9LYs9gHWTAgwt0V+yTAq1kNKK4zT5E49Ij1t/FRbHWlgK/9U7d7OK
   Q==;
X-CSE-ConnectionGUID: deV91+2YRw+7TALolxm18A==
X-CSE-MsgGUID: 8Y4UUCoiTgSFHtijsUgHPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77564234"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="77564234"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 05:14:55 -0800
X-CSE-ConnectionGUID: DBVE+VrKR126V4zyYArzHw==
X-CSE-MsgGUID: aqXIqJB+QEKx4EeYMN92GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="197260485"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Nov 2025 05:14:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOFMB-000000002tZ-3pS0;
	Wed, 26 Nov 2025 13:14:51 +0000
Date: Wed, 26 Nov 2025 21:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-r9a09g077-dt-binding-defs]
 BUILD SUCCESS 7c0b8360a4e2892bc1748aca77c0825af82f3dcd
Message-ID: <202511262141.A5NJducA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-r9a09g077-dt-binding-defs
branch HEAD: 7c0b8360a4e2892bc1748aca77c0825af82f3dcd  dt-bindings: clock: renesas,r9a09g077/87: Add XSPI0/1 IDs

elapsed time: 1645m

configs tested: 128
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251125    gcc-9.5.0
arc                   randconfig-002-20251125    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                        keystone_defconfig    gcc-15.1.0
arm                   randconfig-001-20251125    clang-22
arm                   randconfig-002-20251125    gcc-10.5.0
arm                   randconfig-003-20251125    gcc-10.5.0
arm                   randconfig-004-20251125    gcc-8.5.0
arm                       spear13xx_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251126    gcc-8.5.0
arm64                 randconfig-002-20251126    clang-19
arm64                 randconfig-003-20251126    clang-22
arm64                 randconfig-004-20251126    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251126    gcc-11.5.0
csky                  randconfig-002-20251126    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251125    clang-19
hexagon               randconfig-002-20251125    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251126    clang-20
i386        buildonly-randconfig-002-20251126    gcc-14
i386        buildonly-randconfig-003-20251126    clang-20
i386        buildonly-randconfig-004-20251126    clang-20
i386        buildonly-randconfig-005-20251126    clang-20
i386        buildonly-randconfig-006-20251126    gcc-14
i386                  randconfig-001-20251126    clang-20
i386                  randconfig-002-20251126    clang-20
i386                  randconfig-003-20251126    gcc-14
i386                  randconfig-004-20251126    clang-20
i386                  randconfig-005-20251126    gcc-14
i386                  randconfig-006-20251126    gcc-14
i386                  randconfig-007-20251126    clang-20
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
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
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
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                     ksi8560_defconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    clang-22
powerpc                  mpc866_ads_defconfig    clang-22
powerpc                      pcm030_defconfig    clang-22
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
sh                        sh7757lcr_defconfig    gcc-15.1.0
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
um                    randconfig-002-20251126    clang-22
um                           x86_64_defconfig    clang-22
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
x86_64                randconfig-071-20251126    clang-20
x86_64                randconfig-072-20251126    gcc-14
x86_64                randconfig-073-20251126    clang-20
x86_64                randconfig-074-20251126    gcc-14
x86_64                randconfig-075-20251126    clang-20
x86_64                randconfig-076-20251126    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251126    gcc-14.3.0
xtensa                randconfig-002-20251126    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

