Return-Path: <linux-renesas-soc+bounces-355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 089E07FBE6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 16:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A6BD1C209C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 15:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712911E4AC;
	Tue, 28 Nov 2023 15:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pza2JPoA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2380131
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 07:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701186457; x=1732722457;
  h=date:from:to:cc:subject:message-id;
  bh=1oy518x9QDaruxtifs4CRuJXt7DmCvgVSLCZHETNeHI=;
  b=Pza2JPoAPuwa1LMHnZiRdk2DKTn1lJMKneoIY0gbY0z9fsk21ie/X4IB
   MKQhQs7xtwgZAWD5F5v2edROvJVJ+Ac9uVl8OxXqUO0QHufnTFCdPQSbj
   yMNLZQ/XDnIHh8Gxzqlp/mTAg0pLjv9q5NqUk2FPag70Q8YIhuUF7lmaG
   pDEiWFhZ04Fp/P6KBkOs1jqB94QXJrcZNr6i5H8hDJ3h4JVHoifLVCHDt
   JKZ2wlpGs4bUHqtcZvIuPRbZJ9y5rL3Zt2HXn1BfXH4YiyG6lRpycai+X
   DzQXNOo/LZTIGMj3Mec9ooK+WjFIqz5YKhjLesTZ49y/sPQMazawsXYI9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372322285"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="372322285"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 07:47:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772351414"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="772351414"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Nov 2023 07:47:36 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r80JC-0007hH-17;
	Tue, 28 Nov 2023 15:47:34 +0000
Date: Tue, 28 Nov 2023 23:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 2588e66d6f71d0c96ce09e861e667284fd7a1a33
Message-ID: <202311282355.b2lMw1fF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 2588e66d6f71d0c96ce09e861e667284fd7a1a33  arm64: renesas: defconfig: Refresh for v6.7-rc1

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

