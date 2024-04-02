Return-Path: <linux-renesas-soc+bounces-4234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1A1895FB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Apr 2024 00:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26C2B1F24F09
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 22:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3200249FE;
	Tue,  2 Apr 2024 22:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dk4jfvyB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17A4208B6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Apr 2024 22:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712097814; cv=none; b=s3exeAg0NGz1OO+PWS9oxKnXOncj81VpGiU9UPrmZ47vgJ0GKuo0dQgoLXtEFOn9xZYS00YxajKslOVlnxr1Xjmbal7HkipWMj15nSz3pQToamQ7npx+D58byxpxuJD/0RRmk15DbCO+6Hz3ahQgoirRSDRkF5Qbqrjr77xt78Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712097814; c=relaxed/simple;
	bh=jScydLmshtyK9CSETI5p0GzwK8jGjQUuAMymOh6RmSM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g4IMwvBpuWGnmAHD3P9CKc03I5L5ZDfz0Qn9J9Lz5opDuYBF2GabSWFUpaj72hGquuKa/dKwBmtsw59kz8RsA1hCjanL9rmdUh0eQuBFVNSnLTjpMBECAzN2adylU81dWrFo3lP2cYGtjcR74i5m9yoS8oKFvbUOgYUkeB7ruEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dk4jfvyB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712097813; x=1743633813;
  h=date:from:to:cc:subject:message-id;
  bh=jScydLmshtyK9CSETI5p0GzwK8jGjQUuAMymOh6RmSM=;
  b=dk4jfvyB90nhAoBl2ImoEj+KejfSYb3pRGO8OxPSEOjB8tUvQ6pup/gz
   79COdD7zDGCif0goy1dCz/v77vEhlHSd7dimdNMy9oHGxuNjEFgA+oL9X
   Rxjz9NL6NklacDK78svi9wn4lr0HNq4/qX2nU1ITcPPuz2IOoUcUllMO5
   53bSdpr+IvoO+LyEC2OmSbie5reYV2lLHJUX0inCrBix7slxi0DdRhKpX
   n371WvQBLD4YKaOz79cJS1EnEj7jxuRahJPR/rC5UhVWETCoN2pZNDHHa
   EJEF/q8f6wJzuFAUKJp6Emo8Ap/azsPjuMKVI3hqAWbyAUQX9VedOacRS
   w==;
X-CSE-ConnectionGUID: vgC/AjYFSDuJokACSUQ5uA==
X-CSE-MsgGUID: EcyUQs8DRPyYQjogPbLHTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7158242"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7158242"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 15:43:32 -0700
X-CSE-ConnectionGUID: HLpTTc8DSNOwS+oz5and7Q==
X-CSE-MsgGUID: qutz/OkeTzOAr3flxx8SNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18127672"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Apr 2024 15:43:31 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrmql-0001bl-1Q;
	Tue, 02 Apr 2024 22:43:28 +0000
Date: Wed, 03 Apr 2024 06:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 a31e004a082c9eb21f465a657a1fc56c85e74e6d
Message-ID: <202404030639.mZeyOpVE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: a31e004a082c9eb21f465a657a1fc56c85e74e6d  Merge branch 'renesas-dts-for-v6.10' into renesas-next

elapsed time: 729m

configs tested: 139
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240403   gcc  
arc                   randconfig-002-20240403   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240403   gcc  
arm                   randconfig-002-20240403   gcc  
arm                   randconfig-003-20240403   clang
arm                   randconfig-004-20240403   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240403   clang
arm64                 randconfig-002-20240403   clang
arm64                 randconfig-003-20240403   gcc  
arm64                 randconfig-004-20240403   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240403   gcc  
csky                  randconfig-002-20240403   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240403   clang
hexagon               randconfig-002-20240403   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240403   gcc  
i386         buildonly-randconfig-002-20240403   clang
i386         buildonly-randconfig-003-20240403   clang
i386         buildonly-randconfig-004-20240403   clang
i386         buildonly-randconfig-005-20240403   gcc  
i386         buildonly-randconfig-006-20240403   clang
i386                                defconfig   clang
i386                  randconfig-001-20240403   gcc  
i386                  randconfig-002-20240403   clang
i386                  randconfig-003-20240403   gcc  
i386                  randconfig-004-20240403   gcc  
i386                  randconfig-005-20240403   clang
i386                  randconfig-006-20240403   gcc  
i386                  randconfig-011-20240403   gcc  
i386                  randconfig-012-20240403   clang
i386                  randconfig-013-20240403   gcc  
i386                  randconfig-014-20240403   clang
i386                  randconfig-015-20240403   gcc  
i386                  randconfig-016-20240403   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240403   gcc  
loongarch             randconfig-002-20240403   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240403   gcc  
nios2                 randconfig-002-20240403   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240403   gcc  
parisc                randconfig-002-20240403   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240403   gcc  
powerpc               randconfig-002-20240403   gcc  
powerpc               randconfig-003-20240403   clang
powerpc64             randconfig-001-20240403   gcc  
powerpc64             randconfig-002-20240403   clang
powerpc64             randconfig-003-20240403   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240403   clang
riscv                 randconfig-002-20240403   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240403   clang
s390                  randconfig-002-20240403   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240403   gcc  
sh                    randconfig-002-20240403   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240403   gcc  
sparc64               randconfig-002-20240403   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240403   gcc  
um                    randconfig-002-20240403   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240403   gcc  
xtensa                randconfig-002-20240403   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

