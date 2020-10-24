Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE785297A15
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Oct 2020 02:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756938AbgJXAl2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 20:41:28 -0400
Received: from mga04.intel.com ([192.55.52.120]:8574 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756948AbgJXAl1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 20:41:27 -0400
IronPort-SDR: u5N46KUbkJbFyPJOKnYgIjZck4LR5/9k1K7NqntxnNrSDAT9DddRKoVMxkO2WAntwXfwsY4vwR
 elhLrLVYCgbg==
X-IronPort-AV: E=McAfee;i="6000,8403,9783"; a="165154070"
X-IronPort-AV: E=Sophos;i="5.77,410,1596524400"; 
   d="scan'208";a="165154070"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2020 17:41:26 -0700
IronPort-SDR: pXDlX0Cw8DpX3LeBdLBCRPaNn1e5wcq7jbB6YyHIdnPCWvEP2o6th5jviUNCMyilyIbUy9arve
 9ZMu/Yp5wiCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,410,1596524400"; 
   d="scan'208";a="360394250"
Received: from lkp-server01.sh.intel.com (HELO cda15bb6d7bd) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Oct 2020 17:41:24 -0700
Received: from kbuild by cda15bb6d7bd with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kW7cZ-0000Gl-Ns; Sat, 24 Oct 2020 00:41:23 +0000
Date:   Sat, 24 Oct 2020 08:41:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-pinctrl-for-v5.11] BUILD SUCCESS
 bcc03dd7b2c6b5d1ad819c2429c7915781724dbf
Message-ID: <5f937824.WTeRpD3c3oNQf7pv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  renesas-pinctrl-for-v5.11
branch HEAD: bcc03dd7b2c6b5d1ad819c2429c7915781724dbf  pinctrl: renesas: r8a7791: Optimize pinctrl image size for R8A774[34]

elapsed time: 721m

