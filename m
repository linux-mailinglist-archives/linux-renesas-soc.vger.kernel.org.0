Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 604135BC116
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 03:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbiISBo6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 18 Sep 2022 21:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiISBo5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Sep 2022 21:44:57 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9CCC6597
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 18:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663551896; x=1695087896;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q81V172jWmCN4Cq1Uw4o1HDyMY4QWOKbKGZCs5pToKU=;
  b=hsWg8N5yz5k8+UyZ8/bp0jnuswi5TyQ7TyGW+GnU0nM6i+do7Yh0QwIa
   tZuusVzCttho18DgWN/keslmMcNnvtJM/PVUM7AoDIAZ34rOdV8BCQY9+
   Q1K1hDE6+jDZbCj/tkySLPTNXyzJ35nnnXFfcdIr6I/JmIhAOB7IvkoPi
   nzt3fQf2aqRmF+TCnTJQKrA0Y6F1RnEdCCnq+gjThs/hWA63wTrcem/lm
   0/QHGEYdyK/Uc+vyjRk/xToM3mgpzKVOKKVhYXNaRms+3dlL988J3hKAL
   mKugEg/SnwbEBcoTNwYBBkAW/7GSwVbtvaLsrL9tZ2TOrnmSVssekkazf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="279014160"
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="279014160"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2022 18:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="618303923"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Sep 2022 18:44:55 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oa5qA-0001cb-1e;
        Mon, 19 Sep 2022 01:44:54 +0000
Date:   Mon, 19 Sep 2022 09:44:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 e46a1a9943c0e84f439b971d6ce03f87e3d67441
Message-ID: <6327c984./nKNQOFMqTFKE7mS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: e46a1a9943c0e84f439b971d6ce03f87e3d67441  clk: renesas: r8a779g0: Add EtherAVB clocks

elapsed time: 722m

configs tested: 106
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                               defconfig
x86_64                              defconfig
arc                                 defconfig
arm                                 defconfig
i386                                defconfig
arm64                            allyesconfig
powerpc                           allnoconfig
s390                             allmodconfig
x86_64                           rhel-8.3-syz
arm                              allyesconfig
x86_64                        randconfig-a013
i386                          randconfig-a005
um                           x86_64_defconfig
x86_64                        randconfig-a002
x86_64                               rhel-8.3
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                           allyesconfig
sh                               allmodconfig
um                             i386_defconfig
s390                                defconfig
x86_64                        randconfig-a006
m68k                             allyesconfig
arc                  randconfig-r043-20220918
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a003
x86_64                         rhel-8.3-kunit
i386                          randconfig-a001
x86_64                          rhel-8.3-func
i386                          randconfig-a014
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
i386                          randconfig-a012
i386                             allyesconfig
m68k                             allmodconfig
s390                             allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
arc                              allyesconfig
mips                             allyesconfig
ia64                             allmodconfig
m68k                         amcore_defconfig
mips                           ci20_defconfig
csky                              allnoconfig
nios2                            allyesconfig
i386                          randconfig-c001
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
loongarch                           defconfig
loongarch                         allnoconfig
arm                            hisi_defconfig
sh                           se7724_defconfig
m68k                          atari_defconfig
m68k                       m5275evb_defconfig
sh                         microdev_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220918
arm                        mvebu_v7_defconfig
sh                   rts7751r2dplus_defconfig
mips                           xway_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
arm64                               defconfig
ia64                             allyesconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig

clang tested configs:
riscv                randconfig-r042-20220918
s390                 randconfig-r044-20220918
i386                          randconfig-a004
x86_64                        randconfig-a005
i386                          randconfig-a006
hexagon              randconfig-r041-20220918
x86_64                        randconfig-a012
i386                          randconfig-a002
hexagon              randconfig-r045-20220918
x86_64                        randconfig-a001
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a011
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a015
arm                      tct_hammer_defconfig
powerpc                     ksi8560_defconfig
x86_64                        randconfig-k001
mips                          malta_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
