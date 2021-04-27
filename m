Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9638336CF92
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Apr 2021 01:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235703AbhD0XcH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Apr 2021 19:32:07 -0400
Received: from mga06.intel.com ([134.134.136.31]:39777 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236547AbhD0XcH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Apr 2021 19:32:07 -0400
IronPort-SDR: ORX1wC+UvdWeWjikNr2DC1eEhnJSiqm/NN84aj8qU51IjYAxtt0XmpGiVS1FxIW25hacznmRXN
 fRx1a//HemYQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="257917146"
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; 
   d="scan'208";a="257917146"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2021 16:31:23 -0700
IronPort-SDR: eOZVtcJ9lWcbI2DLhUdX2ucrIlTmLX14L3uCcyY9zkDScCJExdrYT94DQ7TKHwOjtJzBT6JxVZ
 qG+6z/9JMARQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; 
   d="scan'208";a="403448121"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Apr 2021 16:31:22 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lbXAn-0006lU-Aj; Tue, 27 Apr 2021 23:31:21 +0000
Date:   Wed, 28 Apr 2021 07:31:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD REGRESSION
 9561a53bb7b56fe7a9763de36176a25a5d3cee13
Message-ID: <60889ec2.ypkvQjd9HF7Q1L2F%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 9561a53bb7b56fe7a9763de36176a25a5d3cee13  [LOCAL] arm64: defconfig: Update renesas_defconfig

Error/Warning reports:

https://lore.kernel.org/linux-renesas-soc/202103310528.DAQ4Fc4O-lkp@intel.com

Error/Warning in current branch:

drivers/iio/adc/ti-ads131e08.c:180:5: error: 'struct spi_transfer' has no member named 'delay_usecs'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- alpha-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- arc-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- arm-allmodconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- arm-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- arm64-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- h8300-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- i386-allmodconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- i386-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- i386-randconfig-a004-20210426
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- ia64-allmodconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- ia64-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- m68k-allmodconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- m68k-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- mips-allmodconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- mips-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- nds32-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- nios2-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- parisc-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- powerpc-allmodconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- powerpc-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- powerpc64-allmodconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- riscv-allmodconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- riscv-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- s390-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- sh-allmodconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- sh-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- sparc-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- x86_64-allmodconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- x86_64-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
`-- xtensa-allyesconfig
    `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs

elapsed time: 726m

configs tested: 93
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
sh                           se7705_defconfig
mips                     loongson1c_defconfig
s390                                defconfig
sh                          r7780mp_defconfig
sparc                            alldefconfig
arm                          pxa168_defconfig
mips                       lemote2f_defconfig
xtensa                  cadence_csp_defconfig
powerpc                    sam440ep_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                       holly_defconfig
arm                       netwinder_defconfig
arm                       aspeed_g4_defconfig
mips                        omega2p_defconfig
arc                            hsdk_defconfig
powerpc                     skiroot_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210426
i386                 randconfig-a002-20210426
i386                 randconfig-a001-20210426
i386                 randconfig-a006-20210426
i386                 randconfig-a004-20210426
i386                 randconfig-a003-20210426
x86_64               randconfig-a015-20210426
x86_64               randconfig-a016-20210426
x86_64               randconfig-a011-20210426
x86_64               randconfig-a014-20210426
x86_64               randconfig-a012-20210426
x86_64               randconfig-a013-20210426
i386                 randconfig-a014-20210426
i386                 randconfig-a012-20210426
i386                 randconfig-a011-20210426
i386                 randconfig-a013-20210426
i386                 randconfig-a015-20210426
i386                 randconfig-a016-20210426
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210426
x86_64               randconfig-a004-20210426
x86_64               randconfig-a001-20210426
x86_64               randconfig-a006-20210426
x86_64               randconfig-a005-20210426
x86_64               randconfig-a003-20210426

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
