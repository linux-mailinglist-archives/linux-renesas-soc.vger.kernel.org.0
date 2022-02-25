Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA174C3BF2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Feb 2022 03:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236847AbiBYCxP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Feb 2022 21:53:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiBYCxP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Feb 2022 21:53:15 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B192399EC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Feb 2022 18:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645757564; x=1677293564;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aP4Mvf327RVIrQNmIKZhNQJ4s9Uw97d+hk+WnZbaRdU=;
  b=fWaeac4C8RMOMfvgGnx7gpTipyn1F7OdZxyy1JTqx40yPvbpVD5yeXn2
   KYOfF9yXQnf8X4V3daEPNHZGnkDXgNf44J1U87IHVropS/OkDuba6xv+T
   aAEkU3MNHhcFZYg5pltK9PZ6DW5VrsRM5F1Yry0xxlgNK4lUl9lqfCZFp
   q3TpWjy+sPJF7FuaNko4YtICRR7k5yxJnz9769trko5zRyjfrYUP87Xhz
   jPAVlqIL2EKPDHa8xLrtRv+7VU3hZY9htM0+w0XSD6OdA1M42B52JxriZ
   n4frGCceFNJpMs+/WTbyRTylZ+HKy4IktgmbQhoWnuFBmCIhCQSJSRabU
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="233028733"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="233028733"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 18:52:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="684507352"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2022 18:52:42 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nNQio-0003lH-7t; Fri, 25 Feb 2022 02:52:42 +0000
Date:   Fri, 25 Feb 2022 10:52:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 a339e7300fc846eb40d688dbaa4333fe5390bccf
Message-ID: <62184450.OU/7QtR1oAIsSmtF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: a339e7300fc846eb40d688dbaa4333fe5390bccf  Merge branches 'renesas-next' and 'topic/renesas-defconfig' into renesas-devel

elapsed time: 735m

configs tested: 122
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
i386                          randconfig-c001
arm                         axm55xx_defconfig
xtensa                          iss_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                 linkstation_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7780_defconfig
arm                         nhk8815_defconfig
m68k                          hp300_defconfig
sh                          rsk7203_defconfig
microblaze                          defconfig
ia64                            zx1_defconfig
powerpc                      pcm030_defconfig
powerpc                     redwood_defconfig
arc                         haps_hs_defconfig
arm                  randconfig-c002-20220224
arm                  randconfig-c002-20220223
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
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220223
arc                  randconfig-r043-20220224
riscv                randconfig-r042-20220224
s390                 randconfig-r044-20220224
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func

clang tested configs:
x86_64                        randconfig-c007
arm                  randconfig-c002-20220224
powerpc              randconfig-c003-20220224
riscv                randconfig-c006-20220224
i386                          randconfig-c001
mips                 randconfig-c004-20220224
s390                 randconfig-c005-20220224
arm                         s5pv210_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                      pmac32_defconfig
arm                            dove_defconfig
riscv                    nommu_virt_defconfig
arm                                 defconfig
arm                         hackkit_defconfig
powerpc                    mvme5100_defconfig
powerpc                     tqm8560_defconfig
mips                           ip22_defconfig
arm                         socfpga_defconfig
arm                          moxart_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220223
hexagon              randconfig-r041-20220223
riscv                randconfig-r042-20220223
hexagon              randconfig-r045-20220224
hexagon              randconfig-r041-20220224
s390                 randconfig-r044-20220223

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
