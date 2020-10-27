Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE96929A7B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Oct 2020 10:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2509213AbgJ0JXc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Oct 2020 05:23:32 -0400
Received: from mga06.intel.com ([134.134.136.31]:61544 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2509806AbgJ0JXc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 05:23:32 -0400
IronPort-SDR: czRlWbJst0J5Vvu9X0KmxcNLGXJeCRtQxIki6SsgEHgm0rvRGxFs4m9+bvE2i8TEdqU3xZgw3p
 xyUNqZ7/D9pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="229687236"
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; 
   d="scan'208";a="229687236"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2020 02:23:31 -0700
IronPort-SDR: trPKQ3Yxr/bGtWNvuWmFCvDN62lf0btcwbDumEKTg6G0vGsb0Nw3udZXJZ1Ctua4ygUI/4sRru
 UW0K1Gvtgy+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; 
   d="scan'208";a="361314682"
Received: from lkp-server01.sh.intel.com (HELO ef28dff175aa) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 Oct 2020 02:23:30 -0700
Received: from kbuild by ef28dff175aa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kXLCT-0000BF-Jh; Tue, 27 Oct 2020 09:23:29 +0000
Date:   Tue, 27 Oct 2020 17:22:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-drivers-for-v5.11] BUILD SUCCESS
 cf25d802e029c31efac8bdc979236927f37183bd
Message-ID: <5f97e6ec.WDzLe54pof/2Icr5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-drivers-for-v5.11
branch HEAD: cf25d802e029c31efac8bdc979236927f37183bd  soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()

elapsed time: 725m

configs tested: 127
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                             sh03_defconfig
powerpc                     sequoia_defconfig
ia64                             alldefconfig
arm                           sunxi_defconfig
powerpc                        icon_defconfig
sh                     magicpanelr2_defconfig
mips                         tb0219_defconfig
sh                          landisk_defconfig
arm                             mxs_defconfig
powerpc                       holly_defconfig
ia64                             allyesconfig
arm                          pxa910_defconfig
xtensa                generic_kc705_defconfig
arm                            qcom_defconfig
arm                           h3600_defconfig
arm                           sama5_defconfig
arm                         s3c2410_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          rsk7269_defconfig
powerpc                      obs600_defconfig
mips                      pic32mzda_defconfig
xtensa                         virt_defconfig
powerpc                 linkstation_defconfig
mips                      bmips_stb_defconfig
parisc                generic-32bit_defconfig
arm                      integrator_defconfig
arm                          simpad_defconfig
arm                         shannon_defconfig
arm                         s3c6400_defconfig
arm                         assabet_defconfig
sh                            shmin_defconfig
i386                             alldefconfig
powerpc                      mgcoge_defconfig
arm                            lart_defconfig
mips                     loongson1c_defconfig
arm                        mvebu_v5_defconfig
ia64                         bigsur_defconfig
arm                          moxart_defconfig
arm                      footbridge_defconfig
arm                  colibri_pxa270_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                       multi_v4t_defconfig
arm                        trizeps4_defconfig
powerpc                     redwood_defconfig
arc                      axs103_smp_defconfig
ia64                                defconfig
m68k                        mvme16x_defconfig
powerpc                      acadia_defconfig
powerpc                     tqm8560_defconfig
powerpc                         ps3_defconfig
powerpc                 mpc832x_rdb_defconfig
c6x                        evmc6678_defconfig
powerpc                       ppc64_defconfig
arm                       versatile_defconfig
arc                     nsimosci_hs_defconfig
ia64                             allmodconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20201026
i386                 randconfig-a003-20201026
i386                 randconfig-a005-20201026
i386                 randconfig-a001-20201026
i386                 randconfig-a006-20201026
i386                 randconfig-a004-20201026
x86_64               randconfig-a011-20201026
x86_64               randconfig-a013-20201026
x86_64               randconfig-a016-20201026
x86_64               randconfig-a015-20201026
x86_64               randconfig-a012-20201026
x86_64               randconfig-a014-20201026
i386                 randconfig-a016-20201026
i386                 randconfig-a015-20201026
i386                 randconfig-a014-20201026
i386                 randconfig-a012-20201026
i386                 randconfig-a013-20201026
i386                 randconfig-a011-20201026
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20201026
x86_64               randconfig-a003-20201026
x86_64               randconfig-a002-20201026
x86_64               randconfig-a006-20201026
x86_64               randconfig-a004-20201026
x86_64               randconfig-a005-20201026

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
