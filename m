Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E488524BCB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 May 2022 13:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353319AbiELLhV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 May 2022 07:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239947AbiELLhU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 May 2022 07:37:20 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C94A24096
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2022 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652355439; x=1683891439;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=A7IDXWiBwBIoE+rsomPjVF5Dirzz+mlRrWUhz9/kp7s=;
  b=HAmUlwm1HGK0ahbOWBUAmw9hN6IP9fxJSVaYvSm4QGooGgGz/ubfJ64F
   VD3TiCiiiVZRWy3ah5wU4vq7npa9q/dvRb5ZZtnBC17+CA7z/wiz13/Ux
   yM1Kh8IMpyIjRQjIBsiXyH+rfT/X1+J512pgKWwxgHxHl422jvzFXnKtR
   Tr7SiPcPXKqF3QSZ5L3uXHGJeC9Ln/Ky+WofcCZuJR3qBixWRRDoCrQgt
   qkcNExSI83MzhLjbM2CMZPJtAAqFMqaVCj14Gnmrv6JYHY0F88rWJWZVG
   A8LwEjpGOYf4RxCPexPdlN5+BvxsbvAlKk6NthQ/4c8fLoAcY0sAZ20aS
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="252026080"
X-IronPort-AV: E=Sophos;i="5.91,219,1647327600"; 
   d="scan'208";a="252026080"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 04:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,219,1647327600"; 
   d="scan'208";a="636816234"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 May 2022 04:37:17 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1np788-000KMm-Dd;
        Thu, 12 May 2022 11:37:16 +0000
Date:   Thu, 12 May 2022 19:37:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 7ae962c56cead900694de323c7b4f1b39568e2b6
Message-ID: <627cf15f.9T6Xiv6uVX7D8i6w%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 7ae962c56cead900694de323c7b4f1b39568e2b6  Merge branch 'renesas-arm-dt-for-v5.19' into renesas-next

elapsed time: 4447m

