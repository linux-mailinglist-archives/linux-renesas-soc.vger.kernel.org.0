Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66E183530B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Apr 2021 23:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235567AbhDBVWn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Apr 2021 17:22:43 -0400
Received: from mga09.intel.com ([134.134.136.24]:11260 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235523AbhDBVWn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Apr 2021 17:22:43 -0400
IronPort-SDR: uFCc/v9txvqhfxCTwSkFn7yDE+iNl2OaXMdlgbo2776/k45gd4OcKg6Iyr3vvo5FPzxwy0ukhV
 u2cAkU0sSITQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9942"; a="192639426"
X-IronPort-AV: E=Sophos;i="5.81,300,1610438400"; 
   d="scan'208";a="192639426"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2021 14:22:41 -0700
IronPort-SDR: HS+cFbA6qVFCZpgBaieiTbniXXjxMEhz8JR/r3hlDYEfOjM5wdFH1HHC5IyzI1zzXTbYeRRCvF
 Rju9k119DOZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,300,1610438400"; 
   d="scan'208";a="608102476"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Apr 2021 14:22:38 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lSRFW-0007M4-5H; Fri, 02 Apr 2021 21:22:38 +0000
Date:   Sat, 03 Apr 2021 05:22:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.13] BUILD SUCCESS
 2b35ca2fe605f85aa1a52c713571baf04a5f434a
Message-ID: <60678b11.Cvdllg1drzZuVuH0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.13
branch HEAD: 2b35ca2fe605f85aa1a52c713571baf04a5f434a  arm64: dts: renesas: ulcb: Add cpu-supply property to a57_0 node

elapsed time: 723m

