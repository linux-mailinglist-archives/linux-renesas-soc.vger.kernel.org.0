Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 702652EFAF1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 23:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbhAHWQA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 17:16:00 -0500
Received: from mga17.intel.com ([192.55.52.151]:57760 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbhAHWQA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 17:16:00 -0500
IronPort-SDR: FWI6wIrEeRMLVTwosLJiri+98ceoeOX6yeudo/qEoCpDe7+PlnGAfWYPaw3AX8UgmzyJ4DXjBr
 jzMZ/JUl6RKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9858"; a="157442928"
X-IronPort-AV: E=Sophos;i="5.79,332,1602572400"; 
   d="scan'208";a="157442928"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 14:15:19 -0800
IronPort-SDR: JCdbGytAEFfPIMFJavTkYeok6ouQTdiTutTUBpOjM+/WS965nCBQCFAyDY4h2gjDaM8Hm4mtZC
 smPjtOQF761A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,332,1602572400"; 
   d="scan'208";a="380269581"
Received: from lkp-server01.sh.intel.com (HELO 412602b27703) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Jan 2021 14:15:18 -0800
Received: from kbuild by 412602b27703 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ky02P-0000hj-Nq; Fri, 08 Jan 2021 22:15:17 +0000
Date:   Sat, 09 Jan 2021 06:14:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 0d9412f64333a46528eb4136dfb1d06481b18ea7
Message-ID: <5ff8d93a.9C+PspYUAZGisG0t%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 0d9412f64333a46528eb4136dfb1d06481b18ea7  Merge tag 'v5.11-rc2' into renesas-devel

elapsed time: 749m

configs tested: 143
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                       imx_v6_v7_defconfig
x86_64                              defconfig
nios2                            allyesconfig
powerpc                    mvme5100_defconfig
mips                          ath25_defconfig
sh                             shx3_defconfig
m68k                          multi_defconfig
sh                          lboxre2_defconfig
openrisc                            defconfig
powerpc                      arches_defconfig
mips                        qi_lb60_defconfig
powerpc                     sbc8548_defconfig
openrisc                 simple_smp_defconfig
sh                           se7780_defconfig
powerpc                      mgcoge_defconfig
mips                      malta_kvm_defconfig
m68k                        mvme16x_defconfig
powerpc                         wii_defconfig
riscv                          rv32_defconfig
m68k                             alldefconfig
openrisc                  or1klitex_defconfig
parisc                generic-32bit_defconfig
powerpc                        warp_defconfig
mips                           ip28_defconfig
riscv                            alldefconfig
mips                        jmr3927_defconfig
arm                           spitz_defconfig
arm                        magician_defconfig
sh                            migor_defconfig
arm                       imx_v4_v5_defconfig
sh                         ap325rxa_defconfig
m68k                         amcore_defconfig
ia64                             alldefconfig
sh                        sh7785lcr_defconfig
arm                           h3600_defconfig
m68k                          atari_defconfig
sparc                       sparc64_defconfig
c6x                        evmc6472_defconfig
mips                        workpad_defconfig
mips                        omega2p_defconfig
sh                            titan_defconfig
powerpc                      ppc64e_defconfig
sh                        dreamcast_defconfig
arm                         lpc18xx_defconfig
arm                        mvebu_v7_defconfig
microblaze                          defconfig
arm                        oxnas_v6_defconfig
sh                      rts7751r2d1_defconfig
arm                       omap2plus_defconfig
mips                     cu1830-neo_defconfig
alpha                            alldefconfig
mips                           ci20_defconfig
powerpc                     tqm8548_defconfig
xtensa                              defconfig
arm                          pxa168_defconfig
sh                         ecovec24_defconfig
sh                        edosk7705_defconfig
powerpc                  iss476-smp_defconfig
arm                       aspeed_g5_defconfig
m68k                       m5249evb_defconfig
sh                           se7619_defconfig
mips                      maltaaprp_defconfig
arc                          axs103_defconfig
arc                          axs101_defconfig
mips                           gcw0_defconfig
mips                      pic32mzda_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                      pistachio_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
x86_64               randconfig-a004-20210108
x86_64               randconfig-a006-20210108
x86_64               randconfig-a001-20210108
x86_64               randconfig-a002-20210108
x86_64               randconfig-a003-20210108
x86_64               randconfig-a005-20210108
i386                 randconfig-a005-20210108
i386                 randconfig-a002-20210108
i386                 randconfig-a001-20210108
i386                 randconfig-a003-20210108
i386                 randconfig-a006-20210108
i386                 randconfig-a004-20210108
i386                 randconfig-a016-20210108
i386                 randconfig-a011-20210108
i386                 randconfig-a014-20210108
i386                 randconfig-a015-20210108
i386                 randconfig-a013-20210108
i386                 randconfig-a012-20210108
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210108
x86_64               randconfig-a011-20210108
x86_64               randconfig-a012-20210108
x86_64               randconfig-a016-20210108
x86_64               randconfig-a014-20210108
x86_64               randconfig-a015-20210108

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
