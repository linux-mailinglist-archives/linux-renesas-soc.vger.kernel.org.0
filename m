Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E260033E021
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 22:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232282AbhCPVPR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 17:15:17 -0400
Received: from mga07.intel.com ([134.134.136.100]:42554 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232312AbhCPVOy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 17:14:54 -0400
IronPort-SDR: GmTVMOM+26oXpsK3PecrfpdSdeiVcIcNclgIcz2JZHuo+eAfMf1mSJWFPX8AMT7rfja1c3s3Ih
 TaP6/fbhe3AQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="253351041"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="253351041"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2021 14:14:50 -0700
IronPort-SDR: LTxB6OqskHRaH0/qQPe9oeejZP6Q/608ZDxPmHOAEb+A3NA4zZmF5+qJ6N0N5Kca8SySfH6qoc
 a9yiZ+jiCuVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; 
   d="scan'208";a="511508544"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2021 14:14:49 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lMH1c-0000JU-FX; Tue, 16 Mar 2021 21:14:48 +0000
Date:   Wed, 17 Mar 2021 05:14:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 ca7b445e2e7b0cd757c5c29249f37baf9ca71747
Message-ID: <60511fb3.U/Tycs6RBWNyZEEI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: ca7b445e2e7b0cd757c5c29249f37baf9ca71747  Merge branch 'renesas-arm-dt-for-v5.13' into renesas-next

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
i386                             allyesconfig
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
powerpc                     akebono_defconfig
mips                     loongson1b_defconfig
arc                         haps_hs_defconfig
arm                           u8500_defconfig
csky                                defconfig
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
mips                         tb0219_defconfig
nios2                         10m50_defconfig
powerpc               mpc834x_itxgp_defconfig
um                            kunit_defconfig
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
i386                               tinyconfig
i386                                defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210316
i386                 randconfig-a005-20210316
i386                 randconfig-a002-20210316
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
