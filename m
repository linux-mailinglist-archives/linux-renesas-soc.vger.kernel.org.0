Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 441ED52758A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 May 2022 06:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235347AbiEOEpH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 15 May 2022 00:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbiEOEpF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 15 May 2022 00:45:05 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A4917062
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 May 2022 21:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652589904; x=1684125904;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M/BonuqfnGo4YRORilhfjY0kzsFq80KyBSazN+PkqME=;
  b=FaEvmI2w8NxGt0sckZzLzpJJ0RMEqJ7Mr0XHImwd1Swn1dbvUvXUYqlQ
   5cQz8qfHR2STYZcdQpNguvGSmEJIo9ZvoVnM0HrfXCWmx+sjuJauNUNHa
   6kSxokzrwe3DcNeNslyljzbzEqUg+ZFArl+VqFylCAXvQMVG4AB/66PRp
   tllcIt+E/Qc1b63mJ2WNbq6kFWOQUrMuutybLwl/Jy1IbusgNdloXNYnk
   JZqF7TpKOdZCszcCJmcHcSdBwTHs/n8xl4WUGZ1UKb4VSg32bwKopteyS
   m6pHmkJr2FAYYv+8En0/JCUK1J7Fk6FRgC3j2dxv7qgQdF8sVJp8juAPu
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="251109401"
X-IronPort-AV: E=Sophos;i="5.91,227,1647327600"; 
   d="scan'208";a="251109401"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2022 21:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,227,1647327600"; 
   d="scan'208";a="521975143"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 May 2022 21:45:01 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nq67n-0001Ip-Oo;
        Sun, 15 May 2022 04:44:59 +0000
Date:   Sun, 15 May 2022 12:44:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.19] BUILD SUCCESS
 ad1bd2bf658062c6edc5ff1ee1725565a4fc8930
Message-ID: <6280853c.bAnxUl8DKExgCDLG%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.19
branch HEAD: ad1bd2bf658062c6edc5ff1ee1725565a4fc8930  arm64: dts: renesas: Add initial device tree for RZ/V2M EVK

elapsed time: 12673m

