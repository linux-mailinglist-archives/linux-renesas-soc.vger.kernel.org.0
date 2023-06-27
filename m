Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E95273F090
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jun 2023 03:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbjF0BcE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jun 2023 21:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjF0Bbw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jun 2023 21:31:52 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5855E5F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jun 2023 18:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687829510; x=1719365510;
  h=date:from:to:cc:subject:message-id;
  bh=J0dVt/eMXkFC0hPzwksiWRC6XPxEg5Yw6vTZqFcnvH8=;
  b=KwPAFtK62DcbE4trkE0rsqTEdfTa8l1BhaV7oqJhtS4wYOlbN+vmB4QG
   Xl569m8qoSsm/AU1My417gK1nB1NvT1NVOZWLRCkJEGYb+60taLOUZ5Do
   bSb0aJW9mVmDLI/C9R8J5EHxaxJe56i86kEl5tOsxlNXPr68AyC3BlA3e
   SljdJ52ISusDTzqObNsf1WsJimE6U9zAIDhF+ROz/jUHAV3Cc8JXfBryS
   WmSanLDZrAgDsZOwz62ILRr91nSz0dGJSPJCEOuMIl8Kvy4GxygW/3xqj
   rh36WPSt6yVSWNAqXE/QiNi8c3HOcl4jnTIxZNRMyADYUjRnsO9+yJ9/D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="364890265"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="364890265"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 18:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="716355291"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="716355291"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Jun 2023 18:31:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qDxYZ-000Ba1-07;
        Tue, 27 Jun 2023 01:31:47 +0000
Date:   Tue, 27 Jun 2023 09:31:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.6] BUILD SUCCESS
 91e87164a47a1d5036cab9b6a8d8d3ee7509465e
Message-ID: <202306270943.S6ZCjTnB-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.6
branch HEAD: 91e87164a47a1d5036cab9b6a8d8d3ee7509465e  clk: renesas: r8a774b1: Add 3DGE and ZG support

elapsed time: 9370m

