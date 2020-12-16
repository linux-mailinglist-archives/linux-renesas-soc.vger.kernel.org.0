Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D237C2DB96F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 03:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgLPCvp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 21:51:45 -0500
Received: from mga12.intel.com ([192.55.52.136]:45095 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725766AbgLPCvo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 21:51:44 -0500
IronPort-SDR: I9fV9pCFEJN2abIqC3jVlmZiJA0RMz1BJmTF+2iW5sLlfbsTMPgFImTICSVf3HElU+/X7P8HRS
 PNkLOWhO36aw==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="154223530"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; 
   d="scan'208";a="154223530"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 18:51:01 -0800
IronPort-SDR: tezMaR17FV8IwWXMOZWjETOnDDAVQnxwyicLILkVI2VJI35X7IS6+CNZrVDM/Fm6M/DEzeBv/M
 K8apNK/fE/jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; 
   d="scan'208";a="412256411"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Dec 2020 18:50:59 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kpMu3-00018I-0G; Wed, 16 Dec 2020 02:50:59 +0000
Date:   Wed, 16 Dec 2020 10:50:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD SUCCESS
 5d09f155647784bfa900177d13c92ee0c70890d5
Message-ID: <5fd975e5.aVOFhu9eZ5Moncrw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  master
branch HEAD: 5d09f155647784bfa900177d13c92ee0c70890d5  [LOCAL] arm64: defconfig: Update renesas_defconfig

elapsed time: 721m

configs tested: 111
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                                  defconfig
ia64                        generic_defconfig
arm                             ezx_defconfig
mips                   sb1250_swarm_defconfig
arm                           efm32_defconfig
powerpc                  mpc885_ads_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                           tb10x_defconfig
powerpc                     ksi8560_defconfig
h8300                       h8s-sim_defconfig
powerpc                     powernv_defconfig
arm                         assabet_defconfig
ia64                      gensparse_defconfig
openrisc                 simple_smp_defconfig
powerpc                 mpc836x_mds_defconfig
xtensa                    xip_kc705_defconfig
sh                           se7724_defconfig
arm                            lart_defconfig
um                             i386_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7722_defconfig
mips                     loongson1c_defconfig
m68k                       bvme6000_defconfig
arm                       versatile_defconfig
arm                          pxa910_defconfig
powerpc                     pq2fads_defconfig
powerpc                     tqm5200_defconfig
sh                        sh7763rdp_defconfig
arm                          collie_defconfig
m68k                                defconfig
arm                      jornada720_defconfig
mips                           gcw0_defconfig
m68k                             alldefconfig
mips                      malta_kvm_defconfig
arm                              zx_defconfig
mips                         cobalt_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
i386                 randconfig-a001-20201215
i386                 randconfig-a004-20201215
i386                 randconfig-a003-20201215
i386                 randconfig-a002-20201215
i386                 randconfig-a006-20201215
i386                 randconfig-a005-20201215
i386                 randconfig-a014-20201215
i386                 randconfig-a013-20201215
i386                 randconfig-a012-20201215
i386                 randconfig-a011-20201215
i386                 randconfig-a015-20201215
i386                 randconfig-a016-20201215
x86_64               randconfig-a003-20201215
x86_64               randconfig-a006-20201215
x86_64               randconfig-a002-20201215
x86_64               randconfig-a005-20201215
x86_64               randconfig-a004-20201215
x86_64               randconfig-a001-20201215
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
x86_64               randconfig-a016-20201215
x86_64               randconfig-a012-20201215
x86_64               randconfig-a013-20201215
x86_64               randconfig-a015-20201215
x86_64               randconfig-a014-20201215
x86_64               randconfig-a011-20201215

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
