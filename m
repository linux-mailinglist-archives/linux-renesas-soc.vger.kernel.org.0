Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5FFF4C532B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 26 Feb 2022 02:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiBZB5f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Feb 2022 20:57:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiBZB5e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Feb 2022 20:57:34 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22EEA2DFFF5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 17:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645840595; x=1677376595;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d+n2OiepBqYl1/UHGnuyGvHNwjiPMqRUBRhEvPh64X4=;
  b=BKGft6a7qWj2dl3jwqwzE+2hQTSTtjGCYCYcWBxXNU9F1iry2EG1Xc5o
   1ZJheT4vV/aFuSwesTmTzPkiXL7WzLdDmSA7ZchSUn3+zBc5H813WtGia
   5HFlu52qIPU4Ody+6LypyhlXqO6TYTDy20ulayB4eg3Upfify1M5CNdEz
   H4Vh0E/EtUOY/PnadCS5HIosfM2EFwqAivW8qgG2vkh6ChPEx5kde2cHf
   jf/5nSqmRb+0UazYTr+WLPist0IgMhhjrzoJxIrtt8LJw2VpaUAQXjHBh
   1pkTBYuK2bebVGsP7H5gU6C+4Mp2KooukT9If/Df+9CwG5uyEWQb/WiMO
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="251451552"
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; 
   d="scan'208";a="251451552"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 17:56:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; 
   d="scan'208";a="509463092"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Feb 2022 17:56:32 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nNmJz-0004vQ-LK; Sat, 26 Feb 2022 01:56:31 +0000
Date:   Sat, 26 Feb 2022 09:55:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl] BUILD SUCCESS
 babe298e9caaa3d723f9721647eeac22309941d8
Message-ID: <6219889c.8Bf8ifAHBMJPNLfB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
branch HEAD: babe298e9caaa3d723f9721647eeac22309941d8  pinctrl: renesas: r8a779f0: Add Ethernet pins, groups, and functions

elapsed time: 723m

configs tested: 160
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20220225
mips                 randconfig-c004-20220225
powerpc                      pcm030_defconfig
m68k                          sun3x_defconfig
powerpc                    klondike_defconfig
sh                          rsk7203_defconfig
s390                          debug_defconfig
arm                        shmobile_defconfig
sh                         microdev_defconfig
sh                          kfr2r09_defconfig
sparc                       sparc64_defconfig
ia64                         bigsur_defconfig
mips                      loongson3_defconfig
xtensa                           allyesconfig
sh                          sdk7780_defconfig
powerpc                     asp8347_defconfig
arm                          exynos_defconfig
nios2                         3c120_defconfig
sh                        edosk7705_defconfig
arm                           h5000_defconfig
arc                      axs103_smp_defconfig
mips                         tb0226_defconfig
arm                       imx_v6_v7_defconfig
arm                         assabet_defconfig
mips                  decstation_64_defconfig
sh                        dreamcast_defconfig
xtensa                         virt_defconfig
s390                             allyesconfig
arm                           tegra_defconfig
mips                         rt305x_defconfig
arm                           sama5_defconfig
arm64                            alldefconfig
sh                            shmin_defconfig
powerpc                     pq2fads_defconfig
csky                                defconfig
powerpc                        warp_defconfig
m68k                        mvme147_defconfig
microblaze                      mmu_defconfig
nios2                         10m50_defconfig
h8300                               defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                       m5208evb_defconfig
mips                     decstation_defconfig
powerpc                     stx_gp3_defconfig
m68k                       m5475evb_defconfig
powerpc                     tqm8548_defconfig
s390                       zfcpdump_defconfig
powerpc                      tqm8xx_defconfig
mips                        vocore2_defconfig
arm                        trizeps4_defconfig
openrisc                         alldefconfig
powerpc                     redwood_defconfig
i386                             alldefconfig
powerpc                         wii_defconfig
arm                          pxa910_defconfig
arm                           sunxi_defconfig
sh                        sh7785lcr_defconfig
mips                     loongson1b_defconfig
arm                        mvebu_v7_defconfig
powerpc                       maple_defconfig
powerpc                     ep8248e_defconfig
sh                          lboxre2_defconfig
m68k                          hp300_defconfig
parisc                generic-32bit_defconfig
powerpc                      ppc40x_defconfig
arm                            zeus_defconfig
arc                            hsdk_defconfig
arm                        keystone_defconfig
powerpc                     tqm8555_defconfig
arc                          axs103_defconfig
um                               alldefconfig
arm                      integrator_defconfig
arm                  randconfig-c002-20220225
arm                  randconfig-c002-20220226
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
arc                  randconfig-r043-20220225
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220225
x86_64                        randconfig-c007
arm                  randconfig-c002-20220225
mips                 randconfig-c004-20220225
i386                          randconfig-c001
riscv                randconfig-c006-20220225
s390                             alldefconfig
arm                       mainstone_defconfig
mips                          ath25_defconfig
powerpc                     kilauea_defconfig
powerpc                    ge_imp3a_defconfig
mips                      bmips_stb_defconfig
powerpc                   microwatt_defconfig
powerpc                     ppa8548_defconfig
arm                     am200epdkit_defconfig
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220225
hexagon              randconfig-r041-20220225
riscv                randconfig-r042-20220225
hexagon              randconfig-r045-20220226
hexagon              randconfig-r041-20220226
s390                 randconfig-r044-20220225

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
