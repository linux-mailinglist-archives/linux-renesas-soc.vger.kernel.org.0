Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6A934F5A6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Mar 2021 02:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhCaA7Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Mar 2021 20:59:24 -0400
Received: from mga11.intel.com ([192.55.52.93]:63368 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229626AbhCaA7X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Mar 2021 20:59:23 -0400
IronPort-SDR: 9GRSR4KNP7KQcxhzlkI8czukQ9oa4dqEysc62I9vdc85lCVXf5DwjZV1NdNKxoDGthAfISdkTs
 z3EeC6II68OQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="188627786"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="188627786"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 17:59:23 -0700
IronPort-SDR: n00a2XWgZZdx7KgsjX94rY6i1aeDblqQAhV/r+5vXRD7CnA5zKePr2wbwsSFrnQczSLBLYRDO3
 4tnsXN4XVmjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="411886180"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Mar 2021 17:59:22 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lRPCb-0005ZB-UM; Wed, 31 Mar 2021 00:59:21 +0000
Date:   Wed, 31 Mar 2021 08:58:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD REGRESSION
 6f83a4e5ed435a21bc28605a5072057d8b3e4ac3
Message-ID: <6063c942.bHjDJtVBDl0RPglr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 6f83a4e5ed435a21bc28605a5072057d8b3e4ac3  [LOCAL] arm64: defconfig: Update renesas_defconfig

Error/Warning reports:

https://lore.kernel.org/linux-renesas-soc/202103310528.DAQ4Fc4O-lkp@intel.com

Error/Warning in current branch:

drivers/iio/adc/ti-ads131e08.c:180:5: error: 'struct spi_transfer' has no member named 'delay_usecs'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- sparc-allyesconfig
    `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs

elapsed time: 731m

configs tested: 96
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
sparc                            allyesconfig
powerpc                       ppc64_defconfig
sh                           sh2007_defconfig
arc                        nsimosci_defconfig
nios2                            alldefconfig
arm                            qcom_defconfig
arm                            pleb_defconfig
arm                  colibri_pxa270_defconfig
arm                          lpd270_defconfig
powerpc                        icon_defconfig
sh                               alldefconfig
sh                          r7780mp_defconfig
arm                        spear6xx_defconfig
arc                         haps_hs_defconfig
mips                          malta_defconfig
powerpc                    mvme5100_defconfig
m68k                         amcore_defconfig
arm                       versatile_defconfig
arm                         orion5x_defconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210330
x86_64               randconfig-a003-20210330
x86_64               randconfig-a002-20210330
x86_64               randconfig-a001-20210330
x86_64               randconfig-a005-20210330
x86_64               randconfig-a006-20210330
i386                 randconfig-a004-20210330
i386                 randconfig-a006-20210330
i386                 randconfig-a003-20210330
i386                 randconfig-a002-20210330
i386                 randconfig-a001-20210330
i386                 randconfig-a005-20210330
i386                 randconfig-a015-20210330
i386                 randconfig-a011-20210330
i386                 randconfig-a014-20210330
i386                 randconfig-a013-20210330
i386                 randconfig-a016-20210330
i386                 randconfig-a012-20210330
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210330
x86_64               randconfig-a015-20210330
x86_64               randconfig-a014-20210330
x86_64               randconfig-a016-20210330
x86_64               randconfig-a013-20210330
x86_64               randconfig-a011-20210330

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
