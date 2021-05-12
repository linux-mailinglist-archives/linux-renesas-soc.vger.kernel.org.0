Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D41437BC75
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 May 2021 14:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbhELMZ7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 May 2021 08:25:59 -0400
Received: from mga09.intel.com ([134.134.136.24]:40828 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231860AbhELMZ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 May 2021 08:25:56 -0400
IronPort-SDR: S2Vx11+gk+dAzQ+ok1IsNMaD/M+ysHMOkbM8yD5PpZxwmNlL4FXUa4Yy5teOEy7wiEqpcWap3B
 kP2crppst1ng==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="199746332"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="199746332"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 05:24:46 -0700
IronPort-SDR: 863XJGbkzVbS4VPu9jFqlmvKEdaJm4cQpbJM3yvxYECuq8FfAmOpQywvLCOozx0y8RSzZ33VJ6
 u1H19slTOnLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="469434301"
Received: from lkp-server01.sh.intel.com (HELO 1e931876798f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 May 2021 05:24:45 -0700
Received: from kbuild by 1e931876798f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lgnuu-0000Hk-Cs; Wed, 12 May 2021 12:24:44 +0000
Date:   Wed, 12 May 2021 20:23:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 6bd913f54f2f1973e741c6cf36b90175e8963175
Message-ID: <609bc8cf.qzXbJhpl9VWABkKP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 6bd913f54f2f1973e741c6cf36b90175e8963175  clk: renesas: r9a06g032: Switch to .determine_rate()

elapsed time: 1367m

configs tested: 174
configs skipped: 2

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
riscv                            allyesconfig
i386                             allyesconfig
sh                           se7722_defconfig
nios2                         3c120_defconfig
powerpc64                           defconfig
arm                            mmp2_defconfig
arm                       versatile_defconfig
sh                          landisk_defconfig
arm                         at91_dt_defconfig
sh                   secureedge5410_defconfig
arm                           viper_defconfig
powerpc                      obs600_defconfig
mips                     decstation_defconfig
mips                             allyesconfig
arm                           sunxi_defconfig
arm                        clps711x_defconfig
powerpc                  storcenter_defconfig
powerpc                     stx_gp3_defconfig
xtensa                  cadence_csp_defconfig
sh                           se7721_defconfig
arm                       aspeed_g4_defconfig
mips                      malta_kvm_defconfig
parisc                generic-32bit_defconfig
powerpc                     sequoia_defconfig
sh                           se7619_defconfig
mips                        workpad_defconfig
arm                         bcm2835_defconfig
arm                        spear6xx_defconfig
arc                          axs101_defconfig
powerpc                      ep88xc_defconfig
mips                        jmr3927_defconfig
um                            kunit_defconfig
arm                        multi_v7_defconfig
powerpc                 mpc8315_rdb_defconfig
openrisc                            defconfig
sparc64                             defconfig
arm                        neponset_defconfig
arm                       mainstone_defconfig
nios2                         10m50_defconfig
arm                             rpc_defconfig
arc                           tb10x_defconfig
mips                        nlm_xlp_defconfig
powerpc                  mpc866_ads_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      bamboo_defconfig
riscv                             allnoconfig
s390                                defconfig
xtensa                    xip_kc705_defconfig
powerpc                    socrates_defconfig
powerpc                    mvme5100_defconfig
mips                            e55_defconfig
riscv                    nommu_k210_defconfig
sh                          rsk7264_defconfig
powerpc                       holly_defconfig
mips                         mpc30x_defconfig
mips                  decstation_64_defconfig
powerpc                 mpc834x_itx_defconfig
mips                           ip27_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                        keystone_defconfig
powerpc                 mpc836x_mds_defconfig
ia64                                defconfig
sh                          polaris_defconfig
powerpc                       ebony_defconfig
arm                            pleb_defconfig
mips                          rb532_defconfig
arm                           h3600_defconfig
powerpc                        fsp2_defconfig
um                               alldefconfig
powerpc                     ksi8560_defconfig
mips                          malta_defconfig
m68k                          sun3x_defconfig
powerpc64                        alldefconfig
alpha                            alldefconfig
sh                               j2_defconfig
powerpc                     tqm8555_defconfig
sh                              ul2_defconfig
mips                          ath79_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
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
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210512
x86_64               randconfig-a004-20210512
x86_64               randconfig-a001-20210512
x86_64               randconfig-a005-20210512
x86_64               randconfig-a002-20210512
x86_64               randconfig-a006-20210512
i386                 randconfig-a003-20210511
i386                 randconfig-a001-20210511
i386                 randconfig-a005-20210511
i386                 randconfig-a004-20210511
i386                 randconfig-a002-20210511
i386                 randconfig-a006-20210511
i386                 randconfig-a003-20210512
i386                 randconfig-a001-20210512
i386                 randconfig-a005-20210512
i386                 randconfig-a004-20210512
i386                 randconfig-a002-20210512
i386                 randconfig-a006-20210512
x86_64               randconfig-a012-20210511
x86_64               randconfig-a015-20210511
x86_64               randconfig-a011-20210511
x86_64               randconfig-a013-20210511
x86_64               randconfig-a016-20210511
x86_64               randconfig-a014-20210511
i386                 randconfig-a016-20210511
i386                 randconfig-a014-20210511
i386                 randconfig-a011-20210511
i386                 randconfig-a015-20210511
i386                 randconfig-a012-20210511
i386                 randconfig-a013-20210511
i386                 randconfig-a016-20210512
i386                 randconfig-a014-20210512
i386                 randconfig-a011-20210512
i386                 randconfig-a015-20210512
i386                 randconfig-a012-20210512
i386                 randconfig-a013-20210512
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
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
x86_64               randconfig-a003-20210511
x86_64               randconfig-a004-20210511
x86_64               randconfig-a001-20210511
x86_64               randconfig-a005-20210511
x86_64               randconfig-a002-20210511
x86_64               randconfig-a006-20210511
x86_64               randconfig-a015-20210512
x86_64               randconfig-a012-20210512
x86_64               randconfig-a011-20210512
x86_64               randconfig-a013-20210512
x86_64               randconfig-a016-20210512
x86_64               randconfig-a014-20210512

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
