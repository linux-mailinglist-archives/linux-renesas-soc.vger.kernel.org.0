Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5AFE4AE517
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 23:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbiBHW53 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 17:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbiBHW5Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 17:57:16 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C97C061578
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 14:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644361035; x=1675897035;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/DWEWbu3LkBUJXKWjRQCfG8rz1GC0BlHxdFHd6qOpJI=;
  b=H9Bpxn0DGVGlHvwZcFgm7gzvbXYRVoevxjpOXZIgr7CUV0+TVmXuDItv
   G7YV+WQJ80y0tVV1Ibrdbpjl0xnMj023FWwqvdPJOiqHLqUWT3SEzaNk9
   PLtOHS/5v0Z4zn5lsyYEJuWYMUByOEcn33dpfYxRTMEwdibIKAC7uaWJg
   vfsqE0OzmwzglBFBp2DeN6WfIlo+i52IR5l/BgnXNPxIO9fd5wZBggVsZ
   640udV31KeEWvBd60hMA5RYYfra/8VTdkNuHrKZPsfBCfX+J9ZyONoZHl
   6eGwl8zcXrib5id4KxfodjNDPZLdf3dESHcizh14np0E4eFetdOAuCEAr
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249277468"
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; 
   d="scan'208";a="249277468"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 14:57:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; 
   d="scan'208";a="536726945"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Feb 2022 14:57:13 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nHZQ9-0000sm-Ac; Tue, 08 Feb 2022 22:57:13 +0000
Date:   Wed, 09 Feb 2022 06:56:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 429683cd533e19e9d252957b958c071b011dd88e
Message-ID: <6202f51e.hqAB6ahXA6xh0Erz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 429683cd533e19e9d252957b958c071b011dd88e  Merge branch 'renesas-next' into renesas-devel

elapsed time: 729m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
i386                          randconfig-c001
powerpc                    sam440ep_defconfig
arm                         cm_x300_defconfig
h8300                            alldefconfig
powerpc                     pq2fads_defconfig
arc                     haps_hs_smp_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                      loongson3_defconfig
sh                           se7619_defconfig
sh                          rsk7264_defconfig
mips                  decstation_64_defconfig
powerpc                        warp_defconfig
alpha                               defconfig
mips                         cobalt_defconfig
arc                          axs101_defconfig
m68k                        mvme147_defconfig
m68k                             alldefconfig
arm                       omap2plus_defconfig
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
powerpc                     ep8248e_defconfig
m68k                          sun3x_defconfig
powerpc                 canyonlands_defconfig
s390                       zfcpdump_defconfig
arm                  randconfig-c002-20220208
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
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a004
arc                  randconfig-r043-20220208
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
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220208
riscv                          rv32_defconfig
mips                        qi_lb60_defconfig
arm                          ixp4xx_defconfig
powerpc                   bluestone_defconfig
powerpc                          allyesconfig
arm                          ep93xx_defconfig
mips                        workpad_defconfig
arm                         s3c2410_defconfig
hexagon                             defconfig
powerpc                        icon_defconfig
powerpc                     mpc512x_defconfig
mips                  cavium_octeon_defconfig
powerpc                     kmeter1_defconfig
arm                         orion5x_defconfig
powerpc                 mpc8272_ads_defconfig
arm                        neponset_defconfig
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015
i386                          randconfig-a011
i386                          randconfig-a013
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220208
hexagon              randconfig-r041-20220208
riscv                randconfig-r042-20220208
s390                 randconfig-r044-20220208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
