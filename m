Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B725527552
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 May 2022 06:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiEOEOF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 15 May 2022 00:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235418AbiEOEOD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 15 May 2022 00:14:03 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C256625C5B
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 May 2022 21:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652588041; x=1684124041;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E+Bx3Y7ynVP/pAecpdtox8Smqca11xaREXUkj5kw1HE=;
  b=LYYNPs89hlGhwqYukTlkvWnDLT/+KiIamAtlC5Of0BCtdx/R9aMEq6zJ
   VU0toFAlCI/4/qM4QHgE5V2dO58eoHIiuOwK5sSsuL5BMhYLMe7ahXy6M
   Dfmqud3mbYEDLV5jdROFdJ3y8/T1+iXOLRgo892JqYh90TPFYvZm4Xm4l
   yS46MV9Byfv5w1HkFIeM0ErwqXdDVoOPRuzS45u75OUN8mbyW76VayREo
   09iEeMKKrNLFDKVl2KcUilNfZDp4mwUDA3SeMjDkKlDY6mhxmLRUVvpJM
   9uak9sMA8XSS8XC00V6u2FEtEuYgD5GXZJzn+bnkbBlgHinTMaxL4QYfX
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="269418749"
X-IronPort-AV: E=Sophos;i="5.91,227,1647327600"; 
   d="scan'208";a="269418749"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2022 21:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,227,1647327600"; 
   d="scan'208";a="521967370"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 May 2022 21:13:58 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nq5dl-0001I4-LX;
        Sun, 15 May 2022 04:13:57 +0000
Date:   Sun, 15 May 2022 12:13:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dt-bindings-for-v5.19] BUILD SUCCESS 033a26dcbe10476c5203f590dce0537fac802d03
Message-ID: <62807df1.gtgpWFq8xomUE8rO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v5.19
branch HEAD: 033a26dcbe10476c5203f590dce0537fac802d03  dt-bindings: soc: renesas: Move renesas,rzg2l-sysc from arm to soc

elapsed time: 13996m

