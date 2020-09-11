Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 844E0265C94
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 11:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgIKJey (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 05:34:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:14256 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgIKJev (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 05:34:51 -0400
IronPort-SDR: KgSydenWwBioi770T1FqSAfmOdSaezZ5LYAGnujk17ggBGpdLzu073JxkNt9pKpOz2cU1+UogE
 q5Fj16B6xrGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="220278683"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="220278683"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 02:34:49 -0700
IronPort-SDR: eYgvK+mHbBRqfz9e70ePxioh7e7/OQLE6T1h7dJesw7bwXX7uTD3ZH8S05q4fQWHHRwf+g5Mid
 TO60qi5eW+6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="329706246"
Received: from lkp-server01.sh.intel.com (HELO a75722977aa5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Sep 2020 02:34:48 -0700
Received: from kbuild by a75722977aa5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kGfSC-00009j-53; Fri, 11 Sep 2020 09:34:48 +0000
Date:   Fri, 11 Sep 2020 17:34:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-dt-for-v5.10] BUILD SUCCESS
 63070d7c2270e8de8abef8f6f20e192bcc1d50de
Message-ID: <5f5b4496.aLA4eAv8WFtOfr8s%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-dt-for-v5.10
branch HEAD: 63070d7c2270e8de8abef8f6f20e192bcc1d50de  arm64: dts: renesas: Add Renesas Falcon boards support

elapsed time: 724m

configs tested: 155
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
powerpc                 mpc832x_rdb_defconfig
arm                            lart_defconfig
powerpc                      ppc64e_defconfig
arm                           omap1_defconfig
powerpc                      acadia_defconfig
arm                        trizeps4_defconfig
arm                         lpc18xx_defconfig
mips                           ip27_defconfig
arm                              zx_defconfig
sh                          sdk7786_defconfig
powerpc                     rainier_defconfig
sh                           sh2007_defconfig
arm                           efm32_defconfig
arm                       aspeed_g4_defconfig
mips                         tb0226_defconfig
mips                          ath79_defconfig
arm                      integrator_defconfig
mips                           ip22_defconfig
arm                           stm32_defconfig
powerpc                      bamboo_defconfig
sh                            shmin_defconfig
mips                        qi_lb60_defconfig
mips                            e55_defconfig
powerpc                     ksi8560_defconfig
ia64                             alldefconfig
sh                          lboxre2_defconfig
mips                        workpad_defconfig
mips                           gcw0_defconfig
sh                          sdk7780_defconfig
openrisc                    or1ksim_defconfig
arm                          imote2_defconfig
arm                            zeus_defconfig
sh                                  defconfig
powerpc                    mvme5100_defconfig
arm                        cerfcube_defconfig
xtensa                           allyesconfig
arm                       omap2plus_defconfig
arc                 nsimosci_hs_smp_defconfig
h8300                    h8300h-sim_defconfig
mips                            gpr_defconfig
powerpc                    sam440ep_defconfig
arc                          axs101_defconfig
sh                          rsk7264_defconfig
arc                    vdk_hs38_smp_defconfig
arm                         ebsa110_defconfig
powerpc                    adder875_defconfig
powerpc                     asp8347_defconfig
arm                         s3c2410_defconfig
h8300                     edosk2674_defconfig
powerpc                   bluestone_defconfig
arm                         lubbock_defconfig
powerpc                 mpc837x_mds_defconfig
arm                            u300_defconfig
xtensa                           alldefconfig
nios2                         3c120_defconfig
powerpc                     powernv_defconfig
sh                ecovec24-romimage_defconfig
arm                       cns3420vb_defconfig
ia64                            zx1_defconfig
s390                       zfcpdump_defconfig
powerpc                     akebono_defconfig
arm                         at91_dt_defconfig
mips                       capcella_defconfig
powerpc                     ep8248e_defconfig
powerpc                     taishan_defconfig
mips                      loongson3_defconfig
microblaze                    nommu_defconfig
arc                          axs103_defconfig
mips                         rt305x_defconfig
sh                          kfr2r09_defconfig
arm                         cm_x300_defconfig
sh                          polaris_defconfig
mips                        maltaup_defconfig
powerpc                 mpc8272_ads_defconfig
arm                           h3600_defconfig
sparc64                             defconfig
sh                        apsh4ad0a_defconfig
arm                        multi_v5_defconfig
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
powerpc                             defconfig
i386                 randconfig-a004-20200911
i386                 randconfig-a006-20200911
i386                 randconfig-a001-20200911
i386                 randconfig-a003-20200911
i386                 randconfig-a002-20200911
i386                 randconfig-a005-20200911
i386                 randconfig-a004-20200909
i386                 randconfig-a005-20200909
i386                 randconfig-a006-20200909
i386                 randconfig-a002-20200909
i386                 randconfig-a001-20200909
i386                 randconfig-a003-20200909
x86_64               randconfig-a014-20200911
x86_64               randconfig-a011-20200911
x86_64               randconfig-a012-20200911
x86_64               randconfig-a016-20200911
x86_64               randconfig-a015-20200911
x86_64               randconfig-a013-20200911
i386                 randconfig-a015-20200911
i386                 randconfig-a014-20200911
i386                 randconfig-a011-20200911
i386                 randconfig-a013-20200911
i386                 randconfig-a016-20200911
i386                 randconfig-a012-20200911
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20200911
x86_64               randconfig-a006-20200911
x86_64               randconfig-a003-20200911
x86_64               randconfig-a002-20200911
x86_64               randconfig-a005-20200911
x86_64               randconfig-a001-20200911

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
