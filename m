Return-Path: <linux-renesas-soc+bounces-353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD727FBE5E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 16:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 053E82829B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 15:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E981E49B;
	Tue, 28 Nov 2023 15:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdWLYIZP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFF9131
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 07:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701186210; x=1732722210;
  h=date:from:to:cc:subject:message-id;
  bh=YxtBvsnhSlf7ON90mmeJMaHH/JkmV7ITZcnzHnMeN6E=;
  b=jdWLYIZP1zJcR8lEixrRL2L/xgtCVFd9fefUCuPYLhAlIWMKIkCz/NP0
   9Z9yqjGC6xZynnBu+Sf41MjhJxXC5qdL7EtKAxREOVL7UcGX5/o9aVoQH
   U+6UNWm2w0LHDQ6ts/dch/zQkCAUx3EzA9GqxnXew4dpEQhYKY9OI+qsC
   iqtHNIoPhHLz+f3nUZsLb0d2sEBThxWBlhq9V39GL9/TL8axZI/PmocBK
   uERSIwSdhWm3CmAVcIRw2o/VQrZJQyp9SROaChq3FrjJTWgot2Q0XSUbl
   FJWfwLMEuyjzlrIJuc8YadWlTK1bu4OPpbXL/8LYyw5ykVmYjTqEibd1K
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="479143172"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="479143172"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 07:43:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834679748"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="834679748"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Nov 2023 07:43:28 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r80FC-0007gk-0m;
	Tue, 28 Nov 2023 15:43:26 +0000
Date: Tue, 28 Nov 2023 23:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 5f9e29b9159a41fcf6733c3b59fa46a90ce3ae20
Message-ID: <202311282316.BtyPVqrs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 5f9e29b9159a41fcf6733c3b59fa46a90ce3ae20  clk: renesas: rzg2l-cpg: Reuse code in rzg2l_cpg_reset()

elapsed time: 1468m

configs tested: 100
configs skipped: 2

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
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231128   clang
i386         buildonly-randconfig-002-20231128   clang
i386         buildonly-randconfig-003-20231128   clang
i386         buildonly-randconfig-004-20231128   clang
i386         buildonly-randconfig-005-20231128   clang
i386         buildonly-randconfig-006-20231128   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231128   clang
i386                  randconfig-002-20231128   clang
i386                  randconfig-003-20231128   clang
i386                  randconfig-004-20231128   clang
i386                  randconfig-005-20231128   clang
i386                  randconfig-006-20231128   clang
i386                  randconfig-011-20231128   gcc  
i386                  randconfig-012-20231128   gcc  
i386                  randconfig-013-20231128   gcc  
i386                  randconfig-014-20231128   gcc  
i386                  randconfig-015-20231128   gcc  
i386                  randconfig-016-20231128   gcc  
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
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
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
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

