Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663B727929E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Sep 2020 22:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgIYUsY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Sep 2020 16:48:24 -0400
Received: from mga11.intel.com ([192.55.52.93]:38736 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726316AbgIYUsY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Sep 2020 16:48:24 -0400
IronPort-SDR: TY6KNjxjAmBdGF/exh6AuXqlri271sXhUlK3uEj8VyVQyz/zY+75RNwAPWXPX100JQ2BZ/xA29
 /myzUT0SS2LA==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="158975397"
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; 
   d="scan'208";a="158975397"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 12:42:33 -0700
IronPort-SDR: 2F+3oWVPaa8Q0/eST+agakydgVVzfhIDqBSS4+3vB/OcNvdnJWDqRAbH1Wd3scKi4ThcvNXI6V
 z5L7Ze7Uii0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; 
   d="scan'208";a="323505960"
Received: from lkp-server01.sh.intel.com (HELO 2dda29302fe3) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Sep 2020 12:42:32 -0700
Received: from kbuild by 2dda29302fe3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kLtbz-0000EW-AL; Fri, 25 Sep 2020 19:42:31 +0000
Date:   Sat, 26 Sep 2020 03:41:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 8e7dfce6a3935c3c513cc5028ae46b2b84d44266
Message-ID: <5f6e4803.92jdGaop5KTVEbZT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  renesas-clk
branch HEAD: 8e7dfce6a3935c3c513cc5028ae46b2b84d44266  clk: renesas: r8a779a0: Make rcar_r8a779a0_cpg_clk_register() static

elapsed time: 723m

configs tested: 206
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                      axs103_smp_defconfig
arc                            hsdk_defconfig
arm                        multi_v5_defconfig
arm                          ixp4xx_defconfig
mips                      maltaaprp_defconfig
sh                           se7722_defconfig
powerpc                     tqm8548_defconfig
mips                  decstation_64_defconfig
arm                      integrator_defconfig
arm                          imote2_defconfig
sh                ecovec24-romimage_defconfig
arm                      footbridge_defconfig
arm                           h5000_defconfig
powerpc                     tqm8540_defconfig
arc                          axs103_defconfig
powerpc                      tqm8xx_defconfig
arm                         bcm2835_defconfig
arm                           stm32_defconfig
arm                          collie_defconfig
mips                         cobalt_defconfig
arm                        clps711x_defconfig
powerpc                      ppc64e_defconfig
xtensa                  audio_kc705_defconfig
h8300                            alldefconfig
arm                        trizeps4_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          rsk7264_defconfig
sh                          sdk7786_defconfig
mips                    maltaup_xpa_defconfig
arm                         lpc32xx_defconfig
arm                            qcom_defconfig
powerpc                 xes_mpc85xx_defconfig
m68k                          amiga_defconfig
microblaze                      mmu_defconfig
arm                          lpd270_defconfig
powerpc                   bluestone_defconfig
arc                     haps_hs_smp_defconfig
sh                          r7785rp_defconfig
powerpc                     taishan_defconfig
powerpc                   motionpro_defconfig
sh                          kfr2r09_defconfig
powerpc                 linkstation_defconfig
m68k                        mvme16x_defconfig
powerpc                     sbc8548_defconfig
sh                             shx3_defconfig
sh                          landisk_defconfig
sh                            titan_defconfig
xtensa                    smp_lx200_defconfig
arm                       versatile_defconfig
powerpc                     stx_gp3_defconfig
sh                           se7780_defconfig
arm                           efm32_defconfig
powerpc                     akebono_defconfig
sh                         apsh4a3a_defconfig
sh                           se7712_defconfig
sh                        sh7757lcr_defconfig
sh                      rts7751r2d1_defconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
mips                        bcm47xx_defconfig
mips                         tb0226_defconfig
arm                         at91_dt_defconfig
m68k                        m5307c3_defconfig
mips                      bmips_stb_defconfig
m68k                       m5275evb_defconfig
mips                            gpr_defconfig
powerpc                        icon_defconfig
m68k                         apollo_defconfig
powerpc                          g5_defconfig
mips                           rs90_defconfig
powerpc                      ppc6xx_defconfig
mips                             allmodconfig
sh                           se7751_defconfig
mips                       capcella_defconfig
parisc                generic-32bit_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                 mpc837x_rdb_defconfig
xtensa                         virt_defconfig
sh                                  defconfig
sh                           se7724_defconfig
arm                            hisi_defconfig
ia64                                defconfig
mips                        jmr3927_defconfig
sparc                       sparc64_defconfig
arm                       aspeed_g4_defconfig
powerpc                     ksi8560_defconfig
arm                            mps2_defconfig
um                            kunit_defconfig
c6x                                 defconfig
ia64                        generic_defconfig
ia64                      gensparse_defconfig
sh                           se7721_defconfig
powerpc               mpc834x_itxgp_defconfig
sparc                            alldefconfig
arc                           tb10x_defconfig
arm                        keystone_defconfig
mips                        nlm_xlp_defconfig
nios2                         3c120_defconfig
arm                           corgi_defconfig
sh                         ecovec24_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                     davinci_all_defconfig
arm                         hackkit_defconfig
ia64                          tiger_defconfig
ia64                            zx1_defconfig
powerpc                        cell_defconfig
mips                  maltasmvp_eva_defconfig
arm                            xcep_defconfig
powerpc                  storcenter_defconfig
xtensa                  cadence_csp_defconfig
powerpc                      ep88xc_defconfig
arm                             rpc_defconfig
arm                             ezx_defconfig
m68k                             allyesconfig
arm                        mini2440_defconfig
arm                         assabet_defconfig
arc                              alldefconfig
powerpc                 mpc8540_ads_defconfig
arm                          prima2_defconfig
powerpc                      cm5200_defconfig
powerpc                         wii_defconfig
m68k                        stmark2_defconfig
mips                         bigsur_defconfig
mips                     loongson1c_defconfig
mips                        workpad_defconfig
powerpc                     ep8248e_defconfig
powerpc                     ppa8548_defconfig
riscv                          rv32_defconfig
sh                          rsk7269_defconfig
powerpc                      acadia_defconfig
arm                      tct_hammer_defconfig
arc                    vdk_hs38_smp_defconfig
h8300                               defconfig
mips                          ath79_defconfig
mips                           mtx1_defconfig
m68k                          atari_defconfig
mips                      maltasmvp_defconfig
mips                           ip22_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200925
i386                 randconfig-a006-20200925
i386                 randconfig-a003-20200925
i386                 randconfig-a004-20200925
i386                 randconfig-a005-20200925
i386                 randconfig-a001-20200925
x86_64               randconfig-a011-20200925
x86_64               randconfig-a013-20200925
x86_64               randconfig-a014-20200925
x86_64               randconfig-a015-20200925
x86_64               randconfig-a012-20200925
x86_64               randconfig-a016-20200925
i386                 randconfig-a012-20200925
i386                 randconfig-a014-20200925
i386                 randconfig-a016-20200925
i386                 randconfig-a013-20200925
i386                 randconfig-a011-20200925
i386                 randconfig-a015-20200925
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a005-20200925
x86_64               randconfig-a003-20200925
x86_64               randconfig-a004-20200925
x86_64               randconfig-a002-20200925
x86_64               randconfig-a006-20200925
x86_64               randconfig-a001-20200925

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
