Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D99265C96
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 11:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgIKJey (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 05:34:54 -0400
Received: from mga05.intel.com ([192.55.52.43]:24035 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgIKJev (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 05:34:51 -0400
IronPort-SDR: tjP2RaGKq7Jx6aclOizy6mzcklv7KE/Ex1A1yYjlTujMlPDvb7cLhf45XZ5x6KEbVQ0iEbJGiG
 TwpfFUzTNnvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="243546599"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="243546599"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 02:34:50 -0700
IronPort-SDR: 44NdF+nDv8BYRxm/jhbtP/Goi9L49fcP8h5A3qE/QwYq5YCKRqxo6n5H/J2k6ds/mYCEzsKP6g
 IsIJdeIUbApw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="305207938"
Received: from lkp-server01.sh.intel.com (HELO a75722977aa5) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Sep 2020 02:34:48 -0700
Received: from kbuild by a75722977aa5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kGfSC-00009m-5X; Fri, 11 Sep 2020 09:34:48 +0000
Date:   Fri, 11 Sep 2020 17:34:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-dt-bindings-for-v5.10] BUILD SUCCESS
 b08892556b3f19d95d356b33692247de8303fe05
Message-ID: <5f5b448e.A6tsGeBGmUOGbMSx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-dt-bindings-for-v5.10
branch HEAD: b08892556b3f19d95d356b33692247de8303fe05  dt-bindings: arm: renesas: Document Renesas Falcon boards

elapsed time: 724m

configs tested: 146
configs skipped: 3

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
arm                     davinci_all_defconfig
sh                         apsh4a3a_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                       cns3420vb_defconfig
sparc64                             defconfig
arm                         lpc18xx_defconfig
mips                           ip27_defconfig
arm                              zx_defconfig
sh                          sdk7786_defconfig
powerpc                     rainier_defconfig
sh                           sh2007_defconfig
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
mips                          ath79_defconfig
xtensa                           allyesconfig
arm                       omap2plus_defconfig
h8300                    h8300h-sim_defconfig
mips                            gpr_defconfig
powerpc                    sam440ep_defconfig
arc                          axs101_defconfig
sh                          rsk7264_defconfig
arm                         socfpga_defconfig
arm                     am200epdkit_defconfig
sh                           se7343_defconfig
riscv                          rv32_defconfig
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
ia64                            zx1_defconfig
powerpc                     ep8248e_defconfig
powerpc                     taishan_defconfig
mips                      loongson3_defconfig
microblaze                    nommu_defconfig
arc                          axs103_defconfig
mips                         rt305x_defconfig
sh                          kfr2r09_defconfig
arm                         cm_x300_defconfig
sh                          polaris_defconfig
arc                    vdk_hs38_smp_defconfig
mips                        maltaup_defconfig
powerpc                 mpc8272_ads_defconfig
arm                           h3600_defconfig
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
