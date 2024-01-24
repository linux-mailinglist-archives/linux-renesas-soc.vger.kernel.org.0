Return-Path: <linux-renesas-soc+bounces-1797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D82FC83B387
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 22:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 544AC1F24684
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 21:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C813A1350F2;
	Wed, 24 Jan 2024 21:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4tXfSsh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91B71350DD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 21:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706130261; cv=none; b=OKYT5l7QIOzf/Y50g6l/jJ4Avl7jwyfzT8jqGUunmGwHEV9h3fgYZE/PbWBUdXfYGKgi3EV2zK4u6TFK6hIs3Qs9wTZmjKCMsWZKE5ZlUT6k8nybAzs+NDU/PJ2Z5XZmWy3RwytnPUd6cw6z5z0k2j7rPhsUOfTtPkKTzdpJyPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706130261; c=relaxed/simple;
	bh=sGEmu/PdypF3hyjd6y3REYl0KrTZehMxjlqnUu7hhx4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q8CLYYIeOVw7vXv5aD2AIHPRPAA/PdLP9MfX8o4RMld+L1sLfFXGXsf7/t6zdb+K47urjrKL+87L7nEsTxls3oke3olU70p3bvHQlXKGsG9XqhAAIYUquNpdlQf5qocMgF7a0/1b2npNPYfWu9T7RsISQ6z0dTnh48Qd1fMgdN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4tXfSsh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706130259; x=1737666259;
  h=date:from:to:cc:subject:message-id;
  bh=sGEmu/PdypF3hyjd6y3REYl0KrTZehMxjlqnUu7hhx4=;
  b=J4tXfSshmfJiAykL2m2BnyRK53D+EDPQasPwu9M1xcDAuTevigg1Ss9B
   fewXbRKVy3B2BSTNjCu1cBGNytg6QDYHksAPAeZ5czlI9SnV6kBqX5Olt
   dfpfs7HNGpy0wcwajGGbOMkMm2a6NLuFGE5qjoZRTvlAQ/5ay7OxmTymx
   Ycu63UTYg6PpqsMJwiFy3gULrd+O1pUDrfMYwIO/J3BFZf65TA99esJke
   +7mALMKdAwlNVYrwbCHKah+WkiBE9BxeZi8N2OmDQnDBDLhyfBX+dQK4S
   cFzEUhqXNXYvIQXi/3MuFAO/cvMwXplMkCqiHtA3h/1qZ7pDHw+ZfPpFm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15318711"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="15318711"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 13:03:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="28255081"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jan 2024 13:03:17 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSkOw-0008Sb-0h;
	Wed, 24 Jan 2024 21:03:14 +0000
Date: Thu, 25 Jan 2024 05:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.9] BUILD SUCCESS
 4ae2c995c4339959ef04eb9afbbda1966299e5d6
Message-ID: <202401250512.Zm6665RI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.9
branch HEAD: 4ae2c995c4339959ef04eb9afbbda1966299e5d6  clk: renesas: mstp: Remove obsolete clkdev registration

elapsed time: 1460m

configs tested: 167
configs skipped: 4

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
arc                   randconfig-001-20240124   gcc  
arc                   randconfig-002-20240124   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          ixp4xx_defconfig   clang
arm                            mps2_defconfig   gcc  
arm                   randconfig-001-20240124   clang
arm                   randconfig-002-20240124   clang
arm                   randconfig-003-20240124   clang
arm                   randconfig-004-20240124   clang
arm                           sunxi_defconfig   gcc  
arm                        vexpress_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240124   clang
arm64                 randconfig-002-20240124   clang
arm64                 randconfig-003-20240124   clang
arm64                 randconfig-004-20240124   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240124   gcc  
csky                  randconfig-002-20240124   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240124   clang
hexagon               randconfig-002-20240124   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240124   clang
i386         buildonly-randconfig-002-20240124   clang
i386         buildonly-randconfig-003-20240124   clang
i386         buildonly-randconfig-004-20240124   clang
i386         buildonly-randconfig-005-20240124   clang
i386         buildonly-randconfig-006-20240124   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240124   clang
i386                  randconfig-002-20240124   clang
i386                  randconfig-003-20240124   clang
i386                  randconfig-004-20240124   clang
i386                  randconfig-005-20240124   clang
i386                  randconfig-006-20240124   clang
i386                  randconfig-011-20240124   gcc  
i386                  randconfig-012-20240124   gcc  
i386                  randconfig-013-20240124   gcc  
i386                  randconfig-014-20240124   gcc  
i386                  randconfig-015-20240124   gcc  
i386                  randconfig-016-20240124   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240124   gcc  
loongarch             randconfig-002-20240124   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                          rb532_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240124   gcc  
nios2                 randconfig-002-20240124   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240124   gcc  
parisc                randconfig-002-20240124   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240124   clang
powerpc               randconfig-002-20240124   clang
powerpc               randconfig-003-20240124   clang
powerpc64             randconfig-001-20240124   clang
powerpc64             randconfig-002-20240124   clang
powerpc64             randconfig-003-20240124   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240124   clang
riscv                 randconfig-002-20240124   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240124   gcc  
s390                  randconfig-002-20240124   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240124   gcc  
sh                    randconfig-002-20240124   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240124   gcc  
sparc64               randconfig-002-20240124   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240124   clang
um                    randconfig-002-20240124   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240125   gcc  
x86_64       buildonly-randconfig-002-20240125   gcc  
x86_64       buildonly-randconfig-003-20240125   gcc  
x86_64       buildonly-randconfig-004-20240125   gcc  
x86_64       buildonly-randconfig-005-20240125   gcc  
x86_64       buildonly-randconfig-006-20240125   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240125   clang
x86_64                randconfig-002-20240125   clang
x86_64                randconfig-003-20240125   clang
x86_64                randconfig-004-20240125   clang
x86_64                randconfig-005-20240125   clang
x86_64                randconfig-006-20240125   clang
x86_64                randconfig-011-20240125   gcc  
x86_64                randconfig-012-20240125   gcc  
x86_64                randconfig-013-20240125   gcc  
x86_64                randconfig-014-20240125   gcc  
x86_64                randconfig-015-20240125   gcc  
x86_64                randconfig-016-20240125   gcc  
x86_64                randconfig-071-20240125   gcc  
x86_64                randconfig-072-20240125   gcc  
x86_64                randconfig-073-20240125   gcc  
x86_64                randconfig-074-20240125   gcc  
x86_64                randconfig-075-20240125   gcc  
x86_64                randconfig-076-20240125   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240124   gcc  
xtensa                randconfig-002-20240124   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

