Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E14624C0A2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Feb 2022 04:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbiBWDXm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Feb 2022 22:23:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233789AbiBWDXm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 22:23:42 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55C3522EC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 19:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645586595; x=1677122595;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gafoppO7m/Os5dNQDtHHdgewrmr+xowZjKrFV4p6Huo=;
  b=TEo/wxM1ynuuqezVZMzqBJRS7GEDZatIaoZGbvx/WC6WecZo6YvVwl9Y
   jN4zgc+CvsxMpKDQeypf3YcLh6wUbKc6vOK4NozbcqIEkk/KE68chNT64
   F6F0jKx83oWkVZv7vMoA1pGPzIWjHF4deRL+F4TOYg/B0kHxKyh7D4iof
   YzXYgy52XuyTo3Wov83T9aiHxxt2Hpjxebstm/vaYAksvALOmEF+3VEXZ
   6zXYCkKMiihyARRi3dLXo0u6DBJZqDP6p8AlTxvJGxBbqVvjZww1T2pqS
   LNLJr26sgHwm9/LJCfT4GCoIEflgxsjDWg6hg5h0Zjh9f2DW7Lt7hW2Iu
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="250699644"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="250699644"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 19:23:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="532506549"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Feb 2022 19:23:13 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMiFF-0000vi-5v; Wed, 23 Feb 2022 03:23:13 +0000
Date:   Wed, 23 Feb 2022 11:22:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/r8a779f0-pfc-v2] BUILD SUCCESS
 0ca250410980f0106cbf7e57190659c8e69de7ad
Message-ID: <6215a863.fY3fqR3uta5fejUQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/r8a779f0-pfc-v2
branch HEAD: 0ca250410980f0106cbf7e57190659c8e69de7ad  arm64: dts: renesas: spider: Complete SCIF3 description

elapsed time: 751m

configs tested: 165
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220221
sh                      rts7751r2d1_defconfig
arm                             pxa_defconfig
m68k                        m5407c3_defconfig
mips                            ar7_defconfig
sh                             espt_defconfig
sh                   sh7770_generic_defconfig
powerpc                      pasemi_defconfig
sh                          r7780mp_defconfig
arm                        oxnas_v6_defconfig
powerpc                       maple_defconfig
arm                       omap2plus_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                            q40_defconfig
powerpc                     sequoia_defconfig
powerpc                     pq2fads_defconfig
ia64                         bigsur_defconfig
h8300                    h8300h-sim_defconfig
powerpc                         ps3_defconfig
m68k                        m5307c3_defconfig
mips                         db1xxx_defconfig
sparc                               defconfig
arm                          pxa910_defconfig
m68k                       m5475evb_defconfig
m68k                       m5275evb_defconfig
arm                         assabet_defconfig
arm                          gemini_defconfig
arm                       imx_v6_v7_defconfig
powerpc                       ppc64_defconfig
ia64                            zx1_defconfig
arm                        multi_v7_defconfig
arc                     haps_hs_smp_defconfig
arm                           stm32_defconfig
m68k                       m5249evb_defconfig
sparc                            alldefconfig
mips                           ip32_defconfig
um                                  defconfig
arm                           sunxi_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     redwood_defconfig
powerpc                      makalu_defconfig
alpha                               defconfig
m68k                             alldefconfig
powerpc                      ppc6xx_defconfig
mips                            gpr_defconfig
sh                          rsk7203_defconfig
mips                         bigsur_defconfig
arm                          badge4_defconfig
arm                       multi_v4t_defconfig
m68k                             allyesconfig
m68k                       bvme6000_defconfig
powerpc                   currituck_defconfig
mips                           ci20_defconfig
arm                  randconfig-c002-20220221
arm                  randconfig-c002-20220222
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
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a003-20220221
x86_64               randconfig-a002-20220221
x86_64               randconfig-a005-20220221
x86_64               randconfig-a006-20220221
x86_64               randconfig-a001-20220221
x86_64               randconfig-a004-20220221
i386                 randconfig-a002-20220221
i386                 randconfig-a001-20220221
i386                 randconfig-a005-20220221
i386                 randconfig-a003-20220221
i386                 randconfig-a006-20220221
i386                 randconfig-a004-20220221
arc                  randconfig-r043-20220221
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220222
x86_64                        randconfig-c007
arm                  randconfig-c002-20220222
mips                 randconfig-c004-20220222
i386                          randconfig-c001
riscv                randconfig-c006-20220222
powerpc              randconfig-c003-20220221
x86_64               randconfig-c007-20220221
arm                  randconfig-c002-20220221
mips                 randconfig-c004-20220221
i386                 randconfig-c001-20220221
riscv                randconfig-c006-20220221
powerpc                      katmai_defconfig
arm                          imote2_defconfig
powerpc                  mpc866_ads_defconfig
arm                            dove_defconfig
mips                          ath25_defconfig
mips                          ath79_defconfig
mips                       lemote2f_defconfig
mips                malta_qemu_32r6_defconfig
arm                           omap1_defconfig
arm                      pxa255-idp_defconfig
powerpc                     mpc5200_defconfig
mips                           ip27_defconfig
arm64                            allyesconfig
powerpc                     tqm8540_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a011-20220221
x86_64               randconfig-a015-20220221
x86_64               randconfig-a014-20220221
x86_64               randconfig-a016-20220221
x86_64               randconfig-a013-20220221
x86_64               randconfig-a012-20220221
i386                 randconfig-a016-20220221
i386                 randconfig-a012-20220221
i386                 randconfig-a015-20220221
i386                 randconfig-a011-20220221
i386                 randconfig-a014-20220221
i386                 randconfig-a013-20220221
hexagon              randconfig-r045-20220221
hexagon              randconfig-r041-20220221
riscv                randconfig-r042-20220221
hexagon              randconfig-r045-20220222
hexagon              randconfig-r041-20220222

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