configs tested: 457
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220509
m68k                             allmodconfig
xtensa                       common_defconfig
arm                      jornada720_defconfig
sh                      rts7751r2d1_defconfig
arm                           stm32_defconfig
csky                                defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                     tqm8555_defconfig
sh                ecovec24-romimage_defconfig
arm                           sunxi_defconfig
ia64                             alldefconfig
arm                          exynos_defconfig
h8300                    h8300h-sim_defconfig
arm                        multi_v7_defconfig
powerpc                      mgcoge_defconfig
xtensa                    smp_lx200_defconfig
ia64                      gensparse_defconfig
arm                          simpad_defconfig
arm                        cerfcube_defconfig
sh                          r7785rp_defconfig
sh                          urquell_defconfig
m68k                       m5249evb_defconfig
m68k                       m5475evb_defconfig
arm                            pleb_defconfig
mips                          rb532_defconfig
riscv                               defconfig
powerpc                     sequoia_defconfig
arc                          axs103_defconfig
xtensa                  audio_kc705_defconfig
xtensa                           alldefconfig
m68k                       m5275evb_defconfig
xtensa                    xip_kc705_defconfig
h8300                     edosk2674_defconfig
arm                            hisi_defconfig
mips                        bcm47xx_defconfig
sh                              ul2_defconfig
sh                           se7712_defconfig
sh                             sh03_defconfig
sh                   sh7724_generic_defconfig
m68k                          atari_defconfig
powerpc                       eiger_defconfig
mips                         tb0226_defconfig
powerpc                      cm5200_defconfig
ia64                         bigsur_defconfig
powerpc                     redwood_defconfig
mips                  decstation_64_defconfig
h8300                       h8s-sim_defconfig
sh                          kfr2r09_defconfig
mips                           xway_defconfig
powerpc                      pasemi_defconfig
arm                        mini2440_defconfig
m68k                        m5272c3_defconfig
sh                          rsk7201_defconfig
arm                         at91_dt_defconfig
mips                             allyesconfig
arm                         axm55xx_defconfig
arm                        spear6xx_defconfig
x86_64                           alldefconfig
powerpc                     tqm8548_defconfig
m68k                       bvme6000_defconfig
arm                        clps711x_defconfig
sh                           se7705_defconfig
mips                       bmips_be_defconfig
arm                       omap2plus_defconfig
sh                          rsk7203_defconfig
sh                        sh7763rdp_defconfig
powerpc                 mpc8540_ads_defconfig
sh                          landisk_defconfig
xtensa                  nommu_kc705_defconfig
arm                         cm_x300_defconfig
parisc64                         alldefconfig
m68k                            mac_defconfig
powerpc                        warp_defconfig
powerpc                     taishan_defconfig
sh                                  defconfig
powerpc                  storcenter_defconfig
mips                           ci20_defconfig
sh                           se7721_defconfig
s390                       zfcpdump_defconfig
m68k                           sun3_defconfig
arm                       aspeed_g5_defconfig
powerpc                    sam440ep_defconfig
sh                           se7619_defconfig
arc                        nsim_700_defconfig
sh                         ecovec24_defconfig
sh                               allmodconfig
sh                        dreamcast_defconfig
mips                 decstation_r4k_defconfig
powerpc64                        alldefconfig
arc                        nsimosci_defconfig
um                           x86_64_defconfig
sparc64                             defconfig
arm                            zeus_defconfig
nios2                            alldefconfig
sh                           sh2007_defconfig
i386                                defconfig
sparc                       sparc32_defconfig
sh                         ap325rxa_defconfig
x86_64                              defconfig
xtensa                         virt_defconfig
m68k                            q40_defconfig
arm                        keystone_defconfig
powerpc                 mpc85xx_cds_defconfig
parisc                generic-64bit_defconfig
sh                   secureedge5410_defconfig
arc                                 defconfig
mips                             allmodconfig
powerpc                     ep8248e_defconfig
sh                             espt_defconfig
arm                       multi_v4t_defconfig
arm                             ezx_defconfig
xtensa                              defconfig
arm                           sama5_defconfig
arm                       imx_v6_v7_defconfig
sh                        edosk7705_defconfig
ia64                          tiger_defconfig
openrisc                            defconfig
sh                         microdev_defconfig
powerpc                     stx_gp3_defconfig
mips                           jazz_defconfig
um                               alldefconfig
openrisc                    or1ksim_defconfig
nios2                            allyesconfig
powerpc                mpc7448_hpc2_defconfig
mips                            ar7_defconfig
powerpc                       holly_defconfig
arm                        trizeps4_defconfig
m68k                          hp300_defconfig
sparc                       sparc64_defconfig
sh                          polaris_defconfig
powerpc                         wii_defconfig
arm                           viper_defconfig
arm                         lpc18xx_defconfig
nios2                         10m50_defconfig
arm64                            alldefconfig
m68k                          sun3x_defconfig
h8300                            allyesconfig
powerpc                     rainier_defconfig
sparc                               defconfig
sh                           se7750_defconfig
powerpc                 mpc837x_rdb_defconfig
s390                                defconfig
arm                         lubbock_defconfig
openrisc                 simple_smp_defconfig
arc                     haps_hs_smp_defconfig
m68k                        mvme16x_defconfig
mips                         mpc30x_defconfig
sh                           se7343_defconfig
parisc                generic-32bit_defconfig
alpha                               defconfig
mips                         bigsur_defconfig
sh                   rts7751r2dplus_defconfig
sh                           se7751_defconfig
parisc                           alldefconfig
arc                      axs103_smp_defconfig
powerpc                      makalu_defconfig
m68k                       m5208evb_defconfig
mips                      fuloong2e_defconfig
powerpc                      ep88xc_defconfig
sh                          rsk7269_defconfig
alpha                            alldefconfig
m68k                        m5307c3_defconfig
nios2                         3c120_defconfig
arm                      integrator_defconfig
arm                          gemini_defconfig
powerpc                      pcm030_defconfig
alpha                            allyesconfig
arm                          lpd270_defconfig
mips                        vocore2_defconfig
powerpc                      bamboo_defconfig
arm                     eseries_pxa_defconfig
sh                 kfr2r09-romimage_defconfig
i386                             alldefconfig
m68k                        mvme147_defconfig
arm                             pxa_defconfig
sparc                            allyesconfig
ia64                        generic_defconfig
powerpc                      tqm8xx_defconfig
mips                           gcw0_defconfig
nios2                               defconfig
sh                          lboxre2_defconfig
arc                           tb10x_defconfig
microblaze                          defconfig
mips                         db1xxx_defconfig
powerpc                   currituck_defconfig
mips                      maltasmvp_defconfig
sh                            migor_defconfig
powerpc                    adder875_defconfig
sh                        apsh4ad0a_defconfig
arm                            mps2_defconfig
arm                        shmobile_defconfig
sh                               alldefconfig
mips                  maltasmvp_eva_defconfig
arm                            qcom_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                           allnoconfig
powerpc                      ppc6xx_defconfig
sh                          sdk7786_defconfig
powerpc                      chrp32_defconfig
arm                         s3c6400_defconfig
m68k                        stmark2_defconfig
powerpc                        cell_defconfig
arm                           h3600_defconfig
ia64                                defconfig
m68k                         amcore_defconfig
sh                            titan_defconfig
m68k                          amiga_defconfig
mips                       capcella_defconfig
arm                           tegra_defconfig
sh                        sh7757lcr_defconfig
sh                           se7722_defconfig
openrisc                  or1klitex_defconfig
xtensa                  cadence_csp_defconfig
arm                        oxnas_v6_defconfig
arm                             rpc_defconfig
powerpc                 mpc834x_mds_defconfig
arc                              alldefconfig
powerpc                     pq2fads_defconfig
sh                            shmin_defconfig
sh                     sh7710voipgw_defconfig
arm                          pxa910_defconfig
arc                     nsimosci_hs_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                         apsh4a3a_defconfig
arm                           corgi_defconfig
sh                        sh7785lcr_defconfig
powerpc                    amigaone_defconfig
um                             i386_defconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
sh                          sdk7780_defconfig
powerpc                         ps3_defconfig
powerpc                       ppc64_defconfig
arc                            hsdk_defconfig
mips                            gpr_defconfig
xtensa                           allyesconfig
sh                               j2_defconfig
riscv                    nommu_k210_defconfig
powerpc                  iss476-smp_defconfig
powerpc                 mpc834x_itx_defconfig
um                                  defconfig
arc                          axs101_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                      arches_defconfig
arm                        realview_defconfig
mips                     loongson1b_defconfig
powerpc                     asp8347_defconfig
h8300                               defconfig
arm                          iop32x_defconfig
sh                           se7724_defconfig
sh                          rsk7264_defconfig
sh                            hp6xx_defconfig
powerpc                     tqm8541_defconfig
powerpc                       maple_defconfig
sh                          r7780mp_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220506
arm                  randconfig-c002-20220508
x86_64               randconfig-c001-20220509
arm                  randconfig-c002-20220509
arm                  randconfig-c002-20220512
arm                  randconfig-c002-20220507
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                                defconfig
arc                              allyesconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64               randconfig-a015-20220509
x86_64               randconfig-a012-20220509
x86_64               randconfig-a016-20220509
x86_64               randconfig-a014-20220509
x86_64               randconfig-a013-20220509
x86_64               randconfig-a011-20220509
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                 randconfig-a011-20220509
i386                 randconfig-a013-20220509
i386                 randconfig-a016-20220509
i386                 randconfig-a015-20220509
i386                 randconfig-a014-20220509
i386                 randconfig-a012-20220509
arc                  randconfig-r043-20220509
s390                 randconfig-r044-20220509
riscv                randconfig-r042-20220509
s390                 randconfig-r044-20220512
riscv                randconfig-r042-20220512
arc                  randconfig-r043-20220512
arc                  randconfig-r043-20220507
s390                 randconfig-r044-20220507
riscv                randconfig-r042-20220507
arc                  randconfig-r043-20220513
s390                 randconfig-r044-20220510
riscv                randconfig-r042-20220510
arc                  randconfig-r043-20220510
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
powerpc              randconfig-c003-20220506
riscv                randconfig-c006-20220506
mips                 randconfig-c004-20220506
arm                  randconfig-c002-20220506
s390                 randconfig-c005-20220506
powerpc              randconfig-c003-20220507
riscv                randconfig-c006-20220507
mips                 randconfig-c004-20220507
arm                  randconfig-c002-20220507
powerpc              randconfig-c003-20220508
riscv                randconfig-c006-20220508
mips                 randconfig-c004-20220508
arm                  randconfig-c002-20220508
x86_64               randconfig-c007-20220509
i386                 randconfig-c001-20220509
powerpc              randconfig-c003-20220509
riscv                randconfig-c006-20220509
mips                 randconfig-c004-20220509
arm                  randconfig-c002-20220509
s390                 randconfig-c005-20220509
powerpc              randconfig-c003-20220512
riscv                randconfig-c006-20220512
mips                 randconfig-c004-20220512
arm                  randconfig-c002-20220512
powerpc              randconfig-c003-20220510
riscv                randconfig-c006-20220510
mips                 randconfig-c004-20220510
arm                  randconfig-c002-20220510
s390                 randconfig-c005-20220512
mips                        bcm63xx_defconfig
powerpc                     tqm5200_defconfig
powerpc                          allyesconfig
arm                           omap1_defconfig
mips                     cu1830-neo_defconfig
powerpc                      acadia_defconfig
arm                  colibri_pxa300_defconfig
arm                          pcm027_defconfig
powerpc                    mvme5100_defconfig
arm                                 defconfig
arm                          moxart_defconfig
arm                          collie_defconfig
powerpc                      ppc64e_defconfig
mips                         tb0219_defconfig
powerpc                     mpc5200_defconfig
arm                       cns3420vb_defconfig
mips                      pic32mzda_defconfig
x86_64                           allyesconfig
arm                         orion5x_defconfig
i386                             allyesconfig
powerpc                     ksi8560_defconfig
mips                          ath25_defconfig
mips                           rs90_defconfig
arm                         socfpga_defconfig
powerpc                     akebono_defconfig
powerpc                     powernv_defconfig
powerpc                          allmodconfig
mips                       rbtx49xx_defconfig
mips                        maltaup_defconfig
arm                      pxa255-idp_defconfig
arm                  colibri_pxa270_defconfig
arm                        magician_defconfig
arm                        vexpress_defconfig
arm                     davinci_all_defconfig
mips                        omega2p_defconfig
arm                       netwinder_defconfig
riscv                    nommu_virt_defconfig
arm                           spitz_defconfig
powerpc                          g5_defconfig
mips                  cavium_octeon_defconfig
powerpc                     tqm8540_defconfig
riscv                             allnoconfig
arm                       mainstone_defconfig
mips                           mtx1_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     skiroot_defconfig
powerpc                     tqm8560_defconfig
hexagon                             defconfig
powerpc                 mpc8560_ads_defconfig
mips                      malta_kvm_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                 mpc8272_ads_defconfig
mips                          ath79_defconfig
arm                          ixp4xx_defconfig
arm                            mmp2_defconfig
arm                            dove_defconfig
mips                        workpad_defconfig
arm                         lpc32xx_defconfig
arm                        mvebu_v5_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                   lite5200b_defconfig
mips                       lemote2f_defconfig
powerpc                    ge_imp3a_defconfig
mips                      maltaaprp_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      ppc44x_defconfig
arm                       aspeed_g4_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                         s5pv210_defconfig
arm                       versatile_defconfig
mips                malta_qemu_32r6_defconfig
arm                          pxa168_defconfig
powerpc                   bluestone_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64               randconfig-a003-20220509
x86_64               randconfig-a001-20220509
x86_64               randconfig-a002-20220509
x86_64               randconfig-a005-20220509
x86_64               randconfig-a004-20220509
x86_64               randconfig-a006-20220509
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
hexagon              randconfig-r045-20220512
hexagon              randconfig-r041-20220512
hexagon              randconfig-r045-20220509
hexagon              randconfig-r041-20220509
hexagon              randconfig-r045-20220508
riscv                randconfig-r042-20220508
hexagon              randconfig-r041-20220508

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
