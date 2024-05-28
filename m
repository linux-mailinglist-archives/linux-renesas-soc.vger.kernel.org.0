Return-Path: <linux-renesas-soc+bounces-5569-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBBE8D289E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 01:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E65731F27177
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 23:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DEB13E41C;
	Tue, 28 May 2024 23:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFJuqai3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E70B405F8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2024 23:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716938167; cv=none; b=pr0K6SI+1FmcAbiBQKrYHWHxeW+sjneROXjM9T8rzb1V1LucB0/dmu02WVTdnV2DWeTkA/YZB8Yr8Jzy0f9tGLBx0EqhU97wqZpoX5cMKJkf9YmdyeQcY/+H6y9aGPScFvnDbRc6oVurK25sXWeDiWzMIwlqqTIVQBdxMElojyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716938167; c=relaxed/simple;
	bh=e7bWypoiGB9u32hkYmlO+FbCsxUbiz8aMz69lxVhoeA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M6H4hJu4hJ7KzMGuibjcrZctgzvLxF/0oW7znbfgASogM26fQGE/6S5Vyy7g+Njh8s3ZAp59GDkVKR8VkZC4/oNoJei5RdzMWBcTz3Hnc+BV4nYotOYG6BPx4/15TnuVfXkJTlX4ApO0OrbQtRfgEgC5LpOAy903BWW+ArTM5jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFJuqai3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716938162; x=1748474162;
  h=date:from:to:cc:subject:message-id;
  bh=e7bWypoiGB9u32hkYmlO+FbCsxUbiz8aMz69lxVhoeA=;
  b=NFJuqai3N/j5QQ9m3pelo5+BV9/vwSMiSVUQMKwvv+doFuVPJv6tK3wv
   1WxBgQwgmkXhIi4+VNErIkppNlpE4ww1fyUQ24xyURaW/wi7euQCVj1VF
   5buevvEFahZhyGljBJIFKBE+FClZLZPkX8iC3TadwBSisYqA7xU9MI8OX
   uzd8YxbZohOGqt8O1gVUk8VKkUo3V4rRWqJdaemegX4ptclIGqhJLa32t
   0WvsvyktZqIxGUllQf8Cuu6LzCKY2Dv4Dtv/lLdB3Ui9u6gegYB4Sa81V
   3y2sYD66ulE2MJQeMec8AD+pVUKkD8+88p69SH7WWcpUAgFdPMVU6OQOZ
   Q==;
X-CSE-ConnectionGUID: X7j21wPOQHSUH8iDTQ0w9A==
X-CSE-MsgGUID: NpuT88CxQ6SHrzWy3eAWVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30841208"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="30841208"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 16:16:02 -0700
X-CSE-ConnectionGUID: kTS1Lh20QHmN0lB3fab2Wg==
X-CSE-MsgGUID: f7CAqJkTS0WxFzhUF+xJNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="39657158"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 28 May 2024 16:16:00 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC62v-000CrF-15;
	Tue, 28 May 2024 23:15:57 +0000
Date: Wed, 29 May 2024 07:14:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.11] BUILD SUCCESS
 fefa929e898cc472ca2b225552659cabfa90d4e2
Message-ID: <202405290757.uGX61eBP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.11
branch HEAD: fefa929e898cc472ca2b225552659cabfa90d4e2  arm64: dts: renesas: s4sk: Add aliases for I2C buses

elapsed time: 732m

configs tested: 98
configs skipped: 136

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240529   gcc  
arc                   randconfig-002-20240529   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240529   gcc  
arm                   randconfig-002-20240529   gcc  
arm                   randconfig-003-20240529   gcc  
arm                   randconfig-004-20240529   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240529   clang
arm64                 randconfig-002-20240529   clang
arm64                 randconfig-003-20240529   gcc  
arm64                 randconfig-004-20240529   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240529   gcc  
csky                  randconfig-002-20240529   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386         buildonly-randconfig-001-20240528   gcc  
i386         buildonly-randconfig-002-20240529   gcc  
i386         buildonly-randconfig-003-20240529   gcc  
i386         buildonly-randconfig-005-20240529   gcc  
i386                  randconfig-002-20240529   gcc  
i386                  randconfig-003-20240528   gcc  
i386                  randconfig-003-20240529   gcc  
i386                  randconfig-004-20240528   gcc  
i386                  randconfig-004-20240529   gcc  
i386                  randconfig-005-20240528   gcc  
i386                  randconfig-006-20240528   gcc  
i386                  randconfig-012-20240528   gcc  
i386                  randconfig-013-20240528   gcc  
i386                  randconfig-014-20240529   gcc  
i386                  randconfig-015-20240528   gcc  
i386                  randconfig-016-20240528   gcc  
i386                  randconfig-016-20240529   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240529   gcc  
loongarch             randconfig-002-20240529   gcc  
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
nios2                 randconfig-001-20240529   gcc  
nios2                 randconfig-002-20240529   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240529   gcc  
parisc                randconfig-002-20240529   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc64             randconfig-001-20240529   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                 randconfig-001-20240529   gcc  
s390                  randconfig-002-20240529   gcc  
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240529   gcc  
sh                    randconfig-002-20240529   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240529   gcc  
sparc64               randconfig-002-20240529   gcc  
um                               allmodconfig   clang
um                               allyesconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-002-20240529   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240529   gcc  
xtensa                randconfig-002-20240529   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

