Return-Path: <linux-renesas-soc+bounces-4630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D41EF8A5F25
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 02:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89B692816B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 00:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C929386;
	Tue, 16 Apr 2024 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZ7gvXY9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBD536E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Apr 2024 00:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713226721; cv=none; b=B5AuIk8dV76uNK9srCpKL0tVGDm7JqGyV+1RQpdaMUJPe7qN8V8hW94LLsymcjv+H4rVClOculfWjC+Xw2NVyfr3UL/Io8DmRpnw/8svMIt5ZXkMvRK0I6g9GUKfkCo2U+kGii1bhqukSOIsmwEeSK9e+uFSlOECUo8ZzWkFws8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713226721; c=relaxed/simple;
	bh=g+Yl3PHHsnf45botrqUGu19HcBGQkqLrKoPofuRvhHk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JHwFOOl5NnQSXwJQZN91ZM5TwNbNEb5L3y1hEYdyiOFJqJgYYVnuLCN9Djp3bO01d5cWKVcDI/F+GuWMrUs3f74zYVj2XEH/c9T49M82xd63McCe+Y4JA2MY3ydV2gTAXZnY/bioce9Vgdp4flhQvGVls5Ayj84U3SFu5wf5E+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZ7gvXY9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713226719; x=1744762719;
  h=date:from:to:cc:subject:message-id;
  bh=g+Yl3PHHsnf45botrqUGu19HcBGQkqLrKoPofuRvhHk=;
  b=KZ7gvXY9I+xmnu5YVg1VGyeqM1gSEAlZNPZdPaYU9Yz48O0DAMRJdLiV
   LTu3PCdZBf14SDnxNX7Y/0JqIGSGRsFEcRmq3+ACpLXBtmHvI9vLqEBtm
   kBPG5k+XyTQYABvIpj4tvtybuaTaqEICq5VasCmcYuseLVMVDtt/NtU5m
   kn1F3doZsg6nqb0xGiymUhoX6tfzoMDCGJvKEkOl9UCTdOhIFw75IFO+f
   A3CEV8i1dmGhYtiGFtPCOFe5RmDlRofu7u6G9re0gpUnxobGhgLz3TZHP
   uV6o2qRxDO3F2r59VjJnVhkC4Q/xIKlOTg3W9CVpEnZEqo4y6TRFGb3jy
   w==;
X-CSE-ConnectionGUID: 5V9d5TdKRx2eprm1jocMGQ==
X-CSE-MsgGUID: puPQvmpsSdmE1IEJXQdXQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8505789"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8505789"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 17:18:38 -0700
X-CSE-ConnectionGUID: UDNOQnpKQJ2yTKBRJTuY9w==
X-CSE-MsgGUID: 21XAD7OFT86ue9PwcPaQ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="22153739"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Apr 2024 17:18:37 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwWWw-0004lA-2M;
	Tue, 16 Apr 2024 00:18:34 +0000
Date: Tue, 16 Apr 2024 08:18:06 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.10] BUILD SUCCESS
 412f2224b3b63f3d553aa82b54f762245acd4398
Message-ID: <202404160803.nAVIj7iU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.10
branch HEAD: 412f2224b3b63f3d553aa82b54f762245acd4398  arm64: dts: renesas: s4sk: Fix ethernet0 alias

elapsed time: 728m

configs tested: 130
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
arc                   randconfig-001-20240416   gcc  
arc                   randconfig-002-20240416   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           imxrt_defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20240416   clang
arm                   randconfig-002-20240416   clang
arm                   randconfig-003-20240416   gcc  
arm                   randconfig-004-20240416   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240416   gcc  
arm64                 randconfig-002-20240416   clang
arm64                 randconfig-003-20240416   gcc  
arm64                 randconfig-004-20240416   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240416   gcc  
csky                  randconfig-002-20240416   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240415   clang
i386         buildonly-randconfig-002-20240415   gcc  
i386         buildonly-randconfig-003-20240415   gcc  
i386         buildonly-randconfig-004-20240415   gcc  
i386         buildonly-randconfig-005-20240415   gcc  
i386         buildonly-randconfig-006-20240415   clang
i386                                defconfig   clang
i386                  randconfig-001-20240415   gcc  
i386                  randconfig-002-20240415   clang
i386                  randconfig-003-20240415   gcc  
i386                  randconfig-004-20240415   gcc  
i386                  randconfig-005-20240415   gcc  
i386                  randconfig-006-20240415   clang
i386                  randconfig-011-20240415   gcc  
i386                  randconfig-012-20240415   clang
i386                  randconfig-013-20240415   gcc  
i386                  randconfig-014-20240415   gcc  
i386                  randconfig-015-20240415   gcc  
i386                  randconfig-016-20240415   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
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
mips                            gpr_defconfig   clang
mips                           jazz_defconfig   clang
mips                         rt305x_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                       maple_defconfig   clang
powerpc                  storcenter_defconfig   gcc  
powerpc                     taishan_defconfig   clang
powerpc                     tqm5200_defconfig   gcc  
powerpc                     tqm8555_defconfig   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                       common_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

