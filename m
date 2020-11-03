Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC542A3B6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Nov 2020 05:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgKCEaO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Nov 2020 23:30:14 -0500
Received: from mga05.intel.com ([192.55.52.43]:41586 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725940AbgKCEaO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 23:30:14 -0500
IronPort-SDR: SM6BDagzWOxeNxE5btgNOhwPKHJvaXCvo6xwjgb1Y9Ej40HPNWd/fmFHUTLykwCQBk3dZSsLvd
 O1ABhUACj36w==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="253706055"
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; 
   d="scan'208";a="253706055"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 20:30:13 -0800
IronPort-SDR: C9b/wbV8C7LiYhA/vDXmG7m6YsPPqwxr+mGOJlK0JR9+4ELNmFGjhE5BGVzltXmvuqmupNFbHn
 gSKGUvrblXjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; 
   d="scan'208";a="526924930"
Received: from lkp-server02.sh.intel.com (HELO e61783667810) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2020 20:30:12 -0800
Received: from kbuild by e61783667810 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kZnxT-00001o-Ti; Tue, 03 Nov 2020 04:30:11 +0000
Date:   Tue, 03 Nov 2020 12:30:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 751ce311462f180b24e6340de4e65e771e67dddc
Message-ID: <5fa0dcca.nFGmhv64CQlgMZun%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 751ce311462f180b24e6340de4e65e771e67dddc  Merge branch 'renesas-next', tag 'v5.10-rc2' into renesas-devel

elapsed time: 725m

configs tested: 97
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7269_defconfig
arm                      tct_hammer_defconfig
arm                            xcep_defconfig
sh                   rts7751r2dplus_defconfig
mips                      maltasmvp_defconfig
arm                         axm55xx_defconfig
parisc                           alldefconfig
powerpc                    socrates_defconfig
powerpc                 mpc834x_mds_defconfig
sh                           se7750_defconfig
sh                          sdk7780_defconfig
powerpc                       eiger_defconfig
m68k                          multi_defconfig
nios2                            alldefconfig
c6x                        evmc6472_defconfig
sh                            migor_defconfig
powerpc                     tqm5200_defconfig
powerpc                   lite5200b_defconfig
m68k                        mvme147_defconfig
arm                          pxa3xx_defconfig
mips                      fuloong2e_defconfig
arm                       cns3420vb_defconfig
arm                  colibri_pxa270_defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201102
i386                 randconfig-a006-20201102
i386                 randconfig-a005-20201102
i386                 randconfig-a001-20201102
i386                 randconfig-a002-20201102
i386                 randconfig-a003-20201102
x86_64               randconfig-a012-20201102
x86_64               randconfig-a015-20201102
x86_64               randconfig-a011-20201102
x86_64               randconfig-a013-20201102
x86_64               randconfig-a014-20201102
x86_64               randconfig-a016-20201102
i386                 randconfig-a013-20201102
i386                 randconfig-a015-20201102
i386                 randconfig-a014-20201102
i386                 randconfig-a016-20201102
i386                 randconfig-a011-20201102
i386                 randconfig-a012-20201102
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201102
x86_64               randconfig-a005-20201102
x86_64               randconfig-a003-20201102
x86_64               randconfig-a002-20201102
x86_64               randconfig-a006-20201102
x86_64               randconfig-a001-20201102

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
