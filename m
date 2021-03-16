Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76F0133E024
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 22:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbhCPVPQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 17:15:16 -0400
Received: from mga17.intel.com ([192.55.52.151]:51871 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232358AbhCPVOu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 17:14:50 -0400
IronPort-SDR: 81EYqA3o8JoLvJ02Mb9EuD/WaZ2QxLJBiMBJDxR2BZct52AWnnt0DEk6v8RlaMIltli47ykQd5
 hJnKuqzNcquA==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="169250354"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="169250354"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 14:14:50 -0700
IronPort-SDR: 1IumarCmJRVRvguZeb4cgzfGrHNM3XwRmh/E8CRk/vzfePk8/7pr/LekHgN/6JSMhMDrHp2ml7
 8PQ2ljlMPUHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="405675844"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Mar 2021 14:14:49 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lMH1c-0000JW-Ft; Tue, 16 Mar 2021 21:14:48 +0000
Date:   Wed, 17 Mar 2021 05:14:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.13] BUILD SUCCESS
 c8aebc1346522d3569690867ce3996642ad52e01
Message-ID: <60511fa7.NeYOqcKoqEzcPwwF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.13
branch HEAD: c8aebc1346522d3569690867ce3996642ad52e01  arm64: dts: renesas: r8a77980: Fix vin4-7 endpoint binding

elapsed time: 723m

configs tested: 121
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
mips                           ip27_defconfig
nds32                             allnoconfig
powerpc                      arches_defconfig
sh                           se7343_defconfig
powerpc                           allnoconfig
alpha                            alldefconfig
sh                   secureedge5410_defconfig
arm                        magician_defconfig
xtensa                       common_defconfig
powerpc                        icon_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                    vt8500_v6_v7_defconfig
sh                           se7722_defconfig
m68k                         apollo_defconfig
sh                             espt_defconfig
arm                      footbridge_defconfig
powerpc                     taishan_defconfig
arm                         shannon_defconfig
m68k                            q40_defconfig
powerpc                  storcenter_defconfig
powerpc                 mpc837x_mds_defconfig
arm                         mv78xx0_defconfig
riscv             nommu_k210_sdcard_defconfig
xtensa                          iss_defconfig
powerpc                     tqm8540_defconfig
arm                          moxart_defconfig
powerpc                        fsp2_defconfig
mips                        nlm_xlr_defconfig
ia64                             alldefconfig
arm                          imote2_defconfig
arc                          axs103_defconfig
powerpc                     tqm8541_defconfig
sh                          sdk7786_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                mpc7448_hpc2_defconfig
riscv                          rv32_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                     powernv_defconfig
m68k                       m5208evb_defconfig
mips                      pistachio_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                       aspeed_g5_defconfig
arm                            dove_defconfig
arm                  colibri_pxa270_defconfig
arm                       multi_v4t_defconfig
powerpc                     mpc5200_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                      obs600_defconfig
xtensa                  audio_kc705_defconfig
arm                          collie_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a005-20210316
i386                 randconfig-a003-20210316
i386                 randconfig-a004-20210316
i386                 randconfig-a006-20210316
x86_64               randconfig-a016-20210316
x86_64               randconfig-a015-20210316
x86_64               randconfig-a011-20210316
x86_64               randconfig-a013-20210316
x86_64               randconfig-a014-20210316
x86_64               randconfig-a012-20210316
i386                 randconfig-a013-20210316
i386                 randconfig-a016-20210316
i386                 randconfig-a011-20210316
i386                 randconfig-a012-20210316
i386                 randconfig-a015-20210316
i386                 randconfig-a014-20210316
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210316
x86_64               randconfig-a001-20210316
x86_64               randconfig-a005-20210316
x86_64               randconfig-a004-20210316
x86_64               randconfig-a003-20210316
x86_64               randconfig-a002-20210316

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
