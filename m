Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9824AE523
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Feb 2022 00:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbiBHXBL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 18:01:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbiBHWzV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 17:55:21 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CCBC0612B9
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 14:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644360915; x=1675896915;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/CJMBwSlhoOL7/46ivt6OnwEH5ECGMYjLiOJHHi4BeU=;
  b=FsREVXi1zj4SMsPBOM4SlAa+oGCUewplPAEpJqJkZnyNnVnhsVYxwDvC
   W6YjYaVR0NHSYb1ROzn6MIuqWuob7UbD32QqCx3PBlyN0fsSL8vHE6bQk
   QUuTwClxty2/JY06J79kR+TwZA+L4AuvYQMTMfZyXnbD68OcUHtVavYbA
   e3UMkjIlyjcNspeacCEn6uPoLZsfBFN68fCGpBSzjteOf1n0qexBeRuVE
   cuQjBiIzhjyYfz7SZjr4iCfv80G//QS9PWEEfdogw6C3Xcbz6h3fcltBe
   SBGUL/8eATePFD2nqalpCWRR7CokR7JDuCmXaPLjgCQtWEQ81Jjfm9HEt
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="335472348"
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; 
   d="scan'208";a="335472348"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 14:55:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; 
   d="scan'208";a="701019908"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Feb 2022 14:55:13 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nHZOC-0000rs-VR; Tue, 08 Feb 2022 22:55:12 +0000
Date:   Wed, 09 Feb 2022 06:54:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.18] BUILD SUCCESS
 5c65ad12785205d5c57bd92e19d0296f93c19e33
Message-ID: <6202f4ad.+44T8rjD4dsv4ByC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.18
branch HEAD: 5c65ad12785205d5c57bd92e19d0296f93c19e33  arm64: dts: renesas: rzg2lc-smarc: Use SW_SD0_DEV_SEL macro for eMMC/SDHI device selection

elapsed time: 726m

configs tested: 92
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
powerpc                    sam440ep_defconfig
arm                         cm_x300_defconfig
h8300                            alldefconfig
sh                          rsk7264_defconfig
mips                  decstation_64_defconfig
powerpc                        warp_defconfig
alpha                               defconfig
mips                         cobalt_defconfig
mips                      fuloong2e_defconfig
mips                        bcm47xx_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                     tqm8541_defconfig
parisc                           alldefconfig
m68k                        m5407c3_defconfig
powerpc                     tqm8548_defconfig
sh                           se7780_defconfig
arm                         axm55xx_defconfig
powerpc                  storcenter_defconfig
arm                         assabet_defconfig
sh                           se7343_defconfig
mips                 decstation_r4k_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a002
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig

clang tested configs:
mips                        qi_lb60_defconfig
arm                          ixp4xx_defconfig
powerpc                   bluestone_defconfig
powerpc                          allyesconfig
arm                          ep93xx_defconfig
mips                  cavium_octeon_defconfig
powerpc                     kmeter1_defconfig
arm                         orion5x_defconfig
arm                         s5pv210_defconfig
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015
hexagon              randconfig-r045-20220208
hexagon              randconfig-r041-20220208
riscv                randconfig-r042-20220208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
