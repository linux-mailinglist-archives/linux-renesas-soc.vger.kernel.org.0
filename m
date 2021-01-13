Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E87B2F426A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jan 2021 04:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbhAMDX7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 22:23:59 -0500
Received: from mga01.intel.com ([192.55.52.88]:25201 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728903AbhAMDX7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 22:23:59 -0500
IronPort-SDR: reuR16lPC29Cd9OUCAaifdde4ogP4tSyebPKQxdMuG8wnoLLM7hQ374Pa4YmvvxjM8SHZUI1pQ
 e8wRC+upetMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="196777391"
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; 
   d="scan'208";a="196777391"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2021 19:23:18 -0800
IronPort-SDR: YYD8Sz4PBez2MD8yFbS+X3iXswAkYNya1Aom/h0BL6cB59HMsypru3Oj0yXh7ujn6SpgeISySe
 N4GyN5n1SmMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; 
   d="scan'208";a="404686706"
Received: from lkp-server01.sh.intel.com (HELO d5d1a9a2c6bb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jan 2021 19:23:17 -0800
Received: from kbuild by d5d1a9a2c6bb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kzWke-00001w-WF; Wed, 13 Jan 2021 03:23:17 +0000
Date:   Wed, 13 Jan 2021 11:22:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:topic/r8a779a0-dt-msiof-v2] BUILD SUCCESS
 189f6aea74576fd351fc86a868a05328644b140f
Message-ID: <5ffe676c.34mk+Jp4YPLRGP+n%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  topic/r8a779a0-dt-msiof-v2
branch HEAD: 189f6aea74576fd351fc86a868a05328644b140f  arm64: dts: renesas: r8a779a0: Add MSIOF device nodes

elapsed time: 720m

configs tested: 144
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
arm                     davinci_all_defconfig
powerpc                      ep88xc_defconfig
sh                          kfr2r09_defconfig
mips                          rm200_defconfig
powerpc                     sequoia_defconfig
arm                          ixp4xx_defconfig
sh                           se7206_defconfig
powerpc                  storcenter_defconfig
sparc64                          alldefconfig
powerpc                     kmeter1_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                       maple_defconfig
mips                           gcw0_defconfig
arm                        magician_defconfig
sh                           se7343_defconfig
sh                           sh2007_defconfig
powerpc                        icon_defconfig
arm                          moxart_defconfig
arm                           omap1_defconfig
powerpc                       holly_defconfig
microblaze                      mmu_defconfig
arc                          axs101_defconfig
sh                          rsk7203_defconfig
sh                        sh7785lcr_defconfig
arm                        spear3xx_defconfig
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
