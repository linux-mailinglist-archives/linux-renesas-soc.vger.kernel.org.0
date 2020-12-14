Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B44E2DA24B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 22:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503607AbgLNVHw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 16:07:52 -0500
Received: from mga12.intel.com ([192.55.52.136]:22344 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503036AbgLNVHn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 16:07:43 -0500
IronPort-SDR: cbsa7aHNNbiJR4Wh24XayozDOa3EA7N8vnYEprdG33YD1EPPHxOwYxkMlRVM4r/NM/9O7GY8PX
 1n01ehZZRs0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="154012060"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="154012060"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 13:06:57 -0800
IronPort-SDR: ysEdv1xEgM7+zvg0h9TNDVaTGcvXT00hxCNnGJKBIeuOUkKC1HtqaN5ZlStjt6Iw+QY4jE+6PZ
 4RmJTKBOs3xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="554192280"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Dec 2020 13:06:56 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kov3X-0000TR-Oe; Mon, 14 Dec 2020 21:06:55 +0000
Date:   Tue, 15 Dec 2020 05:06:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.12] BUILD SUCCESS
 e923806a309b63eea98ed445f9cacb84b66ccbd4
Message-ID: <5fd7d3b9.0xOa1pWhcMJsWTdD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.12
branch HEAD: e923806a309b63eea98ed445f9cacb84b66ccbd4  arm64: dts: renesas: rcar-gen3: Add missing TMU nodes

elapsed time: 722m

configs tested: 137
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5249evb_defconfig
powerpc                mpc7448_hpc2_defconfig
microblaze                      mmu_defconfig
sh                           se7705_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7206_defconfig
xtensa                    xip_kc705_defconfig
mips                           xway_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     ppa8548_defconfig
microblaze                    nommu_defconfig
arm                         hackkit_defconfig
parisc                              defconfig
mips                         bigsur_defconfig
m68k                       m5275evb_defconfig
arc                      axs103_smp_defconfig
mips                          rm200_defconfig
arm                       spear13xx_defconfig
i386                             alldefconfig
arm                       cns3420vb_defconfig
arc                            hsdk_defconfig
m68k                          sun3x_defconfig
powerpc                      acadia_defconfig
arm                          pxa168_defconfig
powerpc                    sam440ep_defconfig
powerpc                      cm5200_defconfig
xtensa                  audio_kc705_defconfig
sh                        dreamcast_defconfig
arm                        clps711x_defconfig
mips                        jmr3927_defconfig
i386                                defconfig
arm                  colibri_pxa270_defconfig
powerpc                     mpc512x_defconfig
powerpc                         ps3_defconfig
powerpc                      obs600_defconfig
sh                ecovec24-romimage_defconfig
sh                   sh7770_generic_defconfig
powerpc                     kmeter1_defconfig
mips                        nlm_xlp_defconfig
powerpc                     akebono_defconfig
powerpc                    adder875_defconfig
m68k                          amiga_defconfig
powerpc                       holly_defconfig
mips                      maltaaprp_defconfig
mips                     loongson1b_defconfig
sh                             sh03_defconfig
x86_64                           alldefconfig
arm                      pxa255-idp_defconfig
arm                         cm_x300_defconfig
openrisc                         alldefconfig
arm                         at91_dt_defconfig
arm                       netwinder_defconfig
arm                          ixp4xx_defconfig
arm                          pxa910_defconfig
sh                         ap325rxa_defconfig
powerpc                     tqm5200_defconfig
csky                             alldefconfig
mips                      pistachio_defconfig
arm                           sama5_defconfig
arm                        mvebu_v5_defconfig
mips                         mpc30x_defconfig
m68k                       m5475evb_defconfig
mips                        bcm47xx_defconfig
m68k                          multi_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20201214
i386                 randconfig-a004-20201214
i386                 randconfig-a003-20201214
i386                 randconfig-a002-20201214
i386                 randconfig-a006-20201214
i386                 randconfig-a005-20201214
x86_64               randconfig-a016-20201214
x86_64               randconfig-a012-20201214
x86_64               randconfig-a013-20201214
x86_64               randconfig-a015-20201214
x86_64               randconfig-a014-20201214
x86_64               randconfig-a011-20201214
i386                 randconfig-a014-20201214
i386                 randconfig-a013-20201214
i386                 randconfig-a012-20201214
i386                 randconfig-a011-20201214
i386                 randconfig-a015-20201214
i386                 randconfig-a016-20201214
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
x86_64               randconfig-a003-20201214
x86_64               randconfig-a006-20201214
x86_64               randconfig-a002-20201214
x86_64               randconfig-a005-20201214
x86_64               randconfig-a004-20201214
x86_64               randconfig-a001-20201214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
