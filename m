Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE1B4A7AB5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 23:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347743AbiBBWCc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 17:02:32 -0500
Received: from mga12.intel.com ([192.55.52.136]:38750 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347729AbiBBWCb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 17:02:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643839351; x=1675375351;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gnw7AJa18GG9it1c61cCQ16Y3F83kLQdzf6XIK4iOOA=;
  b=j7jQMo46X7HNYI1pw3uOxucpwTKNrwLDdtt2dXQFZx2nZ/tl6PTh4D+W
   q/GW4REp/Q2k6ZUu2jUCtQqzc0J6pNQNj0xHMu8FryJPMgCqdkdCsY24k
   0tHPCpRbaTuB0yLwR+hWFU3TeSWnNhBkQ+PiIqnSO1nWmTcGSZodO+vM3
   8WhE7+OfpDHz9CrKCP86/Ppb72ZSKZ1SblclhqH25NhUhS0JhPzrqEyuu
   Kyhenf6XVGW6IY9jx1MyH0RCc2YP8hXO+DeLYl9XVM2TEK+loFZmVC/uQ
   fIcvv0ty5SFiilGjE/U+Qj5YXMyrZ8coUVUd3/t0iGUkK9VU82CpkSLW1
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="227997842"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="227997842"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 14:02:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="620305416"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2022 14:02:29 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nFNhs-000VBX-BL; Wed, 02 Feb 2022 22:02:28 +0000
Date:   Thu, 03 Feb 2022 06:02:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-r9a07g054-dt-binding-defs] BUILD
 SUCCESS 4decd2e54b61686787f36b727d2772e067a46ea5
Message-ID: <61faff63.tjzew72fy+hOlcVg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-r9a07g054-dt-binding-defs
branch HEAD: 4decd2e54b61686787f36b727d2772e067a46ea5  dt-bindings: clock: Add R9A07G054 CPG Clock and Reset Definitions

elapsed time: 724m

configs tested: 177
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
powerpc              randconfig-c003-20220131
i386                          randconfig-c001
nios2                         3c120_defconfig
nios2                         10m50_defconfig
arc                         haps_hs_defconfig
sh                           sh2007_defconfig
powerpc                     stx_gp3_defconfig
s390                       zfcpdump_defconfig
sh                           se7206_defconfig
powerpc                     redwood_defconfig
h8300                            alldefconfig
mips                  maltasmvp_eva_defconfig
m68k                          sun3x_defconfig
arm                          iop32x_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
powerpc                      ppc40x_defconfig
mips                      maltasmvp_defconfig
powerpc                 mpc85xx_cds_defconfig
arc                              alldefconfig
powerpc                         ps3_defconfig
arm                          gemini_defconfig
sh                   sh7724_generic_defconfig
mips                           ci20_defconfig
powerpc                    amigaone_defconfig
powerpc                      ppc6xx_defconfig
arm                        mvebu_v7_defconfig
arc                     nsimosci_hs_defconfig
arm                        trizeps4_defconfig
sh                               alldefconfig
parisc                generic-32bit_defconfig
arc                           tb10x_defconfig
powerpc                mpc7448_hpc2_defconfig
arc                        nsimosci_defconfig
arc                        vdk_hs38_defconfig
arc                      axs103_smp_defconfig
sh                           se7619_defconfig
s390                             allmodconfig
sh                               j2_defconfig
m68k                       bvme6000_defconfig
m68k                             allyesconfig
ia64                                defconfig
sh                        apsh4ad0a_defconfig
sh                        dreamcast_defconfig
arm                      jornada720_defconfig
m68k                        mvme147_defconfig
sh                           se7343_defconfig
mips                           ip32_defconfig
sh                            migor_defconfig
arm                        multi_v7_defconfig
powerpc                      tqm8xx_defconfig
arm                     eseries_pxa_defconfig
um                             i386_defconfig
ia64                      gensparse_defconfig
s390                          debug_defconfig
microblaze                          defconfig
sh                                  defconfig
powerpc                     asp8347_defconfig
sh                          rsk7203_defconfig
sh                        edosk7760_defconfig
sh                           se7721_defconfig
nios2                               defconfig
h8300                     edosk2674_defconfig
arm                         axm55xx_defconfig
sh                             espt_defconfig
m68k                           sun3_defconfig
mips                           gcw0_defconfig
powerpc                     taishan_defconfig
sh                     sh7710voipgw_defconfig
powerpc                     tqm8541_defconfig
m68k                       m5208evb_defconfig
powerpc                   currituck_defconfig
arm                  randconfig-c002-20220130
arm                  randconfig-c002-20220131
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
nds32                             allnoconfig
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
s390                                defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
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
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220130
arc                  randconfig-r043-20220130
s390                 randconfig-r044-20220130
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220130
x86_64                        randconfig-c007
arm                  randconfig-c002-20220130
powerpc              randconfig-c003-20220130
mips                 randconfig-c004-20220130
i386                          randconfig-c001
powerpc                     ppa8548_defconfig
arm                       versatile_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      maltaaprp_defconfig
powerpc                      katmai_defconfig
powerpc                     kilauea_defconfig
arm                              alldefconfig
powerpc                 mpc836x_rdk_defconfig
arm                         shannon_defconfig
powerpc                        icon_defconfig
arm                       cns3420vb_defconfig
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
