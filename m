Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42EC30313C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 02:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730486AbhAZB2f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Jan 2021 20:28:35 -0500
Received: from mga06.intel.com ([134.134.136.31]:10854 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727173AbhAZB02 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 20:26:28 -0500
IronPort-SDR: xYOUyEOwjhOFUn1WEmrNjTrlgVSK/d1EyKOEzySY+YtbWUKQjtg5ynrZOc8ezoj4Lu0Tc2SZPs
 mR5VXVoU4auw==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="241357269"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="241357269"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 16:38:55 -0800
IronPort-SDR: sFaAJktWx8P3TtAi0J4gw+jhgcsRVe1F2Pxrxtw92ugCvkpEqSkoDd881vQGtypATcguz7EhzL
 Lt/t/9ZpxciA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="472555944"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jan 2021 16:38:54 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l4CNh-0000SZ-KN; Tue, 26 Jan 2021 00:38:53 +0000
Date:   Tue, 26 Jan 2021 08:38:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 88f9dbd53c9c6e7f2133822d0727208a2033e1d2
Message-ID: <600f647d.Qd+zLOQXNX81w1c7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 88f9dbd53c9c6e7f2133822d0727208a2033e1d2  Merge branch 'renesas-arm-dt-for-v5.12' into renesas-next

elapsed time: 726m

configs tested: 124
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7722_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                   sh7770_generic_defconfig
arm                          badge4_defconfig
sh                        sh7757lcr_defconfig
c6x                                 defconfig
powerpc                   bluestone_defconfig
arm                  colibri_pxa270_defconfig
riscv                             allnoconfig
powerpc                    klondike_defconfig
arm                         palmz72_defconfig
m68k                        stmark2_defconfig
mips                         tb0287_defconfig
arm                         assabet_defconfig
powerpc                       eiger_defconfig
sh                           sh2007_defconfig
powerpc                     stx_gp3_defconfig
h8300                            allyesconfig
powerpc                      cm5200_defconfig
arm                           omap1_defconfig
sh                            shmin_defconfig
mips                        nlm_xlr_defconfig
arm                        neponset_defconfig
sh                 kfr2r09-romimage_defconfig
arm                            mmp2_defconfig
ia64                      gensparse_defconfig
arm                              alldefconfig
mips                   sb1250_swarm_defconfig
sh                           se7712_defconfig
x86_64                              defconfig
powerpc                      acadia_defconfig
powerpc                      pmac32_defconfig
arm                           viper_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                    amigaone_defconfig
mips                      fuloong2e_defconfig
arm                       aspeed_g5_defconfig
arm                         nhk8815_defconfig
mips                  maltasmvp_eva_defconfig
arc                            hsdk_defconfig
powerpc                     mpc83xx_defconfig
arm                          imote2_defconfig
m68k                            q40_defconfig
mips                malta_qemu_32r6_defconfig
arm                        multi_v7_defconfig
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
x86_64               randconfig-a003-20210125
x86_64               randconfig-a002-20210125
x86_64               randconfig-a001-20210125
x86_64               randconfig-a005-20210125
x86_64               randconfig-a006-20210125
x86_64               randconfig-a004-20210125
i386                 randconfig-a001-20210125
i386                 randconfig-a002-20210125
i386                 randconfig-a004-20210125
i386                 randconfig-a006-20210125
i386                 randconfig-a005-20210125
i386                 randconfig-a003-20210125
x86_64               randconfig-a012-20210126
x86_64               randconfig-a016-20210126
x86_64               randconfig-a015-20210126
x86_64               randconfig-a011-20210126
x86_64               randconfig-a013-20210126
x86_64               randconfig-a014-20210126
i386                 randconfig-a013-20210125
i386                 randconfig-a011-20210125
i386                 randconfig-a012-20210125
i386                 randconfig-a015-20210125
i386                 randconfig-a014-20210125
i386                 randconfig-a016-20210125
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210125
x86_64               randconfig-a016-20210125
x86_64               randconfig-a015-20210125
x86_64               randconfig-a011-20210125
x86_64               randconfig-a013-20210125
x86_64               randconfig-a014-20210125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
