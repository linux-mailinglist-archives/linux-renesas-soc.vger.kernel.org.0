Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A87135EA0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Apr 2021 02:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237029AbhDNAkO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Apr 2021 20:40:14 -0400
Received: from mga04.intel.com ([192.55.52.120]:29686 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230281AbhDNAkN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Apr 2021 20:40:13 -0400
IronPort-SDR: lUNd0xA3qGj3P6J9nNbtObHQD50h3HXtRWDTnlg1X5HhXnkIJ99Z+Wwa+YLRK90pZNWKT8guEN
 lMFsnF7b2KIw==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="192408004"
X-IronPort-AV: E=Sophos;i="5.82,220,1613462400"; 
   d="scan'208";a="192408004"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 17:39:53 -0700
IronPort-SDR: THaOdD8D2qLnZeZ6KKueLAggDMuy5aKAOWt6igLcbRtCwuixV0+XVj66YR3/xeqHIq+l2CitM7
 344WU9m8pFhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,220,1613462400"; 
   d="scan'208";a="418079616"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2021 17:39:51 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lWTZP-0001Ou-6w; Wed, 14 Apr 2021 00:39:51 +0000
Date:   Wed, 14 Apr 2021 08:39:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD REGRESSION
 5a2aba178ea76ed885d8dcd275912f151c46d13f
Message-ID: <607639ca.GORa7WzWtePanbuz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 5a2aba178ea76ed885d8dcd275912f151c46d13f  [LOCAL] arm64: defconfig: Update renesas_defconfig

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
|-- riscv-allmodconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- riscv-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- s390-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- sh-allmodconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- sparc-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- x86_64-allmodconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
|-- x86_64-allyesconfig
|   `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs
`-- xtensa-allyesconfig
    `-- drivers-iio-adc-ti-ads131e08.c:error:struct-spi_transfer-has-no-member-named-delay_usecs

elapsed time: 724m

configs tested: 114
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
h8300                       h8s-sim_defconfig
sh                          rsk7269_defconfig
arm                       cns3420vb_defconfig
ia64                          tiger_defconfig
arc                        nsim_700_defconfig
openrisc                 simple_smp_defconfig
sh                          urquell_defconfig
h8300                    h8300h-sim_defconfig
arm                          collie_defconfig
mips                         db1xxx_defconfig
sh                            titan_defconfig
m68k                         amcore_defconfig
arm                       netwinder_defconfig
m68k                        mvme147_defconfig
ia64                            zx1_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                           h3600_defconfig
powerpc                   lite5200b_defconfig
arm                              alldefconfig
powerpc                     mpc5200_defconfig
h8300                     edosk2674_defconfig
powerpc                      bamboo_defconfig
xtensa                  nommu_kc705_defconfig
sh                           se7780_defconfig
arm                            qcom_defconfig
mips                        omega2p_defconfig
arm                            xcep_defconfig
mips                         mpc30x_defconfig
mips                          ath79_defconfig
arc                          axs101_defconfig
powerpc                   motionpro_defconfig
mips                        nlm_xlr_defconfig
mips                            gpr_defconfig
powerpc                 canyonlands_defconfig
arm                       multi_v4t_defconfig
sh                     magicpanelr2_defconfig
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
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210413
x86_64               randconfig-a002-20210413
x86_64               randconfig-a001-20210413
x86_64               randconfig-a005-20210413
x86_64               randconfig-a006-20210413
x86_64               randconfig-a004-20210413
i386                 randconfig-a003-20210413
i386                 randconfig-a001-20210413
i386                 randconfig-a006-20210413
i386                 randconfig-a005-20210413
i386                 randconfig-a004-20210413
i386                 randconfig-a002-20210413
i386                 randconfig-a013-20210413
i386                 randconfig-a012-20210413
i386                 randconfig-a011-20210413
i386                 randconfig-a015-20210413
i386                 randconfig-a014-20210413
i386                 randconfig-a016-20210413
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
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
x86_64               randconfig-a014-20210413
x86_64               randconfig-a015-20210413
x86_64               randconfig-a011-20210413
x86_64               randconfig-a013-20210413
x86_64               randconfig-a012-20210413
x86_64               randconfig-a016-20210413

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
