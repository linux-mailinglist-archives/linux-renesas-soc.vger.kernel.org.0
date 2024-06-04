Return-Path: <linux-renesas-soc+bounces-5814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 818778FAC84
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 09:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3549A281A70
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 07:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D325140E22;
	Tue,  4 Jun 2024 07:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcqiCKfZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A0613FD9B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Jun 2024 07:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487466; cv=none; b=gNIcx1b9KyeUq0begBPCvykZ4j6nWIspXtjzlT6mjwd1/WmG2sLD08WajFqGACdSr/68PTWTYrHHR/+AHM4bFhm+ib45BCxvcG0RpjeSlmdWeYl2DGk3edZYPQ3YuctIeifv5RcPJM4oTEL/cgQZ0M1GiCP2pnE/qv5I1qq9POs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487466; c=relaxed/simple;
	bh=mxmVIwR4icns5+W9Htj55S+Ebev01KehqbBW+6L2iNc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ajfVU6NcpDe2gcwObVvWH2jYpmwTympJvXtjcrRAVBp2gw3BMrK4q4Ze8bN67TccCIWOHGoMFEaHKB1DvlKkEeHcOANnf1cYQuoUkpkrpBNS2FpZCTZL1qeYEjPUBPNFwcIEFE+5ikG7NNnljzD4U5krQ7nPrHvV9edFpu9K69E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcqiCKfZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717487464; x=1749023464;
  h=date:from:to:cc:subject:message-id;
  bh=mxmVIwR4icns5+W9Htj55S+Ebev01KehqbBW+6L2iNc=;
  b=bcqiCKfZy4RLCSabisDuGno5sR9Dxz+QdUpb60UVa6vsUoevT3N5nClw
   3Hdfopt0bajV4+8w/p+zmjTMTrBRpCcBacLTb81yM4NXoL9YArRzh1cFW
   JvKEOqxkNREA0ZoaHOSMO1VYgIRUZD3EIxOTfz/VkuCgLVDK0hBBIlUSt
   p2iemyjS5KEajxLUytHeY5xG3hrWCSJMkNNOMJfGvIHDte+2CBQRJpjIC
   gCdASSBZJsyvZTQNab2yNo3oA4ME7oiN7KdfSAP0RidOkcXwbTm7J0ufG
   rrSYXh0rBh+tV6EutGnjCzFJiO/rFgNDlmKGzhFQ5pZ76z5MVQWjwbVoJ
   Q==;
X-CSE-ConnectionGUID: GIYbNVqySK6bM/PvHVW0kg==
X-CSE-MsgGUID: XNChW96sSC63uk0zfXajEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14202808"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="14202808"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 00:51:04 -0700
X-CSE-ConnectionGUID: ndiTqHHVSfi+S/04ytPHrg==
X-CSE-MsgGUID: Vv50TDFXRgyEDxNs3Vu3CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="42085439"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 04 Jun 2024 00:51:02 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEOwd-000MjM-1o;
	Tue, 04 Jun 2024 07:50:59 +0000
Date: Tue, 04 Jun 2024 15:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 20cdf993456075f40d0b9dc1ed78a669f7635037
Message-ID: <202406041534.10DW5eBT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 20cdf993456075f40d0b9dc1ed78a669f7635037  Merge branch 'topic/renesas-defconfig' into renesas-devel

elapsed time: 1332m

