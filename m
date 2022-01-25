Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF6B49BE5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 23:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233695AbiAYWTx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 17:19:53 -0500
Received: from mga12.intel.com ([192.55.52.136]:9488 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233698AbiAYWT1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 17:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643149167; x=1674685167;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=koWwSmE6fL1aV+hgW5l1LtrG7yaavlsCjFQvK4v9CX0=;
  b=c/VqtPgd8TzKNnXLWvw3OpemmE13TFuLyfqts9rZlxtwpxAB/0dypTu8
   TdM0hRX0jCdSDph4DDfieQ9LqBS3mHggNtypXYZTs6F02gsAP4nCwtA0J
   jzD+fg3SaeoJRH7Ts3QWtjBl6nQD3y/Rd6em3/Rlbc/w9JNswT2XI9A2X
   n0ArUzpV18kyGMDSIjaj6QDCXCcOIpkF2CKVN+Qw9T5vboCXGbCOsFsJ4
   HFJvwTEAMlXWVkdDeDXdHQBuyCKIRXJsJxYBuioxllI+EkEv6pZj9l39c
   lfwhwT6PRQBTddyHY5ndHHuyhuwHysS3NXPwONFM1r9qslkxpCd1Mkj1v
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="226405319"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="226405319"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 14:19:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="563208967"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Jan 2022 14:19:24 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nCU9r-000KV8-Dj; Tue, 25 Jan 2022 22:19:23 +0000
Date:   Wed, 26 Jan 2022 06:18:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.18] BUILD SUCCESS
 72a2cab3a10bbfcc9cccc763834acded015d9282
Message-ID: <61f07741.nn0hIqeP56Sxt8Af%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.18
branch HEAD: 72a2cab3a10bbfcc9cccc763834acded015d9282  arm64: dts: renesas: ulcb-kf: Add KF HDMI output

elapsed time: 727m

configs tested: 130
configs skipped: 104

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220124
sh                           se7206_defconfig
powerpc                     redwood_defconfig
arm                        spear6xx_defconfig
powerpc                mpc7448_hpc2_defconfig
openrisc                  or1klitex_defconfig
arc                         haps_hs_defconfig
sh                        apsh4ad0a_defconfig
arm                        trizeps4_defconfig
sh                           se7780_defconfig
alpha                            alldefconfig
xtensa                          iss_defconfig
sh                           se7619_defconfig
sh                         apsh4a3a_defconfig
um                               alldefconfig
sh                           se7721_defconfig
sh                          r7780mp_defconfig
sh                             shx3_defconfig
mips                  maltasmvp_eva_defconfig
mips                            ar7_defconfig
arm                       aspeed_g5_defconfig
arm                  randconfig-c002-20220124
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
x86_64               randconfig-a001-20220124
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
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
arm                  randconfig-c002-20220124
riscv                randconfig-c006-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
powerpc                      katmai_defconfig
arm                           omap1_defconfig
powerpc                      ppc64e_defconfig
arm                        vexpress_defconfig
arm                          pxa168_defconfig
mips                     cu1000-neo_defconfig
powerpc                    socrates_defconfig
arm                         orion5x_defconfig
mips                  cavium_octeon_defconfig
mips                        omega2p_defconfig
powerpc                    mvme5100_defconfig
arm                         lpc32xx_defconfig
riscv                          rv32_defconfig
powerpc                     skiroot_defconfig
powerpc                        icon_defconfig
arm                     davinci_all_defconfig
powerpc                      ppc44x_defconfig
arm                              alldefconfig
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220124
hexagon              randconfig-r041-20220124
hexagon              randconfig-r045-20220125
hexagon              randconfig-r041-20220125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
