Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5136327939B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Sep 2020 23:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgIYVdC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Sep 2020 17:33:02 -0400
Received: from mga03.intel.com ([134.134.136.65]:50113 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726636AbgIYVdC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Sep 2020 17:33:02 -0400
IronPort-SDR: 5mqB8dqkmXNV0r7F8cuwbxnfH/cAeZ7II/M6vke1Kgdm5eqc1cQvNwppS1ohhLAwCisEqc95eI
 t/z6o1fPxq9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="161727081"
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; 
   d="scan'208";a="161727081"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 14:33:01 -0700
IronPort-SDR: AYho5rkkIOzKe38C7g3xxlKBPX9R1ov58OfANLf+tIkvMgecwwUyypvQ8gM9mk+gsHVYMU0yJk
 CMb4aQsvGdvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; 
   d="scan'208";a="513155375"
Received: from lkp-server01.sh.intel.com (HELO 2dda29302fe3) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Sep 2020 14:32:59 -0700
Received: from kbuild by 2dda29302fe3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kLvKt-0000G8-3Z; Fri, 25 Sep 2020 21:32:59 +0000
Date:   Sat, 26 Sep 2020 05:32:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-fixes-for-v5.9] BUILD SUCCESS
 08d7a73fffb6769b1cf2278bf697e692daba3abf
Message-ID: <5f6e61ef.N3KK8mnjhTvmiTXS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-fixes-for-v5.9
branch HEAD: 08d7a73fffb6769b1cf2278bf697e692daba3abf  ARM: dts: iwg20d-q7-common: Fix touch controller probe failure

elapsed time: 721m

configs tested: 181
configs skipped: 69

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
sh                      rts7751r2d1_defconfig
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
powerpc                   bluestone_defconfig
sh                           se7751_defconfig
mips                       capcella_defconfig
parisc                generic-32bit_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                 mpc837x_rdb_defconfig
xtensa                         virt_defconfig
sh                                  defconfig
sh                           se7724_defconfig
arm                            hisi_defconfig
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
mips                         bigsur_defconfig
mips                     loongson1c_defconfig
mips                        workpad_defconfig
powerpc                     ep8248e_defconfig
riscv                          rv32_defconfig
powerpc                     ppa8548_defconfig
arm                      tct_hammer_defconfig
arc                    vdk_hs38_smp_defconfig
h8300                               defconfig
mips                          ath79_defconfig
mips                           mtx1_defconfig
m68k                          atari_defconfig
mips                      maltasmvp_defconfig
mips                           ip22_defconfig
ia64                             allmodconfig
ia64                                defconfig
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
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
