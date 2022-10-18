Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF4D60342C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Oct 2022 22:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiJRUqC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Oct 2022 16:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiJRUqA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Oct 2022 16:46:00 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E07274E1D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Oct 2022 13:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666125960; x=1697661960;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=m4Sn2UG+vZUPiRMZuW9nk2P6wwyr5xoPOM+1WRsnFFQ=;
  b=Hw8uLL7O2gjRmGexFRi0WzP9Mjw6RniY+CrkK2liW4O9tAvO1jLhCvSN
   SPr6UZD3pDOXYJe1HOSOBUNB+bakAe0bAvIY/yamaBtNHNhH8BijaXOpZ
   O18OnRcgdKqybb9yHY7ypD0b3+uR+oNnl5aMhzW0V1Kp1uF1VFEfiqD/K
   MatZL/VYJwu/5GOT+Z05LsJN97WrzG0lCjH4RLZtuAVaTJZEEOySD/xY7
   uR+pw0/6s/Sz+agCWaTMYW9Pyg5N9CZdnMMLYm4W3VjQSUObjGQqy4A9/
   Vc/H0w5SQLaoQh+mxpzNsSwoJOPghbCFPXQ3Uar9GxOBA7rgoxX4MAoUQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="392534466"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; 
   d="scan'208";a="392534466"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 13:45:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="606739609"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; 
   d="scan'208";a="606739609"
Received: from lkp-server01.sh.intel.com (HELO 8381f64adc98) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Oct 2022 13:45:57 -0700
Received: from kbuild by 8381f64adc98 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oktTI-0001zz-1u;
        Tue, 18 Oct 2022 20:45:56 +0000
Date:   Wed, 19 Oct 2022 04:45:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.2] BUILD SUCCESS
 888a358164525a701121192f504433de6c7a281b
Message-ID: <634f1073.L8m9xm3WCBe2CruO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.2
branch HEAD: 888a358164525a701121192f504433de6c7a281b  clk: renesas: r8a779a0: Fix SD0H clock name

elapsed time: 800m

configs tested: 163
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                                 defconfig
alpha                               defconfig
mips                             allyesconfig
s390                             allmodconfig
sh                               allmodconfig
s390                                defconfig
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20221017
s390                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a002
x86_64                              defconfig
x86_64                        randconfig-a004
x86_64                               rhel-8.3
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                           allyesconfig
i386                          randconfig-a005
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                  randconfig-r043-20221018
s390                 randconfig-r044-20221018
riscv                randconfig-r042-20221018
powerpc                 mpc85xx_cds_defconfig
arm                           h3600_defconfig
arc                            hsdk_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                    xip_kc705_defconfig
i386                          randconfig-c001
mips                     decstation_defconfig
powerpc                      makalu_defconfig
powerpc                      pcm030_defconfig
arm                        shmobile_defconfig
arm                          pxa3xx_defconfig
sh                          sdk7786_defconfig
powerpc                      arches_defconfig
sh                        dreamcast_defconfig
sh                                  defconfig
powerpc                      ppc40x_defconfig
xtensa                  audio_kc705_defconfig
m68k                          atari_defconfig
openrisc                       virt_defconfig
sparc64                             defconfig
powerpc                     taishan_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                        sh7757lcr_defconfig
powerpc                         wii_defconfig
arm                            lart_defconfig
sh                   sh7770_generic_defconfig
arc                    vdk_hs38_smp_defconfig
arc                     nsimosci_hs_defconfig
microblaze                      mmu_defconfig
sh                           se7343_defconfig
parisc                              defconfig
ia64                            zx1_defconfig
m68k                       m5208evb_defconfig
arm                         at91_dt_defconfig
arm                        cerfcube_defconfig
sh                  sh7785lcr_32bit_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                           jazz_defconfig
arm                         lpc18xx_defconfig
powerpc                     asp8347_defconfig
mips                  maltasmvp_eva_defconfig
sh                           se7751_defconfig
m68k                       m5275evb_defconfig
powerpc                     pq2fads_defconfig
powerpc                        cell_defconfig
arm                         cm_x300_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
sh                   sh7724_generic_defconfig
ia64                          tiger_defconfig
powerpc                      ppc6xx_defconfig
arc                           tb10x_defconfig
openrisc                 simple_smp_defconfig
m68k                          hp300_defconfig
arm                          gemini_defconfig
mips                            gpr_defconfig
sparc                             allnoconfig
powerpc                     tqm8541_defconfig
powerpc                     stx_gp3_defconfig
powerpc                   currituck_defconfig
powerpc                 mpc834x_mds_defconfig
arm                        trizeps4_defconfig
powerpc                 linkstation_defconfig
m68k                        mvme16x_defconfig
ia64                                defconfig
arm                        mvebu_v7_defconfig
nios2                               defconfig
m68k                          amiga_defconfig
openrisc                         alldefconfig
arm                      jornada720_defconfig
ia64                             allmodconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20221018

clang tested configs:
x86_64               randconfig-a013-20221017
x86_64               randconfig-a014-20221017
x86_64               randconfig-a012-20221017
x86_64               randconfig-a011-20221017
x86_64               randconfig-a015-20221017
hexagon              randconfig-r045-20221017
hexagon              randconfig-r041-20221017
s390                 randconfig-r044-20221017
riscv                randconfig-r042-20221017
x86_64               randconfig-a016-20221017
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                 randconfig-a011-20221017
i386                 randconfig-a013-20221017
x86_64                        randconfig-a005
i386                 randconfig-a012-20221017
i386                 randconfig-a014-20221017
i386                 randconfig-a016-20221017
i386                          randconfig-a002
i386                 randconfig-a015-20221017
i386                          randconfig-a004
i386                          randconfig-a006
powerpc                 mpc832x_mds_defconfig
arm                         socfpga_defconfig
mips                           rs90_defconfig
x86_64                        randconfig-c007
mips                 randconfig-c004-20221018
i386                          randconfig-c001
s390                 randconfig-c005-20221018
arm                  randconfig-c002-20221018
riscv                randconfig-c006-20221018
powerpc              randconfig-c003-20221018
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                      pxa255-idp_defconfig
mips                       lemote2f_defconfig
x86_64                        randconfig-k001
arm                      tct_hammer_defconfig
riscv                             allnoconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