configs tested: 268
configs skipped: 19

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230620   gcc  
alpha                randconfig-r015-20230620   gcc  
alpha                randconfig-r022-20230620   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                  randconfig-r003-20230621   gcc  
arc                  randconfig-r012-20230620   gcc  
arc                  randconfig-r015-20230620   gcc  
arc                  randconfig-r022-20230620   gcc  
arc                  randconfig-r024-20230620   gcc  
arc                  randconfig-r043-20230620   gcc  
arc                  randconfig-r043-20230622   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                          collie_defconfig   clang
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                           imxrt_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                            mmp2_defconfig   clang
arm                            mps2_defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                       netwinder_defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r033-20230620   gcc  
arm                  randconfig-r046-20230620   clang
arm                         s5pv210_defconfig   clang
arm                        shmobile_defconfig   gcc  
arm                        spear6xx_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230620   gcc  
csky                             alldefconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r005-20230620   gcc  
csky                 randconfig-r006-20230620   gcc  
csky                 randconfig-r011-20230620   gcc  
csky                 randconfig-r032-20230620   gcc  
csky                 randconfig-r034-20230620   gcc  
hexagon              randconfig-r003-20230622   clang
hexagon              randconfig-r006-20230620   clang
hexagon              randconfig-r016-20230620   clang
hexagon              randconfig-r041-20230620   clang
hexagon              randconfig-r045-20230620   clang
i386                             alldefconfig   gcc  
i386                             allyesconfig   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230620   clang
i386         buildonly-randconfig-r004-20230622   clang
i386         buildonly-randconfig-r005-20230620   clang
i386         buildonly-randconfig-r005-20230622   clang
i386         buildonly-randconfig-r006-20230620   clang
i386         buildonly-randconfig-r006-20230622   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230620   clang
i386                 randconfig-i001-20230622   clang
i386                 randconfig-i002-20230620   clang
i386                 randconfig-i002-20230622   clang
i386                 randconfig-i003-20230620   clang
i386                 randconfig-i004-20230620   clang
i386                 randconfig-i004-20230622   clang
i386                 randconfig-i005-20230620   clang
i386                 randconfig-i005-20230622   clang
i386                 randconfig-i006-20230620   clang
i386                 randconfig-i006-20230622   clang
i386                 randconfig-i011-20230620   gcc  
i386                 randconfig-i011-20230622   gcc  
i386                 randconfig-i012-20230620   gcc  
i386                 randconfig-i012-20230622   gcc  
i386                 randconfig-i013-20230620   gcc  
i386                 randconfig-i014-20230620   gcc  
i386                 randconfig-i014-20230622   gcc  
i386                 randconfig-i015-20230620   gcc  
i386                 randconfig-i015-20230622   gcc  
i386                 randconfig-i016-20230620   gcc  
i386                 randconfig-i016-20230622   gcc  
i386                 randconfig-r004-20230620   clang
i386                 randconfig-r013-20230620   gcc  
i386                 randconfig-r026-20230620   gcc  
i386                 randconfig-r026-20230622   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230620   gcc  
loongarch            randconfig-r006-20230620   gcc  
loongarch            randconfig-r021-20230622   gcc  
loongarch            randconfig-r024-20230622   gcc  
loongarch            randconfig-r031-20230620   gcc  
loongarch            randconfig-r036-20230620   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                 randconfig-r004-20230620   gcc  
m68k                 randconfig-r021-20230620   gcc  
m68k                 randconfig-r023-20230620   gcc  
m68k                 randconfig-r036-20230620   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r003-20230620   gcc  
microblaze           randconfig-r011-20230620   gcc  
microblaze           randconfig-r014-20230620   gcc  
microblaze           randconfig-r023-20230620   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                           gcw0_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                     loongson1c_defconfig   clang
mips                     loongson2k_defconfig   clang
mips                malta_qemu_32r6_defconfig   clang
mips                      maltaaprp_defconfig   clang
mips                           mtx1_defconfig   clang
mips                 randconfig-r013-20230620   clang
mips                 randconfig-r032-20230620   gcc  
mips                 randconfig-r035-20230620   gcc  
mips                          rb532_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230620   gcc  
nios2                randconfig-r006-20230620   gcc  
nios2                randconfig-r026-20230620   gcc  
openrisc             randconfig-r025-20230620   gcc  
openrisc             randconfig-r031-20230620   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc               randconfig-r001-20230620   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                      makalu_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   clang
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      obs600_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc                       ppc64_defconfig   gcc  
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r014-20230620   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm8541_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230620   clang
riscv                randconfig-r003-20230620   clang
riscv                randconfig-r013-20230622   gcc  
riscv                randconfig-r031-20230620   clang
riscv                randconfig-r034-20230620   clang
riscv                randconfig-r035-20230620   clang
riscv                randconfig-r042-20230620   gcc  
riscv                randconfig-r042-20230622   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230622   clang
s390                 randconfig-r002-20230620   clang
s390                 randconfig-r005-20230620   clang
s390                 randconfig-r011-20230622   gcc  
s390                 randconfig-r015-20230620   gcc  
s390                 randconfig-r024-20230620   gcc  
s390                 randconfig-r033-20230620   clang
s390                 randconfig-r044-20230620   gcc  
s390                 randconfig-r044-20230622   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r012-20230620   gcc  
sh                   randconfig-r016-20230620   gcc  
sh                   randconfig-r024-20230620   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230620   gcc  
sparc                randconfig-r012-20230622   gcc  
sparc                randconfig-r035-20230620   gcc  
sparc64              randconfig-r012-20230620   gcc  
sparc64              randconfig-r016-20230620   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r004-20230620   gcc  
um                   randconfig-r012-20230620   clang
um                   randconfig-r025-20230620   clang
um                   randconfig-r026-20230620   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230620   clang
x86_64       buildonly-randconfig-r001-20230622   clang
x86_64       buildonly-randconfig-r002-20230620   clang
x86_64       buildonly-randconfig-r002-20230622   clang
x86_64       buildonly-randconfig-r003-20230620   clang
x86_64       buildonly-randconfig-r003-20230622   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r013-20230620   gcc  
x86_64               randconfig-r022-20230622   gcc  
x86_64               randconfig-r025-20230622   gcc  
x86_64               randconfig-r034-20230620   clang
x86_64               randconfig-r036-20230620   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa               randconfig-r002-20230620   gcc  
xtensa               randconfig-r021-20230620   gcc  
xtensa               randconfig-r035-20230621   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
