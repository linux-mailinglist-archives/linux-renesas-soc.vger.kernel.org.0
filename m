Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9653927DB87
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Sep 2020 00:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgI2WQq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Sep 2020 18:16:46 -0400
Received: from mga06.intel.com ([134.134.136.31]:6700 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728316AbgI2WQq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Sep 2020 18:16:46 -0400
IronPort-SDR: /9EJEoNCDgZYIekGPbfQYnljc8+3KCgsg2PdiLSOtxP87VMF+ds9rKIYJnP4n9d28/rLfCyjaF
 TyEjaLDC8qnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="223900984"
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; 
   d="scan'208";a="223900984"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 15:16:45 -0700
IronPort-SDR: HUaXBHzm4aLVWXW3W8ecEoNdqHqlD0wy9bdSVjEIf7SUBgvzlDlAE/HWRZX6ZbKlTMQK8TFUuJ
 UHyGXANDjIaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; 
   d="scan'208";a="514048897"
Received: from lkp-server02.sh.intel.com (HELO 10ae44db8633) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 29 Sep 2020 15:16:43 -0700
Received: from kbuild by 10ae44db8633 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kNNvP-0000L7-6c; Tue, 29 Sep 2020 22:16:43 +0000
Date:   Wed, 30 Sep 2020 06:16:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD REGRESSION
 636a9f7dbb24610805c1466de5be6411cc25fcf1
Message-ID: <5f73b248.Sr2oLBN0+cg+xCnk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  master
branch HEAD: 636a9f7dbb24610805c1466de5be6411cc25fcf1  [LOCAL] arm64: defconfig: Update renesas_defconfig

Error/Warning in current branch:

drivers/gpu/drm/msm/msm_iommu.c:46:2: error: implicit declaration of function 'iommu_flush_tlb_all'; did you mean 'iommu_flush_iotlb_all'? [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arm-defconfig
    `-- drivers-gpu-drm-msm-msm_iommu.c:error:implicit-declaration-of-function-iommu_flush_tlb_all

elapsed time: 724m

configs tested: 94
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                    vt8500_v6_v7_defconfig
m68k                        m5407c3_defconfig
mips                         db1xxx_defconfig
powerpc                      cm5200_defconfig
arm                        keystone_defconfig
arm                        multi_v5_defconfig
powerpc                  mpc885_ads_defconfig
arm                             pxa_defconfig
sh                           se7722_defconfig
riscv                    nommu_virt_defconfig
mips                      loongson3_defconfig
arm                       spear13xx_defconfig
arm                         at91_dt_defconfig
sh                          sdk7780_defconfig
powerpc                     tqm8555_defconfig
mips                         mpc30x_defconfig
s390                       zfcpdump_defconfig
arm                         hackkit_defconfig
sh                   sh7724_generic_defconfig
powerpc64                        alldefconfig
arm                            mps2_defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200929
i386                 randconfig-a002-20200929
i386                 randconfig-a003-20200929
i386                 randconfig-a004-20200929
i386                 randconfig-a005-20200929
i386                 randconfig-a001-20200929
x86_64               randconfig-a011-20200929
x86_64               randconfig-a013-20200929
x86_64               randconfig-a015-20200929
x86_64               randconfig-a014-20200929
x86_64               randconfig-a016-20200929
x86_64               randconfig-a012-20200929
i386                 randconfig-a012-20200929
i386                 randconfig-a016-20200929
i386                 randconfig-a014-20200929
i386                 randconfig-a013-20200929
i386                 randconfig-a015-20200929
i386                 randconfig-a011-20200929
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
x86_64               randconfig-a005-20200929
x86_64               randconfig-a003-20200929
x86_64               randconfig-a004-20200929
x86_64               randconfig-a002-20200929
x86_64               randconfig-a006-20200929
x86_64               randconfig-a001-20200929

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
