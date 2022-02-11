Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD4ED4B1C21
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Feb 2022 03:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347261AbiBKCW2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Feb 2022 21:22:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238163AbiBKCW1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Feb 2022 21:22:27 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23CAB37
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Feb 2022 18:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644546147; x=1676082147;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WEznxFLe5XPbzoY1Iit9TkjRwkNJDXiqhdW+WFnNlVE=;
  b=PH9PyEAnSbIFCq+lye5MLFgebomv0jZrW3Gl44E6qlqlhY6OlFRz0ZId
   kRG39kTaqbAZnYSiLzitGLK1B7PWyIPZnrzH9Uogv3U6I2SqBQvIOPj5G
   wrruLqXMwT2Qfw0U9hore6DRZXzE5NhYbHaJu1xesj8M3dsDFsI+G2WLM
   Ookg/YHMejDkNhxFo/xqDa8O4tqybnzAoRdzh7qXn6n/6BBTkB9JIP/5J
   EY3+50NX+I19HIxJCq/ugwpRt7H49pzYt0Wt3Af/Y6xhTzN0/NHOok21m
   zqd0Fg0OvP7JygXl2JEHQU5Ikvb0Y9uhb89lGz/5FgEtyDYC1+eLpbphk
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="310378925"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="310378925"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 18:22:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="701930157"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Feb 2022 18:22:25 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nILZp-00042j-86; Fri, 11 Feb 2022 02:22:25 +0000
Date:   Fri, 11 Feb 2022 10:22:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v5.18] BUILD SUCCESS
 a1bcf50a99dd1e40f0c6a963bd4f12547a89d4cd
Message-ID: <6205c84f.yrVNp5a9duRy3W6P%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.18
branch HEAD: a1bcf50a99dd1e40f0c6a963bd4f12547a89d4cd  clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC

elapsed time: 723m

configs tested: 185
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc              randconfig-c003-20220210
i386                          randconfig-c001
xtensa                         virt_defconfig
powerpc64                           defconfig
powerpc                     sequoia_defconfig
arm                          iop32x_defconfig
h8300                               defconfig
sh                           se7722_defconfig
sh                         ecovec24_defconfig
alpha                               defconfig
arm                         lpc18xx_defconfig
powerpc                       ppc64_defconfig
arm                        mini2440_defconfig
arm                       multi_v4t_defconfig
openrisc                 simple_smp_defconfig
sh                           se7206_defconfig
sh                            hp6xx_defconfig
parisc                generic-64bit_defconfig
arm                         cm_x300_defconfig
sh                            titan_defconfig
x86_64                           alldefconfig
powerpc                      ppc40x_defconfig
sh                        sh7757lcr_defconfig
arm                        shmobile_defconfig
mips                           ip32_defconfig
m68k                            q40_defconfig
powerpc                        warp_defconfig
s390                                defconfig
riscv                    nommu_k210_defconfig
powerpc                 mpc834x_itx_defconfig
arm                             ezx_defconfig
arm                        cerfcube_defconfig
nios2                            alldefconfig
sh                          urquell_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                       m5249evb_defconfig
powerpc                     tqm8541_defconfig
arm                           h3600_defconfig
powerpc                       eiger_defconfig
arm                         s3c6400_defconfig
csky                             alldefconfig
powerpc                      ep88xc_defconfig
ia64                         bigsur_defconfig
sh                        dreamcast_defconfig
arc                     nsimosci_hs_defconfig
mips                             allmodconfig
powerpc64                        alldefconfig
sh                                  defconfig
m68k                        m5407c3_defconfig
sh                   sh7770_generic_defconfig
arm                             pxa_defconfig
csky                                defconfig
powerpc                    klondike_defconfig
arc                              alldefconfig
um                                  defconfig
s390                          debug_defconfig
sh                          r7785rp_defconfig
arm                      footbridge_defconfig
alpha                            allyesconfig
m68k                          hp300_defconfig
powerpc                     tqm8555_defconfig
xtensa                              defconfig
arm                      jornada720_defconfig
arm                           sunxi_defconfig
powerpc                 linkstation_defconfig
sh                         microdev_defconfig
arc                    vdk_hs38_smp_defconfig
arm                        multi_v7_defconfig
sh                           se7750_defconfig
m68k                          amiga_defconfig
alpha                            alldefconfig
powerpc                      arches_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                  randconfig-c002-20220210
arm                  randconfig-c002-20220209
arm                  randconfig-c002-20220211
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                 randconfig-r044-20220209
arc                  randconfig-r043-20220208
arc                  randconfig-r043-20220209
riscv                randconfig-r042-20220210
riscv                randconfig-r042-20220209
arc                  randconfig-r043-20220210
s390                 randconfig-r044-20220210
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220209
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220209
i386                          randconfig-c001
mips                 randconfig-c004-20220209
arm                  randconfig-c002-20220209
riscv                randconfig-c006-20220210
powerpc              randconfig-c003-20220210
arm                  randconfig-c002-20220210
mips                 randconfig-c004-20220210
powerpc                     ksi8560_defconfig
powerpc                      ppc44x_defconfig
mips                            e55_defconfig
x86_64                           allyesconfig
arm                          ep93xx_defconfig
powerpc                    gamecube_defconfig
powerpc                  mpc885_ads_defconfig
mips                         tb0287_defconfig
powerpc                      ppc64e_defconfig
arm                          collie_defconfig
powerpc                    ge_imp3a_defconfig
arm                        multi_v5_defconfig
mips                       rbtx49xx_defconfig
hexagon                             defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     tqm5200_defconfig
powerpc                       ebony_defconfig
mips                      pic32mzda_defconfig
powerpc                     kilauea_defconfig
powerpc                     mpc5200_defconfig
powerpc                     akebono_defconfig
mips                          ath79_defconfig
arm                           omap1_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     tqm8540_defconfig
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
hexagon              randconfig-r045-20220210
hexagon              randconfig-r045-20220209
hexagon              randconfig-r041-20220210
hexagon              randconfig-r041-20220209
hexagon              randconfig-r045-20220208
hexagon              randconfig-r041-20220208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
