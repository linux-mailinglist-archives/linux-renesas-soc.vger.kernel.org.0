Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68DF750202F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Apr 2022 03:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244590AbiDOBqk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Apr 2022 21:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234458AbiDOBqk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Apr 2022 21:46:40 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D6CAC05B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Apr 2022 18:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649987053; x=1681523053;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j9ZBqC6P8Lh9wFTo0YuyIbl4shCbPupEStDb/ujqaaU=;
  b=TgFw+3s26+EJGrqq2Uuz7MZOig/iZmHQXpuLobcG25E4jQhoPkpGbgJv
   6PtnG7VgKAkntmdZQd5GqjiIRwmk/poqwfLjLRi4XOXRoDmR9xfEUXyCG
   Y+CVEgEGJLl4xJudJdgT21k/5hUZGFBJcuV70iCdzCsf7q6LsXRy4XOft
   Xyi7Hj2HT1wPBOX5+7887JRVFpMOeyjLfv5lk3MyPPRfJbhjW6qF6Sr79
   HlW7V1s4js4IjShyMLsdtMWKnsIl5hPR65MR3PgyJbJpjFrm/e8zUbaTo
   0dyQf6IjfU5ctGc3szV2apr9UtaJP3rA5rOt0PSTojkgIW4QBgVK8yL6m
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="288133591"
X-IronPort-AV: E=Sophos;i="5.90,261,1643702400"; 
   d="scan'208";a="288133591"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 18:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,261,1643702400"; 
   d="scan'208";a="527130215"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Apr 2022 18:44:11 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nfB0N-0001O5-7d;
        Fri, 15 Apr 2022 01:44:11 +0000
Date:   Fri, 15 Apr 2022 09:43:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 83f3d1f783134ab640a936201ad287ae8570cec3
Message-ID: <6258cdd9.4XoI9ta8MJ1B2Jyr%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 83f3d1f783134ab640a936201ad287ae8570cec3  Merge branch 'renesas-next' into renesas-devel

elapsed time: 2233m

configs tested: 104
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
arm                        realview_defconfig
powerpc                 canyonlands_defconfig
powerpc                     rainier_defconfig
arc                      axs103_smp_defconfig
arc                          axs101_defconfig
parisc                generic-32bit_defconfig
arm                     eseries_pxa_defconfig
ia64                          tiger_defconfig
arc                          axs103_defconfig
riscv                               defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220413
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a002
arc                  randconfig-r043-20220413
riscv                randconfig-r042-20220413
s390                 randconfig-r044-20220413
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
arm                  randconfig-c002-20220414
mips                 randconfig-c004-20220414
x86_64                        randconfig-c007
i386                          randconfig-c001
powerpc              randconfig-c003-20220414
riscv                randconfig-c006-20220414
s390                 randconfig-c005-20220414
mips                         tb0219_defconfig
riscv                            alldefconfig
mips                     cu1830-neo_defconfig
arm                         s5pv210_defconfig
powerpc                 mpc8560_ads_defconfig
mips                       lemote2f_defconfig
powerpc                      pmac32_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
hexagon              randconfig-r045-20220413
hexagon              randconfig-r041-20220413

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
