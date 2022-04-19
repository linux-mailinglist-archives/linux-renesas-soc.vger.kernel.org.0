Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7339507C40
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Apr 2022 23:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235596AbiDSWAY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 18:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232898AbiDSWAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 18:00:23 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094DA40A35
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 14:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650405460; x=1681941460;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6bt5jW/1iCgW2qP6YNJBImWOmIWbXYyhe9Cdq26la5c=;
  b=axXVHGrkUAHGil10NgZC4qMj9m6I2jkHteh8UqTEeAn7mxnb/CKQMiGo
   SzwBCOA0eau7+XCzS5VQacyZjloYmc0jP39+V4BB2JlpMQn81JWjTw35P
   bWqc4RspsKoBc/kLo8bPwNyG+UdCKCU5MQea6+NzrrdV15Z1kQgnSQ1t6
   cNLIYcSLmRsvBHi1Xe2QW4L47UlEhR3w3oC+KvZVd7SOHv9A9MXOXi/WL
   KmhvuDJlbW/Xhpy6ennwJ2l3xRtQqj8AakW52Ppwh8cci28zQLeVp8gYm
   THcSS7ygccvuRzaTXybICu9McQ16Syu469yec/1HzMTZVF+evmLeUDRLW
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="244465168"
X-IronPort-AV: E=Sophos;i="5.90,273,1643702400"; 
   d="scan'208";a="244465168"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2022 14:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,273,1643702400"; 
   d="scan'208";a="592940394"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Apr 2022 14:57:38 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ngvqr-0006Dw-EK;
        Tue, 19 Apr 2022 21:57:37 +0000
Date:   Wed, 20 Apr 2022 05:57:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v5.19] BUILD SUCCESS
 ca3c550b6d00e1ea83ec6dd15bf3d5d07e53eeb6
Message-ID: <625f304c.jI/SogXYX0dkQT0+%lkp@intel.com>
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
branch HEAD: ca3c550b6d00e1ea83ec6dd15bf3d5d07e53eeb6  pinctrl: renesas: rzg2l: Restore pin config order

elapsed time: 724m

configs tested: 107
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc                       eiger_defconfig
nios2                         10m50_defconfig
arm                          pxa910_defconfig
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
csky                                defconfig
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
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a015
x86_64                        randconfig-a011
x86_64                        randconfig-a013
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
um                           x86_64_defconfig
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
powerpc                      ppc64e_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220419
hexagon              randconfig-r045-20220419

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
