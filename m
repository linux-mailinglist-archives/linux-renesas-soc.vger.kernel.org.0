Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15800611F14
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Oct 2022 03:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiJ2Bam (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Oct 2022 21:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiJ2Bal (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 21:30:41 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF705C7057
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 18:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667007040; x=1698543040;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D7OCAZriV6o0Sf6MJVWGEtR9a9FLRxCVRzreFsqVU+Q=;
  b=lLSTyhpkjI9SZxCpiC0PqgjMT3zxs7lq5kd7aCW+Rov3ZgsFmubFirPb
   dujzEs0Re4OXy01ra59sroIzx59andzogEaVDwHYjQPvYnjT1GuF3w8gZ
   aAXwP/ebe3wKgrDUFXXOzLhb8rNpblwfBV9lmxQf3LDSql5BG2DLGxXF9
   9fyDvQZBCKnBJBI3VeXDjVNKeLQ9nByQhpfPfZcTWCTqEur8Qjhp7a95j
   46E802fKlDEWCS7OSipjg1fTuRGHoFHmB+Jia/gXZ7cLUB06C/uu1znsF
   kuoE6NGkC2ioIHRfDDF6jC+LEQ+XiYXbk3ucV+tGQKuGsK3+GM5s/L4x5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="291920175"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="291920175"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 18:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="627714066"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="627714066"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 28 Oct 2022 18:30:39 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ooagI-000APu-2S;
        Sat, 29 Oct 2022 01:30:38 +0000
Date:   Sat, 29 Oct 2022 09:29:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-soc-for-v6.2] BUILD SUCCESS
 d84ea59e20158ca7a1b6c1dfc3c0e2e652eb4b00
Message-ID: <635c8209.OKBfgx0Bn12UrOfD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-soc-for-v6.2
branch HEAD: d84ea59e20158ca7a1b6c1dfc3c0e2e652eb4b00  arm64: renesas: Drop selecting GPIOLIB and PINCTRL

elapsed time: 725m

configs tested: 92
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
arc                                 defconfig
um                           x86_64_defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
ia64                             allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
riscv                randconfig-r042-20221026
arc                  randconfig-r043-20221026
x86_64                           allyesconfig
s390                 randconfig-r044-20221026
i386                                defconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                  randconfig-r043-20221028
s390                 randconfig-r044-20221028
riscv                randconfig-r042-20221028
i386                          randconfig-c001
i386                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                        randconfig-a002
m68k                             allyesconfig
arm                          pxa3xx_defconfig
sh                        dreamcast_defconfig
x86_64                        randconfig-a004
sparc                            allyesconfig
powerpc                    sam440ep_defconfig
x86_64                        randconfig-a006
mips                           xway_defconfig
arc                      axs103_smp_defconfig
powerpc                      ep88xc_defconfig
powerpc                       ppc64_defconfig
powerpc                      makalu_defconfig
arm                           u8500_defconfig
arm                         lpc18xx_defconfig
arm                      jornada720_defconfig
sh                   sh7724_generic_defconfig
m68k                           sun3_defconfig
m68k                        mvme147_defconfig
powerpc                     asp8347_defconfig
csky                             alldefconfig
m68k                        mvme16x_defconfig
powerpc                 canyonlands_defconfig
arm                           stm32_defconfig
arm64                            alldefconfig
arm                          gemini_defconfig
powerpc                      tqm8xx_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm64                               defconfig
sh                            titan_defconfig
powerpc                      mgcoge_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20221029

clang tested configs:
hexagon              randconfig-r045-20221026
hexagon              randconfig-r041-20221026
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
s390                 randconfig-r044-20221029
hexagon              randconfig-r045-20221029
riscv                randconfig-r042-20221029
x86_64                        randconfig-k001
mips                           rs90_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
