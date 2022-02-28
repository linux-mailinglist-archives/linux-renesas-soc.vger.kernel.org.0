Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0723D4C7D9C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Feb 2022 23:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbiB1WmN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Feb 2022 17:42:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiB1WmM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Feb 2022 17:42:12 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B2412E9F0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Feb 2022 14:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646088092; x=1677624092;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lvH/HE+moa6ZRQTaoy8te+RodYljG+fvuKz+i0oHbk8=;
  b=S3i9IEOcbmX8Pgp4Kn7+a4WWfJx6qzH8gxnf0cxA6dw2cBpnek3sea8M
   ONcgvxz7skRPYSTa36A1en7p3HlVtaKeTwTNdwGIs0Nqlkw4pstVqmQgF
   H4psb8GIC0l1IUi3UTc+Ga+agLnJ9OmZxczeL4EJA4JJ36wT7B/GCy8MJ
   LO1+9Jmgp0ASFVhLp679W+uvKHI2FLrFt0e2CJEt4OXFucSsyIWsJhj7G
   S3/lZoN0GUVzYQ8v19XI5xy4zfB+PU5nTqHmE5/nRCh9mziSfSPjn0GKq
   pRLvWCtyvQZFOVsPbhaz7nfmWvslpbML57SwhGqmWwOb+YSqJ35qW5tNw
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="240414878"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="240414878"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 14:41:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="507585460"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Feb 2022 14:41:31 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nOohu-0007qs-7a; Mon, 28 Feb 2022 22:41:30 +0000
Date:   Tue, 01 Mar 2022 06:40:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 a71d9945241e2e2c40b48a4e45d486664a83354d
Message-ID: <621d4f67.dm9kzVOFCa5zvx6d%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: a71d9945241e2e2c40b48a4e45d486664a83354d  Merge tag 'v5.17-rc6' into renesas-devel

elapsed time: 722m

configs tested: 172
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220228
m68k                           sun3_defconfig
arm                            zeus_defconfig
mips                           ip32_defconfig
mips                      loongson3_defconfig
powerpc                      pcm030_defconfig
m68k                       m5208evb_defconfig
openrisc                    or1ksim_defconfig
arm                        trizeps4_defconfig
arc                         haps_hs_defconfig
powerpc                      cm5200_defconfig
arc                        nsim_700_defconfig
xtensa                           alldefconfig
sparc                       sparc64_defconfig
arm                       aspeed_g5_defconfig
powerpc                    amigaone_defconfig
powerpc                     sequoia_defconfig
sparc                            allyesconfig
alpha                               defconfig
arm                       omap2plus_defconfig
powerpc                     tqm8555_defconfig
mips                         mpc30x_defconfig
arm                        cerfcube_defconfig
mips                       bmips_be_defconfig
mips                         rt305x_defconfig
sh                          rsk7269_defconfig
sh                        sh7785lcr_defconfig
sh                         ecovec24_defconfig
arm                        multi_v7_defconfig
powerpc                       maple_defconfig
powerpc                   currituck_defconfig
m68k                             allyesconfig
powerpc                    adder875_defconfig
mips                      fuloong2e_defconfig
sh                         microdev_defconfig
mips                           ci20_defconfig
sh                          lboxre2_defconfig
arm                      integrator_defconfig
xtensa                          iss_defconfig
sh                      rts7751r2d1_defconfig
sh                          polaris_defconfig
sh                             sh03_defconfig
xtensa                    smp_lx200_defconfig
mips                            ar7_defconfig
sh                             espt_defconfig
arc                          axs101_defconfig
powerpc                      chrp32_defconfig
powerpc                      mgcoge_defconfig
m68k                         amcore_defconfig
powerpc                     taishan_defconfig
sh                     sh7710voipgw_defconfig
sh                          urquell_defconfig
m68k                        mvme16x_defconfig
powerpc                     rainier_defconfig
arm                             ezx_defconfig
arm                          pxa910_defconfig
arm                  randconfig-c002-20220228
arm                  randconfig-c002-20220227
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20220228
x86_64               randconfig-a015-20220228
x86_64               randconfig-a014-20220228
x86_64               randconfig-a013-20220228
x86_64               randconfig-a016-20220228
x86_64               randconfig-a012-20220228
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                 randconfig-a011-20220228
i386                 randconfig-a012-20220228
i386                 randconfig-a013-20220228
i386                 randconfig-a015-20220228
i386                 randconfig-a016-20220228
i386                 randconfig-a014-20220228
s390                 randconfig-r044-20220228
arc                  randconfig-r043-20220228
arc                  randconfig-r043-20220227
riscv                randconfig-r042-20220228
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20220227
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220227
i386                          randconfig-c001
arm                  randconfig-c002-20220227
riscv                randconfig-c006-20220227
s390                 randconfig-c005-20220227
arm                          imote2_defconfig
mips                       rbtx49xx_defconfig
mips                        bcm63xx_defconfig
arm                          pcm027_defconfig
powerpc                     kmeter1_defconfig
powerpc                     mpc512x_defconfig
riscv                    nommu_virt_defconfig
powerpc                     ksi8560_defconfig
powerpc                        icon_defconfig
arm                       cns3420vb_defconfig
arm                        neponset_defconfig
arm                         s5pv210_defconfig
powerpc                      pmac32_defconfig
powerpc                          allmodconfig
mips                      maltaaprp_defconfig
x86_64               randconfig-a001-20220228
x86_64               randconfig-a003-20220228
x86_64               randconfig-a002-20220228
x86_64               randconfig-a004-20220228
x86_64               randconfig-a005-20220228
x86_64               randconfig-a006-20220228
i386                 randconfig-a002-20220228
i386                 randconfig-a001-20220228
i386                 randconfig-a005-20220228
i386                 randconfig-a003-20220228
i386                 randconfig-a006-20220228
i386                 randconfig-a004-20220228
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220227
hexagon              randconfig-r041-20220227
riscv                randconfig-r042-20220227
hexagon              randconfig-r041-20220228
s390                 randconfig-r044-20220227
hexagon              randconfig-r045-20220228

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
