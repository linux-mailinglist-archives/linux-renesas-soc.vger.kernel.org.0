Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D36F5ECD29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Sep 2022 21:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbiI0Tt5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Sep 2022 15:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbiI0Ttz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2022 15:49:55 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF39796B2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 12:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664308194; x=1695844194;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q7loFgvgfJI/53LUgPjZHI+yFvr3bTLhWUZT/too1x4=;
  b=KCWxlgoT50n+DRRz99zhQX0Ohprca5edGVlhxpx3jvzF3mGnCHYx8Clm
   BmSSk+IOCNSj7W8oStLU8V5uGJkd6san5aqK4AfkaUGeV5489H/zRGp+g
   keLkEJ5ZVDhx6bm5JfPTCj2A1tj9nMWn106zGDGAPv+oRordBpJVsfD4L
   pEmUtNKl39/WNPKRrkRaxkfmiZFpPzIDtMFROYAtmmnsDr0XtafTuBYuA
   VSNnapPel7lT5rBZYEYFMVtYUCB56Ir15NFIG6eGDcYNZVMsb7aPQB32F
   hnzrkETSqgRslPAz/roKb5DVUxeGYPCkYKRQ8B++ufzUeCOstFjcWGHzi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="327778225"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="327778225"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 12:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="950415033"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="950415033"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Sep 2022 12:49:52 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1odGaV-0001WS-1h;
        Tue, 27 Sep 2022 19:49:51 +0000
Date:   Wed, 28 Sep 2022 03:49:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.2] BUILD SUCCESS
 05b231db3c340b7a542f144158c4a5a97a90c02e
Message-ID: <633353ba.dWfgoGvhn3zWooiU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.2
branch HEAD: 05b231db3c340b7a542f144158c4a5a97a90c02e  soc: renesas: Kconfig: Explicitly select GPIOLIB and PINCTRL config under SOC_RENESAS

elapsed time: 722m

configs tested: 104
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
sh                               allmodconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                              allyesconfig
alpha                            allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
i386                                defconfig
x86_64                         rhel-8.3-kunit
m68k                             allmodconfig
arc                  randconfig-r043-20220925
x86_64                           rhel-8.3-kvm
m68k                             allyesconfig
x86_64                           allyesconfig
i386                 randconfig-a001-20220926
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
i386                 randconfig-a004-20220926
i386                 randconfig-a002-20220926
riscv                randconfig-r042-20220925
i386                 randconfig-a003-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
i386                             allyesconfig
arm                                 defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
arm64                            allyesconfig
arm                              allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                          randconfig-c001
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-c001
arm                  randconfig-c002-20220925
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                        sh7763rdp_defconfig
csky                                defconfig
ia64                             alldefconfig
powerpc                     asp8347_defconfig
s390                       zfcpdump_defconfig
powerpc                      tqm8xx_defconfig
ia64                             allmodconfig
i386                             alldefconfig
mips                        bcm47xx_defconfig
sh                          urquell_defconfig
arc                      axs103_smp_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
i386                 randconfig-a011-20220926
s390                 randconfig-r044-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a016-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64                        randconfig-a001
x86_64               randconfig-a015-20220926
x86_64               randconfig-a016-20220926
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-k001
arm                         s5pv210_defconfig
arm                        vexpress_defconfig
mips                        qi_lb60_defconfig
powerpc                      ppc44x_defconfig
powerpc                   microwatt_defconfig
mips                          ath25_defconfig
arm                     davinci_all_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