configs tested: 203
configs skipped: 5

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
arc                   randconfig-001-20240603   gcc  
arc                   randconfig-001-20240604   gcc  
arc                   randconfig-002-20240603   gcc  
arc                   randconfig-002-20240604   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240603   gcc  
arm                   randconfig-002-20240603   gcc  
arm                   randconfig-002-20240604   gcc  
arm                   randconfig-003-20240603   gcc  
arm                   randconfig-004-20240603   gcc  
arm                   randconfig-004-20240604   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240603   gcc  
arm64                 randconfig-002-20240603   gcc  
arm64                 randconfig-002-20240604   gcc  
arm64                 randconfig-003-20240604   gcc  
arm64                 randconfig-004-20240603   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240603   gcc  
csky                  randconfig-001-20240604   gcc  
csky                  randconfig-002-20240603   gcc  
csky                  randconfig-002-20240604   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240603   clang
i386         buildonly-randconfig-002-20240603   clang
i386         buildonly-randconfig-002-20240604   clang
i386         buildonly-randconfig-003-20240603   gcc  
i386         buildonly-randconfig-003-20240604   clang
i386         buildonly-randconfig-004-20240603   gcc  
i386         buildonly-randconfig-005-20240603   gcc  
i386         buildonly-randconfig-005-20240604   clang
i386         buildonly-randconfig-006-20240603   clang
i386         buildonly-randconfig-006-20240604   clang
i386                                defconfig   clang
i386                  randconfig-001-20240603   clang
i386                  randconfig-001-20240604   clang
i386                  randconfig-002-20240603   gcc  
i386                  randconfig-002-20240604   clang
i386                  randconfig-003-20240603   gcc  
i386                  randconfig-003-20240604   clang
i386                  randconfig-004-20240603   clang
i386                  randconfig-004-20240604   clang
i386                  randconfig-005-20240603   clang
i386                  randconfig-006-20240603   gcc  
i386                  randconfig-011-20240603   clang
i386                  randconfig-011-20240604   clang
i386                  randconfig-012-20240603   clang
i386                  randconfig-013-20240603   clang
i386                  randconfig-014-20240603   clang
i386                  randconfig-014-20240604   clang
i386                  randconfig-015-20240603   clang
i386                  randconfig-015-20240604   clang
i386                  randconfig-016-20240603   gcc  
i386                  randconfig-016-20240604   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240603   gcc  
loongarch             randconfig-001-20240604   gcc  
loongarch             randconfig-002-20240603   gcc  
loongarch             randconfig-002-20240604   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240603   gcc  
nios2                 randconfig-001-20240604   gcc  
nios2                 randconfig-002-20240603   gcc  
nios2                 randconfig-002-20240604   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240603   gcc  
parisc                randconfig-001-20240604   gcc  
parisc                randconfig-002-20240603   gcc  
parisc                randconfig-002-20240604   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       holly_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc               randconfig-001-20240603   gcc  
powerpc               randconfig-001-20240604   gcc  
powerpc               randconfig-002-20240603   gcc  
powerpc               randconfig-002-20240604   gcc  
powerpc               randconfig-003-20240603   gcc  
powerpc               randconfig-003-20240604   gcc  
powerpc64             randconfig-001-20240603   gcc  
powerpc64             randconfig-001-20240604   gcc  
powerpc64             randconfig-002-20240603   gcc  
powerpc64             randconfig-002-20240604   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240604   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240604   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240603   gcc  
sh                    randconfig-001-20240604   gcc  
sh                    randconfig-002-20240603   gcc  
sh                    randconfig-002-20240604   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240603   gcc  
sparc64               randconfig-001-20240604   gcc  
sparc64               randconfig-002-20240603   gcc  
sparc64               randconfig-002-20240604   gcc  
um                               alldefconfig   clang
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-002-20240603   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240604   clang
x86_64       buildonly-randconfig-002-20240604   clang
x86_64       buildonly-randconfig-003-20240604   gcc  
x86_64       buildonly-randconfig-004-20240604   clang
x86_64       buildonly-randconfig-005-20240604   gcc  
x86_64       buildonly-randconfig-006-20240604   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240604   clang
x86_64                randconfig-002-20240604   gcc  
x86_64                randconfig-003-20240604   gcc  
x86_64                randconfig-004-20240604   gcc  
x86_64                randconfig-005-20240604   gcc  
x86_64                randconfig-006-20240604   gcc  
x86_64                randconfig-011-20240604   clang
x86_64                randconfig-012-20240604   clang
x86_64                randconfig-013-20240604   clang
x86_64                randconfig-014-20240604   clang
x86_64                randconfig-015-20240604   clang
x86_64                randconfig-016-20240604   clang
x86_64                randconfig-071-20240604   clang
x86_64                randconfig-072-20240604   gcc  
x86_64                randconfig-073-20240604   gcc  
x86_64                randconfig-074-20240604   clang
x86_64                randconfig-075-20240604   clang
x86_64                randconfig-076-20240604   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240603   gcc  
xtensa                randconfig-001-20240604   gcc  
xtensa                randconfig-002-20240603   gcc  
xtensa                randconfig-002-20240604   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

