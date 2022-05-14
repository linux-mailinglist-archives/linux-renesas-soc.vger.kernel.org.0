Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E47655273B2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 May 2022 21:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234860AbiENTRh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 May 2022 15:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234855AbiENTRg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 May 2022 15:17:36 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545AD1B78D
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 May 2022 12:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652555855; x=1684091855;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z2XKUvtwa22Br9oMxmYCgfm1G9DwQezJBCiGI46hCNQ=;
  b=QvdmaMYr35aDiXt5JM7p0GrQgNZw53fFF9sqfXbzjj6miFdciF7l9bZW
   Ma8SlZjL/DzGVpPJy52xyjaXNoQP9hZohzu8vLJ/vDskeR5ekj0eZsUt8
   2/Sf6lLOUBNKcrcvkrLi2gx5ZOYlYUwHaD8b0tAioPHrfssG2IfLH3nc+
   m6gasoT7yoNLeVGWEHWW5ZrZBsxdespbsJnC+TYzJwIGD6fEFu+ch75eu
   QAZkcLywJPBKFWt3LtYMklQfMJailQQ0NTZNP0bCQ3AfkstOVa2wYVgWH
   VXNd6I/vMYXK4osW9QvP7xjAUZvS+Bh/2vHskajW0aLMTtaNBs07NbfI6
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="356967182"
X-IronPort-AV: E=Sophos;i="5.91,226,1647327600"; 
   d="scan'208";a="356967182"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2022 12:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,226,1647327600"; 
   d="scan'208";a="554652278"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 May 2022 12:17:30 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1npxGb-0000xi-3Z;
        Sat, 14 May 2022 19:17:29 +0000
Date:   Sun, 15 May 2022 03:16:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v5.19] BUILD SUCCESS
 fc883ed5a43e5f94894216896d74190ecf1356ff
Message-ID: <6280001d.m8Frwc7iJ17GM/pH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v5.19
branch HEAD: fc883ed5a43e5f94894216896d74190ecf1356ff  pinctrl: renesas: checker: Add reserved field checks

elapsed time: 13464m

configs tested: 143
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
i386                          randconfig-c001
powerpc                      ppc40x_defconfig
powerpc                    adder875_defconfig
powerpc                        warp_defconfig
powerpc                      tqm8xx_defconfig
sh                           se7712_defconfig
mips                            gpr_defconfig
h8300                       h8s-sim_defconfig
sparc                       sparc64_defconfig
powerpc                 mpc837x_rdb_defconfig
arc                     nsimosci_hs_defconfig
microblaze                      mmu_defconfig
arm                           tegra_defconfig
sh                            shmin_defconfig
sh                            hp6xx_defconfig
m68k                       m5208evb_defconfig
m68k                             allmodconfig
i386                                defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      cm5200_defconfig
arm                         nhk8815_defconfig
riscv                               defconfig
arc                        nsimosci_defconfig
xtensa                           alldefconfig
ia64                        generic_defconfig
powerpc                   motionpro_defconfig
openrisc                    or1ksim_defconfig
arm                             pxa_defconfig
m68k                          hp300_defconfig
parisc                generic-32bit_defconfig
arm                         vf610m4_defconfig
arm                        mvebu_v7_defconfig
mips                           ip32_defconfig
powerpc                       maple_defconfig
mips                        vocore2_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            pleb_defconfig
mips                          rb532_defconfig
mips                         tb0226_defconfig
sh                                  defconfig
arm                         at91_dt_defconfig
sh                             sh03_defconfig
powerpc64                           defconfig
sh                               j2_defconfig
arm                  randconfig-c002-20220505
x86_64                        randconfig-c001
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220505
riscv                randconfig-r042-20220505
s390                 randconfig-r044-20220505
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
s390                 randconfig-c005-20220506
powerpc              randconfig-c003-20220506
riscv                randconfig-c006-20220506
mips                 randconfig-c004-20220506
arm                  randconfig-c002-20220506
s390                             alldefconfig
powerpc                     mpc512x_defconfig
powerpc                 mpc8272_ads_defconfig
arm                       cns3420vb_defconfig
arm                           omap1_defconfig
powerpc                     kmeter1_defconfig
mips                     loongson1c_defconfig
arm                       mainstone_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          collie_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r045-20220505
hexagon              randconfig-r041-20220505

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
