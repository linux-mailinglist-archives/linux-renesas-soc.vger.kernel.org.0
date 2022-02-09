Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDE104AE611
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Feb 2022 01:34:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240095AbiBIAeY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 19:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbiBIAeY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 19:34:24 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26722C061576
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 16:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644366863; x=1675902863;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hWrMl6EXa0jhuiNKuWRhVl15m4ldFE6/mBGznwlTObk=;
  b=P00cNABiojX18DHqg07H7wBLoExF8RJJxk+O1D/6ZQxVLr5A6dNZSme9
   DcxjNGimiX9KPdCzxucnZfCYkoOqEbByInVG5ZdYtdHRZFJxOH1tCy3UB
   dN2z5G6j+mWu0cE6GjRBrRAZ1nDcKd3N8LkGS5nY8Cst2U+v6dcBQjKTN
   a7bHo/9g6PkSshqU5wMF3ZFJHMo/PSh3YxLf6zAH1rsp/vz3q8ruz7AYR
   P6V+hxj1UmFGne10+QEFZZKN8MVEgc7IjJnYVFBynMsj0PbTGO51b1ehu
   3gbR80azRgII/qpjTQwrvoEnhcFMmcd9OXR2ju/L0Ljo1i6Gc94ZgSXEY
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="232650567"
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; 
   d="scan'208";a="232650567"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 16:34:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; 
   d="scan'208";a="540855501"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Feb 2022 16:34:18 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nHaw6-000106-7m; Wed, 09 Feb 2022 00:34:18 +0000
Date:   Wed, 09 Feb 2022 08:33:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 3df1673d70a013549771c3120d2b248c12bf8a04
Message-ID: <62030bf4.CJFRo1bT/Jv2mqqJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 3df1673d70a013549771c3120d2b248c12bf8a04  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 731m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
i386                          randconfig-c001
sh                           se7750_defconfig
openrisc                         alldefconfig
sparc                       sparc64_defconfig
m68k                        m5272c3_defconfig
arc                          axs101_defconfig
m68k                        mvme147_defconfig
m68k                       m5249evb_defconfig
arm                        realview_defconfig
mips                        jmr3927_defconfig
sh                  sh7785lcr_32bit_defconfig
m68k                          sun3x_defconfig
arm                            zeus_defconfig
nios2                            alldefconfig
mips                     decstation_defconfig
powerpc                 mpc837x_mds_defconfig
arm                  randconfig-c002-20220208
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220208
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
mips                  cavium_octeon_defconfig
arm                            dove_defconfig
mips                        workpad_defconfig
arm                         s3c2410_defconfig
hexagon                             defconfig
powerpc                        icon_defconfig
mips                     cu1000-neo_defconfig
arm                         mv78xx0_defconfig
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220208
hexagon              randconfig-r041-20220208
riscv                randconfig-r042-20220208
s390                 randconfig-r044-20220208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
