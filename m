Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8365F2C95FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Dec 2020 04:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgLADri (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 22:47:38 -0500
Received: from mga09.intel.com ([134.134.136.24]:4917 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbgLADri (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 22:47:38 -0500
IronPort-SDR: 8UUrw3iLfcsxBqwqY7SKmZoH0DqF8GKdTWTqyV5Z2Ddvs+u8w0DXly/42vO6ekcpcUV/utTrdL
 vmQ1y8mtMXQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="172915387"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="172915387"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 19:46:57 -0800
IronPort-SDR: IDVf78Dyj48u9myUyU6pIxxzSku7E6IU3+W6WmEJej5OeWgsRghWm8XOCmH1SUngmEAHA/LEkF
 dTizzj/OoBpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="329810319"
Received: from lkp-server01.sh.intel.com (HELO 70b44b587200) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Nov 2020 19:46:55 -0800
Received: from kbuild by 70b44b587200 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kjwcx-00006m-6k; Tue, 01 Dec 2020 03:46:55 +0000
Date:   Tue, 01 Dec 2020 11:46:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 9b01f862523844081e7700b57633784e4ebbece8
Message-ID: <5fc5bca1.jQV572Jtai2HaPY/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 9b01f862523844081e7700b57633784e4ebbece8  Merge branch 'renesas-next', tag 'v5.10-rc6' into renesas-devel

elapsed time: 724m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
s390                          debug_defconfig
arm                          moxart_defconfig
arm                           corgi_defconfig
m68k                         amcore_defconfig
arm                         cm_x300_defconfig
mips                           ip27_defconfig
mips                      pic32mzda_defconfig
arm                       imx_v6_v7_defconfig
arm                        mvebu_v5_defconfig
s390                       zfcpdump_defconfig
mips                           gcw0_defconfig
arm                      pxa255-idp_defconfig
arm                        multi_v7_defconfig
m68k                                defconfig
powerpc                      ep88xc_defconfig
arm                       aspeed_g5_defconfig
arm                            mmp2_defconfig
sh                   secureedge5410_defconfig
arm                         lpc32xx_defconfig
mips                         tb0287_defconfig
arm                        mvebu_v7_defconfig
powerpc                 canyonlands_defconfig
mips                            gpr_defconfig
arc                        nsimosci_defconfig
powerpc                    sam440ep_defconfig
mips                        workpad_defconfig
arm                          gemini_defconfig
mips                     cu1000-neo_defconfig
ia64                        generic_defconfig
powerpc                     kilauea_defconfig
powerpc                    adder875_defconfig
sh                               j2_defconfig
powerpc                      katmai_defconfig
arc                           tb10x_defconfig
powerpc                     mpc5200_defconfig
nios2                         10m50_defconfig
um                           x86_64_defconfig
powerpc                     skiroot_defconfig
powerpc                 mpc836x_mds_defconfig
h8300                       h8s-sim_defconfig
powerpc                   bluestone_defconfig
powerpc                   lite5200b_defconfig
m68k                        m5272c3_defconfig
powerpc                       ebony_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                      malta_kvm_defconfig
arm                       netwinder_defconfig
powerpc                     tqm8555_defconfig
mips                        nlm_xlp_defconfig
arc                              allyesconfig
xtensa                    xip_kc705_defconfig
m68k                        mvme16x_defconfig
mips                          rm200_defconfig
m68k                       bvme6000_defconfig
mips                     cu1830-neo_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     stx_gp3_defconfig
arm                          simpad_defconfig
arm                              zx_defconfig
arm                        realview_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     kmeter1_defconfig
mips                      maltasmvp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
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
i386                 randconfig-a004-20201130
i386                 randconfig-a002-20201130
i386                 randconfig-a003-20201130
i386                 randconfig-a005-20201130
i386                 randconfig-a006-20201130
i386                 randconfig-a001-20201130
x86_64               randconfig-a014-20201130
x86_64               randconfig-a015-20201130
x86_64               randconfig-a016-20201130
x86_64               randconfig-a011-20201130
x86_64               randconfig-a012-20201130
x86_64               randconfig-a013-20201130
i386                 randconfig-a013-20201130
i386                 randconfig-a012-20201130
i386                 randconfig-a011-20201130
i386                 randconfig-a016-20201130
i386                 randconfig-a015-20201130
i386                 randconfig-a014-20201130
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
x86_64               randconfig-a002-20201130
x86_64               randconfig-a006-20201130
x86_64               randconfig-a005-20201130
x86_64               randconfig-a004-20201130
x86_64               randconfig-a001-20201130
x86_64               randconfig-a003-20201130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
