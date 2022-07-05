Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C32FA5678BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 22:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbiGEUuT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 16:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbiGEUuE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 16:50:04 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7CC20F75
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 13:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657054141; x=1688590141;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Tpts+wL2FgVeozou6Oxovc3bQsW67bfkQ16/VQ8l3Sg=;
  b=Pam4UYaCN9yhacBVFhsr1EopWy+94y/rG4DlSLDYIhic/noVvXkcLyJk
   jg8qKwTNHxCWwCfZ10fV6EOBpawn1veX7byHIsEsTrLs670xGm95LOUcw
   Zs2Uw9zqjZDSARiKCE/FBslTalILXPICEGMvauqJMUGRG8B2N5u4qcPNz
   pIDTO4FWKInbKRm8hdLNUDlTH14aVAFFomoDL7kw/C18/Op/dDyYxrUkI
   4b6xE9ORtVtNlDgHcEg1GLDT8VkQpARmMKvEszeUSKUlkh59GzmNJyRrb
   j+dt6Z43UaC1gCJjREUMiQIoTjYMXjQCTYnm6ZWqCsqwaHnWfeHhpdfYS
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="281049784"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; 
   d="scan'208";a="281049784"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 13:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; 
   d="scan'208";a="590546568"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Jul 2022 13:48:55 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o8pTa-000JZ7-Ak;
        Tue, 05 Jul 2022 20:48:54 +0000
Date:   Wed, 06 Jul 2022 04:48:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-r9a07g043-dt-binding-defs] BUILD
 SUCCESS 668d361c9d893be3cbd4f3650e1934a62b204def
Message-ID: <62c4a38b.osUTSLM0y1mM9Oxs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-r9a07g043-dt-binding-defs
branch HEAD: 668d361c9d893be3cbd4f3650e1934a62b204def  dt-bindings: clock: r9a07g043-cpg: Add Renesas RZ/Five CPG Clock and Reset Definitions

elapsed time: 725m

configs tested: 101
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
xtensa                  audio_kc705_defconfig
sh                            shmin_defconfig
sh                            migor_defconfig
arc                         haps_hs_defconfig
arm                        keystone_defconfig
s390                          debug_defconfig
powerpc                         wii_defconfig
powerpc                      tqm8xx_defconfig
powerpc                       maple_defconfig
sh                                  defconfig
nios2                            allyesconfig
nios2                               defconfig
x86_64                              defconfig
mips                         bigsur_defconfig
sh                            titan_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     pq2fads_defconfig
sh                         ecovec24_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc834x_mds_defconfig
sh                   secureedge5410_defconfig
arm                      integrator_defconfig
sh                   rts7751r2dplus_defconfig
arm                         cm_x300_defconfig
m68k                        stmark2_defconfig
m68k                        m5407c3_defconfig
sparc                       sparc64_defconfig
m68k                        mvme147_defconfig
sh                          polaris_defconfig
arm                         assabet_defconfig
arm                       multi_v4t_defconfig
xtensa                         virt_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                       bvme6000_defconfig
sh                ecovec24-romimage_defconfig
arc                              allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
arm                  randconfig-c002-20220703
ia64                             allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
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
arc                  randconfig-r043-20220703
riscv                randconfig-r042-20220703
s390                 randconfig-r044-20220703
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                          ath79_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                              alldefconfig
mips                          ath25_defconfig
arm                         orion5x_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220703
hexagon              randconfig-r041-20220703

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
