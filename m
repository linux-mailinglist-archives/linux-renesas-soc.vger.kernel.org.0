Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 118FF34E096
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Mar 2021 07:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhC3FWf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Mar 2021 01:22:35 -0400
Received: from mga09.intel.com ([134.134.136.24]:38321 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229483AbhC3FWN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Mar 2021 01:22:13 -0400
IronPort-SDR: j/6TdVrYwt0N8QxmVrxuLpBJQfUWlonch33dQJcAL3FeFMwkKzd9pV2adMeGfSI7Mi3YygOg8o
 0k/nfY2SBJ1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="191789687"
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; 
   d="scan'208";a="191789687"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 22:22:12 -0700
IronPort-SDR: 6qcZGeqj+fWnFiVZwE+VC6jQl+XkAlE/jmTtZSgWFHMkum3FptRYKbOPmIC1bkAB3x2oYJaRUm
 4tIE4SPGe/Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; 
   d="scan'208";a="454865221"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Mar 2021 22:22:10 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lR6pN-000536-Pz; Tue, 30 Mar 2021 05:22:09 +0000
Date:   Tue, 30 Mar 2021 13:21:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.13] BUILD SUCCESS
 bbbf6db5a0b56199702bb225132831bced2eee41
Message-ID: <6062b550.67rWNyitdNn1cTe4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.13
branch HEAD: bbbf6db5a0b56199702bb225132831bced2eee41  arm64: dts: renesas: r8a779a0: Fix PMU interrupt

elapsed time: 1118m

configs tested: 113
configs skipped: 90

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm64                            alldefconfig
xtensa                              defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                            hsdk_defconfig
sh                            hp6xx_defconfig
powerpc                      makalu_defconfig
m68k                          atari_defconfig
sh                            titan_defconfig
riscv                    nommu_virt_defconfig
powerpc                        cell_defconfig
powerpc                   motionpro_defconfig
mips                           gcw0_defconfig
arm                          gemini_defconfig
nios2                            allyesconfig
powerpc                     ppa8548_defconfig
mips                         cobalt_defconfig
arm                        clps711x_defconfig
arm                  colibri_pxa270_defconfig
powerpc                 mpc837x_mds_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     mpc5200_defconfig
powerpc                  mpc885_ads_defconfig
mips                     loongson1b_defconfig
mips                     decstation_defconfig
sh                         apsh4a3a_defconfig
arm                         assabet_defconfig
sh                           se7724_defconfig
mips                         bigsur_defconfig
csky                             alldefconfig
mips                        nlm_xlp_defconfig
arc                      axs103_smp_defconfig
powerpc                      ppc6xx_defconfig
arm                           spitz_defconfig
arm                         s3c2410_defconfig
arm                      jornada720_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210329
x86_64               randconfig-a003-20210329
x86_64               randconfig-a006-20210329
x86_64               randconfig-a001-20210329
x86_64               randconfig-a005-20210329
x86_64               randconfig-a004-20210329
i386                 randconfig-a003-20210329
i386                 randconfig-a004-20210329
i386                 randconfig-a001-20210329
i386                 randconfig-a002-20210329
i386                 randconfig-a006-20210329
i386                 randconfig-a005-20210329
i386                 randconfig-a014-20210329
i386                 randconfig-a011-20210329
i386                 randconfig-a015-20210329
i386                 randconfig-a016-20210329
i386                 randconfig-a013-20210329
i386                 randconfig-a012-20210329
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210329
x86_64               randconfig-a012-20210329
x86_64               randconfig-a013-20210329
x86_64               randconfig-a014-20210329
x86_64               randconfig-a011-20210329
x86_64               randconfig-a016-20210329

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
