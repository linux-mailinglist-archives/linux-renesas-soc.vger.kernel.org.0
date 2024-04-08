Return-Path: <linux-renesas-soc+bounces-4388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 671D489CEA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 00:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 567611C217CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Apr 2024 22:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7377C26ACE;
	Mon,  8 Apr 2024 22:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4psaXjP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE6328389
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Apr 2024 22:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712617031; cv=none; b=UT/fLRXclOiGSLH6p9lInmwDAFsj2aZOPKCYwF3za29tbDGuGttvajrV/A5C0KbRTt6uS3/moUb+l1MlmNJMu0Bu3wIhFT+0/yMotmhc6RtGhe9H+F/ZDj7GOhS849cx7mZWrbXMNKJr24w05xAg4HotuAr7/OHwY28bTr1zWlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712617031; c=relaxed/simple;
	bh=T7Qv2mzokNGvGSCpVhs1SThmlnrPQ/oKcaTwMX5Y35k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y+YAKJ075gQVmQERdLMgI3pfEtk/xUpNPdZpy7hQbg8X6dW7OgF5CE2ieKoPhzW2Qoc1r8ozYZ3uZ61bZDTjF2yJsaGzVUzV0DJFEQ310UPK2+nK4+HaVMHq+R0QpslqjsTk6DGVrRnceb+7P3o+gfM5eHuxHNmgBsLsRy42wRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4psaXjP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712617029; x=1744153029;
  h=date:from:to:cc:subject:message-id;
  bh=T7Qv2mzokNGvGSCpVhs1SThmlnrPQ/oKcaTwMX5Y35k=;
  b=S4psaXjPlJYziSQDDTRQBYRiiNTve3hBZZM+U/BAjB1tsG+980iUKvfz
   OOfiYqQYt+4RbF99slG5uaohlVuXBMXPcUqDpo8dGnfvZhIM+Q54uXnq2
   znstk4Q4QYFHdQWHjy+fu9OGSIub1a45DpdLoNAKHKd0rp1EbBLA1Ui+N
   1aLw1SZoph/msSdTyLjKKo9s6zWituqcdFF4scFlKMzMynkEHTkuXOC/R
   uJ80j8Tdy5Y2aI5vjjeEgCe1ERxtve9ntMam/B8Ne7f4PWOqiHQOAbzwe
   /jtpzeaW9pj5vSZD2G6gr6qk8pDQsT4V3krt3t0TK2g+v/uuUYQm5n5P0
   A==;
X-CSE-ConnectionGUID: 5xfaP7TdTqGFUnmqumFmhQ==
X-CSE-MsgGUID: XTrYtYp+R6CTsrI19hWWlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19348183"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19348183"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 15:57:07 -0700
X-CSE-ConnectionGUID: Ju3eQGbtTsuJK+NP3CmCDw==
X-CSE-MsgGUID: HkSvgqMSQ5KiLNdUgu8Scw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19984669"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Apr 2024 15:57:05 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtxvD-0005XY-1i;
	Mon, 08 Apr 2024 22:57:03 +0000
Date: Tue, 09 Apr 2024 06:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 203a623df035f3be5d039f2d3a83b9bd28855f31
Message-ID: <202404090650.qj8K1dyW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 203a623df035f3be5d039f2d3a83b9bd28855f31  Merge branches 'renesas-arm-defconfig-for-v6.10' and 'renesas-dts-for-v6.10' into renesas-next

elapsed time: 721m

configs tested: 161
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
arc                   randconfig-001-20240409   gcc  
arc                   randconfig-002-20240409   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240409   gcc  
arm                   randconfig-002-20240409   clang
arm                   randconfig-003-20240409   clang
arm                   randconfig-004-20240409   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240409   gcc  
arm64                 randconfig-002-20240409   gcc  
arm64                 randconfig-003-20240409   clang
arm64                 randconfig-004-20240409   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240409   gcc  
csky                  randconfig-002-20240409   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240409   clang
hexagon               randconfig-002-20240409   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240409   clang
i386         buildonly-randconfig-002-20240409   clang
i386         buildonly-randconfig-003-20240409   gcc  
i386         buildonly-randconfig-004-20240409   clang
i386         buildonly-randconfig-005-20240409   gcc  
i386         buildonly-randconfig-006-20240409   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240409   clang
i386                  randconfig-002-20240409   gcc  
i386                  randconfig-003-20240409   clang
i386                  randconfig-004-20240409   gcc  
i386                  randconfig-005-20240409   gcc  
i386                  randconfig-006-20240409   clang
i386                  randconfig-011-20240409   gcc  
i386                  randconfig-012-20240409   clang
i386                  randconfig-013-20240409   clang
i386                  randconfig-014-20240409   clang
i386                  randconfig-015-20240409   gcc  
i386                  randconfig-016-20240409   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240409   gcc  
loongarch             randconfig-002-20240409   gcc  
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
nios2                 randconfig-001-20240409   gcc  
nios2                 randconfig-002-20240409   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240409   gcc  
parisc                randconfig-002-20240409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240409   clang
powerpc               randconfig-002-20240409   gcc  
powerpc               randconfig-003-20240409   clang
powerpc64             randconfig-001-20240409   gcc  
powerpc64             randconfig-002-20240409   clang
powerpc64             randconfig-003-20240409   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240409   clang
riscv                 randconfig-002-20240409   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240409   gcc  
s390                  randconfig-002-20240409   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240409   gcc  
sh                    randconfig-002-20240409   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240409   gcc  
sparc64               randconfig-002-20240409   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240409   clang
um                    randconfig-002-20240409   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240409   clang
x86_64       buildonly-randconfig-002-20240409   clang
x86_64       buildonly-randconfig-003-20240409   gcc  
x86_64       buildonly-randconfig-004-20240409   gcc  
x86_64       buildonly-randconfig-005-20240409   clang
x86_64       buildonly-randconfig-006-20240409   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240409   clang
x86_64                randconfig-002-20240409   clang
x86_64                randconfig-003-20240409   gcc  
x86_64                randconfig-004-20240409   gcc  
x86_64                randconfig-005-20240409   clang
x86_64                randconfig-006-20240409   clang
x86_64                randconfig-011-20240409   gcc  
x86_64                randconfig-012-20240409   clang
x86_64                randconfig-013-20240409   gcc  
x86_64                randconfig-014-20240409   clang
x86_64                randconfig-015-20240409   gcc  
x86_64                randconfig-016-20240409   gcc  
x86_64                randconfig-071-20240409   gcc  
x86_64                randconfig-072-20240409   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240409   gcc  
xtensa                randconfig-002-20240409   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

