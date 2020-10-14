Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9AF928D831
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Oct 2020 04:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgJNCBC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Oct 2020 22:01:02 -0400
Received: from mga01.intel.com ([192.55.52.88]:13977 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgJNCBC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Oct 2020 22:01:02 -0400
IronPort-SDR: XEY/f4yuaV+VpdugJbYWBvuZiNYtdLayQg3GAbKpaQMVoffBKxy2HcoTPswpvN14DX2aM6NTDt
 R4Cwo63aTPoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="183525067"
X-IronPort-AV: E=Sophos;i="5.77,373,1596524400"; 
   d="scan'208";a="183525067"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 19:00:56 -0700
IronPort-SDR: dfVYdd6vHXaGuv+HPUFeXeZtnZuOjat0tTG3oX4KPrp/Drxx+mymmsvITGWLuNZvSFDQGuj7qk
 SPIQYkjACu2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,373,1596524400"; 
   d="scan'208";a="345473796"
Received: from lkp-server02.sh.intel.com (HELO c57e4c60a28b) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Oct 2020 19:00:54 -0700
Received: from kbuild by c57e4c60a28b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kSW61-000071-OF; Wed, 14 Oct 2020 02:00:53 +0000
Date:   Wed, 14 Oct 2020 10:00:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD REGRESSION
 369d11260c6a5f7c903c8731f0f01c7e863dfad6
Message-ID: <5f865bc2.T0ggFnVb7yLj7QUB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  master
branch HEAD: 369d11260c6a5f7c903c8731f0f01c7e863dfad6  [LOCAL] arm64: defconfig: Update renesas_defconfig

Error/Warning in current branch:

drivers/gpu/drm/msm/msm_iommu.c:46:2: error: implicit declaration of function 'iommu_flush_tlb_all'; did you mean 'iommu_flush_iotlb_all'? [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-allmodconfig
|   `-- drivers-gpu-drm-msm-msm_iommu.c:error:implicit-declaration-of-function-iommu_flush_tlb_all
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-msm-msm_iommu.c:error:implicit-declaration-of-function-iommu_flush_tlb_all
|-- arm-defconfig
|   `-- drivers-gpu-drm-msm-msm_iommu.c:error:implicit-declaration-of-function-iommu_flush_tlb_all
|-- arm64-allyesconfig
|   `-- drivers-gpu-drm-msm-msm_iommu.c:error:implicit-declaration-of-function-iommu_flush_tlb_all
|-- arm64-defconfig
|   `-- drivers-gpu-drm-msm-msm_iommu.c:error:implicit-declaration-of-function-iommu_flush_tlb_all
`-- arm64-randconfig-s031-20201013
    `-- drivers-gpu-drm-msm-msm_iommu.c:error:implicit-declaration-of-function-iommu_flush_tlb_all

elapsed time: 721m

configs tested: 93
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                     davinci_all_defconfig
m68k                          hp300_defconfig
powerpc                     sbc8548_defconfig
arm                         palmz72_defconfig
microblaze                          defconfig
m68k                        stmark2_defconfig
um                           x86_64_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     asp8347_defconfig
ia64                        generic_defconfig
mips                        nlm_xlr_defconfig
riscv                    nommu_k210_defconfig
m68k                         apollo_defconfig
mips                           mtx1_defconfig
arm                      footbridge_defconfig
arm                   milbeaut_m10v_defconfig
arc                     haps_hs_smp_defconfig
sh                               alldefconfig
powerpc                          g5_defconfig
riscv                    nommu_virt_defconfig
m68k                            mac_defconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201013
x86_64               randconfig-a002-20201013
x86_64               randconfig-a006-20201013
x86_64               randconfig-a001-20201013
x86_64               randconfig-a003-20201013
x86_64               randconfig-a005-20201013
i386                 randconfig-a005-20201013
i386                 randconfig-a006-20201013
i386                 randconfig-a001-20201013
i386                 randconfig-a003-20201013
i386                 randconfig-a004-20201013
i386                 randconfig-a002-20201013
i386                 randconfig-a016-20201013
i386                 randconfig-a015-20201013
i386                 randconfig-a013-20201013
i386                 randconfig-a012-20201013
i386                 randconfig-a011-20201013
i386                 randconfig-a014-20201013
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
x86_64               randconfig-a016-20201013
x86_64               randconfig-a015-20201013
x86_64               randconfig-a012-20201013
x86_64               randconfig-a013-20201013
x86_64               randconfig-a014-20201013
x86_64               randconfig-a011-20201013

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
