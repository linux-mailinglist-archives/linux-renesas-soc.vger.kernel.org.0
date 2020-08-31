Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B3F2582A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Aug 2020 22:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbgHaUcI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Aug 2020 16:32:08 -0400
Received: from mga01.intel.com ([192.55.52.88]:50965 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726167AbgHaUcI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Aug 2020 16:32:08 -0400
IronPort-SDR: WVJkCdw5lyp/D6Cy8GC1bo6P6jMsWLPNT9RFcpcewHSiGX8lEvXk2IaMvDJnWyoxso0T20FSzd
 u9eh3eCjuuZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="175100942"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="175100942"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 13:32:07 -0700
IronPort-SDR: 4ZjE0CWzXhglawzbMw7PwDdro4Ks+ZnEMQqFb7qCKyWYbEAj/R0z/KDzlW2Gh+eZVy9z4gaFFy
 NZYfs6K69u2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="445858690"
Received: from lkp-server02.sh.intel.com (HELO 713faec3b0e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Aug 2020 13:32:05 -0700
Received: from kbuild by 713faec3b0e5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kCqTE-0000Bj-Kd; Mon, 31 Aug 2020 20:32:04 +0000
Date:   Tue, 01 Sep 2020 04:31:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:sh-pfc] BUILD SUCCESS
 bbf369d4e59a248ed715041267951f5cd051b317
Message-ID: <5f4d5e14.2rExP2mgOwKecudi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  sh-pfc
branch HEAD: bbf369d4e59a248ed715041267951f5cd051b317  pinctrl: sh-pfc: r8a7790: Add CAN pins, groups and functions

elapsed time: 720m

configs tested: 121
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                     cu1830-neo_defconfig
xtensa                generic_kc705_defconfig
powerpc                      pasemi_defconfig
arm                            pleb_defconfig
powerpc                     mpc512x_defconfig
mips                 decstation_r4k_defconfig
m68k                            q40_defconfig
arm                       cns3420vb_defconfig
alpha                            allyesconfig
sh                           se7751_defconfig
arm                           u8500_defconfig
parisc                generic-32bit_defconfig
m68k                        mvme147_defconfig
powerpc                          allmodconfig
powerpc                 linkstation_defconfig
h8300                    h8300h-sim_defconfig
mips                       capcella_defconfig
powerpc                      ppc6xx_defconfig
m68k                       m5208evb_defconfig
mips                          rm200_defconfig
mips                     cu1000-neo_defconfig
riscv                               defconfig
mips                      pic32mzda_defconfig
sh                          sdk7780_defconfig
mips                  decstation_64_defconfig
arm                        trizeps4_defconfig
sh                           se7206_defconfig
powerpc                    mvme5100_defconfig
mips                     loongson1c_defconfig
mips                        maltaup_defconfig
sh                           sh2007_defconfig
mips                         tb0287_defconfig
arm                         socfpga_defconfig
um                             i386_defconfig
m68k                        stmark2_defconfig
m68k                             allyesconfig
mips                        jmr3927_defconfig
arm                          ixp4xx_defconfig
ia64                             alldefconfig
arm                         nhk8815_defconfig
nios2                         3c120_defconfig
powerpc                    adder875_defconfig
sh                            titan_defconfig
m68k                            mac_defconfig
mips                           gcw0_defconfig
arm                         bcm2835_defconfig
arc                            hsdk_defconfig
arm                         s5pv210_defconfig
powerpc                         wii_defconfig
sh                        sh7757lcr_defconfig
sh                           se7722_defconfig
arm                          exynos_defconfig
sh                              ul2_defconfig
arm                        clps711x_defconfig
nds32                             allnoconfig
parisc                generic-64bit_defconfig
xtensa                              defconfig
arm                              alldefconfig
arc                 nsimosci_hs_smp_defconfig
arm                          simpad_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
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
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200831
i386                 randconfig-a002-20200831
i386                 randconfig-a004-20200831
i386                 randconfig-a006-20200831
i386                 randconfig-a005-20200831
i386                 randconfig-a003-20200831
x86_64               randconfig-a012-20200831
x86_64               randconfig-a015-20200831
x86_64               randconfig-a014-20200831
x86_64               randconfig-a011-20200831
x86_64               randconfig-a016-20200831
x86_64               randconfig-a013-20200831
i386                 randconfig-a013-20200831
i386                 randconfig-a011-20200831
i386                 randconfig-a012-20200831
i386                 randconfig-a015-20200831
i386                 randconfig-a016-20200831
i386                 randconfig-a014-20200831
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
