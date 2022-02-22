Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03C514C04AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Feb 2022 23:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236063AbiBVWfe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Feb 2022 17:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235145AbiBVWfe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 17:35:34 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFA310CF1C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 14:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645569307; x=1677105307;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QSztP6ohUCgfbWhMRFqDxzx8LyYG0RIj6X3M8alfU/8=;
  b=FmjLJlIjr/wW+cxyQSIJnEDOJWQxnfCqkeJHFWjrWx+cr7rgw//xPMci
   x7tEBNmyUaJPcrLsSfEJmlZWPyyUBLDOTtLtOaJn+cGqczCuA+gl5W39v
   LsW2QQrKEwSRSSVtUIPRz2Zg9KAybkGe12iNHZiqOw2JTqF0hYz8AgV+d
   MQhx1OOqGqYcqFcIpXUM9Q5xE1YNvIKuvj9dV0fyeNUrQUC2CPK6S1ihd
   4UuP/hnfwt/+kp6gFSXUkoixO+tlxBGIpygU4oOLd6JlWU5bA2mjdvj/Z
   XQowG73RLYSrzUSodTDDOUm7Kdzg1duXnCKlZxhjVyRX+XYFmuqtUftHA
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="312544977"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; 
   d="scan'208";a="312544977"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 14:35:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; 
   d="scan'208";a="508181606"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Feb 2022 14:35:06 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMdkP-0000gr-Am; Tue, 22 Feb 2022 22:35:05 +0000
Date:   Wed, 23 Feb 2022 06:34:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v5.18] BUILD SUCCESS
 73421f2a48e6bd1d1024a09aedbc9c662cb88e77
Message-ID: <621564e5.VtDshJ1nCyHmhr+1%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.18
branch HEAD: 73421f2a48e6bd1d1024a09aedbc9c662cb88e77  clk: renesas: r8a779f0: Add PFC clock

elapsed time: 733m

configs tested: 162
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220221
arm                         lubbock_defconfig
sh                           se7619_defconfig
sh                      rts7751r2d1_defconfig
arm                             pxa_defconfig
m68k                        m5407c3_defconfig
powerpc                      pasemi_defconfig
sh                          r7780mp_defconfig
arm                        oxnas_v6_defconfig
xtensa                         virt_defconfig
ia64                          tiger_defconfig
arm                          iop32x_defconfig
sh                             shx3_defconfig
sh                 kfr2r09-romimage_defconfig
m68k                        mvme147_defconfig
powerpc                       maple_defconfig
arm                       omap2plus_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                            q40_defconfig
alpha                            alldefconfig
sh                           se7724_defconfig
powerpc                     sequoia_defconfig
mips                       bmips_be_defconfig
m68k                       m5208evb_defconfig
s390                             allmodconfig
powerpc                         ps3_defconfig
m68k                        m5307c3_defconfig
mips                         db1xxx_defconfig
sparc                               defconfig
arm                          pxa910_defconfig
m68k                       m5475evb_defconfig
m68k                       m5275evb_defconfig
arm                         assabet_defconfig
arm                          pxa3xx_defconfig
powerpc                        warp_defconfig
sh                           sh2007_defconfig
arc                     haps_hs_smp_defconfig
arm                           stm32_defconfig
m68k                       m5249evb_defconfig
sparc                            alldefconfig
mips                           ip32_defconfig
ia64                            zx1_defconfig
mips                        jmr3927_defconfig
powerpc                     redwood_defconfig
powerpc                      makalu_defconfig
s390                       zfcpdump_defconfig
powerpc                    sam440ep_defconfig
ia64                             allyesconfig
sh                         ecovec24_defconfig
m68k                             alldefconfig
powerpc                      ppc6xx_defconfig
mips                            gpr_defconfig
sh                          rsk7203_defconfig
mips                         bigsur_defconfig
arm                          badge4_defconfig
arm                       multi_v4t_defconfig
m68k                             allyesconfig
arm                  randconfig-c002-20220221
ia64                                defconfig
ia64                             allmodconfig
m68k                                defconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
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
i386                 randconfig-a006-20220221
i386                 randconfig-a002-20220221
i386                 randconfig-a001-20220221
i386                 randconfig-a005-20220221
i386                 randconfig-a003-20220221
i386                 randconfig-a004-20220221
arc                  randconfig-r043-20220221
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func

clang tested configs:
powerpc              randconfig-c003-20220221
x86_64               randconfig-c007-20220221
arm                  randconfig-c002-20220221
mips                 randconfig-c004-20220221
i386                 randconfig-c001-20220221
riscv                randconfig-c006-20220221
powerpc                      katmai_defconfig
arm                          imote2_defconfig
mips                          ath79_defconfig
mips                       lemote2f_defconfig
mips                malta_qemu_32r6_defconfig
arm                           omap1_defconfig
arm                      pxa255-idp_defconfig
powerpc                     kmeter1_defconfig
arm                        spear3xx_defconfig
arm                        neponset_defconfig
arm                  colibri_pxa300_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                      ppc44x_defconfig
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
i386                 randconfig-a011-20220221
i386                 randconfig-a013-20220221
i386                 randconfig-a012-20220221
i386                 randconfig-a016-20220221
i386                 randconfig-a015-20220221
i386                 randconfig-a014-20220221
hexagon              randconfig-r045-20220221
hexagon              randconfig-r041-20220221
riscv                randconfig-r042-20220221
s390                 randconfig-r044-20220221

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
