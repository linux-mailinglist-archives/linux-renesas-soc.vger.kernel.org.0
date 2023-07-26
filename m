Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57E5076297B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 05:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjGZDvV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jul 2023 23:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbjGZDvS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jul 2023 23:51:18 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5842698
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jul 2023 20:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690343477; x=1721879477;
  h=date:from:to:cc:subject:message-id;
  bh=+bwWXqVkbXpiVYR0gelQSr55KN8eZ0aaIOQPYm5Aef4=;
  b=iALYVjeCkhK/hJVSkh/MghZQ21SSa8nIK64p/pVNeMaA1GmMGEMWwbM0
   2xedkZ+HvYoJhLLhQKq1VBpLiR/FTGESCDlb/75GCXdA9FPmqHur4arFA
   mhOUcqUh2LOQGdwhTAQy79MxFkO3HwlndtOrn6hTuHRiDO4cML5Qo6ZtO
   I1RLULo/8dfHQS6WzJDmE63Ix7CGXqM3wliObHhZLcQjZRG+ZQymfHzXp
   ozzSQBEv//W1VWj0eM47Ej+1Gh/XzzBvciCaH9pVeV6pwTPbMNwv2k8wD
   XlJU0NZqODjIZgdxG2Uwg4oMV7j3eu/zFu9UBLjwiS34+BO3B1x/5ZMSI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="454280455"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="454280455"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 20:51:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="816508940"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="816508940"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jul 2023 20:51:08 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOVYJ-0000cY-2t;
        Wed, 26 Jul 2023 03:51:07 +0000
Date:   Wed, 26 Jul 2023 11:51:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 2fd3f06b527e6ffaa929129a267386961e20a86c
Message-ID: <202307261102.FQD4mM7G-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 2fd3f06b527e6ffaa929129a267386961e20a86c  clk: renesas: r9a07g043: Add MTU3a clock and reset entry

elapsed time: 723m

