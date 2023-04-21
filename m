Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1929C6EB460
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Apr 2023 00:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbjDUWDh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 18:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233046AbjDUWDf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 18:03:35 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27ED410F2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 15:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682114614; x=1713650614;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1P0gNtdE9I6Vrm0BOKZLQeYAFtrzIEyUFP4aSM3OVRE=;
  b=CPt1AijxxztifLbvIjUCWJnKnhF/P+C+gkCUl8UzdozVc3RLqdqHcj+6
   S5nyOEx251kRNDpZ7X43ORnAvlF2Gr2SsdSued9ZhDFmXixLpDp0dyyMt
   l0zeGbHdPnKAqem1wc0gcUdfRUPMd1Os2CIaN9dt2OBxaX5KOFiNmLep4
   JcIZQfTs76b0WN5nwyuSRHC+yL35aIzQRuJx6HELfqtOuz0jtpcmWJEBh
   ptvBehW1TYTO10sGAEJ4MHZLSy3TrfBwSJ840NzhuEYeX00S8PEQvEkjQ
   2DKRNhZ2YQyA37wQCUHAvVZHA1rYSXWpd5ijA8UcQDd0AYrljb2knkWK6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="330294195"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="330294195"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 15:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="761715876"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="761715876"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2023 15:03:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ppyqi-000grQ-29;
        Fri, 21 Apr 2023 22:03:24 +0000
Date:   Sat, 22 Apr 2023 06:03:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 58c481b761fe2bc4936caea1c712d28e30488ef4
Message-ID: <6443082a.k/BgYqE/DiXDP1Qi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 58c481b761fe2bc4936caea1c712d28e30488ef4  Merge branch 'renesas-dts-for-v6.5' into renesas-devel

elapsed time: 727m