configs tested: 216
configs skipped: 87

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
sh                          rsk7203_defconfig
arc                    vdk_hs38_smp_defconfig
mips                       rbtx49xx_defconfig
arm                           h5000_defconfig
powerpc                     powernv_defconfig
mips                      malta_kvm_defconfig
m68k                        mvme16x_defconfig
powerpc                      ppc40x_defconfig
mips                         tb0226_defconfig
xtensa                generic_kc705_defconfig
sh                            titan_defconfig
arm                      footbridge_defconfig
arm                             ezx_defconfig
arm                        trizeps4_defconfig
arm                             rpc_defconfig
xtensa                       common_defconfig
powerpc                     ksi8560_defconfig
arm                          lpd270_defconfig
arm                       aspeed_g4_defconfig
riscv                    nommu_k210_defconfig
m68k                          amiga_defconfig
alpha                            alldefconfig
arm                           sama5_defconfig
sh                         apsh4a3a_defconfig
arm                           omap1_defconfig
mips                          rm200_defconfig
parisc                generic-64bit_defconfig
powerpc                     mpc83xx_defconfig
ia64                      gensparse_defconfig
mips                      fuloong2e_defconfig
powerpc                     sequoia_defconfig
arm                          ixp4xx_defconfig
arm                          pxa910_defconfig
mips                     cu1830-neo_defconfig
mips                     cu1000-neo_defconfig
mips                             allmodconfig
mips                      pistachio_defconfig
riscv                          rv32_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     redwood_defconfig
parisc                generic-32bit_defconfig
mips                            gpr_defconfig
powerpc                     tqm8540_defconfig
sh                     magicpanelr2_defconfig
m68k                         amcore_defconfig
m68k                       bvme6000_defconfig
arm                       spear13xx_defconfig
powerpc                     ppa8548_defconfig
ia64                             allmodconfig
sh                             sh03_defconfig
powerpc                          g5_defconfig
powerpc                      katmai_defconfig
arm                        mini2440_defconfig
sh                            migor_defconfig
powerpc                     akebono_defconfig
s390                                defconfig
powerpc                      makalu_defconfig
openrisc                    or1ksim_defconfig
arm                     eseries_pxa_defconfig
m68k                            q40_defconfig
um                           x86_64_defconfig
powerpc                      acadia_defconfig
arm                             pxa_defconfig
mips                        workpad_defconfig
nios2                         10m50_defconfig
arm                          iop32x_defconfig
ia64                             alldefconfig
powerpc                      ep88xc_defconfig
arm                        neponset_defconfig
arm                          pxa168_defconfig
mips                 decstation_r4k_defconfig
sh                          lboxre2_defconfig
m68k                          hp300_defconfig
powerpc                 mpc8540_ads_defconfig
arc                        nsim_700_defconfig
arm                         lpc32xx_defconfig
powerpc                     tqm8560_defconfig
powerpc                      tqm8xx_defconfig
mips                           ip27_defconfig
arm                        cerfcube_defconfig
m68k                           sun3_defconfig
parisc                              defconfig
arc                 nsimosci_hs_smp_defconfig
mips                malta_qemu_32r6_defconfig
arm                           stm32_defconfig
mips                          rb532_defconfig
arm                        shmobile_defconfig
m68k                         apollo_defconfig
xtensa                          iss_defconfig
sh                          rsk7201_defconfig
arm                     am200epdkit_defconfig
h8300                    h8300h-sim_defconfig
arm                        oxnas_v6_defconfig
powerpc                    amigaone_defconfig
sh                           se7724_defconfig
powerpc                         wii_defconfig
arm                       multi_v4t_defconfig
sh                        sh7785lcr_defconfig
mips                  cavium_octeon_defconfig
mips                     loongson1c_defconfig
arm                         palmz72_defconfig
sh                     sh7710voipgw_defconfig
mips                        vocore2_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                 kfr2r09-romimage_defconfig
sparc64                             defconfig
powerpc                 mpc834x_mds_defconfig
mips                          malta_defconfig
powerpc                       eiger_defconfig
ia64                         bigsur_defconfig
mips                           gcw0_defconfig
mips                        omega2p_defconfig
sh                           se7780_defconfig
mips                         tb0219_defconfig
sh                           se7750_defconfig
powerpc                    ge_imp3a_defconfig
arc                        vdk_hs38_defconfig
powerpc                           allnoconfig
arm                           corgi_defconfig
m68k                       m5208evb_defconfig
mips                       capcella_defconfig
arm                          exynos_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                           ci20_defconfig
powerpc                  iss476-smp_defconfig
sh                          urquell_defconfig
sh                           se7712_defconfig
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20210402
x86_64               randconfig-a005-20210402
x86_64               randconfig-a003-20210402
x86_64               randconfig-a001-20210402
x86_64               randconfig-a002-20210402
x86_64               randconfig-a006-20210402
i386                 randconfig-a006-20210402
i386                 randconfig-a003-20210402
i386                 randconfig-a001-20210402
i386                 randconfig-a004-20210402
i386                 randconfig-a005-20210402
i386                 randconfig-a002-20210402
i386                 randconfig-a006-20210401
i386                 randconfig-a003-20210401
i386                 randconfig-a001-20210401
i386                 randconfig-a004-20210401
i386                 randconfig-a002-20210401
i386                 randconfig-a005-20210401
i386                 randconfig-a014-20210402
i386                 randconfig-a016-20210402
i386                 randconfig-a011-20210402
i386                 randconfig-a012-20210402
i386                 randconfig-a013-20210402
i386                 randconfig-a015-20210402
i386                 randconfig-a014-20210401
i386                 randconfig-a011-20210401
i386                 randconfig-a016-20210401
i386                 randconfig-a012-20210401
i386                 randconfig-a013-20210401
i386                 randconfig-a015-20210401
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210401
x86_64               randconfig-a005-20210401
x86_64               randconfig-a003-20210401
x86_64               randconfig-a001-20210401
x86_64               randconfig-a002-20210401
x86_64               randconfig-a006-20210401
x86_64               randconfig-a014-20210402
x86_64               randconfig-a015-20210402
x86_64               randconfig-a011-20210402
x86_64               randconfig-a013-20210402
x86_64               randconfig-a012-20210402
x86_64               randconfig-a016-20210402

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
