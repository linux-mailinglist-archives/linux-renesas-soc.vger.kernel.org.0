Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3453D473773
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Dec 2021 23:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239112AbhLMW3A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Dec 2021 17:29:00 -0500
Received: from mga07.intel.com ([134.134.136.100]:45004 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243575AbhLMW3A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 17:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639434539; x=1670970539;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=f/e3/Xj7VgNzLzQCcmOCyqI+SFqrXxeXnRIZkIqbUMY=;
  b=Md4IVEqX5l8EL3U0n18GzZMKGYFxn92cXcUzYCMKXKECzh6e1ahqgv+s
   1mjAr4jiHRPk82crKsmO4lBAXjwhHs3ptEudzgrZj51VuaJ6SwnkeKZ18
   WZczLgEl/JvLq1I1sdT1G8A0aa0rSTh6uFeh65u2WG0bicrUGS7lKjHUT
   4RY1XHeI72fr4blcKPBPW77yj9HD26p0tln84Hd2emF1AYfo8J/Gm58ZZ
   nl0KIjiREsCkK43TRSQOWWkbArktBBWP078fmEOZab0W87+jpMuM3Xjzh
   075k229TTTPYMq76aPjrj+5BXJsDI41YV/k917HpvHJvMnvQhhqKPdgXB
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="302225911"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="302225911"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 14:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="464824890"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Dec 2021 14:28:58 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mwtoX-00077w-LX; Mon, 13 Dec 2021 22:28:57 +0000
Date:   Tue, 14 Dec 2021 06:28:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 2d93a61c003c8e6bbc9e44c5ffc3eb00242028ef
Message-ID: <61b7c90a.7oeaSTqCtud50FzC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 2d93a61c003c8e6bbc9e44c5ffc3eb00242028ef  Merge tag 'v5.16-rc5' into renesas-devel

elapsed time: 725m

configs tested: 103
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211213
powerpc                      ep88xc_defconfig
arm                           h3600_defconfig
sh                        edosk7760_defconfig
um                             i386_defconfig
sh                        sh7757lcr_defconfig
arc                        vdk_hs38_defconfig
xtensa                              defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         axm55xx_defconfig
arm                         lubbock_defconfig
sh                        apsh4ad0a_defconfig
arm                            dove_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                         tb0287_defconfig
arm                          pxa3xx_defconfig
powerpc                      pasemi_defconfig
sh                          r7780mp_defconfig
ia64                        generic_defconfig
sh                           sh2007_defconfig
arm                  randconfig-c002-20211213
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a011-20211213
x86_64               randconfig-a012-20211213
x86_64               randconfig-a014-20211213
x86_64               randconfig-a013-20211213
x86_64               randconfig-a016-20211213
x86_64               randconfig-a015-20211213
i386                 randconfig-a013-20211213
i386                 randconfig-a011-20211213
i386                 randconfig-a016-20211213
i386                 randconfig-a014-20211213
i386                 randconfig-a015-20211213
i386                 randconfig-a012-20211213
arc                  randconfig-r043-20211213
s390                 randconfig-r044-20211213
riscv                randconfig-r042-20211213
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func

clang tested configs:
x86_64               randconfig-c007-20211213
arm                  randconfig-c002-20211213
mips                 randconfig-c004-20211213
i386                 randconfig-c001-20211213
s390                 randconfig-c005-20211213
powerpc              randconfig-c003-20211213
riscv                randconfig-c006-20211213
i386                 randconfig-a001-20211213
i386                 randconfig-a002-20211213
i386                 randconfig-a003-20211213
i386                 randconfig-a004-20211213
i386                 randconfig-a005-20211213
i386                 randconfig-a006-20211213
hexagon              randconfig-r045-20211213
hexagon              randconfig-r041-20211213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
