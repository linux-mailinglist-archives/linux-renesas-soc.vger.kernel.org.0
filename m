Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B28AF4AE514
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 23:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiBHW4Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 17:56:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbiBHW4P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 17:56:15 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E54C061578
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 14:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644360975; x=1675896975;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VcSTAP2bA3NdtW0Jz6BYfSyUQLDwMoSyMoQ6ZK10utg=;
  b=Bw4hUXeg7pLBFzhqhWJol2F9Q57KqTmUKfOPbhzefdDL7Wzd9bxjROxk
   x+EHzE0bA2pYzMGq5gjLW/H5BAWsqFoSGIQiZ+eNSDUX+J5rRtWgf3JYz
   vDRjogMlSI4s9/6QCbZT3cApnMReg9PDRt8jf6PIjZgXkWjlKHiqhvnbu
   ranbBg2TVW2xJP6USBbqeyj0hL+ZYgrlEbTywPOWpirW7BXi9oyR7hDup
   VdPIzfwCkx7zJD5PCnAvynXbbKCSutCaOfwR8oD4rw61sQrZDDiCpVQXk
   Y1TBoelGnNMH73j8V6NXxEF5sSZGtH767OB5XldUYLinhOzldDUi7TwXg
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="273604429"
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; 
   d="scan'208";a="273604429"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 14:56:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; 
   d="scan'208";a="484985916"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Feb 2022 14:56:13 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nHZPB-0000s7-3j; Tue, 08 Feb 2022 22:56:13 +0000
Date:   Wed, 09 Feb 2022 06:55:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v5.18] BUILD SUCCESS
 9b90413c0524fc40eef1d63cd9dbaf9aa576038d
Message-ID: <6202f4fd.rmBiNMJQxStvYxLg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.18
branch HEAD: 9b90413c0524fc40eef1d63cd9dbaf9aa576038d  clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC

elapsed time: 729m

configs tested: 121
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm                                 defconfig
i386                          randconfig-c001
powerpc                    sam440ep_defconfig
arm                         cm_x300_defconfig
h8300                            alldefconfig
sh                          sdk7780_defconfig
sh                         apsh4a3a_defconfig
ia64                             alldefconfig
powerpc                 mpc837x_rdb_defconfig
sh                          rsk7264_defconfig
mips                  decstation_64_defconfig
powerpc                        warp_defconfig
alpha                               defconfig
mips                         cobalt_defconfig
mips                     decstation_defconfig
sh                               j2_defconfig
sh                           se7712_defconfig
arm                        mini2440_defconfig
arm                          iop32x_defconfig
arm                      jornada720_defconfig
powerpc                     tqm8541_defconfig
mips                      fuloong2e_defconfig
mips                        bcm47xx_defconfig
xtensa                  nommu_kc705_defconfig
parisc                           alldefconfig
m68k                        m5407c3_defconfig
powerpc                     tqm8548_defconfig
sh                           se7780_defconfig
arm                         axm55xx_defconfig
powerpc                  storcenter_defconfig
arm                         assabet_defconfig
sh                           se7343_defconfig
mips                 decstation_r4k_defconfig
arm                  randconfig-c002-20220208
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
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
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a004
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
riscv                randconfig-c006-20220208
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220208
mips                 randconfig-c004-20220208
arm                  randconfig-c002-20220208
mips                        qi_lb60_defconfig
arm                          ixp4xx_defconfig
powerpc                   bluestone_defconfig
powerpc                          allyesconfig
arm                          ep93xx_defconfig
mips                      bmips_stb_defconfig
arm                        spear3xx_defconfig
mips                  cavium_octeon_defconfig
powerpc                     kmeter1_defconfig
arm                         orion5x_defconfig
arm                         hackkit_defconfig
powerpc                     mpc512x_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015
x86_64                        randconfig-a003
hexagon              randconfig-r045-20220208
hexagon              randconfig-r041-20220208
riscv                randconfig-r042-20220208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
