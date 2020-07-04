Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1665521423D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2020 02:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgGDAI5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Jul 2020 20:08:57 -0400
Received: from mga12.intel.com ([192.55.52.136]:36958 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726631AbgGDAI4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Jul 2020 20:08:56 -0400
IronPort-SDR: pI4bvj2k7ljpv9DqDNP22i8ZKagESeQmjuKUSgWeVZR/hsEhgqlz3y9Q8jsIugTgVKiN1scvTa
 DS8SmkjWgxfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9671"; a="126817789"
X-IronPort-AV: E=Sophos;i="5.75,309,1589266800"; 
   d="scan'208";a="126817789"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2020 17:08:56 -0700
IronPort-SDR: UTySDWtqmwLVTHqGuO1D+HgU4rk2ClBvDMzwNTVpLe7Z8G6pvrEINEI7Oi0V+SKDQ5TMaMA/fJ
 LeA8b2/Onwgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,309,1589266800"; 
   d="scan'208";a="313422819"
Received: from lkp-server01.sh.intel.com (HELO 6dc8ab148a5d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Jul 2020 17:08:54 -0700
Received: from kbuild by 6dc8ab148a5d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jrVji-0000Si-6w; Sat, 04 Jul 2020 00:08:54 +0000
Date:   Sat, 04 Jul 2020 08:08:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:next] BUILD SUCCESS
 a98d016e408ad2c329e16a60ec10c9d40e0252fb
Message-ID: <5effc864.QD2/u2aoY1qD8Ojn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  next
branch HEAD: a98d016e408ad2c329e16a60ec10c9d40e0252fb  Merge branch 'renesas-arm-defconfig-for-v5.9' into renesas-next

elapsed time: 724m

configs tested: 83
configs skipped: 96

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                       aspeed_g4_defconfig
m68k                       m5249evb_defconfig
arm                            mmp2_defconfig
sh                            shmin_defconfig
powerpc                      pmac32_defconfig
parisc                           allmodconfig
i386                              allnoconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a012-20200701
x86_64               randconfig-a016-20200701
x86_64               randconfig-a014-20200701
x86_64               randconfig-a011-20200701
x86_64               randconfig-a015-20200701
x86_64               randconfig-a013-20200701
i386                 randconfig-a011-20200701
i386                 randconfig-a015-20200701
i386                 randconfig-a014-20200701
i386                 randconfig-a016-20200701
i386                 randconfig-a012-20200701
i386                 randconfig-a013-20200701
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
