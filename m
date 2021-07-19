Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8DC3CF08C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 02:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355296AbhGSX2G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 19:28:06 -0400
Received: from mga04.intel.com ([192.55.52.120]:43570 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1384822AbhGSWOa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 18:14:30 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="209238825"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; 
   d="scan'208";a="209238825"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2021 15:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; 
   d="scan'208";a="660948106"
Received: from lkp-server01.sh.intel.com (HELO a467b34d8c10) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jul 2021 15:50:15 -0700
Received: from kbuild by a467b34d8c10 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m5c5W-0000pB-MX; Mon, 19 Jul 2021 22:50:14 +0000
Date:   Tue, 20 Jul 2021 06:49:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-defconfig-for-v5.15] BUILD SUCCESS
 d016ed8d8ee821da772b6f6a8d63a7016a41d17c
Message-ID: <60f6017a.nYyhKXwWeJRHLzB4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v5.15
branch HEAD: d016ed8d8ee821da772b6f6a8d63a7016a41d17c  arm64: defconfig: Enable RIIC

elapsed time: 722m

configs tested: 99
configs skipped: 51

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     rainier_defconfig
x86_64                              defconfig
mips                   sb1250_swarm_defconfig
mips                  maltasmvp_eva_defconfig
sparc64                             defconfig
arm                         mv78xx0_defconfig
arm                         lpc32xx_defconfig
arm                          imote2_defconfig
xtensa                         virt_defconfig
powerpc                    klondike_defconfig
arm                            mmp2_defconfig
arc                              alldefconfig
powerpc                      ppc44x_defconfig
arm                       imx_v4_v5_defconfig
sh                          polaris_defconfig
m68k                        m5307c3_defconfig
parisc                              defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                   microwatt_defconfig
arm                         at91_dt_defconfig
mips                        bcm63xx_defconfig
m68k                             allyesconfig
mips                         bigsur_defconfig
sh                          sdk7780_defconfig
arm                          pcm027_defconfig
xtensa                  audio_kc705_defconfig
sh                         ecovec24_defconfig
sh                     magicpanelr2_defconfig
openrisc                         alldefconfig
arm                          gemini_defconfig
xtensa                    xip_kc705_defconfig
sh                          r7780mp_defconfig
riscv                    nommu_virt_defconfig
arm                           spitz_defconfig
powerpc                     ppa8548_defconfig
powerpc                           allnoconfig
arm                            qcom_defconfig
m68k                       m5275evb_defconfig
arm                          collie_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
x86_64               randconfig-a005-20210718
x86_64               randconfig-a004-20210718
x86_64               randconfig-a002-20210718
x86_64               randconfig-a003-20210718
x86_64               randconfig-a006-20210718
x86_64               randconfig-a001-20210718
i386                 randconfig-a005-20210719
i386                 randconfig-a004-20210719
i386                 randconfig-a006-20210719
i386                 randconfig-a001-20210719
i386                 randconfig-a003-20210719
i386                 randconfig-a002-20210719
i386                 randconfig-a014-20210719
i386                 randconfig-a015-20210719
i386                 randconfig-a011-20210719
i386                 randconfig-a013-20210719
i386                 randconfig-a016-20210719
i386                 randconfig-a012-20210719
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig

clang tested configs:
x86_64               randconfig-b001-20210719
x86_64               randconfig-a005-20210719
x86_64               randconfig-a004-20210719
x86_64               randconfig-a002-20210719
x86_64               randconfig-a003-20210719
x86_64               randconfig-a006-20210719
x86_64               randconfig-a001-20210719

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
