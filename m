Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35829390DEC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 May 2021 03:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhEZBbp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 May 2021 21:31:45 -0400
Received: from mga12.intel.com ([192.55.52.136]:13967 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231258AbhEZBbo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 May 2021 21:31:44 -0400
IronPort-SDR: cpk9XDYNVSTLtfErjHE3BXQxQkOvp+b/tXTJaYkYxJohX64IjJFXmZtKAlbQer7/e8TQI81Enc
 N6s8iflRcXbg==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="181991141"
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; 
   d="scan'208";a="181991141"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 18:30:12 -0700
IronPort-SDR: UrCT9Ss+jC68d2sDYGxPnDFlVWSuTJyH3v7/yyaDDsSOOiMpafThyjOYIgOSKp/atFZegoFJJQ
 hAfsnuUf9Ftw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; 
   d="scan'208";a="476692710"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 May 2021 18:30:11 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lliN9-0001vI-4W; Wed, 26 May 2021 01:30:11 +0000
Date:   Wed, 26 May 2021 09:29:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD SUCCESS
 cec9893933577f8920f4e2b35850b41841e0d969
Message-ID: <60ada48e.2Vpve/FkwiG2RkoV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: cec9893933577f8920f4e2b35850b41841e0d969  [LOCAL] arm64: defconfig: Update renesas_defconfig

elapsed time: 729m

configs tested: 96
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                generic_kc705_defconfig
powerpc                      ep88xc_defconfig
sh                               j2_defconfig
powerpc                 mpc834x_mds_defconfig
mips                       lemote2f_defconfig
sh                         ap325rxa_defconfig
mips                       bmips_be_defconfig
powerpc                       maple_defconfig
mips                        jmr3927_defconfig
arm                           viper_defconfig
powerpc                        icon_defconfig
powerpc                      pcm030_defconfig
xtensa                    xip_kc705_defconfig
parisc                           alldefconfig
m68k                          sun3x_defconfig
mips                   sb1250_swarm_defconfig
x86_64                            allnoconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210525
i386                 randconfig-a002-20210525
i386                 randconfig-a005-20210525
i386                 randconfig-a006-20210525
i386                 randconfig-a003-20210525
i386                 randconfig-a004-20210525
x86_64               randconfig-a013-20210525
x86_64               randconfig-a012-20210525
x86_64               randconfig-a014-20210525
x86_64               randconfig-a016-20210525
x86_64               randconfig-a015-20210525
x86_64               randconfig-a011-20210525
i386                 randconfig-a011-20210525
i386                 randconfig-a016-20210525
i386                 randconfig-a015-20210525
i386                 randconfig-a012-20210525
i386                 randconfig-a014-20210525
i386                 randconfig-a013-20210525
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210525
x86_64               randconfig-a005-20210525
x86_64               randconfig-a006-20210525
x86_64               randconfig-a001-20210525
x86_64               randconfig-a003-20210525
x86_64               randconfig-a004-20210525
x86_64               randconfig-a002-20210525

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
