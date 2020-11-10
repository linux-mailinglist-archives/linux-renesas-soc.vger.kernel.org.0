Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4422AC9A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 01:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgKJAXs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Nov 2020 19:23:48 -0500
Received: from mga03.intel.com ([134.134.136.65]:58377 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727311AbgKJAXs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 19:23:48 -0500
IronPort-SDR: BLqeWnzlMbXravdcUhL4S4GfpzYCsinPWxu7pv3lL6Apwt8lQDaiyLDv4bh97p3teMzdbmOnj9
 p6WiPD/G6G4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="170004730"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="170004730"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 16:23:46 -0800
IronPort-SDR: O0Inb0xfYiloEtV3Lo6W+w87l/Q6HIawP5fdplYzDoj1pbhjcNKmmGCQv2kV33SIp0Os+Ij127
 5jJSt6LsC3zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="354308263"
Received: from lkp-server01.sh.intel.com (HELO d0be80f1a028) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Nov 2020 16:23:45 -0800
Received: from kbuild by d0be80f1a028 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kcHRo-0000Wy-Lq; Tue, 10 Nov 2020 00:23:44 +0000
Date:   Tue, 10 Nov 2020 08:23:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-pinctrl-for-v5.11] BUILD SUCCESS
 92db7780f6d17e50976b21af8ffc4e2bb890733a
Message-ID: <5fa9dd8e.IruRJQvRqE7JBxH8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  renesas-pinctrl-for-v5.11
branch HEAD: 92db7780f6d17e50976b21af8ffc4e2bb890733a  pinctrl: renesas: Protect GPIO leftovers by CONFIG_PINCTRL_SH_FUNC_GPIO

elapsed time: 723m

configs tested: 152
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
openrisc                 simple_smp_defconfig
xtensa                  cadence_csp_defconfig
mips                      maltaaprp_defconfig
powerpc                  storcenter_defconfig
ia64                            zx1_defconfig
sh                            migor_defconfig
powerpc                      pmac32_defconfig
powerpc                     mpc5200_defconfig
sh                      rts7751r2d1_defconfig
mips                      malta_kvm_defconfig
sh                ecovec24-romimage_defconfig
parisc                generic-64bit_defconfig
x86_64                              defconfig
powerpc                    sam440ep_defconfig
powerpc                     pseries_defconfig
m68k                         amcore_defconfig
arm                         s5pv210_defconfig
xtensa                  audio_kc705_defconfig
m68k                          hp300_defconfig
sh                           se7206_defconfig
arm                          ep93xx_defconfig
arc                        nsimosci_defconfig
sh                          sdk7780_defconfig
mips                          malta_defconfig
powerpc                        cell_defconfig
sh                            hp6xx_defconfig
powerpc                 mpc836x_mds_defconfig
sh                          rsk7201_defconfig
powerpc                      pasemi_defconfig
mips                             allmodconfig
powerpc                     stx_gp3_defconfig
arm                         nhk8815_defconfig
mips                  cavium_octeon_defconfig
m68k                             alldefconfig
nios2                         10m50_defconfig
powerpc                     tqm8548_defconfig
c6x                        evmc6474_defconfig
powerpc                     tqm8541_defconfig
arc                                 defconfig
mips                      fuloong2e_defconfig
sh                         microdev_defconfig
arm                            mmp2_defconfig
arm                          collie_defconfig
sh                        sh7757lcr_defconfig
arm                       versatile_defconfig
arc                              alldefconfig
arm                        multi_v5_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                   motionpro_defconfig
powerpc                     tqm5200_defconfig
powerpc                      katmai_defconfig
arm                        mvebu_v7_defconfig
m68k                        m5272c3_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                       omap2plus_defconfig
mips                           ip27_defconfig
powerpc                 mpc8560_ads_defconfig
mips                        qi_lb60_defconfig
mips                           jazz_defconfig
arm                        keystone_defconfig
arm                        cerfcube_defconfig
arm                        oxnas_v6_defconfig
arc                        vdk_hs38_defconfig
arm                          pcm027_defconfig
arm                        realview_defconfig
mips                          rb532_defconfig
mips                        nlm_xlr_defconfig
parisc                           alldefconfig
arm                        shmobile_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                     tqm8540_defconfig
powerpc                     skiroot_defconfig
arm                         shannon_defconfig
arm                           corgi_defconfig
arm                          gemini_defconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201109
x86_64               randconfig-a002-20201109
x86_64               randconfig-a003-20201109
x86_64               randconfig-a005-20201109
x86_64               randconfig-a006-20201109
x86_64               randconfig-a001-20201109
i386                 randconfig-a004-20201109
i386                 randconfig-a006-20201109
i386                 randconfig-a005-20201109
i386                 randconfig-a001-20201109
i386                 randconfig-a003-20201109
i386                 randconfig-a002-20201109
i386                 randconfig-a014-20201109
i386                 randconfig-a015-20201109
i386                 randconfig-a013-20201109
i386                 randconfig-a016-20201109
i386                 randconfig-a011-20201109
i386                 randconfig-a012-20201109
x86_64               randconfig-a003-20201110
x86_64               randconfig-a005-20201110
x86_64               randconfig-a004-20201110
x86_64               randconfig-a002-20201110
x86_64               randconfig-a006-20201110
x86_64               randconfig-a001-20201110
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20201109
x86_64               randconfig-a015-20201109
x86_64               randconfig-a013-20201109
x86_64               randconfig-a011-20201109
x86_64               randconfig-a014-20201109
x86_64               randconfig-a016-20201109

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
