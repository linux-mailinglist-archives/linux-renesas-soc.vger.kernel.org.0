Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 038ED33E022
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 22:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbhCPVPR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 17:15:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:35720 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232282AbhCPVOv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 17:14:51 -0400
IronPort-SDR: z+mOr40h/PTjNf8WOHRHqFo/Pk457oeUNpFoqcBcr9Drz8NTizVKeOeldEgNKNcScshyshjCTq
 B/+osRmHQ7Yg==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="188694564"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="188694564"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 14:14:51 -0700
IronPort-SDR: /ibfImBx6cfXTbkL8NBZx4a63LyuAWU8NYOU11FuCF9kVIrzon7u7DhwlcOpeuzKhLf5PGUsNk
 QwURHt0xF8bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="373919994"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Mar 2021 14:14:50 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lMH1d-0000Jd-Kw; Tue, 16 Mar 2021 21:14:49 +0000
Date:   Wed, 17 Mar 2021 05:14:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 0f7f46c3ad4c7155aaa1d7077afdab5b3e9f7a9b
Message-ID: <60511faf.6KokUkXY0WudnjRr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 0f7f46c3ad4c7155aaa1d7077afdab5b3e9f7a9b  Merge branch 'renesas-next' into renesas-devel

elapsed time: 723m

configs tested: 128
configs skipped: 3

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
xtensa                    xip_kc705_defconfig
mips                     cu1000-neo_defconfig
um                             i386_defconfig
arm                     am200epdkit_defconfig
sh                           se7721_defconfig
arm                          moxart_defconfig
powerpc                        fsp2_defconfig
mips                        nlm_xlr_defconfig
ia64                             alldefconfig
arm                          imote2_defconfig
arc                          axs103_defconfig
powerpc                      pcm030_defconfig
arm                         bcm2835_defconfig
mips                          rm200_defconfig
ia64                          tiger_defconfig
arm                        keystone_defconfig
sh                          rsk7201_defconfig
powerpc                     tqm8541_defconfig
sh                          sdk7786_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                mpc7448_hpc2_defconfig
riscv                          rv32_defconfig
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
nds32                             allnoconfig
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
powerpc                           allnoconfig
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
