Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 312FE2F70C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jan 2021 04:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbhAOC7V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 21:59:21 -0500
Received: from mga06.intel.com ([134.134.136.31]:32228 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726894AbhAOC7V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 21:59:21 -0500
IronPort-SDR: pHpaZzAFPrIq822VeuiqX5IeV9z95HRK42tiKomF7hxIes9ipVCTnaFeG8GJWrp7Qmcd4aCbqb
 dYxfDfUMQ2JA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="240031678"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="240031678"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 18:58:40 -0800
IronPort-SDR: pl4ySGzQ2WC8O7YmAwKuOLhBl/wi+LydaMSmqcgzTMpIcNJxLH6pWGES1IrWLdtM0qAE3wtlfk
 /FiHM2n+JrYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="499787713"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Jan 2021 18:58:39 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l0FJu-000068-PW; Fri, 15 Jan 2021 02:58:38 +0000
Date:   Fri, 15 Jan 2021 10:57:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:renesas-pinctrl-for-v5.12] BUILD SUCCESS
 a5cda861ed57710837bc560a3c715160da710555
Message-ID: <600104a7.OwGhhYPcPmTV/jv9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  renesas-pinctrl-for-v5.12
branch HEAD: a5cda861ed57710837bc560a3c715160da710555  pinctrl: renesas: r8a779a0: Add TPU pins, groups and functions

elapsed time: 722m

configs tested: 110
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       imx_v4_v5_defconfig
arc                      axs103_smp_defconfig
sh                          r7785rp_defconfig
m68k                        m5272c3_defconfig
arm                        oxnas_v6_defconfig
powerpc                     mpc5200_defconfig
arm                       cns3420vb_defconfig
powerpc                       holly_defconfig
mips                      pistachio_defconfig
mips                        nlm_xlr_defconfig
m68k                             alldefconfig
arm                         at91_dt_defconfig
m68k                        m5407c3_defconfig
riscv                          rv32_defconfig
arm                           corgi_defconfig
arm                       aspeed_g5_defconfig
arm                        mvebu_v5_defconfig
arm                         assabet_defconfig
arm                        multi_v7_defconfig
ia64                             allmodconfig
mips                      bmips_stb_defconfig
powerpc                      ppc6xx_defconfig
arm                             ezx_defconfig
sh                            migor_defconfig
arm64                            alldefconfig
powerpc                     pseries_defconfig
mips                        nlm_xlp_defconfig
arm                         cm_x300_defconfig
sh                           se7750_defconfig
sh                           se7206_defconfig
powerpc                     tqm8555_defconfig
arm                         lpc32xx_defconfig
sh                           se7722_defconfig
nds32                             allnoconfig
mips                        maltaup_defconfig
csky                             alldefconfig
arm                          iop32x_defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210114
i386                 randconfig-a005-20210114
i386                 randconfig-a006-20210114
i386                 randconfig-a001-20210114
i386                 randconfig-a003-20210114
i386                 randconfig-a004-20210114
x86_64               randconfig-a015-20210114
x86_64               randconfig-a012-20210114
x86_64               randconfig-a013-20210114
x86_64               randconfig-a016-20210114
x86_64               randconfig-a014-20210114
x86_64               randconfig-a011-20210114
i386                 randconfig-a012-20210114
i386                 randconfig-a011-20210114
i386                 randconfig-a016-20210114
i386                 randconfig-a015-20210114
i386                 randconfig-a013-20210114
i386                 randconfig-a014-20210114
riscv                    nommu_k210_defconfig
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210114
x86_64               randconfig-a006-20210114
x86_64               randconfig-a001-20210114
x86_64               randconfig-a003-20210114
x86_64               randconfig-a005-20210114
x86_64               randconfig-a002-20210114

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
