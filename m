Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31FC02F426E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jan 2021 04:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbhAMDYP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 22:24:15 -0500
Received: from mga17.intel.com ([192.55.52.151]:27954 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728279AbhAMDYO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 22:24:14 -0500
IronPort-SDR: fiJnjM3+4n1qHOTBK9GXhb2RV3pAeBIHINWeTac8GinVDt5ugqAEXeh38AqmbvTxjziW/StLUq
 fLkDSr6V9BOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="157919648"
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; 
   d="scan'208";a="157919648"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 19:23:19 -0800
IronPort-SDR: TK4C7fL8d8gtC/X8F7E/HkZhy14cWUwN11+U9w+6lqsVyn/vMF0Fv7EkFmcRspTiV6cv9n3RiG
 I6oEcDNZEOzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; 
   d="scan'208";a="567727108"
Received: from lkp-server01.sh.intel.com (HELO d5d1a9a2c6bb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Jan 2021 19:23:17 -0800
Received: from kbuild by d5d1a9a2c6bb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kzWke-00001i-QM; Wed, 13 Jan 2021 03:23:16 +0000
Date:   Wed, 13 Jan 2021 11:22:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:topic/r8a779a0-dmac-v1] BUILD SUCCESS
 e0cb2fd4c43934c86e52a25b1b13e6df8da529ee
Message-ID: <5ffe677b.J4lwdqXGof3brrz4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  topic/r8a779a0-dmac-v1
branch HEAD: e0cb2fd4c43934c86e52a25b1b13e6df8da529ee  dmaengine: rcar-dmac: Add support for R-Car V3U

elapsed time: 721m

configs tested: 155
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     akebono_defconfig
powerpc                  mpc866_ads_defconfig
mips                         db1xxx_defconfig
mips                           rs90_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                  cadence_csp_defconfig
arm                  colibri_pxa300_defconfig
sh                           se7206_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                   lite5200b_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                       lemote2f_defconfig
nios2                         10m50_defconfig
mips                     loongson1c_defconfig
mips                          rb532_defconfig
mips                       bmips_be_defconfig
ia64                         bigsur_defconfig
powerpc64                        alldefconfig
arm                         cm_x300_defconfig
m68k                       m5475evb_defconfig
ia64                          tiger_defconfig
mips                      loongson3_defconfig
arm                          collie_defconfig
arm                         shannon_defconfig
m68k                          amiga_defconfig
mips                        qi_lb60_defconfig
powerpc                 mpc836x_mds_defconfig
sh                           se7780_defconfig
powerpc                       ebony_defconfig
arm                            lart_defconfig
arm                         lubbock_defconfig
arm                     am200epdkit_defconfig
mips                        bcm47xx_defconfig
ia64                      gensparse_defconfig
arm                          moxart_defconfig
powerpc                      arches_defconfig
arm                             rpc_defconfig
arc                        nsimosci_defconfig
m68k                          multi_defconfig
mips                  cavium_octeon_defconfig
riscv                            alldefconfig
arc                            hsdk_defconfig
arm                            xcep_defconfig
powerpc                     ksi8560_defconfig
arm                           corgi_defconfig
sh                          r7785rp_defconfig
powerpc                       eiger_defconfig
m68k                            mac_defconfig
powerpc                     tqm8548_defconfig
arm                       spear13xx_defconfig
powerpc                  storcenter_defconfig
sparc64                          alldefconfig
powerpc                     kmeter1_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                      ep88xc_defconfig
sh                          rsk7264_defconfig
sh                        apsh4ad0a_defconfig
mips                       rbtx49xx_defconfig
powerpc                       maple_defconfig
mips                           gcw0_defconfig
arm                        magician_defconfig
sh                           se7343_defconfig
sh                           sh2007_defconfig
powerpc                        icon_defconfig
arm                           omap1_defconfig
powerpc                       holly_defconfig
microblaze                      mmu_defconfig
arc                          axs101_defconfig
sh                          rsk7203_defconfig
sh                        sh7785lcr_defconfig
arm                        spear3xx_defconfig
arm                            qcom_defconfig
sh                ecovec24-romimage_defconfig
arm                          tango4_defconfig
mips                          ath25_defconfig
powerpc                     rainier_defconfig
m68k                         amcore_defconfig
h8300                            alldefconfig
arm                         orion5x_defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210112
i386                 randconfig-a005-20210112
i386                 randconfig-a006-20210112
i386                 randconfig-a003-20210112
i386                 randconfig-a001-20210112
i386                 randconfig-a004-20210112
x86_64               randconfig-a015-20210112
x86_64               randconfig-a012-20210112
x86_64               randconfig-a013-20210112
x86_64               randconfig-a016-20210112
x86_64               randconfig-a014-20210112
x86_64               randconfig-a011-20210112
i386                 randconfig-a012-20210112
i386                 randconfig-a011-20210112
i386                 randconfig-a016-20210112
i386                 randconfig-a013-20210112
i386                 randconfig-a015-20210112
i386                 randconfig-a014-20210112
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210112
x86_64               randconfig-a004-20210112
x86_64               randconfig-a001-20210112
x86_64               randconfig-a005-20210112
x86_64               randconfig-a003-20210112
x86_64               randconfig-a002-20210112

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
