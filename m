Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D15932A3B6C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Nov 2020 05:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbgKCEaO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Nov 2020 23:30:14 -0500
Received: from mga09.intel.com ([134.134.136.24]:47968 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727093AbgKCEaO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 23:30:14 -0500
IronPort-SDR: CjXgN09h4Vpz7jYnKGShhUhOKmCJ9Fyqo/V3a3YKWkIzc4yuQPOZVVKDGw5lAywRfKQEXkq4jv
 95vfbmuEE3hg==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="169129618"
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; 
   d="scan'208";a="169129618"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 20:30:13 -0800
IronPort-SDR: TMhb0mTNVMPRKZvRGDL0bX8JI+uwp75VhwOCLfFwE977x5ty0xz8vSft/wO8ghhntlYWqAHQMw
 UjN8F3Pr4jwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; 
   d="scan'208";a="470640366"
Received: from lkp-server02.sh.intel.com (HELO e61783667810) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 02 Nov 2020 20:30:12 -0800
Received: from kbuild by e61783667810 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kZnxT-00001l-Rf; Tue, 03 Nov 2020 04:30:11 +0000
Date:   Tue, 03 Nov 2020 12:30:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-dt-bindings-for-v5.11] BUILD SUCCESS
 5649789d9706e864b9a2af2c057da5b1706ff3a0
Message-ID: <5fa0dccd.rdsD+l31IjS7Mw/I%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-dt-bindings-for-v5.11
branch HEAD: 5649789d9706e864b9a2af2c057da5b1706ff3a0  dt-bindings: arm: renesas: Add R-Car M3-W+ ULCB with Kingfisher

elapsed time: 725m

configs tested: 140
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                    vt8500_v6_v7_defconfig
powerpc                    amigaone_defconfig
arm                        spear6xx_defconfig
arm                            mmp2_defconfig
ia64                        generic_defconfig
mips                    maltaup_xpa_defconfig
sh                           se7750_defconfig
arm                         at91_dt_defconfig
arm                              zx_defconfig
sh                           se7343_defconfig
sh                            hp6xx_defconfig
powerpc                      makalu_defconfig
sh                          polaris_defconfig
sh                           se7724_defconfig
m68k                       bvme6000_defconfig
arm                         lpc32xx_defconfig
ia64                            zx1_defconfig
m68k                             allmodconfig
m68k                        mvme16x_defconfig
alpha                               defconfig
mips                        bcm47xx_defconfig
mips                            gpr_defconfig
powerpc                 mpc837x_mds_defconfig
arm                        shmobile_defconfig
m68k                        m5407c3_defconfig
mips                        qi_lb60_defconfig
arm                            u300_defconfig
powerpc                          allmodconfig
mips                     loongson1b_defconfig
powerpc                      arches_defconfig
m68k                        mvme147_defconfig
arm                        neponset_defconfig
arm                         axm55xx_defconfig
parisc                           alldefconfig
powerpc                    socrates_defconfig
powerpc                 mpc834x_mds_defconfig
sh                          sdk7780_defconfig
powerpc                       eiger_defconfig
m68k                          multi_defconfig
xtensa                generic_kc705_defconfig
powerpc                      obs600_defconfig
sh                   sh7770_generic_defconfig
csky                                defconfig
nds32                            alldefconfig
riscv                    nommu_k210_defconfig
arm                            xcep_defconfig
sh                         ecovec24_defconfig
riscv                          rv32_defconfig
nios2                            alldefconfig
arm                      tct_hammer_defconfig
c6x                        evmc6472_defconfig
sh                            migor_defconfig
mips                malta_kvm_guest_defconfig
mips                        jmr3927_defconfig
powerpc                   currituck_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                    gamecube_defconfig
mips                      maltasmvp_defconfig
sh                           se7206_defconfig
m68k                       m5208evb_defconfig
microblaze                      mmu_defconfig
arm                          pxa3xx_defconfig
mips                      fuloong2e_defconfig
arm                       cns3420vb_defconfig
arm                  colibri_pxa270_defconfig
m68k                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
sparc                               defconfig
i386                                defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201102
i386                 randconfig-a006-20201102
i386                 randconfig-a005-20201102
i386                 randconfig-a001-20201102
i386                 randconfig-a002-20201102
i386                 randconfig-a003-20201102
i386                 randconfig-a004-20201103
i386                 randconfig-a006-20201103
i386                 randconfig-a005-20201103
i386                 randconfig-a001-20201103
i386                 randconfig-a002-20201103
i386                 randconfig-a003-20201103
x86_64               randconfig-a012-20201102
x86_64               randconfig-a015-20201102
x86_64               randconfig-a011-20201102
x86_64               randconfig-a013-20201102
x86_64               randconfig-a014-20201102
x86_64               randconfig-a016-20201102
i386                 randconfig-a013-20201102
i386                 randconfig-a015-20201102
i386                 randconfig-a014-20201102
i386                 randconfig-a016-20201102
i386                 randconfig-a011-20201102
i386                 randconfig-a012-20201102
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201102
x86_64               randconfig-a005-20201102
x86_64               randconfig-a003-20201102
x86_64               randconfig-a002-20201102
x86_64               randconfig-a006-20201102
x86_64               randconfig-a001-20201102

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
