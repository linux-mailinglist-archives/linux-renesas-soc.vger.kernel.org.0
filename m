Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11181720B9F
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Jun 2023 00:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbjFBWAL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jun 2023 18:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236506AbjFBWAI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 18:00:08 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E44E45
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jun 2023 15:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685743206; x=1717279206;
  h=date:from:to:cc:subject:message-id;
  bh=LZv7cyEk565zC/m5tFiZRrTxp9cKVl5tdj6RjAvX7yY=;
  b=HCfcdU5LRN+4/UZCLzFMnIPAiNIDqNO6C+x3/qBA4E2PDM94VysbVzSC
   zazDZQVz7DwBYzLslM5Umd270Xo0JyD7H3Gvm5zZpUDgZ8+dBlCVvmdtU
   yZ0QUXz241hh394JkCf773rHFcDfGl5RgYwuizWQNu+TdOf6HiXuBkQlN
   FSJ/U/7fsTF5eIzi0VcO90z1oKqKJoGHb8C1Z5xSp8uDX5oCbTdIM/+5L
   C42VeebngGQSPsrYfvLRlKvbRwq//UIbMnr/3FvCXCx9h/NFcbi7AYuvj
   izQ3ZpkoHLu0Dh0kUG/m0y3/lEvKy00eqQ6x26GVKaFeidy6sDuUvant+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="442356484"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="442356484"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 15:00:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="832105185"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="832105185"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Jun 2023 15:00:04 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q5CoV-00010w-22;
        Fri, 02 Jun 2023 22:00:03 +0000
Date:   Sat, 03 Jun 2023 05:59:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 256ba57a94d64c7d95e8f620dc8d1299c15fbc35
Message-ID: <20230602215909.toIOm%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 256ba57a94d64c7d95e8f620dc8d1299c15fbc35  Merge branches 'renesas-arm-defconfig-for-v6.5' and 'renesas-dts-for-v6.5' into renesas-next

elapsed time: 722m

