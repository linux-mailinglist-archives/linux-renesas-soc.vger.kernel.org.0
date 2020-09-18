Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4F72705B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Sep 2020 21:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgIRTkk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Sep 2020 15:40:40 -0400
Received: from mga03.intel.com ([134.134.136.65]:41678 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726154AbgIRTkj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 15:40:39 -0400
IronPort-SDR: v8BCy1D4Fr2B4kig/9egCF431m2OQEbhA6TVplv/5oQWEj68kTW72MfFTpD7wKlbpGs8smdcGJ
 nvA0ZklmZyZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="160076530"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="160076530"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 12:40:34 -0700
IronPort-SDR: e4g0OIQRW9btXHqILj4i9C4mtrd+i/OVO+mvxz3OqFDWAV672FOCg9/0iUqoV7sK9mjgsFaEny
 rWkte6ER7tuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="308004131"
Received: from lkp-server01.sh.intel.com (HELO a05db971c861) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Sep 2020 12:40:32 -0700
Received: from kbuild by a05db971c861 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kJMFD-0000gD-K0; Fri, 18 Sep 2020 19:40:31 +0000
Date:   Sat, 19 Sep 2020 03:40:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 e2c59836e6462cec37d83b13b919bfb1207d923b
Message-ID: <5f650d28.iJjIQbXtSxlsYrW+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  next
branch HEAD: e2c59836e6462cec37d83b13b919bfb1207d923b  Merge branches 'renesas-arm-dt-for-v5.10' and 'renesas-drivers-for-v5.10' into renesas-next

elapsed time: 722m

configs tested: 134
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                    nommu_k210_defconfig
m68k                          amiga_defconfig
powerpc                 mpc832x_mds_defconfig
ia64                             alldefconfig
riscv                          rv32_defconfig
powerpc                     akebono_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     rainier_defconfig
mips                       capcella_defconfig
powerpc                     kilauea_defconfig
arm                         ebsa110_defconfig
sh                        edosk7760_defconfig
sparc64                          alldefconfig
m68k                          multi_defconfig
sh                        edosk7705_defconfig
arm                          pxa3xx_defconfig
powerpc                      mgcoge_defconfig
parisc                generic-32bit_defconfig
m68k                        m5272c3_defconfig
sh                     magicpanelr2_defconfig
arm                         nhk8815_defconfig
mips                  cavium_octeon_defconfig
x86_64                           allyesconfig
nios2                         10m50_defconfig
powerpc                        fsp2_defconfig
mips                       lemote2f_defconfig
arm                  colibri_pxa300_defconfig
mips                  maltasmvp_eva_defconfig
sh                         microdev_defconfig
arm                    vt8500_v6_v7_defconfig
arm                         mv78xx0_defconfig
arm                          badge4_defconfig
mips                      loongson3_defconfig
m68k                        stmark2_defconfig
sh                           se7780_defconfig
powerpc                    sam440ep_defconfig
arm                       imx_v4_v5_defconfig
m68k                        m5407c3_defconfig
arm                            pleb_defconfig
arm                          exynos_defconfig
powerpc                     tqm5200_defconfig
powerpc                    klondike_defconfig
arc                         haps_hs_defconfig
arm                          lpd270_defconfig
arm                          simpad_defconfig
mips                           ci20_defconfig
arm                          moxart_defconfig
parisc                           alldefconfig
powerpc                 linkstation_defconfig
mips                     decstation_defconfig
powerpc                        cell_defconfig
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
i386                 randconfig-a004-20200917
i386                 randconfig-a006-20200917
i386                 randconfig-a003-20200917
i386                 randconfig-a001-20200917
i386                 randconfig-a002-20200917
i386                 randconfig-a005-20200917
x86_64               randconfig-a014-20200917
x86_64               randconfig-a011-20200917
x86_64               randconfig-a016-20200917
x86_64               randconfig-a012-20200917
x86_64               randconfig-a015-20200917
x86_64               randconfig-a013-20200917
x86_64               randconfig-a004-20200918
x86_64               randconfig-a006-20200918
x86_64               randconfig-a003-20200918
x86_64               randconfig-a002-20200918
x86_64               randconfig-a005-20200918
x86_64               randconfig-a001-20200918
i386                 randconfig-a015-20200917
i386                 randconfig-a014-20200917
i386                 randconfig-a011-20200917
i386                 randconfig-a013-20200917
i386                 randconfig-a016-20200917
i386                 randconfig-a012-20200917
i386                 randconfig-a015-20200918
i386                 randconfig-a011-20200918
i386                 randconfig-a014-20200918
i386                 randconfig-a013-20200918
i386                 randconfig-a012-20200918
i386                 randconfig-a016-20200918
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20200917
x86_64               randconfig-a004-20200917
x86_64               randconfig-a003-20200917
x86_64               randconfig-a002-20200917
x86_64               randconfig-a001-20200917
x86_64               randconfig-a005-20200917

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
