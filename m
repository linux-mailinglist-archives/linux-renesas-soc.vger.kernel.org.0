Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB012AE666
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 03:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgKKC21 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 21:28:27 -0500
Received: from mga02.intel.com ([134.134.136.20]:12758 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbgKKC21 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 21:28:27 -0500
IronPort-SDR: RJEDI3zxMSrKfwawlz7RWp9/+FN5zsya8t0TyWWK9/dIul8NqnusdjVBNn7znDHsU+JOJlDmSs
 EM/vgFHQ8MIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="157091214"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
   d="scan'208";a="157091214"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 18:28:26 -0800
IronPort-SDR: WhA4fih/AxdPq1G32vBGmsCD1E/B5isfglmlDLd9v7gxz5FjOFe7EU6vfmiHFAVWbpTvXoaOZ7
 GA0z6rCIAmuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
   d="scan'208";a="356431753"
Received: from lkp-server02.sh.intel.com (HELO c6c5fbb3488a) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Nov 2020 18:28:25 -0800
Received: from kbuild by c6c5fbb3488a with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kcfs1-0000aw-0b; Wed, 11 Nov 2020 02:28:25 +0000
Date:   Wed, 11 Nov 2020 10:28:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-pinctrl-for-v5.11] BUILD SUCCESS
 86f52edb7374a83c294ffad3a1fb58dbe76c5a06
Message-ID: <5fab4c42.5YyAetKYWph+xocf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  renesas-pinctrl-for-v5.11
branch HEAD: 86f52edb7374a83c294ffad3a1fb58dbe76c5a06  pinctrl: renesas: Constify sh73a0_vccq_mc0_ops

elapsed time: 723m

configs tested: 139
configs skipped: 2

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
arm                         shannon_defconfig
powerpc                  mpc866_ads_defconfig
mips                         bigsur_defconfig
m68k                          hp300_defconfig
nios2                         3c120_defconfig
parisc                           alldefconfig
m68k                        m5407c3_defconfig
m68k                        stmark2_defconfig
sh                           se7721_defconfig
powerpc                   motionpro_defconfig
sh                           se7750_defconfig
arm                          moxart_defconfig
powerpc                          g5_defconfig
mips                           ip22_defconfig
arm                      jornada720_defconfig
arm                            zeus_defconfig
arc                 nsimosci_hs_smp_defconfig
sparc64                             defconfig
arm                          badge4_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
sh                          polaris_defconfig
m68k                            q40_defconfig
sh                        edosk7760_defconfig
xtensa                       common_defconfig
arm                           corgi_defconfig
sh                               j2_defconfig
powerpc                   currituck_defconfig
ia64                         bigsur_defconfig
sh                              ul2_defconfig
arm                       omap2plus_defconfig
mips                     loongson1b_defconfig
arm                   milbeaut_m10v_defconfig
mips                           ip32_defconfig
mips                         tb0287_defconfig
powerpc                    amigaone_defconfig
powerpc                    klondike_defconfig
mips                            ar7_defconfig
mips                   sb1250_swarm_defconfig
sparc                               defconfig
arm                       versatile_defconfig
arm                  colibri_pxa270_defconfig
microblaze                          defconfig
sh                   rts7751r2dplus_defconfig
powerpc                      ppc44x_defconfig
m68k                       m5475evb_defconfig
m68k                          atari_defconfig
arm                             rpc_defconfig
m68k                         amcore_defconfig
arm                            hisi_defconfig
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
i386                                defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a006-20201110
x86_64               randconfig-a003-20201110
x86_64               randconfig-a005-20201110
x86_64               randconfig-a004-20201110
x86_64               randconfig-a002-20201110
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
x86_64               randconfig-a015-20201110
x86_64               randconfig-a011-20201110
x86_64               randconfig-a014-20201110
x86_64               randconfig-a013-20201110
x86_64               randconfig-a016-20201110
x86_64               randconfig-a012-20201110

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
