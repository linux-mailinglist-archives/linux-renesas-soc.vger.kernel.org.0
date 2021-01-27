Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8533E3052FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jan 2021 07:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232643AbhA0GOe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Jan 2021 01:14:34 -0500
Received: from mga01.intel.com ([192.55.52.88]:47277 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235247AbhA0DQR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 22:16:17 -0500
IronPort-SDR: gcedy1DgXcuv8GZP7OVNnZPuzPpjjBopfwZHGXrCmeZC59v4+/DxMn70iqYX+KX5jwy8xlWsTX
 8zvkft/ALOwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="198801331"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="198801331"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 18:08:27 -0800
IronPort-SDR: ETXbaR2RhQbVXohT81lcp2/MZZhId8qtvje8/FSkITCp4qxA5ydBwVfvFmj/fAYK21tOQegYRC
 A3iIj8+zeZ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="472975798"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2021 18:08:26 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l4aFu-0001FR-4r; Wed, 27 Jan 2021 02:08:26 +0000
Date:   Wed, 27 Jan 2021 10:07:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:topic/r8a779a0-dmac-v2] BUILD SUCCESS
 e1e92d941864c688e02fcf691065bc97059c18f6
Message-ID: <6010cade.sdYaR7oExa0E7InF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/r8a779a0-dmac-v2
branch HEAD: e1e92d941864c688e02fcf691065bc97059c18f6  dmaengine: rcar-dmac: Add support for R-Car V3U

elapsed time: 721m

configs tested: 148
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          landisk_defconfig
powerpc                     redwood_defconfig
m68k                          atari_defconfig
m68k                             allmodconfig
powerpc                     tqm8540_defconfig
mips                 decstation_r4k_defconfig
powerpc                      ep88xc_defconfig
sh                          kfr2r09_defconfig
powerpc                    klondike_defconfig
powerpc                    mvme5100_defconfig
mips                           ip22_defconfig
openrisc                    or1ksim_defconfig
arm                        clps711x_defconfig
mips                     decstation_defconfig
powerpc                  storcenter_defconfig
arm                          ep93xx_defconfig
powerpc                         wii_defconfig
sh                           se7780_defconfig
xtensa                         virt_defconfig
arc                         haps_hs_defconfig
arm                          prima2_defconfig
mips                           rs90_defconfig
arm                            xcep_defconfig
s390                          debug_defconfig
arm                          moxart_defconfig
mips                           ip27_defconfig
mips                           jazz_defconfig
arm                           omap1_defconfig
xtensa                    xip_kc705_defconfig
arm                       imx_v6_v7_defconfig
arm                        realview_defconfig
arm                         vf610m4_defconfig
alpha                               defconfig
mips                           ci20_defconfig
arm                  colibri_pxa300_defconfig
c6x                                 defconfig
powerpc                     taishan_defconfig
arm                            hisi_defconfig
arc                              allyesconfig
nds32                             allnoconfig
powerpc                    adder875_defconfig
arm                       cns3420vb_defconfig
um                            kunit_defconfig
sh                        edosk7705_defconfig
sh                         ap325rxa_defconfig
sh                           se7751_defconfig
arm                           h5000_defconfig
mips                           ip32_defconfig
microblaze                          defconfig
arc                     nsimosci_hs_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                        spear6xx_defconfig
arm                            lart_defconfig
powerpc                           allnoconfig
arm                        spear3xx_defconfig
sh                           se7750_defconfig
sh                          rsk7264_defconfig
m68k                          amiga_defconfig
powerpc                     asp8347_defconfig
powerpc                       ppc64_defconfig
nds32                               defconfig
mips                        nlm_xlr_defconfig
arm                        neponset_defconfig
arm                        multi_v7_defconfig
powerpc                       maple_defconfig
m68k                        m5307c3_defconfig
arm                        shmobile_defconfig
powerpc                   lite5200b_defconfig
arm                         s3c2410_defconfig
arm                        oxnas_v6_defconfig
arm                            qcom_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                     pseries_defconfig
arm                          lpd270_defconfig
mips                           ip28_defconfig
powerpc                   bluestone_defconfig
mips                        qi_lb60_defconfig
powerpc                        icon_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                             allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a001-20210126
i386                 randconfig-a002-20210126
i386                 randconfig-a004-20210126
i386                 randconfig-a006-20210126
i386                 randconfig-a003-20210126
i386                 randconfig-a005-20210126
x86_64               randconfig-a012-20210126
x86_64               randconfig-a016-20210126
x86_64               randconfig-a015-20210126
x86_64               randconfig-a011-20210126
x86_64               randconfig-a013-20210126
x86_64               randconfig-a014-20210126
i386                 randconfig-a013-20210126
i386                 randconfig-a011-20210126
i386                 randconfig-a012-20210126
i386                 randconfig-a015-20210126
i386                 randconfig-a014-20210126
i386                 randconfig-a016-20210126
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
x86_64               randconfig-a003-20210126
x86_64               randconfig-a002-20210126
x86_64               randconfig-a001-20210126
x86_64               randconfig-a005-20210126
x86_64               randconfig-a006-20210126
x86_64               randconfig-a004-20210126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
