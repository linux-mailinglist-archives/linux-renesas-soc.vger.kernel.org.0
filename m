Return-Path: <linux-renesas-soc+bounces-17610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5021FAC6829
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 13:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05F041BC4B68
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 11:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55F12153C6;
	Wed, 28 May 2025 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpfKIU9v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED54718DB03
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430652; cv=none; b=jejxQPSnUS+3h+xZ2CTpb1S10e2J7bfZHmbg6+mNjThAKZ7ze6Nq7yxlRvbPSbXXENppoHCotBxcB/NwwaALWcVvD7JcCI+yoCMkSq8jc0a0366OAc84iiOVStPY6452a9NDMTFfnE9fNSidKoHN5bC7k9c9K41CWvBz4OSUeBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430652; c=relaxed/simple;
	bh=vccef7OLX1wqtveg0W1nHtUBzV8q/FvlF0IyTkk2tVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YQ6ZZPCD1/dz5Vc/RO4jg4cSjennkeDFJs6dxL5WHQbG/UYycZBLDK4M3eLAvS8JfQX2BRDzsclgB+VGJUuOht9KmfnmthxXnSkPX8DhWINaaLAm+Oh4j/BUvhslfhsLihUg0V04CgcVLYj3CJUyCGswTBSDa196JxVpQb2nbKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpfKIU9v; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748430651; x=1779966651;
  h=date:from:to:cc:subject:message-id;
  bh=vccef7OLX1wqtveg0W1nHtUBzV8q/FvlF0IyTkk2tVg=;
  b=fpfKIU9v5HvsS82xo9N3R8VT+dHuGJ8Fja2ijS1kQ8Cg3i0pTB6sFoXG
   rruZ7mD2kmvHzHmGqkop6k1AbTPKnkJS25OF5+3jxHUqrsZcXxut41t0h
   ZOIIFfSRXjdQBVc7CvSOWW+DlEFmx4V1rMOEjp1tBavygQ+lnXzGiZJnG
   l3/5wyfUuNNTP2RajiKcKozb4oFblX1Pl87kIz4obz0iZQjcs+Zo5K+EY
   DAPQa/+zMaUTpGOhDTRt3kDy7V+qENpdKMFNmuHQUk4JenxSjcS9y9PDR
   0QT7EEb9VZOq6foQIi+zH3t0gK6CNHriicAY0Q7Hh2prOJH1widN02QGT
   g==;
X-CSE-ConnectionGUID: PULKNflNTIiEd53WDveuRg==
X-CSE-MsgGUID: sE/xL5zDQUqfyiRUkwE6fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="72982937"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="72982937"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 04:10:50 -0700
X-CSE-ConnectionGUID: 39ercYM3RXWMC22ZCfryXQ==
X-CSE-MsgGUID: PiIm7AmRQ6e9mLBsicZskA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="144186093"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 May 2025 04:10:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKEgI-000Vao-35;
	Wed, 28 May 2025 11:10:46 +0000
Date: Wed, 28 May 2025 19:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 7b17a6c08ed771b4936392c39ba15349f530b5f7
Message-ID: <202505281921.qkfpzxHK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 7b17a6c08ed771b4936392c39ba15349f530b5f7  [LOCAL] riscv: rzfive: defconfig: Update rzfive_defconfig

elapsed time: 1212m

configs tested: 139
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250527    gcc-10.5.0
arc                   randconfig-002-20250527    gcc-10.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-18
arm                                 defconfig    clang-21
arm                   milbeaut_m10v_defconfig    clang-19
arm                   randconfig-001-20250527    clang-21
arm                   randconfig-002-20250527    gcc-7.5.0
arm                   randconfig-003-20250527    clang-19
arm                   randconfig-004-20250527    clang-21
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250527    gcc-8.5.0
arm64                 randconfig-002-20250527    gcc-8.5.0
arm64                 randconfig-003-20250527    clang-16
arm64                 randconfig-004-20250527    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250528    gcc-15.1.0
csky                  randconfig-002-20250528    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250528    clang-21
hexagon               randconfig-002-20250528    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250528    gcc-12
i386        buildonly-randconfig-002-20250528    clang-20
i386        buildonly-randconfig-003-20250528    clang-20
i386        buildonly-randconfig-004-20250528    clang-20
i386        buildonly-randconfig-005-20250528    gcc-12
i386        buildonly-randconfig-006-20250528    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250528    gcc-15.1.0
loongarch             randconfig-002-20250528    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250528    gcc-13.3.0
nios2                 randconfig-002-20250528    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                 simple_smp_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250528    gcc-6.5.0
parisc                randconfig-002-20250528    gcc-14.2.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                       eiger_defconfig    clang-21
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    clang-21
powerpc               randconfig-001-20250528    clang-21
powerpc               randconfig-002-20250528    gcc-7.5.0
powerpc               randconfig-003-20250528    gcc-7.5.0
powerpc64             randconfig-001-20250528    gcc-7.5.0
powerpc64             randconfig-002-20250528    clang-21
powerpc64             randconfig-003-20250528    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250528    gcc-9.3.0
riscv                 randconfig-002-20250528    clang-18
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250528    clang-21
s390                  randconfig-002-20250528    clang-21
s390                       zfcpdump_defconfig    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250528    gcc-9.3.0
sh                    randconfig-002-20250528    gcc-5.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250528    gcc-14.2.0
sparc                 randconfig-002-20250528    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250528    gcc-8.5.0
sparc64               randconfig-002-20250528    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250528    clang-21
um                    randconfig-002-20250528    gcc-11
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250528    clang-20
x86_64      buildonly-randconfig-002-20250528    clang-20
x86_64      buildonly-randconfig-003-20250528    gcc-12
x86_64      buildonly-randconfig-004-20250528    gcc-12
x86_64      buildonly-randconfig-005-20250528    gcc-12
x86_64      buildonly-randconfig-006-20250528    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250528    gcc-14.2.0
xtensa                randconfig-002-20250528    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

