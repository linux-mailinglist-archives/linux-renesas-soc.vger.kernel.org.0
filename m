Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8F12FAD16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jan 2021 23:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733307AbhARWI5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jan 2021 17:08:57 -0500
Received: from mga18.intel.com ([134.134.136.126]:11487 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387473AbhARWIz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jan 2021 17:08:55 -0500
IronPort-SDR: WGjvZlRwvyTvdUXBdg4sPDSMGfoQYMhu7qAI+USz6EmGjx/cvkIlpRwxbT/4z52oIIz6s73l/U
 1SRyjO3Ts1Nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="166519661"
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="166519661"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 14:08:12 -0800
IronPort-SDR: GSd/glKlFcK9JJ1Tb7WUD8B6kDR469gUxzJpfPOuiLvIQX89jmsrozyI6kLq2gzhKvKuH9oaEM
 WWok6exVFVQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="406325315"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2021 14:08:11 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l1ch0-0004Ta-U6; Mon, 18 Jan 2021 22:08:10 +0000
Date:   Tue, 19 Jan 2021 06:07:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 822f1d4bfbf25ac7008eb9779c43ea99d5aa8f40
Message-ID: <600606a6.x+1nM5owkdUe5C5g%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 822f1d4bfbf25ac7008eb9779c43ea99d5aa8f40  Merge branch 'renesas-next', tag 'v5.11-rc4' into renesas-devel

elapsed time: 723m

configs tested: 98
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                        sh7763rdp_defconfig
powerpc                   lite5200b_defconfig
powerpc                     asp8347_defconfig
arm                        keystone_defconfig
mips                            gpr_defconfig
sh                         ecovec24_defconfig
c6x                        evmc6457_defconfig
c6x                                 defconfig
sh                         microdev_defconfig
powerpc                      ppc6xx_defconfig
xtensa                          iss_defconfig
mips                  decstation_64_defconfig
powerpc                 mpc834x_itx_defconfig
arm                           h3600_defconfig
mips                        jmr3927_defconfig
arc                           tb10x_defconfig
powerpc                   motionpro_defconfig
arm                         at91_dt_defconfig
arm                            hisi_defconfig
mips                       bmips_be_defconfig
powerpc                 linkstation_defconfig
m68k                          atari_defconfig
arm                           omap1_defconfig
mips                        bcm63xx_defconfig
powerpc                    sam440ep_defconfig
powerpc                    socrates_defconfig
arm                           u8500_defconfig
arm                         palmz72_defconfig
powerpc64                        alldefconfig
arm                         shannon_defconfig
arm                            zeus_defconfig
openrisc                  or1klitex_defconfig
m68k                         amcore_defconfig
powerpc                       holly_defconfig
m68k                       m5275evb_defconfig
mips                        workpad_defconfig
powerpc                    amigaone_defconfig
sh                         apsh4a3a_defconfig
mips                           ip32_defconfig
microblaze                      mmu_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210118
x86_64               randconfig-a004-20210118
x86_64               randconfig-a001-20210118
x86_64               randconfig-a003-20210118
x86_64               randconfig-a005-20210118
x86_64               randconfig-a002-20210118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
