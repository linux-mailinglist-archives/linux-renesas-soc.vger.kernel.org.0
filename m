Return-Path: <linux-renesas-soc+bounces-6154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AC290720A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 14:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBC2E1F24C03
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 12:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC8920ED;
	Thu, 13 Jun 2024 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhNbKEx4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212A713A406
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2024 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718282582; cv=none; b=HLKgaUTjKNpx05gM/skjU6CdSm+Zn4f5ag2ptOSr09ubMONuoINJ6+01+GpIKAMYEfxbIX4Cph0CPRWKDmPUpTRA9vOEf6P9Ik24CFaR5uYGXScKzZhT0B/oALgefF+fDn5GRVCURMeZObZk7e00kCLvI6dN4ucm5HhYU+KRfKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718282582; c=relaxed/simple;
	bh=rDPpfZTnck42Eo+i1tqH/42qC4HYO1RwmrTttQlAe7A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AOLUyYOvvHwzJzwbLcCEm7OzzJUGPBoVpvRG8dFb13p1+oNuazrx9s/8f5Vof8AZYWjO+4o2zuktSrsfEERyBa/KLBYMJvr6wy66b1EpU3yx/nEXkprbvppETv0YJEAZxGy0atYDOni0IviBoavBhEXkqHjML+yNtqD+qBKtHSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZhNbKEx4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718282581; x=1749818581;
  h=date:from:to:cc:subject:message-id;
  bh=rDPpfZTnck42Eo+i1tqH/42qC4HYO1RwmrTttQlAe7A=;
  b=ZhNbKEx43Y4xn27hrBWDyN7/AkKzOPjbrqU2u00j0HZTvRmxtr8auRP7
   qK59F3JLwRcqglim6/tBunL4YlTI1dvnElmU/6oqH2et8C/eOlOEu+ScV
   q+GvLW/m52YOJrdaKh0dRvUyWaSLuY5+NFRI9+JLQoTE4RuGDAyN4R/8W
   47pkuRCrii9jjZlwZ/HfyXc4OKZg9is925vzmpr7s4rqj/tikXVREEuMF
   m1ODT9HljKlThn5xPd5zhUkdXy8MIYk818fTG5XBEruovLnBWAbw4HT9O
   f7XinjoEWV98j9RpUdQNlpPsVgiZ3gtpGeTzoGSBN0WSIdvvnvCnvAvnd
   A==;
X-CSE-ConnectionGUID: vWS+ks0ZSbSFkBwxCaRoVg==
X-CSE-MsgGUID: gZqK6EYiTnSPYcor44l2JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14935098"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="14935098"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 05:42:59 -0700
X-CSE-ConnectionGUID: FRxV/KMAQNO5XSkd518g/A==
X-CSE-MsgGUID: PX0Dd6sVTJS+qgCu8oUmRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="70920898"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jun 2024 05:42:58 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHjn5-000022-1z;
	Thu, 13 Jun 2024 12:42:55 +0000
Date: Thu, 13 Jun 2024 20:42:55 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/rcar-fuse-v2] BUILD SUCCESS
 e2e0212b8a466372457f1db80e0200b1156c8527
Message-ID: <202406132053.96rpcxI5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-fuse-v2
branch HEAD: e2e0212b8a466372457f1db80e0200b1156c8527  arm64: dts: renesas: r8a779h0: Add OTP_MEM node

elapsed time: 2762m

configs tested: 83
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   clang-14
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                             allmodconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                             allyesconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386                                defconfig   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                             allyesconfig   gcc-13.2.0
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang-19
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

