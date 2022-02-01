Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C79FE4A554A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 03:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbiBACji (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jan 2022 21:39:38 -0500
Received: from mga05.intel.com ([192.55.52.43]:33597 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232321AbiBACjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jan 2022 21:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643683177; x=1675219177;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YI+yKHKE9Bov3irIAMUlfWx7VkLY51k0+JSbUGDW+jU=;
  b=I7wkem1KQjrIf81BLJwHoxfQ0ascE+ulcnJm/+VzjNjP1vN5iFkCHj0E
   2pqcg5OddgakrsaNTNZ/cLAkca1E8oni5ChuuRBqSB8GKy/FTu1lGIjYG
   sZdoocoyNtQ+gXRRG7RvExppY0ICYboxayyvzxqSvuh12Y/eA/OjKBJmO
   kvuUGLSg6JBRkUufgT7klUw4mtOlSigII8AcY8c4MDSvgdii842u+yP7E
   yZC7UdO8KJiO6NVorlbGOuBaqYtNPGLxfx0QXQwe++R9L11834EH7Y+/+
   AlWK9Pzdz1hTo7Gj62kRHx1l21IKSOlFMd/IYZ7YnTjUjeWDCeTgQjMia
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="333965034"
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; 
   d="scan'208";a="333965034"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 18:39:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; 
   d="scan'208";a="582885630"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Jan 2022 18:39:07 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nEj4V-000Sdh-31; Tue, 01 Feb 2022 02:39:07 +0000
Date:   Tue, 01 Feb 2022 10:38:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 3aa8ba88974022cbe2386cf2cd1b93d7244301b5
Message-ID: <61f89d25.4t/tNaw4thg9ZGPn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 3aa8ba88974022cbe2386cf2cd1b93d7244301b5  Merge tag 'v5.17-rc2' into renesas-devel

elapsed time: 727m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220131
xtensa                       common_defconfig
sh                        dreamcast_defconfig
sh                          rsk7203_defconfig
m68k                       m5475evb_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                        sh7763rdp_defconfig
mips                         mpc30x_defconfig
sh                 kfr2r09-romimage_defconfig
sh                               alldefconfig
arm                          pxa910_defconfig
arm                          lpd270_defconfig
m68k                       m5208evb_defconfig
mips                 decstation_r4k_defconfig
powerpc                        warp_defconfig
arm                        oxnas_v6_defconfig
sh                          rsk7269_defconfig
powerpc                    klondike_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc837x_rdb_defconfig
xtensa                           allyesconfig
arc                    vdk_hs38_smp_defconfig
powerpc                 mpc837x_mds_defconfig
h8300                     edosk2674_defconfig
powerpc                      pasemi_defconfig
powerpc                  storcenter_defconfig
sh                           se7206_defconfig
arm                           stm32_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     asp8347_defconfig
arm                      footbridge_defconfig
mips                        vocore2_defconfig
powerpc                     redwood_defconfig
sh                            hp6xx_defconfig
arc                                 defconfig
m68k                          sun3x_defconfig
mips                      maltasmvp_defconfig
arm                       omap2plus_defconfig
mips                       capcella_defconfig
sh                        apsh4ad0a_defconfig
arm                            mps2_defconfig
arm                  randconfig-c002-20220131
arm                  randconfig-c002-20220130
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
sh                               allmodconfig
h8300                            allyesconfig
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
x86_64               randconfig-a004-20220131
x86_64               randconfig-a003-20220131
x86_64               randconfig-a001-20220131
x86_64               randconfig-a006-20220131
x86_64               randconfig-a005-20220131
x86_64               randconfig-a002-20220131
i386                 randconfig-a006-20220131
i386                 randconfig-a005-20220131
i386                 randconfig-a003-20220131
i386                 randconfig-a002-20220131
i386                 randconfig-a001-20220131
i386                 randconfig-a004-20220131
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
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc                          allyesconfig
arm                        spear3xx_defconfig
arm                             mxs_defconfig
arm                       versatile_defconfig
powerpc                      pmac32_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a011-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220131
hexagon              randconfig-r045-20220130
hexagon              randconfig-r041-20220130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