configs tested: 275
configs skipped: 24

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230421   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230421   gcc  
alpha                randconfig-r016-20230416   gcc  
alpha                randconfig-r023-20230416   gcc  
alpha                randconfig-r023-20230421   gcc  
alpha                randconfig-r033-20230416   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                  randconfig-r003-20230421   gcc  
arc                  randconfig-r005-20230416   gcc  
arc                  randconfig-r006-20230421   gcc  
arc                  randconfig-r015-20230421   gcc  
arc                  randconfig-r022-20230421   gcc  
arc                  randconfig-r023-20230419   gcc  
arc                  randconfig-r031-20230421   gcc  
arc                  randconfig-r033-20230421   gcc  
arc                  randconfig-r043-20230416   gcc  
arc                  randconfig-r043-20230417   gcc  
arc                  randconfig-r043-20230420   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         bcm2835_defconfig   clang
arm          buildonly-randconfig-r004-20230421   gcc  
arm                                 defconfig   gcc  
arm                          moxart_defconfig   clang
arm                  randconfig-r005-20230421   clang
arm                  randconfig-r015-20230417   gcc  
arm                  randconfig-r022-20230416   clang
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230417   gcc  
arm                  randconfig-r046-20230420   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230416   clang
arm64        buildonly-randconfig-r002-20230417   gcc  
arm64        buildonly-randconfig-r004-20230416   clang
arm64        buildonly-randconfig-r004-20230421   gcc  
arm64        buildonly-randconfig-r005-20230421   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230421   gcc  
arm64                randconfig-r006-20230416   clang
arm64                randconfig-r023-20230418   gcc  
arm64                randconfig-r025-20230417   clang
arm64                randconfig-r026-20230417   clang
arm64                randconfig-r031-20230421   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230417   gcc  
csky                 randconfig-r002-20230417   gcc  
csky                 randconfig-r003-20230417   gcc  
csky                 randconfig-r012-20230421   gcc  
csky                 randconfig-r015-20230421   gcc  
csky                 randconfig-r023-20230421   gcc  
csky                 randconfig-r024-20230419   gcc  
csky                 randconfig-r024-20230421   gcc  
csky                 randconfig-r025-20230421   gcc  
csky                 randconfig-r026-20230416   gcc  
csky                 randconfig-r036-20230421   gcc  
hexagon      buildonly-randconfig-r001-20230421   clang
hexagon      buildonly-randconfig-r002-20230421   clang
hexagon      buildonly-randconfig-r004-20230417   clang
hexagon              randconfig-r022-20230421   clang
hexagon              randconfig-r031-20230416   clang
hexagon              randconfig-r041-20230416   clang
hexagon              randconfig-r041-20230417   clang
hexagon              randconfig-r041-20230420   clang
hexagon              randconfig-r041-20230421   clang
hexagon              randconfig-r045-20230416   clang
hexagon              randconfig-r045-20230417   clang
hexagon              randconfig-r045-20230420   clang
hexagon              randconfig-r045-20230421   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                          randconfig-a002   clang
i386                 randconfig-a003-20230417   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                          randconfig-a004   clang
i386                 randconfig-a005-20230417   gcc  
i386                 randconfig-a006-20230417   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
i386                 randconfig-r036-20230417   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r005-20230421   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230421   gcc  
ia64                 randconfig-r013-20230416   gcc  
ia64                 randconfig-r015-20230416   gcc  
ia64                 randconfig-r022-20230421   gcc  
ia64                 randconfig-r034-20230421   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230421   gcc  
loongarch            randconfig-r011-20230421   gcc  
loongarch            randconfig-r012-20230419   gcc  
loongarch            randconfig-r035-20230421   gcc  
loongarch            randconfig-r036-20230421   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                 randconfig-r004-20230421   gcc  
m68k                 randconfig-r014-20230421   gcc  
m68k                 randconfig-r016-20230421   gcc  
m68k                 randconfig-r021-20230418   gcc  
m68k                 randconfig-r023-20230421   gcc  
m68k                 randconfig-r034-20230417   gcc  
microblaze   buildonly-randconfig-r003-20230417   gcc  
microblaze   buildonly-randconfig-r005-20230417   gcc  
microblaze           randconfig-r004-20230421   gcc  
microblaze           randconfig-r011-20230419   gcc  
microblaze           randconfig-r012-20230421   gcc  
microblaze           randconfig-r013-20230421   gcc  
microblaze           randconfig-r015-20230421   gcc  
microblaze           randconfig-r021-20230421   gcc  
microblaze           randconfig-r024-20230421   gcc  
microblaze           randconfig-r034-20230421   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                          malta_defconfig   clang
mips                 randconfig-r001-20230421   clang
mips                 randconfig-r012-20230421   gcc  
mips                 randconfig-r013-20230421   gcc  
mips                 randconfig-r014-20230421   gcc  
mips                 randconfig-r022-20230421   gcc  
mips                 randconfig-r024-20230418   clang
nios2        buildonly-randconfig-r002-20230421   gcc  
nios2        buildonly-randconfig-r003-20230416   gcc  
nios2        buildonly-randconfig-r005-20230421   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230416   gcc  
nios2                randconfig-r006-20230421   gcc  
nios2                randconfig-r011-20230417   gcc  
nios2                randconfig-r014-20230416   gcc  
nios2                randconfig-r022-20230419   gcc  
nios2                randconfig-r025-20230418   gcc  
nios2                randconfig-r026-20230421   gcc  
nios2                randconfig-r035-20230416   gcc  
nios2                randconfig-r035-20230421   gcc  
openrisc                         alldefconfig   gcc  
openrisc     buildonly-randconfig-r002-20230421   gcc  
openrisc     buildonly-randconfig-r003-20230421   gcc  
openrisc     buildonly-randconfig-r006-20230421   gcc  
openrisc                  or1klitex_defconfig   gcc  
openrisc             randconfig-r031-20230421   gcc  
openrisc             randconfig-r032-20230421   gcc  
openrisc             randconfig-r035-20230417   gcc  
parisc       buildonly-randconfig-r002-20230421   gcc  
parisc       buildonly-randconfig-r004-20230421   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r014-20230421   gcc  
parisc               randconfig-r024-20230421   gcc  
parisc               randconfig-r026-20230419   gcc  
parisc               randconfig-r036-20230421   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r006-20230421   clang
powerpc                       eiger_defconfig   gcc  
powerpc                     kmeter1_defconfig   clang
powerpc                     ksi8560_defconfig   clang
powerpc              randconfig-r002-20230421   gcc  
powerpc              randconfig-r003-20230421   gcc  
powerpc              randconfig-r006-20230420   clang
powerpc              randconfig-r006-20230421   gcc  
powerpc              randconfig-r011-20230416   gcc  
powerpc              randconfig-r022-20230421   clang
powerpc              randconfig-r025-20230416   gcc  
powerpc              randconfig-r025-20230421   clang
powerpc              randconfig-r026-20230421   clang
powerpc              randconfig-r032-20230421   gcc  
powerpc              randconfig-r033-20230421   gcc  
powerpc              randconfig-r034-20230421   gcc  
powerpc                     skiroot_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230416   gcc  
riscv        buildonly-randconfig-r004-20230421   clang
riscv        buildonly-randconfig-r005-20230416   gcc  
riscv        buildonly-randconfig-r005-20230421   clang
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230421   gcc  
riscv                randconfig-r012-20230417   clang
riscv                randconfig-r031-20230417   gcc  
riscv                randconfig-r035-20230421   gcc  
riscv                randconfig-r042-20230416   gcc  
riscv                randconfig-r042-20230417   clang
riscv                randconfig-r042-20230420   gcc  
riscv                randconfig-r042-20230421   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230421   clang
s390                                defconfig   gcc  
s390                 randconfig-r023-20230421   clang
s390                 randconfig-r024-20230416   gcc  
s390                 randconfig-r044-20230416   gcc  
s390                 randconfig-r044-20230417   clang
s390                 randconfig-r044-20230420   gcc  
s390                 randconfig-r044-20230421   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r006-20230421   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                   randconfig-r011-20230421   gcc  
sh                   randconfig-r012-20230421   gcc  
sh                   randconfig-r013-20230419   gcc  
sh                   randconfig-r026-20230418   gcc  
sh                            shmin_defconfig   gcc  
sparc        buildonly-randconfig-r004-20230421   gcc  
sparc        buildonly-randconfig-r005-20230421   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230420   gcc  
sparc                randconfig-r005-20230421   gcc  
sparc                randconfig-r016-20230417   gcc  
sparc                randconfig-r021-20230421   gcc  
sparc                randconfig-r032-20230416   gcc  
sparc                randconfig-r033-20230417   gcc  
sparc                randconfig-r034-20230421   gcc  
sparc64      buildonly-randconfig-r001-20230421   gcc  
sparc64              randconfig-r003-20230416   gcc  
sparc64              randconfig-r006-20230417   gcc  
sparc64              randconfig-r013-20230417   gcc  
sparc64              randconfig-r014-20230417   gcc  
sparc64              randconfig-r016-20230421   gcc  
sparc64              randconfig-r025-20230421   gcc  
sparc64              randconfig-r032-20230417   gcc  
sparc64              randconfig-r035-20230421   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64                        randconfig-a011   gcc  
x86_64               randconfig-a012-20230417   clang
x86_64                        randconfig-a012   clang
x86_64               randconfig-a013-20230417   clang
x86_64                        randconfig-a013   gcc  
x86_64               randconfig-a014-20230417   clang
x86_64                        randconfig-a014   clang
x86_64               randconfig-a015-20230417   clang
x86_64                        randconfig-a015   gcc  
x86_64               randconfig-a016-20230417   clang
x86_64                        randconfig-a016   clang
x86_64               randconfig-r021-20230417   clang
x86_64                               rhel-8.3   gcc  
xtensa                       common_defconfig   gcc  
xtensa               randconfig-r005-20230421   gcc  
xtensa               randconfig-r011-20230421   gcc  
xtensa               randconfig-r012-20230416   gcc  
xtensa               randconfig-r013-20230421   gcc  
xtensa               randconfig-r014-20230419   gcc  
xtensa               randconfig-r021-20230416   gcc  
xtensa               randconfig-r021-20230421   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
