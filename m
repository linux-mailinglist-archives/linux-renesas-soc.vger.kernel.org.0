Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32BB148CE20
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 22:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233979AbiALV6V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 16:58:21 -0500
Received: from mga05.intel.com ([192.55.52.43]:55005 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233999AbiALV6U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 16:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642024700; x=1673560700;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mDQwoCsLolMInoRa8sGSts0sXlqvpXjDPUD7OAe2nlk=;
  b=ERE1suR7Uczo9l1Kv1fiJ7T11F3OZyZOW463Ss8018NBKrxct1JoIK8L
   S9RR/+QRJQ43qIaEjOzv3Xn+LELUKKFlM6RtWUy8RQanSKma1pi3aHNuz
   a4bryhy5QAW3l1QPDKOowSQKT86VFcKxIx/s5ZPkDvi+3YJmSZ/r2foWf
   PgWkrnM+O38oUMLWKJceCnWFUB4+Bg7eVX46DaVVLRHhDtJClKNqrq/p8
   w3F3aRS2LEmkIKNsNtXnecQhakFlwMhFfnGSvNCnuxNMCJwXFPdbaRsIR
   1CPboxqU0mW+NtVQVN2dpN7AIx7Q56sg1lssfOTm/uSqpewG28XWz/ZMj
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="330210097"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="330210097"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 13:58:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="475072244"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jan 2022 13:58:18 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n7ldJ-0006Sc-Ml; Wed, 12 Jan 2022 21:58:17 +0000
Date:   Thu, 13 Jan 2022 05:57:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 3fbefb9570325500dbf3faff80ded6d0d46f48b2
Message-ID: <61df4ede.suKOx7elx/LdElRz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 3fbefb9570325500dbf3faff80ded6d0d46f48b2  [LOCAL] arm64: defconfig: Update renesas_defconfig

elapsed time: 1716m

configs tested: 107
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
arc                                 defconfig
s390                             allmodconfig
alpha                            alldefconfig
arm                          pxa910_defconfig
mips                     loongson1b_defconfig
riscv                    nommu_k210_defconfig
mips                    maltaup_xpa_defconfig
arm                            pleb_defconfig
powerpc                     rainier_defconfig
sh                            hp6xx_defconfig
sh                            shmin_defconfig
sh                   rts7751r2dplus_defconfig
sh                        sh7763rdp_defconfig
powerpc                       ppc64_defconfig
arm                  randconfig-c002-20220111
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220111
riscv                randconfig-r042-20220111
s390                 randconfig-r044-20220111
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220111
mips                 randconfig-c004-20220111
arm                  randconfig-c002-20220111
x86_64                        randconfig-c007
i386                          randconfig-c001
riscv                randconfig-c006-20220111
s390                 randconfig-c005-20220111
arm                      tct_hammer_defconfig
powerpc                       ebony_defconfig
arm                       cns3420vb_defconfig
arm                     davinci_all_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                 mpc836x_mds_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220111
hexagon              randconfig-r041-20220111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
