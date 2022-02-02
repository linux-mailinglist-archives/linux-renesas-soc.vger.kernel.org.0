Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4BC4A7ABA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 23:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347757AbiBBWDb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 17:03:31 -0500
Received: from mga18.intel.com ([134.134.136.126]:26221 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241586AbiBBWDa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 17:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643839410; x=1675375410;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a2d0WiKEdj8+2oDkjYVgiaDA+4X7+VwERNfAsZsZReo=;
  b=QVnBv6sJh1MAHWIOdxHtEfKIHcqKlrrBkixB20yR6YZvLckNLhfZgBl/
   jAyxwWff3a6NaVOyyb8JPCzEMuIVeYqC8bjbdySMOO6eZkUgnQxrief2k
   Or/s2SMsARvfv63v4VOVLRU6Rn/ikB+SWvqkbB0fS5wFoHwPkweFHJk3w
   YfEtrZo1uTkEpB/BxfVB7KGHnX7GjC8riI5MUM7F7VQPPRKIX6rmD9XgC
   Psk5JOgBeuubjBdzS9ULbPly5wfeEyb16W7ZIaAk/7hAYJM4heA1ROPs3
   bWNp8NGIFCv1VTDj+oqjDy/yREqkjUSL+kUdVowKs0GL3M9Pg0aMCRgXu
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="231595148"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="231595148"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 14:03:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="497923105"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Feb 2022 14:03:29 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nFNiq-000VBt-Es; Wed, 02 Feb 2022 22:03:28 +0000
Date:   Thu, 03 Feb 2022 06:02:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 c48c8f3ef757dc425358adbb73941c19708a7926
Message-ID: <61faff77.0X96oy40fITN0iT1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: c48c8f3ef757dc425358adbb73941c19708a7926  arm64: renesas: defconfig: Refresh for v5.16-rc1

elapsed time: 722m

configs tested: 145
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
arm                            zeus_defconfig
sh                   sh7770_generic_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                          rsk7269_defconfig
mips                  maltasmvp_eva_defconfig
m68k                          sun3x_defconfig
arm                          iop32x_defconfig
arc                              alldefconfig
powerpc                    amigaone_defconfig
powerpc                      ppc6xx_defconfig
arm                        mvebu_v7_defconfig
arc                     nsimosci_hs_defconfig
arm                        trizeps4_defconfig
sh                        apsh4ad0a_defconfig
sh                        dreamcast_defconfig
arm                      jornada720_defconfig
ia64                                defconfig
s390                       zfcpdump_defconfig
h8300                       h8s-sim_defconfig
powerpc                      pcm030_defconfig
parisc                generic-64bit_defconfig
m68k                        mvme147_defconfig
sh                           se7343_defconfig
mips                           ip32_defconfig
sh                            migor_defconfig
arm                        multi_v7_defconfig
arm                     eseries_pxa_defconfig
ia64                      gensparse_defconfig
powerpc                      tqm8xx_defconfig
powerpc                mpc7448_hpc2_defconfig
um                             i386_defconfig
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
m68k                       m5208evb_defconfig
arc                           tb10x_defconfig
powerpc                   currituck_defconfig
powerpc                     tqm8541_defconfig
arm                  randconfig-c002-20220130
arm                  randconfig-c002-20220131
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
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
riscv                randconfig-r042-20220130
arc                  randconfig-r043-20220130
s390                 randconfig-r044-20220130
arc                  randconfig-r043-20220131
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc                      ppc64e_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      maltaaprp_defconfig
arm                     am200epdkit_defconfig
mips                      malta_kvm_defconfig
mips                          ath25_defconfig
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
s390                 randconfig-r044-20220131

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
