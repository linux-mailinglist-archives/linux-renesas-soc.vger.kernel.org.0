Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7D5956C585
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Jul 2022 02:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiGIAmR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jul 2022 20:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiGIAmQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jul 2022 20:42:16 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA3AA3D44
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Jul 2022 17:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657327336; x=1688863336;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OZBiT11fjlNvChiMR+vOxInEQqZPujIGsiByUK1LG40=;
  b=G4oifBcS0xDXTfd2gc2LrQfuE45jYLSnANy3BDHBYKHqMAHMw0qVn1LW
   XSYP/EEsU9uL84VBszat9fsZQ0idgP06NaEAuRriYmGWvM7/MeMn3wzRa
   pdWoeOoffmeb7C6uJhXMXDs6yLOQkcTsVHAurkpUgdZdXXYB3tvCRFx6c
   FQElRBqIL2MWL15oFrCD3I8ju+rXEnzI04xCwANjfgD9x68ueaOS8uXVA
   ZSI4lWHRqysCNvpFuUCwMFQArlGrXHyEJa3jRR1Ap9t4tYK83GgB+ISC5
   sbT1YvOrKrjPN8nOfrxe23ambEGLzvuih7MzYOVMq9abSVA5/7iJ2kH42
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="285136653"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="285136653"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 17:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="621426858"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Jul 2022 17:42:14 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o9yY1-000O6k-Td;
        Sat, 09 Jul 2022 00:42:13 +0000
Date:   Sat, 09 Jul 2022 08:41:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 b5468cb7909f0068dd977e1f63ea39132098dbb7
Message-ID: <62c8cecf.gEdUaeGj79dzTopA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: b5468cb7909f0068dd977e1f63ea39132098dbb7  Merge branches 'renesas-arm-dt-for-v5.20' and 'renesas-dt-bindings-for-v5.20' into renesas-next

elapsed time: 2330m

configs tested: 175
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
m68k                        mvme147_defconfig
m68k                             alldefconfig
xtensa                       common_defconfig
sh                               j2_defconfig
powerpc                     sequoia_defconfig
arm                           h3600_defconfig
mips                         rt305x_defconfig
sh                                  defconfig
sh                          rsk7269_defconfig
alpha                            alldefconfig
openrisc                            defconfig
arm                          badge4_defconfig
powerpc                  storcenter_defconfig
arc                         haps_hs_defconfig
mips                             allmodconfig
arc                            hsdk_defconfig
arm                        cerfcube_defconfig
powerpc                     asp8347_defconfig
arm                          pxa910_defconfig
arc                      axs103_smp_defconfig
powerpc                      mgcoge_defconfig
sh                             shx3_defconfig
mips                           xway_defconfig
powerpc                 mpc8540_ads_defconfig
nios2                            allyesconfig
sh                           se7705_defconfig
powerpc                     tqm8548_defconfig
ia64                          tiger_defconfig
sh                          rsk7264_defconfig
sh                        edosk7705_defconfig
m68k                       m5249evb_defconfig
arc                        nsimosci_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                           stm32_defconfig
sh                   sh7770_generic_defconfig
mips                         tb0226_defconfig
powerpc                     ep8248e_defconfig
powerpc                 linkstation_defconfig
arm                         vf610m4_defconfig
sh                           se7619_defconfig
sh                           se7712_defconfig
arm                        mvebu_v7_defconfig
sh                         ap325rxa_defconfig
arm                        spear6xx_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7721_defconfig
sh                           se7750_defconfig
riscv                               defconfig
sh                           se7722_defconfig
xtensa                              defconfig
powerpc                     tqm8555_defconfig
arm                             ezx_defconfig
mips                 decstation_r4k_defconfig
powerpc                    adder875_defconfig
sh                              ul2_defconfig
arm                        keystone_defconfig
sh                   secureedge5410_defconfig
arm                           u8500_defconfig
arc                     nsimosci_hs_defconfig
m68k                            q40_defconfig
powerpc                      ppc6xx_defconfig
arm                      jornada720_defconfig
arm                        clps711x_defconfig
arm                        oxnas_v6_defconfig
powerpc                        warp_defconfig
m68k                           sun3_defconfig
sh                          r7780mp_defconfig
x86_64                           alldefconfig
xtensa                generic_kc705_defconfig
sh                   sh7724_generic_defconfig
sh                           se7724_defconfig
sh                     magicpanelr2_defconfig
xtensa                    xip_kc705_defconfig
arm                            qcom_defconfig
microblaze                      mmu_defconfig
s390                          debug_defconfig
m68k                       m5475evb_defconfig
sh                         microdev_defconfig
sh                           sh2007_defconfig
sh                         ecovec24_defconfig
arm                            hisi_defconfig
powerpc                     taishan_defconfig
parisc64                            defconfig
nios2                            alldefconfig
mips                      maltasmvp_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
powerpc                          allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
arm                  randconfig-c002-20220707
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220707
arc                  randconfig-r043-20220707
s390                 randconfig-r044-20220707
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                  mpc885_ads_defconfig
powerpc                    mvme5100_defconfig
mips                     loongson1c_defconfig
mips                   sb1250_swarm_defconfig
arm                      pxa255-idp_defconfig
powerpc                     tqm8540_defconfig
mips                         tb0287_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                    gamecube_defconfig
arm                            dove_defconfig
arm                        multi_v5_defconfig
powerpc                 mpc8315_rdb_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220707
hexagon              randconfig-r041-20220707

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
