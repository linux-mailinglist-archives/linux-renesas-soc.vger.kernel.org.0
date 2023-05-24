Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2A670EA66
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 May 2023 02:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236027AbjEXAlu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 May 2023 20:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbjEXAls (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 May 2023 20:41:48 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA52DCD
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 May 2023 17:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684888904; x=1716424904;
  h=date:from:to:cc:subject:message-id;
  bh=3/ummSVbD4RSzYzoV4/YZi8EEkmxPfkst7Y0tEGjy5M=;
  b=AKgu/GlvlTU6i7eKzWLxpOUnpxsx8LGoIogd/qxV2RRff7gIsd9984FA
   kDUw/1OKC/5EiAPic8tFgtbjVTQ/GNc5rYHnC0b1w6vUUNn2Xy5FnhcKQ
   saZmocK4OzT+gDS8ceVyn5kNL6D/pMImKi6gVYqmjGpJfjWP8fGRJN2UE
   aO5FUzYOwddFDpUvv4+QxGKDGK3jTucK91HIDjF6MyTlX0029G/bqlRQP
   QJkHIs4gg2qy1NRuPEXnyT+ADD6eaexI2mSY/AcTBy3eKfl8be/bH2oUy
   xSD2We+4a0wc6X69hqme6hyoGNkspPJ5E+3k15Lpb1FnNCx9y8cc6y7Ej
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="333772300"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; 
   d="scan'208";a="333772300"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 17:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="707245598"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; 
   d="scan'208";a="707245598"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 May 2023 17:41:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q1cZO-000EEV-18;
        Wed, 24 May 2023 00:41:38 +0000
Date:   Wed, 24 May 2023 08:40:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.5] BUILD SUCCESS
 d1c20885d3b01e6a62e920af4b227abd294d22f3
Message-ID: <20230524004038.Ru4Cz%lkp@intel.com>
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

