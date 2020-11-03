Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A482A3B6D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Nov 2020 05:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgKCEaO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Nov 2020 23:30:14 -0500
Received: from mga06.intel.com ([134.134.136.31]:7215 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727139AbgKCEaO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 23:30:14 -0500
IronPort-SDR: oV84VylDiYr+gavIqXcuGuSSbwWksIqkDGsEl3IBx3fNU6/ZyHQiewtGjp+Srg7qZmJgLLnDbs
 P+21YmbDjxFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="230626756"
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; 
   d="scan'208";a="230626756"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 20:30:13 -0800
IronPort-SDR: K+oazwHMkrBcNd7BHwWCyJ7JYGLvB87nCf5TFQaMvSBFsZL0LNT0OFRBD/Gp9bbdGXPF7t0PAz
 DloX7IR6k0tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; 
   d="scan'208";a="357556287"
Received: from lkp-server02.sh.intel.com (HELO e61783667810) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 02 Nov 2020 20:30:12 -0800
Received: from kbuild by e61783667810 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kZnxT-00001r-UI; Tue, 03 Nov 2020 04:30:11 +0000
Date:   Tue, 03 Nov 2020 12:30:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 b860052992d74dfec4f75aec8050b099956c54c6
Message-ID: <5fa0dccb.9sAAMZO9YcK5d3+F%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  next
branch HEAD: b860052992d74dfec4f75aec8050b099956c54c6  Merge branch 'renesas-dt-bindings-for-v5.11' into renesas-next

elapsed time: 725m

configs tested: 146
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
sh                          rsk7269_defconfig
arm                      tct_hammer_defconfig
arm                            xcep_defconfig
sh                   rts7751r2dplus_defconfig
mips                      maltasmvp_defconfig
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
arc                          axs101_defconfig
arc                        vdk_hs38_defconfig
mips                             allyesconfig
arm                           omap1_defconfig
m68k                        mvme16x_defconfig
alpha                               defconfig
mips                        bcm47xx_defconfig
mips                            gpr_defconfig
powerpc                 mpc837x_mds_defconfig
arm                        shmobile_defconfig
m68k                        m5407c3_defconfig
mips                        qi_lb60_defconfig
powerpc                          allmodconfig
arm                            u300_defconfig
arm                         axm55xx_defconfig
parisc                           alldefconfig
powerpc                    socrates_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                     mpc5200_defconfig
arm                        cerfcube_defconfig
h8300                    h8300h-sim_defconfig
m68k                        stmark2_defconfig
sh                          rsk7201_defconfig
mips                   sb1250_swarm_defconfig
powerpc                    klondike_defconfig
arm                          pcm027_defconfig
sh                   secureedge5410_defconfig
microblaze                      mmu_defconfig
sh                        sh7757lcr_defconfig
arm                        trizeps4_defconfig
sh                          sdk7780_defconfig
powerpc                       eiger_defconfig
m68k                          multi_defconfig
xtensa                generic_kc705_defconfig
powerpc                      obs600_defconfig
sh                   sh7770_generic_defconfig
csky                                defconfig
nios2                            alldefconfig
c6x                        evmc6472_defconfig
sh                            migor_defconfig
powerpc                 mpc832x_rdb_defconfig
m68k                          amiga_defconfig
arc                        nsim_700_defconfig
mips                malta_kvm_guest_defconfig
mips                        jmr3927_defconfig
powerpc                   currituck_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                    gamecube_defconfig
sh                           se7206_defconfig
m68k                       m5208evb_defconfig
powerpc                     tqm5200_defconfig
powerpc                   lite5200b_defconfig
m68k                        mvme147_defconfig
c6x                                 defconfig
sh                     sh7710voipgw_defconfig
arm                          pxa3xx_defconfig
mips                      fuloong2e_defconfig
arm                       cns3420vb_defconfig
arm                  colibri_pxa270_defconfig
m68k                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201102
i386                 randconfig-a006-20201102
i386                 randconfig-a005-20201102
i386                 randconfig-a001-20201102
i386                 randconfig-a002-20201102
i386                 randconfig-a003-20201102
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
x86_64               randconfig-a004-20201102
x86_64               randconfig-a005-20201102
x86_64               randconfig-a003-20201102
x86_64               randconfig-a002-20201102
x86_64               randconfig-a006-20201102
x86_64               randconfig-a001-20201102

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
