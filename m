Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F046507C3F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Apr 2022 23:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238291AbiDSWAY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 18:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235596AbiDSWAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 18:00:23 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF4340E46
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 14:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650405460; x=1681941460;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9g1f9i/IKgAeQcFZGXsYGFnATwi8l2I0JXIfOPLJPRc=;
  b=fZaiEXf7lEr9IUpz89Kwr6+QLtVt8k9fhT6z1GlNk2DgbEUC88k5+kay
   /BHAFZCQrMTODrbPOrPS70l6Va4r2dVXtXjrbz41ul1HSGEjrMGobN5c3
   M8FgfGakIQkf4zeTp2w8SOqwLKnv2ydovh2tIG+qGAelHL847Q8B6cf6j
   3oFDcGtsHeYZZraGKhv0R4X0f8kYxeh8/gaWOdNxx+P68+l9t9Ijq4cj9
   qQtPZNhK5s6f/h+uOGeVqw9pku/4NkwNg27FvkE8mDJL5mKdHcBxqOsXg
   ZhrlMBKM3fclpadFRkFqYdOMtDNGHuajl05YKqM8DMr+Xw95FWSYPzTYw
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="245773980"
X-IronPort-AV: E=Sophos;i="5.90,273,1643702400"; 
   d="scan'208";a="245773980"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2022 14:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,273,1643702400"; 
   d="scan'208";a="727232281"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Apr 2022 14:57:38 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ngvqr-0006Du-DV;
        Tue, 19 Apr 2022 21:57:37 +0000
Date:   Wed, 20 Apr 2022 05:57:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.19] BUILD SUCCESS
 aa70cbda745d5d2085f2847b875d0da3173a9032
Message-ID: <625f3045.KLTkrbjRZiGzDK4G%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.19
branch HEAD: aa70cbda745d5d2085f2847b875d0da3173a9032  ARM: dts: r9a06g032: Drop "arm,cortex-a7-timer" from timer node

elapsed time: 722m

configs tested: 119
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
ia64                         bigsur_defconfig
arm                             rpc_defconfig
powerpc                       eiger_defconfig
nios2                         10m50_defconfig
arm                          pxa910_defconfig
sh                               alldefconfig
xtensa                generic_kc705_defconfig
sh                        sh7785lcr_defconfig
sh                        edosk7705_defconfig
sh                           se7724_defconfig
ia64                        generic_defconfig
mips                       capcella_defconfig
powerpc                      pcm030_defconfig
ia64                             alldefconfig
powerpc                     redwood_defconfig
sh                           se7343_defconfig
mips                     decstation_defconfig
powerpc64                        alldefconfig
sh                           se7721_defconfig
m68k                        m5307c3_defconfig
h8300                               defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        stmark2_defconfig
arm                          badge4_defconfig
um                           x86_64_defconfig
sh                            titan_defconfig
csky                                defconfig
sh                             shx3_defconfig
sh                        sh7757lcr_defconfig
arm                        mvebu_v7_defconfig
arm                         axm55xx_defconfig
s390                          debug_defconfig
powerpc                       holly_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220419
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220419
arc                  randconfig-r043-20220419
s390                 randconfig-r044-20220419
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220419
arm                  randconfig-c002-20220419
i386                          randconfig-c001
riscv                randconfig-c006-20220419
mips                 randconfig-c004-20220419
s390                 randconfig-c005-20220419
powerpc                     tqm5200_defconfig
powerpc                     kilauea_defconfig
arm                           spitz_defconfig
powerpc                     taishan_defconfig
powerpc                         ps3_defconfig
mips                         tb0226_defconfig
powerpc                    klondike_defconfig
powerpc                      ppc64e_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
