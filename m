Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F834783B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 04:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbhLQDhi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 22:37:38 -0500
Received: from mga05.intel.com ([192.55.52.43]:43648 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230206AbhLQDhh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 22:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639712257; x=1671248257;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3ZYebQGlrxJWHptuoikWfRd3jUVlLOcErnaRUYQhokQ=;
  b=K2NWUOY+0oVmc3KqO8NquU+5miNf3lQWuI/P8htsKzGM9nVQnRBaXvSL
   F/mXCiEeFotoJSPDTOkxXdoiMeNbxS59g+GUmuLJcnI93qdkAGcteyR8o
   8D6dGG39xuqbCLU3iahKjKtrJBjzsWp8mQRn468/rSGxFvpTWiDYUuqE5
   T42mvLIzHv4jcxYFQp1etYf4/fJAmApAA2aUeoODjv1YS02AzprFkb5vW
   m8Iz+d37YyQFQZA/+uj6EFGsE5YEhguHZXGPAKeLDclPzYPgkixTVFPGI
   3zy7ibyEzGOLzKhok1qhLRlT6z1u7XiEQTev/TuvT8cO7r7Bsl6WKnTAq
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="325956306"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="325956306"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 19:37:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="615419991"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Dec 2021 19:37:35 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1my43r-0004BQ-8N; Fri, 17 Dec 2021 03:37:35 +0000
Date:   Fri, 17 Dec 2021 11:37:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 a155038f641134b0272d26f75d1ab4a805013e48
Message-ID: <61bc05ed.EUcl+15uymEjQEoc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: a155038f641134b0272d26f75d1ab4a805013e48  Merge branch 'renesas-arm-dt-for-v5.17' into renesas-next

elapsed time: 733m

configs tested: 133
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211216
m68k                       m5475evb_defconfig
sh                           se7712_defconfig
arm                         lubbock_defconfig
arm                        magician_defconfig
arm                         s3c2410_defconfig
ia64                            zx1_defconfig
arm                      tct_hammer_defconfig
powerpc                      katmai_defconfig
sh                            migor_defconfig
sh                           se7724_defconfig
m68k                       m5208evb_defconfig
sparc                               defconfig
mips                        vocore2_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                            pleb_defconfig
mips                         mpc30x_defconfig
powerpc                   currituck_defconfig
mips                     loongson1b_defconfig
m68k                          atari_defconfig
h8300                    h8300h-sim_defconfig
sh                        dreamcast_defconfig
arm                           sunxi_defconfig
nds32                             allnoconfig
sh                           se7722_defconfig
mips                           mtx1_defconfig
csky                                defconfig
arm                        mvebu_v7_defconfig
sparc                       sparc32_defconfig
powerpc                 mpc836x_mds_defconfig
arm                           sama5_defconfig
riscv                            alldefconfig
mips                malta_qemu_32r6_defconfig
arm                          ixp4xx_defconfig
arm                        oxnas_v6_defconfig
arm                       omap2plus_defconfig
arm                           u8500_defconfig
m68k                         amcore_defconfig
arm                      integrator_defconfig
arm                         at91_dt_defconfig
sh                        sh7763rdp_defconfig
powerpc                      bamboo_defconfig
powerpc                      ppc64e_defconfig
xtensa                  audio_kc705_defconfig
arm                         lpc32xx_defconfig
s390                       zfcpdump_defconfig
arm                       imx_v4_v5_defconfig
arm                        mvebu_v5_defconfig
sparc64                             defconfig
mips                           ip32_defconfig
mips                            e55_defconfig
arm                     davinci_all_defconfig
powerpc                       ebony_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                        edosk7705_defconfig
powerpc                    adder875_defconfig
parisc                generic-32bit_defconfig
arm                  randconfig-c002-20211216
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211216
x86_64               randconfig-a005-20211216
x86_64               randconfig-a001-20211216
x86_64               randconfig-a002-20211216
x86_64               randconfig-a003-20211216
x86_64               randconfig-a004-20211216
i386                 randconfig-a001-20211216
i386                 randconfig-a002-20211216
i386                 randconfig-a005-20211216
i386                 randconfig-a003-20211216
i386                 randconfig-a006-20211216
i386                 randconfig-a004-20211216
i386                 randconfig-a013-20211217
i386                 randconfig-a011-20211217
i386                 randconfig-a016-20211217
i386                 randconfig-a014-20211217
i386                 randconfig-a015-20211217
i386                 randconfig-a012-20211217
arc                  randconfig-r043-20211216
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
hexagon              randconfig-r045-20211216
s390                 randconfig-r044-20211216
riscv                randconfig-r042-20211216
hexagon              randconfig-r041-20211216

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
