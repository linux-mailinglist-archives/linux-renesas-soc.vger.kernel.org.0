Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA592AE737
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 04:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgKKDt6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 22:49:58 -0500
Received: from mga12.intel.com ([192.55.52.136]:46723 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbgKKDt5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 22:49:57 -0500
IronPort-SDR: X0s8l508qM9KGigEwSZAOGsRYvRngU6mtPw1tRiLvcO4nT2EXWrriBFZvYuI8n+x4GxLLRXtBI
 leSH7Y91Si/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="149365232"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
   d="scan'208";a="149365232"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 19:49:56 -0800
IronPort-SDR: BdywYe+tDTxA1OwxTL5d1fNDssWWyGRr0rB2Hk4umxkc6xTUJCU5Hkz1Ex0tXJdW2S/CIyHdlX
 YbyQj4pvEYyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
   d="scan'208";a="327946630"
Received: from lkp-server02.sh.intel.com (HELO 14a21f3b7a6a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 10 Nov 2020 19:49:55 -0800
Received: from kbuild by 14a21f3b7a6a with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kch8s-00002C-Ev; Wed, 11 Nov 2020 03:49:54 +0000
Date:   Wed, 11 Nov 2020 11:49:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-defconfig-for-v5.11] BUILD SUCCESS
 bc518da26e3a98d8eaa713b7e51a326eceb3b3fd
Message-ID: <5fab5f48.WaJdesRHH7iP4ewf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-defconfig-for-v5.11
branch HEAD: bc518da26e3a98d8eaa713b7e51a326eceb3b3fd  arm64: defconfig: Enable R8A779A0 SoC

elapsed time: 725m

configs tested: 168
configs skipped: 93

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                       aspeed_g4_defconfig
sh                   sh7724_generic_defconfig
mips                malta_qemu_32r6_defconfig
sh                          lboxre2_defconfig
nios2                            alldefconfig
powerpc                      pcm030_defconfig
powerpc                    amigaone_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      ppc64e_defconfig
arm                      pxa255-idp_defconfig
sparc                               defconfig
arm                             mxs_defconfig
mips                           ip32_defconfig
openrisc                 simple_smp_defconfig
arm                    vt8500_v6_v7_defconfig
arm                          pxa3xx_defconfig
arm                           corgi_defconfig
arm                            mmp2_defconfig
ia64                      gensparse_defconfig
ia64                             alldefconfig
powerpc                    sam440ep_defconfig
nios2                         10m50_defconfig
arm                          exynos_defconfig
xtensa                          iss_defconfig
powerpc                     skiroot_defconfig
arm                           efm32_defconfig
arm                          iop32x_defconfig
arm                        cerfcube_defconfig
h8300                    h8300h-sim_defconfig
h8300                               defconfig
powerpc                   motionpro_defconfig
sh                           se7750_defconfig
arm                          moxart_defconfig
powerpc                          g5_defconfig
mips                           ip22_defconfig
arm                      jornada720_defconfig
powerpc                     tqm8541_defconfig
arm                          pcm027_defconfig
riscv                    nommu_virt_defconfig
sh                        dreamcast_defconfig
sh                     sh7710voipgw_defconfig
mips                           ip28_defconfig
h8300                     edosk2674_defconfig
powerpc                     tqm5200_defconfig
arm                        mini2440_defconfig
sh                               j2_defconfig
powerpc                   currituck_defconfig
ia64                         bigsur_defconfig
sh                              ul2_defconfig
sh                         apsh4a3a_defconfig
arm                       netwinder_defconfig
arm                         mv78xx0_defconfig
sh                            migor_defconfig
arm                       omap2plus_defconfig
mips                     loongson1b_defconfig
arm                   milbeaut_m10v_defconfig
arc                          axs101_defconfig
mips                           jazz_defconfig
arm                            pleb_defconfig
mips                        maltaup_defconfig
arm                        magician_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc836x_mds_defconfig
arm                       versatile_defconfig
arm                  colibri_pxa270_defconfig
microblaze                          defconfig
sh                   rts7751r2dplus_defconfig
powerpc                      ppc44x_defconfig
nds32                             allnoconfig
sh                          r7780mp_defconfig
powerpc                       ebony_defconfig
alpha                               defconfig
arm                          lpd270_defconfig
powerpc                     ppa8548_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20201110
x86_64               randconfig-a005-20201110
x86_64               randconfig-a004-20201110
x86_64               randconfig-a002-20201110
x86_64               randconfig-a006-20201110
x86_64               randconfig-a001-20201110
i386                 randconfig-a006-20201110
i386                 randconfig-a005-20201110
i386                 randconfig-a002-20201110
i386                 randconfig-a001-20201110
i386                 randconfig-a003-20201110
i386                 randconfig-a004-20201110
i386                 randconfig-a006-20201111
i386                 randconfig-a005-20201111
i386                 randconfig-a002-20201111
i386                 randconfig-a001-20201111
i386                 randconfig-a003-20201111
i386                 randconfig-a004-20201111
x86_64               randconfig-a015-20201111
x86_64               randconfig-a011-20201111
x86_64               randconfig-a014-20201111
x86_64               randconfig-a013-20201111
x86_64               randconfig-a016-20201111
x86_64               randconfig-a012-20201111
i386                 randconfig-a012-20201110
i386                 randconfig-a014-20201110
i386                 randconfig-a016-20201110
i386                 randconfig-a011-20201110
i386                 randconfig-a015-20201110
i386                 randconfig-a013-20201110
i386                 randconfig-a012-20201111
i386                 randconfig-a014-20201111
i386                 randconfig-a016-20201111
i386                 randconfig-a011-20201111
i386                 randconfig-a015-20201111
i386                 randconfig-a013-20201111
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
x86_64               randconfig-a015-20201110
x86_64               randconfig-a011-20201110
x86_64               randconfig-a014-20201110
x86_64               randconfig-a013-20201110
x86_64               randconfig-a016-20201110
x86_64               randconfig-a012-20201110
x86_64               randconfig-a003-20201111
x86_64               randconfig-a005-20201111
x86_64               randconfig-a004-20201111
x86_64               randconfig-a002-20201111
x86_64               randconfig-a006-20201111
x86_64               randconfig-a001-20201111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
