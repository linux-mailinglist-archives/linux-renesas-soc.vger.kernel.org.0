Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 851937EA918
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 04:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbjKNDYg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 22:24:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjKNDYf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 22:24:35 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF0210C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 19:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699932272; x=1731468272;
  h=date:from:to:cc:subject:message-id;
  bh=siwO/oE1/QIU+Hn4M/1bvl/eIGUeBuQiztdB64VxoYA=;
  b=ZOle7VV7C9iT02jZTfnb0NGZY0aS02tQN7083GrFuOaUn19iljaq/zs8
   odnkOEsf+v7fD/0LlLF1tdLXfGKOF6pilqZh8ba+7PtFlg3CxVUHzA5mC
   Rst27Y2ioI6NW9REG1K84tbSROedtwDfbhAap4NQ8kHlwYAmO0p/ug9Qs
   bDLC6fmj57muZJQc5UztpdndIt4Cl5SWAulS7qO8Gi3c+zQJxivMMzq9u
   MyG9Pg0gea4t95zXfOY+mRn6E+gfukwwOjiPnhK/PqKxkxsKySCiB+djt
   e0JzeKVbTc+AUhs/tIP8rDcLb1FoXTCtaS1WifOMUh+ETNJsPMfseUIP2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="457060036"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="457060036"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 19:24:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="740961836"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="740961836"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Nov 2023 19:24:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1r2k2O-000Cnw-00;
        Tue, 14 Nov 2023 03:24:28 +0000
Date:   Tue, 14 Nov 2023 11:24:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD REGRESSION
 2cbe2219523d8ff9bc5d81dfd3bb6cf97807ab2d
Message-ID: <202311141115.JnMsCjty-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 2cbe2219523d8ff9bc5d81dfd3bb6cf97807ab2d  Merge branch 'renesas-next' into renesas-devel

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- xtensa-randconfig-001-20231114
    |-- xtensa-linux-ld:a6xx_gmu.c:(.text):undefined-reference-to-qmp_put
    `-- xtensa-linux-ld:a6xx_gmu.c:(.text):undefined-reference-to-qmp_send

elapsed time: 732m

configs tested: 177
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231114   gcc  
arc                   randconfig-002-20231114   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                        multi_v5_defconfig   clang
arm                   randconfig-001-20231114   gcc  
arm                   randconfig-002-20231114   gcc  
arm                   randconfig-003-20231114   gcc  
arm                   randconfig-004-20231114   gcc  
arm                         s3c6400_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231114   gcc  
arm64                 randconfig-002-20231114   gcc  
arm64                 randconfig-003-20231114   gcc  
arm64                 randconfig-004-20231114   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231114   gcc  
csky                  randconfig-002-20231114   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231114   gcc  
i386         buildonly-randconfig-002-20231114   gcc  
i386         buildonly-randconfig-003-20231114   gcc  
i386         buildonly-randconfig-004-20231114   gcc  
i386         buildonly-randconfig-005-20231114   gcc  
i386         buildonly-randconfig-006-20231114   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231114   gcc  
i386                  randconfig-002-20231114   gcc  
i386                  randconfig-003-20231114   gcc  
i386                  randconfig-004-20231114   gcc  
i386                  randconfig-005-20231114   gcc  
i386                  randconfig-006-20231114   gcc  
i386                  randconfig-011-20231114   gcc  
i386                  randconfig-012-20231114   gcc  
i386                  randconfig-013-20231114   gcc  
i386                  randconfig-014-20231114   gcc  
i386                  randconfig-015-20231114   gcc  
i386                  randconfig-016-20231114   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231114   gcc  
loongarch             randconfig-002-20231114   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231114   gcc  
nios2                 randconfig-002-20231114   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231114   gcc  
parisc                randconfig-002-20231114   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc               randconfig-001-20231114   gcc  
powerpc               randconfig-002-20231114   gcc  
powerpc               randconfig-003-20231114   gcc  
powerpc64             randconfig-001-20231114   gcc  
powerpc64             randconfig-002-20231114   gcc  
powerpc64             randconfig-003-20231114   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20231114   gcc  
riscv                 randconfig-002-20231114   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231114   gcc  
s390                  randconfig-002-20231114   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20231114   gcc  
sh                    randconfig-002-20231114   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231114   gcc  
sparc                 randconfig-002-20231114   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231114   gcc  
sparc64               randconfig-002-20231114   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231114   gcc  
um                    randconfig-002-20231114   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231114   gcc  
x86_64       buildonly-randconfig-002-20231114   gcc  
x86_64       buildonly-randconfig-003-20231114   gcc  
x86_64       buildonly-randconfig-004-20231114   gcc  
x86_64       buildonly-randconfig-005-20231114   gcc  
x86_64       buildonly-randconfig-006-20231114   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231114   gcc  
x86_64                randconfig-002-20231114   gcc  
x86_64                randconfig-003-20231114   gcc  
x86_64                randconfig-004-20231114   gcc  
x86_64                randconfig-005-20231114   gcc  
x86_64                randconfig-006-20231114   gcc  
x86_64                randconfig-011-20231114   gcc  
x86_64                randconfig-012-20231114   gcc  
x86_64                randconfig-013-20231114   gcc  
x86_64                randconfig-014-20231114   gcc  
x86_64                randconfig-015-20231114   gcc  
x86_64                randconfig-016-20231114   gcc  
x86_64                randconfig-071-20231114   gcc  
x86_64                randconfig-072-20231114   gcc  
x86_64                randconfig-073-20231114   gcc  
x86_64                randconfig-074-20231114   gcc  
x86_64                randconfig-075-20231114   gcc  
x86_64                randconfig-076-20231114   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                randconfig-001-20231114   gcc  
xtensa                randconfig-002-20231114   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