configs tested: 342
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220509
i386                          randconfig-c001
arm                           h5000_defconfig
m68k                          hp300_defconfig
alpha                            alldefconfig
arm                         nhk8815_defconfig
sh                               j2_defconfig
sh                         ap325rxa_defconfig
sh                      rts7751r2d1_defconfig
sh                          landisk_defconfig
powerpc                      mgcoge_defconfig
powerpc                     sequoia_defconfig
powerpc                      makalu_defconfig
arm                         axm55xx_defconfig
powerpc                 linkstation_defconfig
mips                       capcella_defconfig
sh                          rsk7269_defconfig
xtensa                         virt_defconfig
um                                  defconfig
m68k                       m5249evb_defconfig
sh                          urquell_defconfig
sh                           se7721_defconfig
powerpc                   currituck_defconfig
arm                           corgi_defconfig
mips                 decstation_r4k_defconfig
powerpc                        warp_defconfig
powerpc                       eiger_defconfig
mips                           xway_defconfig
powerpc                      pasemi_defconfig
arm                          pxa910_defconfig
arm                         lubbock_defconfig
parisc                           alldefconfig
arm                       omap2plus_defconfig
ia64                             alldefconfig
sh                          rsk7203_defconfig
arm                        spear6xx_defconfig
arm                           h3600_defconfig
arm                          iop32x_defconfig
arm                         cm_x300_defconfig
arm                             rpc_defconfig
mips                         cobalt_defconfig
riscv                            allyesconfig
parisc64                         alldefconfig
m68k                            mac_defconfig
powerpc                     taishan_defconfig
sh                          r7785rp_defconfig
sh                                  defconfig
powerpc                  storcenter_defconfig
sparc                       sparc64_defconfig
arm                       aspeed_g5_defconfig
ia64                        generic_defconfig
xtensa                  nommu_kc705_defconfig
sh                          sdk7780_defconfig
sh                           se7712_defconfig
arm                        clps711x_defconfig
arc                              alldefconfig
powerpc                           allnoconfig
sparc64                             defconfig
arm                            zeus_defconfig
nios2                            alldefconfig
sh                           sh2007_defconfig
i386                                defconfig
sh                          polaris_defconfig
sh                            hp6xx_defconfig
sparc                            alldefconfig
arc                         haps_hs_defconfig
arm                         at91_dt_defconfig
mips                    maltaup_xpa_defconfig
powerpc64                           defconfig
arc                        vdk_hs38_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                       imx_v6_v7_defconfig
xtensa                           alldefconfig
arm                         assabet_defconfig
arm                       multi_v4t_defconfig
nios2                               defconfig
powerpc                     tqm8548_defconfig
powerpc                       holly_defconfig
mips                        vocore2_defconfig
arm                        keystone_defconfig
riscv             nommu_k210_sdcard_defconfig
openrisc                            defconfig
sh                        sh7763rdp_defconfig
sh                   sh7724_generic_defconfig
nios2                            allyesconfig
h8300                    h8300h-sim_defconfig
m68k                          multi_defconfig
s390                             allyesconfig
mips                             allmodconfig
powerpc                    klondike_defconfig
arm                         lpc18xx_defconfig
powerpc                 mpc8540_ads_defconfig
nios2                         10m50_defconfig
sh                             sh03_defconfig
arc                                 defconfig
mips                             allyesconfig
s390                                defconfig
csky                                defconfig
openrisc                 simple_smp_defconfig
s390                       zfcpdump_defconfig
arc                          axs103_defconfig
arm                      footbridge_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                           se7343_defconfig
sh                          kfr2r09_defconfig
arm                             ezx_defconfig
sh                           se7751_defconfig
arc                      axs103_smp_defconfig
sh                        dreamcast_defconfig
ia64                      gensparse_defconfig
sh                ecovec24-romimage_defconfig
arm                           sunxi_defconfig
sh                         apsh4a3a_defconfig
xtensa                    xip_kc705_defconfig
mips                         tb0226_defconfig
powerpc                 canyonlands_defconfig
mips                            ar7_defconfig
xtensa                    smp_lx200_defconfig
sh                         microdev_defconfig
arm                      integrator_defconfig
xtensa                           allyesconfig
arm                          badge4_defconfig
powerpc                      tqm8xx_defconfig
mips                           gcw0_defconfig
arm                          simpad_defconfig
ia64                         bigsur_defconfig
xtensa                       common_defconfig
arm                            xcep_defconfig
sh                           se7724_defconfig
mips                           ci20_defconfig
arm                        cerfcube_defconfig
sh                            migor_defconfig
powerpc                     tqm8555_defconfig
openrisc                    or1ksim_defconfig
arm                      jornada720_defconfig
sh                          rsk7201_defconfig
powerpc                      cm5200_defconfig
arm                            mps2_defconfig
powerpc                      pcm030_defconfig
parisc                generic-32bit_defconfig
alpha                            allyesconfig
powerpc                         wii_defconfig
m68k                        stmark2_defconfig
m68k                        mvme147_defconfig
powerpc                        cell_defconfig
ia64                                defconfig
m68k                             allyesconfig
arm                           sama5_defconfig
m68k                        m5307c3_defconfig
sh                        sh7785lcr_defconfig
m68k                        m5272c3_defconfig
powerpc                     stx_gp3_defconfig
powerpc                      ppc6xx_defconfig
m68k                          amiga_defconfig
sh                         ecovec24_defconfig
mips                        bcm47xx_defconfig
arm                           tegra_defconfig
sh                        sh7757lcr_defconfig
sh                           se7722_defconfig
arm                          exynos_defconfig
openrisc                  or1klitex_defconfig
sh                          r7780mp_defconfig
m68k                       bvme6000_defconfig
sh                           se7206_defconfig
sh                          lboxre2_defconfig
sh                           se7780_defconfig
sh                        edosk7705_defconfig
sh                            shmin_defconfig
arm                           stm32_defconfig
sh                     sh7710voipgw_defconfig
ia64                          tiger_defconfig
sh                        apsh4ad0a_defconfig
arm                        trizeps4_defconfig
x86_64                              defconfig
powerpc                      ppc40x_defconfig
arm                            qcom_defconfig
arc                     nsimosci_hs_defconfig
mips                            gpr_defconfig
microblaze                          defconfig
powerpc                    adder875_defconfig
powerpc                       ppc64_defconfig
powerpc                         ps3_defconfig
arm                          lpd270_defconfig
powerpc                  iss476-smp_defconfig
powerpc                 mpc834x_itx_defconfig
arm                         s3c6400_defconfig
arc                          axs101_defconfig
mips                         mpc30x_defconfig
arm                            hisi_defconfig
sh                             espt_defconfig
riscv                    nommu_k210_defconfig
arc                        nsim_700_defconfig
powerpc                      ep88xc_defconfig
powerpc                     tqm8541_defconfig
powerpc                       maple_defconfig
x86_64               randconfig-c001-20220509
arm                  randconfig-c002-20220509
x86_64                        randconfig-c001
arm                  randconfig-c002-20220512
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
arc                              allyesconfig
alpha                               defconfig
h8300                            allyesconfig
sh                               allmodconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20220509
x86_64               randconfig-a012-20220509
x86_64               randconfig-a016-20220509
x86_64               randconfig-a014-20220509
x86_64               randconfig-a013-20220509
x86_64               randconfig-a011-20220509
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                 randconfig-a011-20220509
i386                 randconfig-a013-20220509
i386                 randconfig-a016-20220509
i386                 randconfig-a015-20220509
i386                 randconfig-a014-20220509
i386                 randconfig-a012-20220509
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220509
s390                 randconfig-r044-20220509
riscv                randconfig-r042-20220509
s390                 randconfig-r044-20220510
riscv                randconfig-r042-20220510
arc                  randconfig-r043-20220510
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64               randconfig-c007-20220509
i386                 randconfig-c001-20220509
powerpc              randconfig-c003-20220509
riscv                randconfig-c006-20220509
arm                  randconfig-c002-20220509
mips                 randconfig-c004-20220509
s390                 randconfig-c005-20220509
powerpc              randconfig-c003-20220510
x86_64                        randconfig-c007
riscv                randconfig-c006-20220510
mips                 randconfig-c004-20220510
i386                          randconfig-c001
arm                  randconfig-c002-20220510
s390                 randconfig-c005-20220512
powerpc              randconfig-c003-20220512
riscv                randconfig-c006-20220512
mips                 randconfig-c004-20220512
arm                  randconfig-c002-20220512
powerpc                      ppc64e_defconfig
mips                        bcm63xx_defconfig
mips                       lemote2f_defconfig
mips                          ath79_defconfig
mips                           ip28_defconfig
arm                           omap1_defconfig
mips                     cu1830-neo_defconfig
powerpc                    mvme5100_defconfig
arm                                 defconfig
arm                        magician_defconfig
powerpc                     kmeter1_defconfig
arm                        spear3xx_defconfig
arm                       imx_v4_v5_defconfig
powerpc                     ppa8548_defconfig
powerpc                 mpc836x_mds_defconfig
mips                          malta_defconfig
powerpc                      katmai_defconfig
powerpc                     tqm8540_defconfig
arm                         socfpga_defconfig
powerpc                     tqm8560_defconfig
arm                      pxa255-idp_defconfig
mips                        workpad_defconfig
arm                          pcm027_defconfig
powerpc                     akebono_defconfig
powerpc                     powernv_defconfig
powerpc                          allmodconfig
mips                       rbtx49xx_defconfig
mips                        maltaup_defconfig
mips                      maltaaprp_defconfig
hexagon                             defconfig
arm                         bcm2835_defconfig
mips                          ath25_defconfig
powerpc                   bluestone_defconfig
mips                           ip27_defconfig
powerpc                     skiroot_defconfig
arm                          ixp4xx_defconfig
arm                  colibri_pxa300_defconfig
arm                       versatile_defconfig
arm                          collie_defconfig
mips                     loongson1c_defconfig
arm                       netwinder_defconfig
arm                       aspeed_g4_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                     cu1000-neo_defconfig
arm                         orion5x_defconfig
arm                          pxa168_defconfig
x86_64               randconfig-a006-20220509
x86_64               randconfig-a002-20220509
x86_64               randconfig-a001-20220509
x86_64               randconfig-a004-20220509
x86_64               randconfig-a005-20220509
x86_64               randconfig-a003-20220509
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                 randconfig-a004-20220509
i386                 randconfig-a006-20220509
i386                 randconfig-a002-20220509
i386                 randconfig-a003-20220509
i386                 randconfig-a001-20220509
i386                 randconfig-a005-20220509
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220509
hexagon              randconfig-r041-20220509

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
