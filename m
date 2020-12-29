Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2816A2E6CE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Dec 2020 01:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730191AbgL2AyO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 19:54:14 -0500
Received: from mga03.intel.com ([134.134.136.65]:47805 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729773AbgL2AyN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 19:54:13 -0500
IronPort-SDR: hj9pgfzSfOIyT6kcDDM+UKEtA2xwDTQaIRgPuOejKK4VRCym0LwDrGI/ma4STRjeTZKXTf2PDY
 5rooOWHWk6lQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="176536898"
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="176536898"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 16:53:31 -0800
IronPort-SDR: QH94Z97Nbvhg2u+0ey/UIiQIBtzUwU60y9Rg9BRhYzYhdiDFgF4ZnKkbJw1M3H0+fJqVO1RRIx
 RBoOz4Cb2Npg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; 
   d="scan'208";a="392935216"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 28 Dec 2020 16:53:29 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ku3GT-0003CS-BE; Tue, 29 Dec 2020 00:53:29 +0000
Date:   Tue, 29 Dec 2020 08:52:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 b8e76cdb157494770d8feee237222a511468c788
Message-ID: <5fea7ddd.pWudgsMLs6LtRWmP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  next
branch HEAD: b8e76cdb157494770d8feee237222a511468c788  Merge branches 'renesas-arm-dt-for-v5.12' and 'renesas-dt-bindings-for-v5.12' into renesas-next

elapsed time: 722m

configs tested: 149
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                          hp300_defconfig
powerpc                   lite5200b_defconfig
mips                          rb532_defconfig
powerpc                     tqm8560_defconfig
sh                        sh7757lcr_defconfig
powerpc                     tqm8541_defconfig
sh                           se7722_defconfig
sh                 kfr2r09-romimage_defconfig
sh                         ap325rxa_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     powernv_defconfig
arm                     am200epdkit_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
sh                           se7705_defconfig
sh                      rts7751r2d1_defconfig
arm                         axm55xx_defconfig
arm                         socfpga_defconfig
sparc                               defconfig
mips                        workpad_defconfig
nios2                            alldefconfig
um                           x86_64_defconfig
sh                           se7724_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                         tb0226_defconfig
x86_64                           allyesconfig
sh                         apsh4a3a_defconfig
arc                         haps_hs_defconfig
powerpc                  storcenter_defconfig
powerpc                     tqm8548_defconfig
h8300                       h8s-sim_defconfig
sh                               j2_defconfig
csky                                defconfig
sparc                       sparc32_defconfig
powerpc                      pmac32_defconfig
powerpc                  mpc866_ads_defconfig
xtensa                         virt_defconfig
powerpc                 mpc8540_ads_defconfig
arm                            hisi_defconfig
m68k                        mvme147_defconfig
sh                         ecovec24_defconfig
arm                         at91_dt_defconfig
sh                           se7751_defconfig
arm                      footbridge_defconfig
sh                     magicpanelr2_defconfig
powerpc                    adder875_defconfig
arm                           tegra_defconfig
mips                            gpr_defconfig
arm                           sunxi_defconfig
mips                malta_kvm_guest_defconfig
arm                         s3c6400_defconfig
mips                            ar7_defconfig
m68k                         amcore_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     mpc5200_defconfig
mips                           xway_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                            e55_defconfig
arm                           h5000_defconfig
sh                        dreamcast_defconfig
powerpc                      makalu_defconfig
powerpc                       ebony_defconfig
mips                        jmr3927_defconfig
arm                   milbeaut_m10v_defconfig
mips                           ci20_defconfig
powerpc                     kilauea_defconfig
arm                         bcm2835_defconfig
mips                        bcm47xx_defconfig
m68k                           sun3_defconfig
powerpc                        icon_defconfig
arm                         shannon_defconfig
powerpc                      walnut_defconfig
sh                        sh7763rdp_defconfig
mips                             allmodconfig
m68k                        stmark2_defconfig
arc                     haps_hs_smp_defconfig
mips                      fuloong2e_defconfig
mips                  maltasmvp_eva_defconfig
arm                      jornada720_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
alpha                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20201228
i386                 randconfig-a002-20201228
i386                 randconfig-a004-20201228
i386                 randconfig-a006-20201228
i386                 randconfig-a003-20201228
i386                 randconfig-a001-20201228
x86_64               randconfig-a014-20201228
x86_64               randconfig-a015-20201228
x86_64               randconfig-a016-20201228
x86_64               randconfig-a012-20201228
x86_64               randconfig-a011-20201228
x86_64               randconfig-a013-20201228
i386                 randconfig-a014-20201228
i386                 randconfig-a012-20201228
i386                 randconfig-a016-20201228
i386                 randconfig-a011-20201228
i386                 randconfig-a015-20201228
i386                 randconfig-a013-20201228
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20201228
x86_64               randconfig-a006-20201228
x86_64               randconfig-a002-20201228
x86_64               randconfig-a004-20201228
x86_64               randconfig-a003-20201228
x86_64               randconfig-a005-20201228

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
