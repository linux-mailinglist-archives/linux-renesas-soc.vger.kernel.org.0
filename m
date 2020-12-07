Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 804C82D1CAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Dec 2020 23:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgLGWDH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Dec 2020 17:03:07 -0500
Received: from mga09.intel.com ([134.134.136.24]:7712 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726220AbgLGWDH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Dec 2020 17:03:07 -0500
IronPort-SDR: HISymIQ6MMwdtF5hEwTifGL2E+HCUPSN4pPnZxgLIQbiN545g/yFNY9BO17Hev2Zz56LZTYld2
 jUaVwDY8KZng==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173933796"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="173933796"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 14:02:26 -0800
IronPort-SDR: 23oCUvykmeW0b2x1j2VxRHCiw0tyev+FDahbvlttjgPp+q/SQ+bh5KkU+GIAmM17obhQFY7uws
 zn/M0RJb+bwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="363332104"
Received: from lkp-server01.sh.intel.com (HELO f1d34cfde454) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Dec 2020 14:02:24 -0800
Received: from kbuild by f1d34cfde454 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kmOaO-0000B6-1E; Mon, 07 Dec 2020 22:02:24 +0000
Date:   Tue, 08 Dec 2020 06:01:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 2de1408b9f24558d68c4f09341fb124b7d12f78b
Message-ID: <5fcea636.QBDudlvnkp82g8Yd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 2de1408b9f24558d68c4f09341fb124b7d12f78b  Merge tag 'v5.10-rc7' into renesas-devel

elapsed time: 723m

configs tested: 122
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       imx_v6_v7_defconfig
arm                          tango4_defconfig
microblaze                      mmu_defconfig
arm                        trizeps4_defconfig
xtensa                generic_kc705_defconfig
m68k                        mvme16x_defconfig
m68k                          amiga_defconfig
powerpc                   motionpro_defconfig
mips                malta_qemu_32r6_defconfig
arm                           stm32_defconfig
sh                             shx3_defconfig
mips                         cobalt_defconfig
mips                     loongson1b_defconfig
arc                            hsdk_defconfig
powerpc                     tqm8555_defconfig
sh                            shmin_defconfig
arm                  colibri_pxa270_defconfig
c6x                              alldefconfig
powerpc                      pcm030_defconfig
powerpc                 mpc8313_rdb_defconfig
sparc                            alldefconfig
arm                      footbridge_defconfig
powerpc                      ppc40x_defconfig
sh                            migor_defconfig
arm                            qcom_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      katmai_defconfig
c6x                        evmc6474_defconfig
sh                        edosk7705_defconfig
sh                          rsk7203_defconfig
powerpc                     pseries_defconfig
mips                  decstation_64_defconfig
arm                          pxa168_defconfig
mips                           ci20_defconfig
mips                            ar7_defconfig
arm                       netwinder_defconfig
sparc64                          alldefconfig
x86_64                              defconfig
arm                             ezx_defconfig
mips                          ath79_defconfig
powerpc                    sam440ep_defconfig
powerpc                    klondike_defconfig
m68k                          atari_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                      pistachio_defconfig
c6x                        evmc6472_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                        nlm_xlp_defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20201207
i386                 randconfig-a004-20201207
i386                 randconfig-a001-20201207
i386                 randconfig-a002-20201207
i386                 randconfig-a006-20201207
i386                 randconfig-a003-20201207
x86_64               randconfig-a016-20201207
x86_64               randconfig-a012-20201207
x86_64               randconfig-a014-20201207
x86_64               randconfig-a013-20201207
x86_64               randconfig-a015-20201207
x86_64               randconfig-a011-20201207
i386                 randconfig-a014-20201207
i386                 randconfig-a013-20201207
i386                 randconfig-a011-20201207
i386                 randconfig-a015-20201207
i386                 randconfig-a012-20201207
i386                 randconfig-a016-20201207
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
x86_64                                  kexec
x86_64                               rhel-8.3

clang tested configs:
x86_64               randconfig-a004-20201207
x86_64               randconfig-a006-20201207
x86_64               randconfig-a002-20201207
x86_64               randconfig-a001-20201207
x86_64               randconfig-a005-20201207
x86_64               randconfig-a003-20201207

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