configs tested: 273
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                        clps711x_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                         tb0226_defconfig
m68k                             allmodconfig
xtensa                       common_defconfig
arm                      jornada720_defconfig
powerpc                     ep8248e_defconfig
nios2                            allyesconfig
sh                ecovec24-romimage_defconfig
arm                           sunxi_defconfig
ia64                             alldefconfig
arm                          exynos_defconfig
h8300                    h8300h-sim_defconfig
arm                        multi_v7_defconfig
powerpc                      mgcoge_defconfig
xtensa                    smp_lx200_defconfig
ia64                      gensparse_defconfig
riscv                               defconfig
powerpc                     sequoia_defconfig
arc                          axs103_defconfig
ia64                         bigsur_defconfig
powerpc                     redwood_defconfig
mips                  decstation_64_defconfig
h8300                       h8s-sim_defconfig
sh                          kfr2r09_defconfig
sh                           se7712_defconfig
sh                           se7705_defconfig
mips                       bmips_be_defconfig
s390                       zfcpdump_defconfig
m68k                           sun3_defconfig
sh                        dreamcast_defconfig
mips                 decstation_r4k_defconfig
powerpc64                        alldefconfig
arc                        nsimosci_defconfig
um                           x86_64_defconfig
arm                        spear6xx_defconfig
powerpc                      cm5200_defconfig
sh                         ap325rxa_defconfig
x86_64                              defconfig
mips                      loongson3_defconfig
sparc                            alldefconfig
powerpc                 mpc837x_rdb_defconfig
arm                        mini2440_defconfig
sh                   sh7724_generic_defconfig
xtensa                              defconfig
arm                           sama5_defconfig
sh                         microdev_defconfig
arm                         lpc18xx_defconfig
powerpc                    klondike_defconfig
mips                           jazz_defconfig
um                               alldefconfig
openrisc                    or1ksim_defconfig
m68k                          hp300_defconfig
sparc                       sparc64_defconfig
sh                          polaris_defconfig
sh                        sh7763rdp_defconfig
powerpc                         wii_defconfig
arm                           viper_defconfig
h8300                            allyesconfig
powerpc                     rainier_defconfig
sparc                               defconfig
sh                           se7750_defconfig
sh                                  defconfig
arm                     eseries_pxa_defconfig
powerpc                  storcenter_defconfig
sh                               allmodconfig
arm                         lubbock_defconfig
sh                           se7343_defconfig
parisc                generic-32bit_defconfig
alpha                               defconfig
powerpc                      pasemi_defconfig
mips                           ci20_defconfig
mips                         bigsur_defconfig
sh                   rts7751r2dplus_defconfig
i386                                defconfig
sh                 kfr2r09-romimage_defconfig
arm                         nhk8815_defconfig
powerpc                      ep88xc_defconfig
sh                          rsk7269_defconfig
alpha                            alldefconfig
m68k                        m5307c3_defconfig
powerpc                      pcm030_defconfig
arm                            zeus_defconfig
powerpc                       holly_defconfig
csky                                defconfig
sh                           se7721_defconfig
alpha                            allyesconfig
arm                          lpd270_defconfig
mips                        vocore2_defconfig
arm                             pxa_defconfig
arm                        cerfcube_defconfig
sparc                            allyesconfig
ia64                        generic_defconfig
m68k                          sun3x_defconfig
powerpc                      chrp32_defconfig
sh                        apsh4ad0a_defconfig
arm                       multi_v4t_defconfig
sh                          lboxre2_defconfig
arc                           tb10x_defconfig
sh                          sdk7786_defconfig
arm                         s3c6400_defconfig
arm                           stm32_defconfig
arm                       aspeed_g5_defconfig
m68k                        stmark2_defconfig
sh                             sh03_defconfig
m68k                       m5249evb_defconfig
arm                         cm_x300_defconfig
arm                            lart_defconfig
powerpc                     pq2fads_defconfig
arm                       imx_v6_v7_defconfig
openrisc                 simple_smp_defconfig
powerpc                       eiger_defconfig
mips                        bcm47xx_defconfig
m68k                          multi_defconfig
arc                              alldefconfig
arm                        shmobile_defconfig
m68k                         amcore_defconfig
sh                  sh7785lcr_32bit_defconfig
m68k                          amiga_defconfig
parisc                generic-64bit_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                         at91_dt_defconfig
sh                          sdk7780_defconfig
xtensa                           allyesconfig
sh                               j2_defconfig
riscv                    nommu_k210_defconfig
mips                            ar7_defconfig
arc                    vdk_hs38_smp_defconfig
arm                       omap2plus_defconfig
powerpc                      arches_defconfig
powerpc                     tqm8555_defconfig
powerpc                    adder875_defconfig
ia64                            zx1_defconfig
arm                        oxnas_v6_defconfig
mips                            gpr_defconfig
powerpc64                           defconfig
m68k                       m5475evb_defconfig
powerpc                     asp8347_defconfig
h8300                               defconfig
powerpc                    sam440ep_defconfig
sh                           se7722_defconfig
arm                          iop32x_defconfig
openrisc                            defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220506
arm                  randconfig-c002-20220508
arm                  randconfig-c002-20220505
arm                  randconfig-c002-20220507
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
arc                                 defconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
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
riscv                randconfig-r042-20220505
arc                  randconfig-r043-20220505
s390                 randconfig-r044-20220505
arc                  randconfig-r043-20220507
s390                 randconfig-r044-20220507
riscv                randconfig-r042-20220507
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
s390                 randconfig-c005-20220506
powerpc              randconfig-c003-20220506
riscv                randconfig-c006-20220506
mips                 randconfig-c004-20220506
arm                  randconfig-c002-20220506
powerpc              randconfig-c003-20220507
riscv                randconfig-c006-20220507
mips                 randconfig-c004-20220507
arm                  randconfig-c002-20220507
powerpc              randconfig-c003-20220508
riscv                randconfig-c006-20220508
mips                 randconfig-c004-20220508
arm                  randconfig-c002-20220508
powerpc              randconfig-c003-20220505
riscv                randconfig-c006-20220505
arm                  randconfig-c002-20220505
arm                           omap1_defconfig
arm                          moxart_defconfig
arm                          collie_defconfig
mips                         tb0219_defconfig
powerpc                     mpc5200_defconfig
arm                       cns3420vb_defconfig
mips                      pic32mzda_defconfig
i386                             allyesconfig
powerpc                     ksi8560_defconfig
mips                          ath25_defconfig
mips                           rs90_defconfig
arm                       spear13xx_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     skiroot_defconfig
hexagon                             defconfig
arm                            mmp2_defconfig
arm                     davinci_all_defconfig
arm                            dove_defconfig
arm                         lpc32xx_defconfig
arm                          ixp4xx_defconfig
powerpc                    ge_imp3a_defconfig
mips                      maltaaprp_defconfig
mips                   sb1250_swarm_defconfig
arm                           spitz_defconfig
hexagon                          alldefconfig
mips                malta_qemu_32r6_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a004-20220509
i386                 randconfig-a006-20220509
i386                 randconfig-a002-20220509
i386                 randconfig-a003-20220509
i386                 randconfig-a001-20220509
i386                 randconfig-a005-20220509
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220506
riscv                randconfig-r042-20220506
hexagon              randconfig-r041-20220506
hexagon              randconfig-r045-20220505
hexagon              randconfig-r041-20220505
hexagon              randconfig-r045-20220509
hexagon              randconfig-r045-20220508
riscv                randconfig-r042-20220508
hexagon              randconfig-r041-20220509
hexagon              randconfig-r041-20220508

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