configs tested: 242
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230531   gcc  
alpha        buildonly-randconfig-r005-20230531   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230531   gcc  
alpha                randconfig-r002-20230531   gcc  
alpha                randconfig-r013-20230531   gcc  
alpha                randconfig-r015-20230601   gcc  
alpha                randconfig-r031-20230531   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc          buildonly-randconfig-r005-20230531   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r003-20230531   gcc  
arc                  randconfig-r006-20230602   gcc  
arc                  randconfig-r043-20230531   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                            hisi_defconfig   gcc  
arm                            mmp2_defconfig   clang
arm                        multi_v5_defconfig   clang
arm                             mxs_defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r016-20230601   clang
arm                  randconfig-r021-20230531   gcc  
arm                  randconfig-r022-20230531   gcc  
arm                  randconfig-r024-20230531   gcc  
arm                  randconfig-r046-20230531   gcc  
arm                             rpc_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r001-20230531   gcc  
arm64        buildonly-randconfig-r005-20230531   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230602   gcc  
arm64                randconfig-r012-20230602   clang
arm64                randconfig-r026-20230531   clang
arm64                randconfig-r034-20230602   gcc  
csky         buildonly-randconfig-r002-20230531   gcc  
csky         buildonly-randconfig-r003-20230531   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230602   gcc  
csky                 randconfig-r012-20230601   gcc  
csky                 randconfig-r023-20230531   gcc  
csky                 randconfig-r025-20230531   gcc  
csky                 randconfig-r035-20230531   gcc  
hexagon              randconfig-r003-20230602   clang
hexagon              randconfig-r031-20230531   clang
hexagon              randconfig-r036-20230531   clang
hexagon              randconfig-r041-20230531   clang
hexagon              randconfig-r045-20230531   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r001-20230531   gcc  
i386         buildonly-randconfig-r001-20230602   gcc  
i386         buildonly-randconfig-r002-20230531   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230531   gcc  
i386                 randconfig-i002-20230531   gcc  
i386                 randconfig-i003-20230531   gcc  
i386                 randconfig-i004-20230531   gcc  
i386                 randconfig-i005-20230531   gcc  
i386                 randconfig-i006-20230531   gcc  
i386                 randconfig-i051-20230531   gcc  
i386                 randconfig-i051-20230602   gcc  
i386                 randconfig-i052-20230531   gcc  
i386                 randconfig-i052-20230602   gcc  
i386                 randconfig-i053-20230531   gcc  
i386                 randconfig-i053-20230602   gcc  
i386                 randconfig-i054-20230531   gcc  
i386                 randconfig-i054-20230602   gcc  
i386                 randconfig-i055-20230531   gcc  
i386                 randconfig-i055-20230602   gcc  
i386                 randconfig-i056-20230531   gcc  
i386                 randconfig-i056-20230602   gcc  
i386                 randconfig-i061-20230531   gcc  
i386                 randconfig-i061-20230602   gcc  
i386                 randconfig-i062-20230531   gcc  
i386                 randconfig-i062-20230602   gcc  
i386                 randconfig-i063-20230531   gcc  
i386                 randconfig-i063-20230602   gcc  
i386                 randconfig-i064-20230531   gcc  
i386                 randconfig-i064-20230602   gcc  
i386                 randconfig-i065-20230531   gcc  
i386                 randconfig-i065-20230602   gcc  
i386                 randconfig-i066-20230531   gcc  
i386                 randconfig-i066-20230602   gcc  
i386                 randconfig-r003-20230531   gcc  
i386                 randconfig-r004-20230531   gcc  
i386                 randconfig-r004-20230602   gcc  
i386                 randconfig-r006-20230531   gcc  
ia64                          tiger_defconfig   gcc  
ia64                            zx1_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230602   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230531   gcc  
loongarch            randconfig-r033-20230602   gcc  
m68k                             allmodconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k         buildonly-randconfig-r004-20230531   gcc  
m68k         buildonly-randconfig-r006-20230531   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                 randconfig-r002-20230531   gcc  
m68k                 randconfig-r016-20230601   gcc  
m68k                 randconfig-r021-20230531   gcc  
m68k                 randconfig-r031-20230531   gcc  
m68k                 randconfig-r034-20230531   gcc  
m68k                 randconfig-r036-20230531   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
microblaze           randconfig-r003-20230531   gcc  
microblaze           randconfig-r014-20230601   gcc  
microblaze           randconfig-r015-20230531   gcc  
microblaze           randconfig-r021-20230531   gcc  
microblaze           randconfig-r022-20230531   gcc  
microblaze           randconfig-r025-20230531   gcc  
microblaze           randconfig-r031-20230602   gcc  
microblaze           randconfig-r032-20230531   gcc  
microblaze           randconfig-r036-20230602   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r003-20230531   clang
mips                           ci20_defconfig   gcc  
mips                          rb532_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2        buildonly-randconfig-r002-20230531   gcc  
nios2        buildonly-randconfig-r004-20230531   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230602   gcc  
nios2                randconfig-r012-20230531   gcc  
nios2                randconfig-r012-20230601   gcc  
nios2                randconfig-r024-20230531   gcc  
nios2                randconfig-r026-20230531   gcc  
nios2                randconfig-r032-20230531   gcc  
openrisc     buildonly-randconfig-r003-20230531   gcc  
openrisc             randconfig-r002-20230531   gcc  
parisc       buildonly-randconfig-r003-20230531   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230531   gcc  
parisc               randconfig-r005-20230531   gcc  
parisc               randconfig-r006-20230531   gcc  
parisc               randconfig-r016-20230531   gcc  
parisc               randconfig-r026-20230531   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      ppc44x_defconfig   clang
powerpc              randconfig-r002-20230602   gcc  
powerpc              randconfig-r011-20230601   gcc  
powerpc              randconfig-r035-20230531   gcc  
powerpc                     tqm8555_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r004-20230531   clang
riscv        buildonly-randconfig-r006-20230531   clang
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230531   gcc  
riscv                randconfig-r033-20230531   gcc  
riscv                randconfig-r034-20230531   gcc  
riscv                randconfig-r036-20230531   gcc  
riscv                randconfig-r042-20230531   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230531   gcc  
s390                 randconfig-r011-20230601   gcc  
s390                 randconfig-r014-20230531   clang
s390                 randconfig-r016-20230602   clang
s390                 randconfig-r033-20230531   gcc  
s390                 randconfig-r044-20230531   clang
sh                               allmodconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                   randconfig-r005-20230602   gcc  
sh                   randconfig-r036-20230531   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc        buildonly-randconfig-r002-20230602   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230531   gcc  
sparc                randconfig-r016-20230601   gcc  
sparc                randconfig-r031-20230531   gcc  
sparc                randconfig-r035-20230602   gcc  
sparc64              randconfig-r001-20230602   gcc  
sparc64              randconfig-r005-20230602   gcc  
sparc64              randconfig-r013-20230601   gcc  
sparc64              randconfig-r025-20230531   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r003-20230531   gcc  
x86_64       buildonly-randconfig-r005-20230602   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230531   gcc  
x86_64               randconfig-a002-20230531   gcc  
x86_64               randconfig-a003-20230531   gcc  
x86_64               randconfig-a004-20230531   gcc  
x86_64               randconfig-a005-20230531   gcc  
x86_64               randconfig-a006-20230531   gcc  
x86_64               randconfig-r004-20230531   gcc  
x86_64               randconfig-r006-20230531   gcc  
x86_64               randconfig-r032-20230602   gcc  
x86_64               randconfig-r033-20230531   gcc  
x86_64               randconfig-r034-20230531   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230531   gcc  
xtensa                              defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r001-20230531   gcc  
xtensa               randconfig-r023-20230531   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
