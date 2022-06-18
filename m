Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E697C550469
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Jun 2022 14:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbiFRMWT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 18 Jun 2022 08:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbiFRMWT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 Jun 2022 08:22:19 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727CE1D0F4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jun 2022 05:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655554938; x=1687090938;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6/8pRgBGF9vkrAC4Jr2pSNumSFSk1FagBcYM+IZtxWE=;
  b=E8Z++BFngtclsUztdytL4rEF6Q39PRTcTkzaFQODluduCq2sIz1iqY+l
   hb5Wr3j50qkPTsCwr57SIDFz6cqAq+3YSvSor2iRNLLaKvBtRrBb76ZtX
   hRNay62doJTRZXRm1NpUaRwoN+ug4KvY1hzjizRrMk/DFr+OPoEWa1zHQ
   IjkLXy6JlCjDBTqV6p3mV8nyNPhGYHXpaiPecwqbowE/pKjgRIBogjcX6
   gwE/WDMhDCmrkPeL6z7apS3Y829HhDx+m0M9jCN4nX4z8Q00g/i+Jtc83
   OYPMnE/UqIFQB9mAeN++GXKlYodKX0nWWZG+Tg9t7aemF1u4hhCvJavPN
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280384422"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="280384422"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2022 05:22:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="688700508"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2022 05:22:16 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o2XSy-000QJ9-69;
        Sat, 18 Jun 2022 12:22:16 +0000
Date:   Sat, 18 Jun 2022 20:21:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 080bcd8d5997b1a615e17cab02bd9d16d1d4fbf3
Message-ID: <62adc359.hU1QlMEp2VApyux3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 080bcd8d5997b1a615e17cab02bd9d16d1d4fbf3  clk: renesas: r8a779f0: Add HSCIF clocks

elapsed time: 1662m

configs tested: 175
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
s390                       zfcpdump_defconfig
sh                           se7751_defconfig
sh                            migor_defconfig
mips                            gpr_defconfig
powerpc                    adder875_defconfig
sh                           se7724_defconfig
microblaze                          defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                         ps3_defconfig
sh                          r7780mp_defconfig
sh                           sh2007_defconfig
sh                   rts7751r2dplus_defconfig
m68k                       m5475evb_defconfig
parisc64                            defconfig
powerpc                     tqm8548_defconfig
mips                             allyesconfig
sh                             sh03_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                          pxa910_defconfig
powerpc                 mpc8540_ads_defconfig
arm                        spear6xx_defconfig
m68k                          amiga_defconfig
arm                         at91_dt_defconfig
sh                      rts7751r2d1_defconfig
sh                         microdev_defconfig
parisc64                         alldefconfig
arc                           tb10x_defconfig
arm                        cerfcube_defconfig
powerpc                        cell_defconfig
sh                          sdk7780_defconfig
mips                    maltaup_xpa_defconfig
sh                            titan_defconfig
mips                           ip32_defconfig
xtensa                              defconfig
um                             i386_defconfig
xtensa                         virt_defconfig
powerpc                     pq2fads_defconfig
m68k                            mac_defconfig
mips                           xway_defconfig
m68k                        mvme147_defconfig
powerpc                       maple_defconfig
sh                   secureedge5410_defconfig
xtensa                  audio_kc705_defconfig
arc                        vdk_hs38_defconfig
powerpc                      ep88xc_defconfig
powerpc                      ppc40x_defconfig
sh                            hp6xx_defconfig
xtensa                  nommu_kc705_defconfig
mips                             allmodconfig
arm                            zeus_defconfig
arc                    vdk_hs38_smp_defconfig
sparc64                          alldefconfig
powerpc                       holly_defconfig
xtensa                  cadence_csp_defconfig
mips                  decstation_64_defconfig
powerpc                     tqm8541_defconfig
m68k                          multi_defconfig
m68k                       m5249evb_defconfig
sparc64                             defconfig
ia64                         bigsur_defconfig
arm                       aspeed_g5_defconfig
powerpc                     rainier_defconfig
m68k                          hp300_defconfig
sh                          landisk_defconfig
sh                        edosk7760_defconfig
m68k                         amcore_defconfig
mips                      maltasmvp_defconfig
arm                           u8500_defconfig
powerpc                      arches_defconfig
arc                         haps_hs_defconfig
arc                        nsimosci_defconfig
sh                             shx3_defconfig
csky                             alldefconfig
mips                         tb0226_defconfig
m68k                        m5407c3_defconfig
sh                             espt_defconfig
sh                     sh7710voipgw_defconfig
arm                        realview_defconfig
m68k                       m5208evb_defconfig
sh                   sh7724_generic_defconfig
sh                              ul2_defconfig
riscv             nommu_k210_sdcard_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220617
ia64                                defconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220617
arc                  randconfig-r043-20220617
s390                 randconfig-r044-20220617
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                           sama7_defconfig
mips                      malta_kvm_defconfig
arm                       spear13xx_defconfig
arm                      pxa255-idp_defconfig
riscv                             allnoconfig
arm                          collie_defconfig
powerpc                       ebony_defconfig
arm                             mxs_defconfig
arm                         s3c2410_defconfig
arm                            mmp2_defconfig
powerpc                     mpc512x_defconfig
powerpc                     tqm5200_defconfig
arm                          moxart_defconfig
mips                      bmips_stb_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                          allmodconfig
powerpc                        icon_defconfig
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
hexagon              randconfig-r041-20220617
hexagon              randconfig-r045-20220617

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
