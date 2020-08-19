Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 741E92491F7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Aug 2020 02:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgHSAtN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Aug 2020 20:49:13 -0400
Received: from mga01.intel.com ([192.55.52.88]:60269 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726717AbgHSAtN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Aug 2020 20:49:13 -0400
IronPort-SDR: JXNxFb5KSfqUhvbEEGxPN3s0WpmgzuyYi1utmv2u0wkoPsMdqUSB69xANmPV1N5Lt1/XtCEVId
 mkl3vGipM46A==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="173075776"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; 
   d="scan'208";a="173075776"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 17:49:11 -0700
IronPort-SDR: oNFa3pKn6ayGeb+b6Ez7pHyoAgnOqA0PmlG48YA/Bz3AKq1yxK6gmZNS/+6K2ZwwjxcIkKiyrH
 YxR+4FP9f5pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; 
   d="scan'208";a="400662689"
Received: from lkp-server02.sh.intel.com (HELO 2f0d8b563e65) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Aug 2020 17:49:10 -0700
Received: from kbuild by 2f0d8b563e65 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k8CHt-0001W5-D3; Wed, 19 Aug 2020 00:49:09 +0000
Date:   Wed, 19 Aug 2020 08:48:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 923afaacb49deba2efb93f30a5f855099b6f6948
Message-ID: <5f3c76d5.mNQ21xKD2ONmexf9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  next
branch HEAD: 923afaacb49deba2efb93f30a5f855099b6f6948  Merge branches 'renesas-arm-defconfig-for-v5.10' and 'renesas-arm-dt-for-v5.10' into renesas-next

elapsed time: 2391m

configs tested: 149
configs skipped: 89

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                        apsh4ad0a_defconfig
arm                            hisi_defconfig
ia64                             allyesconfig
riscv                    nommu_k210_defconfig
powerpc                       holly_defconfig
arm                          collie_defconfig
m68k                        stmark2_defconfig
powerpc                         ps3_defconfig
h8300                     edosk2674_defconfig
sh                          urquell_defconfig
ia64                        generic_defconfig
ia64                          tiger_defconfig
csky                                defconfig
m68k                          amiga_defconfig
ia64                             alldefconfig
powerpc                    adder875_defconfig
nds32                             allnoconfig
mips                          rb532_defconfig
powerpc                     mpc83xx_defconfig
sh                            hp6xx_defconfig
mips                      malta_kvm_defconfig
sparc                            alldefconfig
mips                       capcella_defconfig
powerpc                      ppc6xx_defconfig
arm                             mxs_defconfig
mips                        omega2p_defconfig
mips                       rbtx49xx_defconfig
mips                         cobalt_defconfig
mips                malta_kvm_guest_defconfig
mips                malta_qemu_32r6_defconfig
arm                          pcm027_defconfig
ia64                            zx1_defconfig
mips                         mpc30x_defconfig
alpha                               defconfig
arm                           tegra_defconfig
arm                         s3c2410_defconfig
m68k                          hp300_defconfig
arm                        clps711x_defconfig
mips                      pic32mzda_defconfig
mips                      maltasmvp_defconfig
arm                           sunxi_defconfig
powerpc                     powernv_defconfig
mips                             allyesconfig
arm                         assabet_defconfig
arm                        neponset_defconfig
arm                      integrator_defconfig
arm                      footbridge_defconfig
mips                        nlm_xlr_defconfig
microblaze                      mmu_defconfig
arm                        oxnas_v6_defconfig
sh                               j2_defconfig
sh                             espt_defconfig
h8300                    h8300h-sim_defconfig
mips                  decstation_64_defconfig
sh                          kfr2r09_defconfig
sh                          sdk7786_defconfig
arm                           spitz_defconfig
powerpc                        cell_defconfig
powerpc                      ppc44x_defconfig
m68k                       m5208evb_defconfig
arm                   milbeaut_m10v_defconfig
c6x                        evmc6472_defconfig
sh                           sh2007_defconfig
mips                        nlm_xlp_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20200817
x86_64               randconfig-a001-20200817
x86_64               randconfig-a005-20200817
x86_64               randconfig-a003-20200817
x86_64               randconfig-a002-20200817
x86_64               randconfig-a004-20200817
i386                 randconfig-a005-20200817
i386                 randconfig-a001-20200817
i386                 randconfig-a002-20200817
i386                 randconfig-a003-20200817
i386                 randconfig-a006-20200817
i386                 randconfig-a004-20200817
i386                 randconfig-a005-20200818
i386                 randconfig-a002-20200818
i386                 randconfig-a001-20200818
i386                 randconfig-a006-20200818
i386                 randconfig-a003-20200818
i386                 randconfig-a004-20200818
x86_64               randconfig-a013-20200818
x86_64               randconfig-a016-20200818
x86_64               randconfig-a012-20200818
x86_64               randconfig-a011-20200818
x86_64               randconfig-a014-20200818
x86_64               randconfig-a015-20200818
i386                 randconfig-a016-20200817
i386                 randconfig-a011-20200817
i386                 randconfig-a013-20200817
i386                 randconfig-a015-20200817
i386                 randconfig-a014-20200817
i386                 randconfig-a012-20200817
i386                 randconfig-a016-20200818
i386                 randconfig-a011-20200818
i386                 randconfig-a015-20200818
i386                 randconfig-a013-20200818
i386                 randconfig-a012-20200818
i386                 randconfig-a014-20200818
x86_64               randconfig-a006-20200819
x86_64               randconfig-a001-20200819
x86_64               randconfig-a003-20200819
x86_64               randconfig-a005-20200819
x86_64               randconfig-a004-20200819
x86_64               randconfig-a002-20200819
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
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
