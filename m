Return-Path: <linux-renesas-soc+bounces-26094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC804CDBA3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 09:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC77B30069B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 08:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AB829E114;
	Wed, 24 Dec 2025 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihF28+T4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1216D3A8F7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766563682; cv=none; b=IM0W4JwwJz5cMMCq7jsvGxk0naACg78u1z09kgZyVYA2o4O9JrqRikct26W90UoknpXvIe19mEP16n4yfHMJl44QT4EOwnh75wWHP5aH+zxLZdM5kLzdmQ9BW40Y1he1vskIcejZ9OYZjnjMUXVLMeTGHmtwAAA453BWVXv7Eo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766563682; c=relaxed/simple;
	bh=rD7IeHUDMP5CRxvkFpuWnlnCDVxs+aUxzJpCNxKN/1M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FXWDbFW99DoWj0NU0tDalxsT7HE7arn/bLYno90bh6XQW9Vulv96rKT3WT3nb/sVfdD8RkKZdLvZzFoHOyMuUeNrekcL7QPj72qCi+LTztO/FKhDev+nLviafeMDd85OyXPDbScZqvwy+LlvU/ptHLjoUABSy0v0aWQ7MuUyquo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ihF28+T4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766563680; x=1798099680;
  h=date:from:to:cc:subject:message-id;
  bh=rD7IeHUDMP5CRxvkFpuWnlnCDVxs+aUxzJpCNxKN/1M=;
  b=ihF28+T4IYJ3ZPAv5KZNL2A1yifvIV2ubthrTLMFxQ81UYPaC2Ekz3y2
   Rn9PMoiBtMLivwf7NR3ZDlfyfQuNgncrNY0YUGfLBDq52cSxpesFyos8m
   mDk5iKXPSmCGzUJh3NklaIQNw0X5gdh8EhZAH0d+kVxW3bBRjgZRs2Vm/
   OG1m0trUKTfDOtZICKLayEGJ0q42rAc1HHDir4gQjaS4PVPw+dRCPYoEg
   qqF2wAzi7PZ++qrQQsspBLaga5al48iVll7S39Sr8JxLwVrAN5x7OyK6X
   CZvtfn3M+eP5aPm7jBbVHlYhIM8lahW/Rr2vHu8gh+1NwcYD83D9nhRwa
   g==;
X-CSE-ConnectionGUID: zc34w8umTa+RaC7ZaVErJw==
X-CSE-MsgGUID: bx/cctu4Tdi+OmohRZYAzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="85825812"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="85825812"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 00:07:59 -0800
X-CSE-ConnectionGUID: DrMy0JOKQDqithxAiC5jCw==
X-CSE-MsgGUID: HGqTKFyARnSKX22BySsghw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="204474142"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Dec 2025 00:07:58 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYJuV-000000002pr-1JyV;
	Wed, 24 Dec 2025 08:07:55 +0000
Date: Wed, 24 Dec 2025 16:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 7ed898ff0dea7a1a95943730ac636cb59c3aed41
Message-ID: <202512241643.fOxLwTb2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 7ed898ff0dea7a1a95943730ac636cb59c3aed41  Merge branches 'renesas-drivers-for-v6.20' and 'renesas-dts-for-v6.20' into renesas-next

elapsed time: 1320m

configs tested: 150
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251224    gcc-12.5.0
arc                   randconfig-002-20251224    gcc-10.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    clang-22
arm                                 defconfig    clang-22
arm                       imx_v4_v5_defconfig    clang-22
arm                      jornada720_defconfig    clang-22
arm                          moxart_defconfig    gcc-15.1.0
arm                   randconfig-001-20251224    gcc-8.5.0
arm                   randconfig-002-20251224    gcc-8.5.0
arm                   randconfig-003-20251224    gcc-12.5.0
arm                   randconfig-004-20251224    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251224    gcc-8.5.0
arm64                 randconfig-002-20251224    gcc-14.3.0
arm64                 randconfig-003-20251224    clang-17
arm64                 randconfig-004-20251224    gcc-10.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251224    gcc-15.1.0
csky                  randconfig-002-20251224    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251224    clang-22
hexagon               randconfig-002-20251224    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251224    clang-20
i386        buildonly-randconfig-002-20251224    gcc-14
i386        buildonly-randconfig-003-20251224    clang-20
i386        buildonly-randconfig-004-20251224    gcc-12
i386        buildonly-randconfig-005-20251224    gcc-14
i386        buildonly-randconfig-006-20251224    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251224    gcc-14
i386                  randconfig-002-20251224    gcc-14
i386                  randconfig-003-20251224    gcc-14
i386                  randconfig-004-20251224    gcc-12
i386                  randconfig-005-20251224    clang-20
i386                  randconfig-006-20251224    clang-20
i386                  randconfig-007-20251224    gcc-14
i386                  randconfig-011-20251224    clang-20
i386                  randconfig-012-20251224    clang-20
i386                  randconfig-013-20251224    clang-20
i386                  randconfig-014-20251224    clang-20
i386                  randconfig-015-20251224    clang-20
i386                  randconfig-016-20251224    clang-20
i386                  randconfig-017-20251224    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251224    gcc-15.1.0
loongarch             randconfig-002-20251224    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5475evb_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251224    gcc-11.5.0
nios2                 randconfig-002-20251224    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20251224    gcc-8.5.0
parisc                randconfig-002-20251224    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251224    clang-22
powerpc               randconfig-002-20251224    clang-22
powerpc                 xes_mpc85xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251224    gcc-8.5.0
powerpc64             randconfig-002-20251224    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20251224    gcc-8.5.0
riscv                 randconfig-002-20251224    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251224    gcc-10.5.0
s390                  randconfig-002-20251224    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251224    gcc-14.3.0
sh                    randconfig-002-20251224    gcc-10.5.0
sh                           se7721_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251224    gcc-8.5.0
sparc                 randconfig-002-20251224    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251224    gcc-8.5.0
sparc64               randconfig-002-20251224    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251224    gcc-14
um                    randconfig-002-20251224    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251224    clang-20
x86_64      buildonly-randconfig-002-20251224    gcc-14
x86_64      buildonly-randconfig-003-20251224    gcc-14
x86_64      buildonly-randconfig-004-20251224    clang-20
x86_64      buildonly-randconfig-005-20251224    gcc-14
x86_64      buildonly-randconfig-006-20251224    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251224    clang-20
x86_64                randconfig-002-20251224    gcc-14
x86_64                randconfig-003-20251224    clang-20
x86_64                randconfig-004-20251224    gcc-14
x86_64                randconfig-005-20251224    gcc-14
x86_64                randconfig-006-20251224    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251224    gcc-15.1.0
xtensa                randconfig-002-20251224    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

