Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E764632A632
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Mar 2021 17:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240469AbhCBOKj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Mar 2021 09:10:39 -0500
Received: from mga07.intel.com ([134.134.136.100]:55578 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346519AbhCAXsy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 18:48:54 -0500
IronPort-SDR: iMmmAXaK1CuTDLif9NwOAjGaNB8Ru4E6RtGsb3rS5S1QVJyVr+ZOgphiuZbZwlP7zOVZtsHOLV
 epkDB77GTa1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="250680908"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="250680908"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 15:48:13 -0800
IronPort-SDR: 6EuuAb/u3xs2/ObFjqjVBlyOuCiERW6JiSLh0akGa/X+VgQXAJ0p8AR304n5MOVxuFTDcmyvUR
 npioisYHOnvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; 
   d="scan'208";a="427133020"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Mar 2021 15:48:11 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lGsGp-0004od-6s; Mon, 01 Mar 2021 23:48:11 +0000
Date:   Tue, 02 Mar 2021 07:47:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-drivers-for-v5.13] BUILD SUCCESS
 fb13bbd6c90ee4fb983c0e9a341bd2832a3857cf
Message-ID: <603d7d15.dQyPmuz5IOA/nv85%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v5.13
branch HEAD: fb13bbd6c90ee4fb983c0e9a341bd2832a3857cf  soc: renesas: rmobile-sysc: Mark fwnode when PM domain is added

elapsed time: 721m

configs tested: 95
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm                          moxart_defconfig
m68k                            q40_defconfig
powerpc                      katmai_defconfig
alpha                               defconfig
ia64                             alldefconfig
powerpc                      makalu_defconfig
powerpc                      chrp32_defconfig
i386                             allyesconfig
mips                        jmr3927_defconfig
arc                        nsim_700_defconfig
arm                         nhk8815_defconfig
arm                            zeus_defconfig
mips                     cu1830-neo_defconfig
sh                          rsk7269_defconfig
mips                         mpc30x_defconfig
arm                       versatile_defconfig
sparc                               defconfig
sparc64                             defconfig
sh                        apsh4ad0a_defconfig
powerpc                 canyonlands_defconfig
sh                     sh7710voipgw_defconfig
mips                 decstation_r4k_defconfig
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
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20210228
i386                 randconfig-a005-20210228
i386                 randconfig-a004-20210228
i386                 randconfig-a003-20210228
i386                 randconfig-a001-20210228
i386                 randconfig-a002-20210228
x86_64               randconfig-a013-20210301
x86_64               randconfig-a016-20210301
x86_64               randconfig-a015-20210301
x86_64               randconfig-a014-20210301
x86_64               randconfig-a012-20210301
x86_64               randconfig-a011-20210301
i386                 randconfig-a016-20210301
i386                 randconfig-a012-20210301
i386                 randconfig-a014-20210301
i386                 randconfig-a013-20210301
i386                 randconfig-a011-20210301
i386                 randconfig-a015-20210301
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210301
x86_64               randconfig-a001-20210301
x86_64               randconfig-a004-20210301
x86_64               randconfig-a002-20210301
x86_64               randconfig-a005-20210301
x86_64               randconfig-a003-20210301

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
