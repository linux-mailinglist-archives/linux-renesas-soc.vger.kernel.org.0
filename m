Return-Path: <linux-renesas-soc+bounces-3398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 474FA86EE93
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 05:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1185B22889
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 04:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7552DBA45;
	Sat,  2 Mar 2024 04:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXmIN2KW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EA828F0
	for <linux-renesas-soc@vger.kernel.org>; Sat,  2 Mar 2024 04:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709353762; cv=none; b=jTWxo4VQTbqhapxrS7T1qiHIWWVEveeNfaNuPwkAlqLwElLNCtnEHzvUzvV0CjSRXuzzReVrD+o2Qyr/4wh+IfxOsDzYZPLpnIqWa8hVhplB4ayYMLElMDBJxJa+hGANEUypyHUD/KZC73dyTz/KF99+vbWxi5tupse+m8Pokkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709353762; c=relaxed/simple;
	bh=wtC2IhMvBwbGiAvkJBSBUWyNPRJsHDR6sghc8ducN30=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tned758RZ+71GHWz5hHkgohLeVbZAthD7V1jvjDcFC8T9ODu1vRbaJ0ZY7DL4N2L6aRXzq7a9AQ7Z19Hp0QbvCMeSDPedz9tIpZPZb2lWCihoEdEFnsKsZEiZY4fVH/02YMrs8GVyLmDWLn9lpvOuu3alUokfC88x3Ssl+8YC38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXmIN2KW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709353761; x=1740889761;
  h=date:from:to:cc:subject:message-id;
  bh=wtC2IhMvBwbGiAvkJBSBUWyNPRJsHDR6sghc8ducN30=;
  b=PXmIN2KWuBLOT+HjqqNkRvl0Pss61p2vb4qHyIjzkPIzXKbSFlu1kfnh
   +BJ+LkkN5jmcuhT/Yb6xB+/2uga+WxVRseRLQXr5Vp98hR2UguKx3/oRv
   gLCpRD9Zapuh9lc0gmIZFEjnKkmHkywiqye4OrfVujmuInhOCPdKwomzL
   qIlygr0Ekos16TzZdMdEGVp+sI67Eq8J2qBNgktFozoV7oFFFOuIzQVHw
   BswbpnUA03Dz/61DhaU1Rcqo1IanMH+ZQRcQ87cD+yXaRFn49HkAbMVrr
   iZxSpklsfxbBoKZpn+cEYlvQyOa0s8WvZI5bXlAxNrU+Yo9qLyYazmq8O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4034135"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="4034135"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 20:29:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="31576881"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2024 20:29:18 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgGzs-000EJO-0x;
	Sat, 02 Mar 2024 04:29:16 +0000
Date: Sat, 02 Mar 2024 12:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 01fdf7d6f1504ba6a93e7d8eacb27d45dc995325
Message-ID: <202403021259.9kJolkRC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 01fdf7d6f1504ba6a93e7d8eacb27d45dc995325  Merge branch 'renesas-dt-bindings-for-v6.9' into renesas-next

elapsed time: 729m

configs tested: 153
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
arc                   randconfig-001-20240302   gcc  
arc                   randconfig-002-20240302   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240302   gcc  
arm                   randconfig-002-20240302   gcc  
arm                   randconfig-003-20240302   gcc  
arm                   randconfig-004-20240302   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240302   gcc  
arm64                 randconfig-002-20240302   gcc  
arm64                 randconfig-003-20240302   clang
arm64                 randconfig-004-20240302   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240302   gcc  
csky                  randconfig-002-20240302   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240302   clang
hexagon               randconfig-002-20240302   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240302   clang
i386         buildonly-randconfig-002-20240302   gcc  
i386         buildonly-randconfig-003-20240302   gcc  
i386         buildonly-randconfig-004-20240302   clang
i386         buildonly-randconfig-005-20240302   gcc  
i386         buildonly-randconfig-006-20240302   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240302   clang
i386                  randconfig-002-20240302   gcc  
i386                  randconfig-003-20240302   clang
i386                  randconfig-004-20240302   gcc  
i386                  randconfig-005-20240302   gcc  
i386                  randconfig-006-20240302   clang
i386                  randconfig-011-20240302   gcc  
i386                  randconfig-012-20240302   gcc  
i386                  randconfig-013-20240302   gcc  
i386                  randconfig-014-20240302   gcc  
i386                  randconfig-015-20240302   clang
i386                  randconfig-016-20240302   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240302   gcc  
loongarch             randconfig-002-20240302   gcc  
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
nios2                 randconfig-001-20240302   gcc  
nios2                 randconfig-002-20240302   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240302   gcc  
parisc                randconfig-002-20240302   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240302   clang
powerpc               randconfig-002-20240302   clang
powerpc               randconfig-003-20240302   gcc  
powerpc64             randconfig-001-20240302   clang
powerpc64             randconfig-002-20240302   gcc  
powerpc64             randconfig-003-20240302   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240302   gcc  
riscv                 randconfig-002-20240302   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240302   gcc  
s390                  randconfig-002-20240302   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240302   gcc  
sh                    randconfig-002-20240302   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240302   gcc  
sparc64               randconfig-002-20240302   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240302   gcc  
um                    randconfig-002-20240302   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240302   clang
x86_64       buildonly-randconfig-002-20240302   clang
x86_64       buildonly-randconfig-003-20240302   gcc  
x86_64       buildonly-randconfig-004-20240302   gcc  
x86_64       buildonly-randconfig-005-20240302   gcc  
x86_64       buildonly-randconfig-006-20240302   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240302   clang
x86_64                randconfig-002-20240302   gcc  
x86_64                randconfig-003-20240302   gcc  
x86_64                randconfig-004-20240302   clang
x86_64                randconfig-005-20240302   gcc  
x86_64                randconfig-006-20240302   clang
x86_64                randconfig-011-20240302   clang
x86_64                randconfig-012-20240302   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240302   gcc  
xtensa                randconfig-002-20240302   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