configs tested: 198
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230725   gcc  
alpha                randconfig-r002-20230725   gcc  
alpha                randconfig-r006-20230725   gcc  
alpha                randconfig-r012-20230725   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r013-20230725   gcc  
arc                  randconfig-r016-20230725   gcc  
arc                  randconfig-r031-20230725   gcc  
arc                  randconfig-r043-20230725   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230725   gcc  
arm                  randconfig-r032-20230725   gcc  
arm                  randconfig-r046-20230725   clang
arm                           sunxi_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230725   clang
arm64                randconfig-r024-20230725   gcc  
arm64                randconfig-r035-20230725   clang
csky                                defconfig   gcc  
csky                 randconfig-r006-20230725   gcc  
csky                 randconfig-r016-20230725   gcc  
csky                 randconfig-r023-20230725   gcc  
csky                 randconfig-r025-20230725   gcc  
hexagon                          alldefconfig   clang
hexagon              randconfig-r004-20230725   clang
hexagon              randconfig-r005-20230725   clang
hexagon              randconfig-r023-20230725   clang
hexagon              randconfig-r041-20230725   clang
hexagon              randconfig-r041-20230726   clang
hexagon              randconfig-r045-20230725   clang
hexagon              randconfig-r045-20230726   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230725   clang
i386         buildonly-randconfig-r005-20230725   clang
i386         buildonly-randconfig-r006-20230725   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230725   clang
i386                 randconfig-i002-20230725   clang
i386                 randconfig-i003-20230725   clang
i386                 randconfig-i004-20230725   clang
i386                 randconfig-i005-20230725   clang
i386                 randconfig-i006-20230725   clang
i386                 randconfig-i011-20230725   gcc  
i386                 randconfig-i012-20230725   gcc  
i386                 randconfig-i013-20230725   gcc  
i386                 randconfig-i014-20230725   gcc  
i386                 randconfig-i015-20230725   gcc  
i386                 randconfig-i016-20230725   gcc  
i386                 randconfig-r001-20230725   clang
i386                 randconfig-r003-20230725   clang
i386                 randconfig-r016-20230725   gcc  
i386                 randconfig-r022-20230725   gcc  
i386                 randconfig-r026-20230725   gcc  
i386                 randconfig-r036-20230725   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230725   gcc  
loongarch            randconfig-r013-20230725   gcc  
loongarch            randconfig-r015-20230725   gcc  
loongarch            randconfig-r016-20230725   gcc  
loongarch            randconfig-r021-20230725   gcc  
loongarch            randconfig-r024-20230725   gcc  
loongarch            randconfig-r031-20230725   gcc  
loongarch            randconfig-r032-20230725   gcc  
loongarch            randconfig-r034-20230725   gcc  
loongarch            randconfig-r035-20230725   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230725   gcc  
m68k                 randconfig-r003-20230725   gcc  
m68k                 randconfig-r021-20230725   gcc  
m68k                 randconfig-r026-20230725   gcc  
m68k                 randconfig-r036-20230725   gcc  
microblaze           randconfig-r002-20230725   gcc  
microblaze           randconfig-r004-20230725   gcc  
microblaze           randconfig-r012-20230725   gcc  
microblaze           randconfig-r024-20230725   gcc  
microblaze           randconfig-r025-20230725   gcc  
microblaze           randconfig-r033-20230725   gcc  
microblaze           randconfig-r035-20230725   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                 randconfig-r002-20230725   gcc  
mips                 randconfig-r005-20230725   gcc  
mips                 randconfig-r033-20230725   gcc  
mips                           xway_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r021-20230725   gcc  
nios2                randconfig-r026-20230725   gcc  
openrisc             randconfig-r012-20230725   gcc  
openrisc             randconfig-r031-20230725   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230725   gcc  
parisc               randconfig-r016-20230725   gcc  
parisc               randconfig-r025-20230725   gcc  
parisc               randconfig-r036-20230725   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                 linkstation_defconfig   gcc  
powerpc              randconfig-r006-20230725   clang
powerpc              randconfig-r023-20230725   gcc  
powerpc              randconfig-r032-20230725   clang
powerpc              randconfig-r034-20230725   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230725   clang
riscv                randconfig-r011-20230725   gcc  
riscv                randconfig-r012-20230725   gcc  
riscv                randconfig-r013-20230725   gcc  
riscv                randconfig-r024-20230725   gcc  
riscv                randconfig-r034-20230725   clang
riscv                randconfig-r042-20230725   gcc  
riscv                randconfig-r042-20230726   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230725   gcc  
s390                 randconfig-r031-20230725   clang
s390                 randconfig-r033-20230725   clang
s390                 randconfig-r044-20230725   gcc  
s390                 randconfig-r044-20230726   clang
sh                               allmodconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                   randconfig-r014-20230725   gcc  
sh                   randconfig-r036-20230725   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230725   gcc  
sparc                randconfig-r003-20230725   gcc  
sparc                randconfig-r004-20230725   gcc  
sparc                randconfig-r012-20230725   gcc  
sparc                randconfig-r021-20230725   gcc  
sparc                randconfig-r023-20230725   gcc  
sparc64              randconfig-r005-20230725   gcc  
sparc64              randconfig-r014-20230725   gcc  
sparc64              randconfig-r022-20230725   gcc  
sparc64              randconfig-r025-20230725   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r004-20230725   gcc  
um                   randconfig-r015-20230725   clang
um                   randconfig-r016-20230725   clang
um                   randconfig-r023-20230725   clang
um                   randconfig-r026-20230725   clang
um                   randconfig-r032-20230725   gcc  
um                   randconfig-r034-20230725   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230725   clang
x86_64       buildonly-randconfig-r002-20230725   clang
x86_64       buildonly-randconfig-r003-20230725   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r014-20230725   gcc  
x86_64               randconfig-r015-20230725   gcc  
x86_64               randconfig-r024-20230725   gcc  
x86_64               randconfig-x001-20230725   gcc  
x86_64               randconfig-x002-20230725   gcc  
x86_64               randconfig-x003-20230725   gcc  
x86_64               randconfig-x004-20230725   gcc  
x86_64               randconfig-x005-20230725   gcc  
x86_64               randconfig-x006-20230725   gcc  
x86_64               randconfig-x011-20230725   clang
x86_64               randconfig-x012-20230725   clang
x86_64               randconfig-x013-20230725   clang
x86_64               randconfig-x014-20230725   clang
x86_64               randconfig-x015-20230725   clang
x86_64               randconfig-x016-20230725   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
