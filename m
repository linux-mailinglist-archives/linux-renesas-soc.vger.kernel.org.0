Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43E066083CF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Oct 2022 05:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiJVDUr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Oct 2022 23:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiJVDUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2022 23:20:45 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD50204AED
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Oct 2022 20:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666408842; x=1697944842;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uBCGlxE9WKH3ohI+nYA6KrmXpMuknn6fGH1APUUwjUE=;
  b=oDJisCIM5zOuKWiLktu05Tor5zFwChdS48P6lheplbMhR60+DI+VI4vf
   Rr9Ho9+Wp8H3Q+Js0a5CVeXWzeovbrr/aub7wHvsEyZp3T0m3EAbTzUSE
   42qkBJsCPgURxAKjGjxmiYdJycUgFyqQWbGrV+IdpHtssyKZmbpppJo3J
   xwrs5v6YAsgiVbX1MQA8OWZfiN+LrIV9enKoi9QMzKyMqmk6QD6jU5zaq
   59xw0bbBbAiPrQaSJitMNbPZzy3OgBO0IUCPRcrpt8gJMsyIgnjdoegey
   vQPRMvmDJ+2wn+97hXqNO1hrQrmjb63PnpL6p7ko+bD1hx5P0Shoyc3zQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="286868649"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; 
   d="scan'208";a="286868649"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 20:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="959869053"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; 
   d="scan'208";a="959869053"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Oct 2022 20:20:40 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1om53w-0003HH-0W;
        Sat, 22 Oct 2022 03:20:40 +0000
Date:   Sat, 22 Oct 2022 11:20:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-fixes-for-v6.1] BUILD SUCCESS
 b5204a1ef90bf59f34240702abffe52dc15b14cf
Message-ID: <63536169.Av5UERODR1dSs75a%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-fixes-for-v6.1
branch HEAD: b5204a1ef90bf59f34240702abffe52dc15b14cf  clk: renesas: r8a779g0: Fix HSCIF parent clocks

elapsed time: 724m

configs tested: 135
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
arc                                 defconfig
um                           x86_64_defconfig
alpha                               defconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
s390                             allmodconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a013
x86_64                          rhel-8.3-func
s390                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a011
s390                                defconfig
x86_64                        randconfig-a004
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a014
x86_64                        randconfig-a002
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
i386                          randconfig-a012
arm                                 defconfig
x86_64                        randconfig-a006
i386                          randconfig-a016
i386                             allyesconfig
x86_64                        randconfig-a015
i386                          randconfig-a005
arc                  randconfig-r043-20221020
powerpc                           allnoconfig
s390                 randconfig-r044-20221020
mips                             allyesconfig
arc                  randconfig-r043-20221018
x86_64                               rhel-8.3
powerpc                          allmodconfig
riscv                randconfig-r042-20221020
sh                               allmodconfig
riscv                randconfig-r042-20221018
s390                 randconfig-r044-20221018
x86_64                           allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
arc                           tb10x_defconfig
sh                            titan_defconfig
powerpc                     pq2fads_defconfig
arm                         nhk8815_defconfig
arm                       omap2plus_defconfig
arm                        clps711x_defconfig
powerpc                 linkstation_defconfig
arc                            hsdk_defconfig
openrisc                 simple_smp_defconfig
arc                              alldefconfig
m68k                          atari_defconfig
powerpc                     tqm8548_defconfig
arm                          lpd270_defconfig
arm                           u8500_defconfig
csky                                defconfig
parisc                generic-64bit_defconfig
i386                          randconfig-c001
sh                           se7722_defconfig
sparc                       sparc32_defconfig
sh                          sdk7786_defconfig
parisc                           alldefconfig
mips                      fuloong2e_defconfig
arm                        multi_v7_defconfig
sh                           se7721_defconfig
powerpc                         ps3_defconfig
m68k                           virt_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arc                  randconfig-r043-20221022
s390                 randconfig-r044-20221022
riscv                randconfig-r042-20221022
arc                  randconfig-r043-20221019
ia64                          tiger_defconfig
arm                        mvebu_v7_defconfig
mips                    maltaup_xpa_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
m68k                            q40_defconfig
m68k                        mvme147_defconfig
nios2                            allyesconfig
arm                            zeus_defconfig
sh                               alldefconfig
loongarch                         allnoconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a002
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a003
hexagon              randconfig-r041-20221020
i386                          randconfig-a004
x86_64                        randconfig-a005
hexagon              randconfig-r045-20221020
x86_64                        randconfig-a014
hexagon              randconfig-r041-20221018
i386                          randconfig-a006
hexagon              randconfig-r045-20221018
arm                        vexpress_defconfig
mips                       rbtx49xx_defconfig
arm                           spitz_defconfig
s390                 randconfig-r044-20221019
hexagon              randconfig-r045-20221019
riscv                randconfig-r042-20221019
hexagon              randconfig-r041-20221019
x86_64                        randconfig-k001
arm                       netwinder_defconfig
mips                        maltaup_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                   microwatt_defconfig
arm                         orion5x_defconfig
powerpc                      obs600_defconfig
i386                 randconfig-a013-20221017
i386                 randconfig-a015-20221017
i386                 randconfig-a016-20221017
i386                 randconfig-a011-20221017
i386                 randconfig-a014-20221017
i386                 randconfig-a012-20221017
arm                            mmp2_defconfig
arm                      pxa255-idp_defconfig
mips                          ath79_defconfig
powerpc                      acadia_defconfig
arm                             mxs_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
