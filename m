Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5EC302F5F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Jan 2021 23:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732149AbhAYWtI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Jan 2021 17:49:08 -0500
Received: from mga09.intel.com ([134.134.136.24]:51855 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732719AbhAYWpv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 17:45:51 -0500
IronPort-SDR: QIHBSjx/QsWHlc0VUohiv1iz5RITpGX2OZ3zJEhLjnMdZYX6po8+LX5Y82NnLpt5Sz/mz4Lr8I
 MiTX0Fhsd6rA==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="179961399"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="179961399"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 14:44:52 -0800
IronPort-SDR: Y/g3ZGT/PIh5i6bF6uct5FJYNP6/kHWuLFrQwnh/xEMQrNPVi/d9DbrjwoJUQJ8IJQkn3exslk
 6wrH3nh1UrYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="573836581"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jan 2021 14:44:51 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l4AbK-0000Qs-FN; Mon, 25 Jan 2021 22:44:50 +0000
Date:   Tue, 26 Jan 2021 06:44:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-clk] BUILD SUCCESS
 c5e91ba25a65378edb013fbfe418b65d74f9aae5
Message-ID: <600f49b0.A81hNziGbK3BMXFq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: c5e91ba25a65378edb013fbfe418b65d74f9aae5  clk: renesas: r8a779a0: Add RAVB clocks

elapsed time: 740m

configs tested: 112
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sparc                               defconfig
arm                       aspeed_g5_defconfig
riscv                            alldefconfig
arm                          imote2_defconfig
powerpc                   bluestone_defconfig
arm                  colibri_pxa270_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          pcm027_defconfig
mips                        qi_lb60_defconfig
mips                  decstation_64_defconfig
mips                         tb0287_defconfig
arm                         palmz72_defconfig
arm                         assabet_defconfig
powerpc                       eiger_defconfig
sh                           sh2007_defconfig
powerpc                     stx_gp3_defconfig
sh                      rts7751r2d1_defconfig
mips                         tb0219_defconfig
mips                           ip27_defconfig
m68k                         apollo_defconfig
arc                        nsimosci_defconfig
h8300                            allyesconfig
powerpc                      cm5200_defconfig
arm                           omap1_defconfig
sh                            shmin_defconfig
mips                        nlm_xlr_defconfig
arm                        neponset_defconfig
nios2                            allyesconfig
sh                               j2_defconfig
sh                   sh7770_generic_defconfig
sh                         ecovec24_defconfig
sh                           se7712_defconfig
x86_64                              defconfig
powerpc                      acadia_defconfig
powerpc                      pmac32_defconfig
arm                           viper_defconfig
powerpc                 mpc8315_rdb_defconfig
um                           x86_64_defconfig
sparc                       sparc32_defconfig
arm                          ixp4xx_defconfig
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
i386                 randconfig-a013-20210125
i386                 randconfig-a011-20210125
i386                 randconfig-a012-20210125
i386                 randconfig-a015-20210125
i386                 randconfig-a014-20210125
i386                 randconfig-a016-20210125
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