configs tested: 204
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         lpc18xx_defconfig
arc                        vdk_hs38_defconfig
mips                      bmips_stb_defconfig
powerpc                      katmai_defconfig
mips                             allmodconfig
mips                         cobalt_defconfig
sh                      rts7751r2d1_defconfig
nios2                            allyesconfig
powerpc                     ep8248e_defconfig
arm                            mmp2_defconfig
arm                         palmz72_defconfig
arm                          tango4_defconfig
h8300                       h8s-sim_defconfig
arm                             pxa_defconfig
arm                           h3600_defconfig
arc                         haps_hs_defconfig
mips                        nlm_xlr_defconfig
powerpc                  mpc885_ads_defconfig
arm                         s3c6400_defconfig
mips                     loongson1c_defconfig
mips                        jmr3927_defconfig
powerpc                     ppa8548_defconfig
sh                   sh7724_generic_defconfig
mips                         db1xxx_defconfig
arc                 nsimosci_hs_smp_defconfig
sparc                       sparc32_defconfig
arm                        spear6xx_defconfig
riscv                            alldefconfig
arm                            xcep_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
powerpc                     ksi8560_defconfig
mips                     cu1830-neo_defconfig
powerpc                   bluestone_defconfig
powerpc                 mpc8272_ads_defconfig
arm                      tct_hammer_defconfig
c6x                              allyesconfig
powerpc                 canyonlands_defconfig
mips                      malta_kvm_defconfig
arm                             mxs_defconfig
arc                        nsim_700_defconfig
mips                          ath79_defconfig
powerpc                      ppc44x_defconfig
sh                           se7751_defconfig
powerpc                 linkstation_defconfig
arm                     am200epdkit_defconfig
microblaze                          defconfig
mips                           ip27_defconfig
powerpc                      pasemi_defconfig
arm                       aspeed_g5_defconfig
arm                       netwinder_defconfig
arm                        oxnas_v6_defconfig
xtensa                  cadence_csp_defconfig
arm                            zeus_defconfig
sh                           se7722_defconfig
mips                     decstation_defconfig
arm                      jornada720_defconfig
sh                          lboxre2_defconfig
xtensa                           allyesconfig
arm                           efm32_defconfig
i386                             alldefconfig
powerpc                    klondike_defconfig
arm                            pleb_defconfig
xtensa                              defconfig
powerpc                      chrp32_defconfig
xtensa                    xip_kc705_defconfig
m68k                            q40_defconfig
openrisc                    or1ksim_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     redwood_defconfig
sh                             sh03_defconfig
sparc64                          alldefconfig
sh                     magicpanelr2_defconfig
powerpc                    sam440ep_defconfig
xtensa                         virt_defconfig
m68k                          atari_defconfig
powerpc                      bamboo_defconfig
arm                       aspeed_g4_defconfig
arm                          moxart_defconfig
arm                          lpd270_defconfig
arm                         axm55xx_defconfig
c6x                        evmc6678_defconfig
mips                         bigsur_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                     tqm8560_defconfig
powerpc                     akebono_defconfig
sh                           se7343_defconfig
arm                            dove_defconfig
arm                      integrator_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                  iss476-smp_defconfig
powerpc                 mpc836x_rdk_defconfig
riscv                               defconfig
sh                        edosk7705_defconfig
arm                             ezx_defconfig
powerpc                     mpc83xx_defconfig
arm                        neponset_defconfig
sh                           se7724_defconfig
arm                      pxa255-idp_defconfig
powerpc                      ppc40x_defconfig
arm                           viper_defconfig
nios2                               defconfig
powerpc                          allyesconfig
powerpc                 mpc8313_rdb_defconfig
sh                               alldefconfig
m68k                        mvme16x_defconfig
mips                           rs90_defconfig
arm                           spitz_defconfig
powerpc                     mpc512x_defconfig
ia64                        generic_defconfig
sparc                       sparc64_defconfig
sh                   sh7770_generic_defconfig
arm                          imote2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
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
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20201023
i386                 randconfig-a005-20201023
i386                 randconfig-a003-20201023
i386                 randconfig-a001-20201023
i386                 randconfig-a006-20201023
i386                 randconfig-a004-20201023
i386                 randconfig-a002-20201022
i386                 randconfig-a005-20201022
i386                 randconfig-a003-20201022
i386                 randconfig-a001-20201022
i386                 randconfig-a006-20201022
i386                 randconfig-a004-20201022
x86_64               randconfig-a001-20201023
x86_64               randconfig-a002-20201023
x86_64               randconfig-a003-20201023
x86_64               randconfig-a006-20201023
x86_64               randconfig-a004-20201023
x86_64               randconfig-a005-20201023
x86_64               randconfig-a011-20201022
x86_64               randconfig-a013-20201022
x86_64               randconfig-a016-20201022
x86_64               randconfig-a015-20201022
x86_64               randconfig-a012-20201022
x86_64               randconfig-a014-20201022
i386                 randconfig-a016-20201022
i386                 randconfig-a014-20201022
i386                 randconfig-a015-20201022
i386                 randconfig-a012-20201022
i386                 randconfig-a013-20201022
i386                 randconfig-a011-20201022
i386                 randconfig-a016-20201023
i386                 randconfig-a014-20201023
i386                 randconfig-a015-20201023
i386                 randconfig-a012-20201023
i386                 randconfig-a013-20201023
i386                 randconfig-a011-20201023
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20201022
x86_64               randconfig-a002-20201022
x86_64               randconfig-a003-20201022
x86_64               randconfig-a006-20201022
x86_64               randconfig-a004-20201022
x86_64               randconfig-a005-20201022
x86_64               randconfig-a011-20201023
x86_64               randconfig-a013-20201023
x86_64               randconfig-a016-20201023
x86_64               randconfig-a015-20201023
x86_64               randconfig-a012-20201023
x86_64               randconfig-a014-20201023

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