tree/branch: INFO setup_repo_specs: /db/releases/20230524001904/lkp-src/repo/*/geert-renesas-drivers
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.5
branch HEAD: d1c20885d3b01e6a62e920af4b227abd294d22f3  clk: renesas: rzg2l: Fix CPG_SIPLL5_CLK1 register write

elapsed time: 728m

configs tested: 275
configs skipped: 21

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230521   gcc  
alpha        buildonly-randconfig-r003-20230522   gcc  
alpha        buildonly-randconfig-r006-20230521   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230522   gcc  
alpha                randconfig-r006-20230522   gcc  
alpha                randconfig-r006-20230523   gcc  
alpha                randconfig-r022-20230522   gcc  
alpha                randconfig-r024-20230522   gcc  
alpha                randconfig-r026-20230522   gcc  
alpha                randconfig-r035-20230522   gcc  
alpha                randconfig-r036-20230522   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230522   gcc  
arc          buildonly-randconfig-r004-20230522   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230522   gcc  
arc                  randconfig-r014-20230521   gcc  
arc                  randconfig-r023-20230522   gcc  
arc                  randconfig-r024-20230521   gcc  
arc                  randconfig-r025-20230522   gcc  
arc                  randconfig-r043-20230521   gcc  
arc                  randconfig-r043-20230522   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                  randconfig-r003-20230521   gcc  
arm                  randconfig-r015-20230521   clang
arm                  randconfig-r031-20230521   gcc  
arm                  randconfig-r046-20230521   clang
arm                  randconfig-r046-20230522   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r003-20230521   clang
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230523   clang
arm64                randconfig-r011-20230522   clang
csky                                defconfig   gcc  
csky                 randconfig-r005-20230522   gcc  
csky                 randconfig-r025-20230521   gcc  
csky                 randconfig-r035-20230521   gcc  
hexagon      buildonly-randconfig-r001-20230521   clang
hexagon      buildonly-randconfig-r001-20230522   clang
hexagon              randconfig-r001-20230521   clang
hexagon              randconfig-r002-20230522   clang
hexagon              randconfig-r006-20230521   clang
hexagon              randconfig-r021-20230522   clang
hexagon              randconfig-r024-20230521   clang
hexagon              randconfig-r041-20230521   clang
hexagon              randconfig-r041-20230522   clang
hexagon              randconfig-r045-20230521   clang
hexagon              randconfig-r045-20230522   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230522   gcc  
i386                 randconfig-a002-20230522   gcc  
i386                 randconfig-a003-20230522   gcc  
i386                 randconfig-a004-20230522   gcc  
i386                 randconfig-a005-20230522   gcc  
i386                 randconfig-a006-20230522   gcc  
i386                 randconfig-i051-20230523   clang
i386                 randconfig-i052-20230523   clang
i386                 randconfig-i053-20230523   clang
i386                 randconfig-i054-20230523   clang
i386                 randconfig-i055-20230523   clang
i386                 randconfig-i056-20230523   clang
i386                 randconfig-i061-20230523   clang
i386                 randconfig-i062-20230523   clang
i386                 randconfig-i063-20230523   clang
i386                 randconfig-i064-20230523   clang
i386                 randconfig-i065-20230523   clang
i386                 randconfig-i066-20230523   clang
i386                 randconfig-r003-20230522   gcc  
i386                 randconfig-r016-20230522   clang
i386                 randconfig-r026-20230522   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230523   gcc  
ia64                 randconfig-r005-20230522   gcc  
ia64                 randconfig-r013-20230521   gcc  
ia64                 randconfig-r013-20230522   gcc  
ia64                 randconfig-r021-20230522   gcc  
ia64                 randconfig-r023-20230521   gcc  
ia64                 randconfig-r033-20230521   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230521   gcc  
loongarch            randconfig-r004-20230522   gcc  
loongarch            randconfig-r015-20230521   gcc  
loongarch            randconfig-r021-20230521   gcc  
loongarch            randconfig-r025-20230521   gcc  
loongarch            randconfig-r034-20230521   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r005-20230522   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                 randconfig-r005-20230521   gcc  
m68k                 randconfig-r005-20230523   gcc  
m68k                 randconfig-r022-20230521   gcc  
m68k                 randconfig-r036-20230522   gcc  
microblaze   buildonly-randconfig-r006-20230522   gcc  
microblaze           randconfig-r006-20230521   gcc  
microblaze           randconfig-r015-20230522   gcc  
microblaze           randconfig-r016-20230521   gcc  
microblaze           randconfig-r022-20230521   gcc  
microblaze           randconfig-r034-20230522   gcc  
microblaze           randconfig-r036-20230521   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230521   gcc  
mips                           jazz_defconfig   gcc  
mips                 randconfig-r004-20230521   gcc  
mips                 randconfig-r014-20230521   clang
mips                 randconfig-r022-20230522   gcc  
mips                 randconfig-r036-20230521   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230522   gcc  
nios2                randconfig-r002-20230523   gcc  
nios2                randconfig-r003-20230523   gcc  
nios2                randconfig-r004-20230522   gcc  
nios2                randconfig-r012-20230522   gcc  
openrisc     buildonly-randconfig-r004-20230521   gcc  
openrisc             randconfig-r002-20230521   gcc  
openrisc             randconfig-r002-20230522   gcc  
openrisc             randconfig-r006-20230521   gcc  
openrisc             randconfig-r014-20230522   gcc  
openrisc             randconfig-r026-20230521   gcc  
openrisc             randconfig-r026-20230522   gcc  
openrisc             randconfig-r032-20230521   gcc  
openrisc             randconfig-r033-20230521   gcc  
parisc       buildonly-randconfig-r002-20230521   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230522   gcc  
parisc               randconfig-r001-20230523   gcc  
parisc               randconfig-r012-20230521   gcc  
parisc               randconfig-r016-20230522   gcc  
parisc               randconfig-r031-20230522   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230521   gcc  
powerpc      buildonly-randconfig-r002-20230522   clang
powerpc                      mgcoge_defconfig   gcc  
powerpc              randconfig-r004-20230522   gcc  
powerpc              randconfig-r016-20230521   gcc  
powerpc              randconfig-r021-20230521   gcc  
powerpc              randconfig-r032-20230522   gcc  
powerpc              randconfig-r034-20230522   gcc  
powerpc                     tqm8541_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230523   clang
riscv                randconfig-r005-20230521   clang
riscv                randconfig-r005-20230523   clang
riscv                randconfig-r006-20230523   clang
riscv                randconfig-r011-20230521   gcc  
riscv                randconfig-r011-20230522   clang
riscv                randconfig-r036-20230521   clang
riscv                randconfig-r042-20230521   gcc  
riscv                randconfig-r042-20230522   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230521   gcc  
s390         buildonly-randconfig-r004-20230522   clang
s390                                defconfig   gcc  
s390                 randconfig-r001-20230523   clang
s390                 randconfig-r003-20230521   clang
s390                 randconfig-r004-20230521   clang
s390                 randconfig-r006-20230522   gcc  
s390                 randconfig-r011-20230521   gcc  
s390                 randconfig-r023-20230521   gcc  
s390                 randconfig-r032-20230522   gcc  
s390                 randconfig-r034-20230521   clang
s390                 randconfig-r044-20230521   gcc  
s390                 randconfig-r044-20230522   clang
sh                               allmodconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r013-20230522   gcc  
sh                   randconfig-r014-20230522   gcc  
sh                   randconfig-r021-20230521   gcc  
sh                   randconfig-r024-20230522   gcc  
sh                   randconfig-r034-20230522   gcc  
sh                   randconfig-r036-20230522   gcc  
sh                           se7722_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230522   gcc  
sparc                randconfig-r012-20230521   gcc  
sparc                randconfig-r023-20230522   gcc  
sparc                randconfig-r026-20230521   gcc  
sparc                randconfig-r033-20230521   gcc  
sparc                randconfig-r035-20230522   gcc  
sparc64      buildonly-randconfig-r003-20230522   gcc  
sparc64      buildonly-randconfig-r005-20230521   gcc  
sparc64              randconfig-r001-20230521   gcc  
sparc64              randconfig-r003-20230521   gcc  
sparc64              randconfig-r006-20230522   gcc  
sparc64              randconfig-r015-20230522   gcc  
sparc64              randconfig-r025-20230521   gcc  
sparc64              randconfig-r032-20230521   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r002-20230522   gcc  
x86_64       buildonly-randconfig-r005-20230522   gcc  
x86_64       buildonly-randconfig-r006-20230522   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230522   gcc  
x86_64               randconfig-a002-20230522   gcc  
x86_64               randconfig-a003-20230522   gcc  
x86_64               randconfig-a004-20230522   gcc  
x86_64               randconfig-a005-20230522   gcc  
x86_64               randconfig-a006-20230522   gcc  
x86_64               randconfig-a011-20230522   clang
x86_64               randconfig-a012-20230522   clang
x86_64               randconfig-a013-20230522   clang
x86_64               randconfig-a014-20230522   clang
x86_64               randconfig-a015-20230522   clang
x86_64               randconfig-a016-20230522   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-x051-20230522   clang
x86_64               randconfig-x052-20230522   clang
x86_64               randconfig-x053-20230522   clang
x86_64               randconfig-x054-20230522   clang
x86_64               randconfig-x055-20230522   clang
x86_64               randconfig-x056-20230522   clang
x86_64               randconfig-x061-20230522   clang
x86_64               randconfig-x062-20230522   clang
x86_64               randconfig-x063-20230522   clang
x86_64               randconfig-x064-20230522   clang
x86_64               randconfig-x065-20230522   clang
x86_64               randconfig-x066-20230522   clang
x86_64               randconfig-x071-20230522   gcc  
x86_64               randconfig-x072-20230522   gcc  
x86_64               randconfig-x073-20230522   gcc  
x86_64               randconfig-x074-20230522   gcc  
x86_64               randconfig-x075-20230522   gcc  
x86_64               randconfig-x076-20230522   gcc  
x86_64               randconfig-x081-20230522   gcc  
x86_64                        randconfig-x081   gcc  
x86_64               randconfig-x082-20230522   gcc  
x86_64                        randconfig-x082   clang
x86_64               randconfig-x083-20230522   gcc  
x86_64                        randconfig-x083   gcc  
x86_64               randconfig-x084-20230522   gcc  
x86_64                        randconfig-x084   clang
x86_64               randconfig-x085-20230522   gcc  
x86_64                        randconfig-x085   gcc  
x86_64               randconfig-x086-20230522   gcc  
x86_64                        randconfig-x086   clang
x86_64               randconfig-x091-20230523   gcc  
x86_64               randconfig-x092-20230523   gcc  
x86_64               randconfig-x093-20230523   gcc  
x86_64               randconfig-x094-20230523   gcc  
x86_64               randconfig-x095-20230523   gcc  
x86_64               randconfig-x096-20230523   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r013-20230521   gcc  
xtensa               randconfig-r022-20230521   gcc  
xtensa               randconfig-r031-20230521   gcc  
xtensa               randconfig-r031-20230522   gcc  
xtensa               randconfig-r032-20230522   gcc  
xtensa               randconfig-r035-20230521   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
