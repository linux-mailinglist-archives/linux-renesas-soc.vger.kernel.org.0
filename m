Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3202C6C9A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 21:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731457AbgK0Ufg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 15:35:36 -0500
Received: from mga11.intel.com ([192.55.52.93]:42882 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732479AbgK0UfJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 15:35:09 -0500
IronPort-SDR: InII+ttstgtBWL3/Ffmxf4D0Se+hqMeqtpcqd/K+g3QXR0mSGWI0gy1rV88+iAgAEQCBIaaWG/
 QRdyP+xPi0MQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="168929700"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="168929700"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 12:34:57 -0800
IronPort-SDR: g/BRVTI+cI7XqVdWPDETKTbcyS1uEvOGBn8WceYqV3S20QJ+9H8Y7X3ey0oOIzAYUR8hYD3nHe
 7RLQ/ELy+KFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="333777955"
Received: from lkp-server01.sh.intel.com (HELO b5888d13d5a5) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Nov 2020 12:34:54 -0800
Received: from kbuild by b5888d13d5a5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kikSD-00009z-PN; Fri, 27 Nov 2020 20:34:53 +0000
Date:   Sat, 28 Nov 2020 04:34:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 acaece1de58901a7f56cc0d4e5149897a903ad23
Message-ID: <5fc162c2.zXMch8GI/KIWgSUm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  renesas-clk
branch HEAD: acaece1de58901a7f56cc0d4e5149897a903ad23  dt-bindings: clock: renesas: rcar-usb2-clock-sel: Convert bindings to json-schema

elapsed time: 728m

configs tested: 137
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                          axs101_defconfig
mips                      pic32mzda_defconfig
arm                       imx_v6_v7_defconfig
powerpc64                        alldefconfig
powerpc                 mpc834x_itx_defconfig
powerpc                    amigaone_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                           spitz_defconfig
mips                        bcm47xx_defconfig
arm                         shannon_defconfig
mips                         rt305x_defconfig
powerpc                      mgcoge_defconfig
m68k                        mvme16x_defconfig
powerpc                    mvme5100_defconfig
arm                           efm32_defconfig
powerpc                    sam440ep_defconfig
m68k                       m5475evb_defconfig
xtensa                    smp_lx200_defconfig
arm                         mv78xx0_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                          rm200_defconfig
arm                   milbeaut_m10v_defconfig
mips                      pistachio_defconfig
mips                         tb0219_defconfig
powerpc                     ksi8560_defconfig
arm                       omap2plus_defconfig
arm                          pxa3xx_defconfig
xtensa                generic_kc705_defconfig
powerpc                     pq2fads_defconfig
ia64                            zx1_defconfig
nds32                               defconfig
riscv                    nommu_virt_defconfig
powerpc                      ppc40x_defconfig
arm                            dove_defconfig
arm                      jornada720_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                          polaris_defconfig
arm                            pleb_defconfig
powerpc                 mpc834x_mds_defconfig
arm                          simpad_defconfig
sh                                  defconfig
ia64                      gensparse_defconfig
arm                          collie_defconfig
mips                      malta_kvm_defconfig
mips                           jazz_defconfig
c6x                         dsk6455_defconfig
arm                           h5000_defconfig
powerpc                     ppa8548_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     tqm5200_defconfig
arc                            hsdk_defconfig
arm                       netwinder_defconfig
arm                         assabet_defconfig
arm                       spear13xx_defconfig
arm                           sunxi_defconfig
powerpc                      tqm8xx_defconfig
mips                           ip27_defconfig
powerpc64                           defconfig
arm                          ep93xx_defconfig
mips                          ath25_defconfig
microblaze                      mmu_defconfig
m68k                       m5208evb_defconfig
arm                           h3600_defconfig
sh                        edosk7760_defconfig
powerpc                    klondike_defconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201127
i386                 randconfig-a003-20201127
i386                 randconfig-a002-20201127
i386                 randconfig-a005-20201127
i386                 randconfig-a001-20201127
i386                 randconfig-a006-20201127
x86_64               randconfig-a015-20201127
x86_64               randconfig-a011-20201127
x86_64               randconfig-a014-20201127
x86_64               randconfig-a016-20201127
x86_64               randconfig-a012-20201127
x86_64               randconfig-a013-20201127
i386                 randconfig-a016-20201127
i386                 randconfig-a014-20201127
i386                 randconfig-a015-20201127
i386                 randconfig-a012-20201127
i386                 randconfig-a013-20201127
i386                 randconfig-a011-20201127
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3

clang tested configs:
x86_64               randconfig-a006-20201127
x86_64               randconfig-a003-20201127
x86_64               randconfig-a004-20201127
x86_64               randconfig-a005-20201127
x86_64               randconfig-a002-20201127
x86_64               randconfig-a001-20201127

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
