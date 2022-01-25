Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD0E49AB0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 05:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S3420109AbiAYELN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 23:11:13 -0500
Received: from mga05.intel.com ([192.55.52.43]:15188 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S3420125AbiAYCWr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 21:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643077367; x=1674613367;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZHtswv+OcGLSwbeURYn6qb+X7tFNySx0nYcHP7OivQI=;
  b=ZcIcBQfd0wUvSo91VjKLgof7f3yybRgh5bP+jQmpb4JSiJ0fd7FLzPaV
   C1IPG9RN+wHD9bWDzRALwuhrFBTYKp3m9fQiMgkp8+ETQi1lz+FNExgQ4
   EFCocJDFWlbTJymGRQntVKYqrqtudol9CySKPXNdmjQ4R+wHXeNPxndzm
   wRYiaMsZZoSPghdoTpj6v25fKSwElWHx5osi6b9zH4fbg89D6uVtkK368
   vHS7IWj5YwNnddO7Y4QxnckUwwCmhdIlExwm9mLLOXgJdIYwpQu4oFPCa
   hEsuTI3efx+ISbQLk6LIDEH9Dq0/Oalnq0R8vh/uMEo8vj0H1L2Qfp8fk
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="332546152"
X-IronPort-AV: E=Sophos;i="5.88,313,1635231600"; 
   d="scan'208";a="332546152"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 17:29:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,313,1635231600"; 
   d="scan'208";a="580588296"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jan 2022 17:29:18 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nCAe5-000JBJ-Ks; Tue, 25 Jan 2022 01:29:17 +0000
Date:   Tue, 25 Jan 2022 09:28:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.18] BUILD SUCCESS
 86db90921943867aefc827ff92745101a698df32
Message-ID: <61ef5235.DA9/XIsu2PkOmRaj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.18
branch HEAD: 86db90921943867aefc827ff92745101a698df32  arm64: dts: renesas: Add initial device tree for RZ/V2L SMARC EVK

elapsed time: 734m

configs tested: 142
configs skipped: 87

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220124
m68k                          hp300_defconfig
m68k                        mvme16x_defconfig
sh                   sh7770_generic_defconfig
arc                           tb10x_defconfig
sh                           se7722_defconfig
mips                     decstation_defconfig
sparc                       sparc64_defconfig
powerpc                      ppc6xx_defconfig
mips                            gpr_defconfig
arm                         s3c6400_defconfig
mips                        jmr3927_defconfig
powerpc                        warp_defconfig
sh                         ecovec24_defconfig
sh                          polaris_defconfig
um                                  defconfig
sh                           se7206_defconfig
ia64                          tiger_defconfig
arc                            hsdk_defconfig
arm                       multi_v4t_defconfig
arm                        trizeps4_defconfig
h8300                            allyesconfig
arm                        mvebu_v7_defconfig
arm                           viper_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                            migor_defconfig
sh                           se7705_defconfig
sh                          rsk7201_defconfig
nds32                            alldefconfig
sh                          sdk7786_defconfig
arm                            mps2_defconfig
mips                        vocore2_defconfig
arm                            lart_defconfig
arm                            pleb_defconfig
sparc64                          alldefconfig
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
x86_64               randconfig-a001-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
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
mips                  cavium_octeon_defconfig
mips                        omega2p_defconfig
powerpc                    mvme5100_defconfig
arm                         lpc32xx_defconfig
riscv                          rv32_defconfig
mips                        bcm63xx_defconfig
powerpc                          g5_defconfig
arm                          imote2_defconfig
mips                           mtx1_defconfig
powerpc                   lite5200b_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                     tqm5200_defconfig
mips                       lemote2f_defconfig
powerpc                        icon_defconfig
arm                     davinci_all_defconfig
mips                     cu1000-neo_defconfig
powerpc                      ppc44x_defconfig
arm                              alldefconfig
arm                         hackkit_defconfig
mips                     loongson2k_defconfig
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
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220124
hexagon              randconfig-r041-20220124

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
