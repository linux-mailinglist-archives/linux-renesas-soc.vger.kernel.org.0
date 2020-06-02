Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4445F1EC0BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2020 19:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgFBRJI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jun 2020 13:09:08 -0400
Received: from mga06.intel.com ([134.134.136.31]:8665 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726598AbgFBRJI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jun 2020 13:09:08 -0400
IronPort-SDR: sjfjWk/hqzrJ9kp53DNtxcD2RI8G8u1/7W6PyefJg30EJeRXScxKPT9foP0jTHWD4CIyJt4dLi
 Ab7fk9GHRKOQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2020 10:09:05 -0700
IronPort-SDR: 5yE0fwM8snQWhHtPmWBxWdqjeEGrsJqZ1U2OoBEDqQCxwcFuYO/Qariy/+CXmX0xjwLnaa+Gar
 xYi4b4lnIBpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,465,1583222400"; 
   d="scan'208";a="257693299"
Received: from lkp-server01.sh.intel.com (HELO e5a7ad696f24) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Jun 2020 10:09:04 -0700
Received: from kbuild by e5a7ad696f24 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jgAPP-00004Q-LC; Tue, 02 Jun 2020 17:09:03 +0000
Date:   Wed, 03 Jun 2020 01:08:53 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:clk-renesas] BUILD SUCCESS
 ed85137b57ea1063804880006f5bffd301beaec6
Message-ID: <5ed687a5.shPWV+0i0bXMDCtz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  clk-renesas
branch HEAD: ed85137b57ea1063804880006f5bffd301beaec6  dt-bindings: clock: renesas: cpg: Convert to json-schema

elapsed time: 480m

configs tested: 163
configs skipped: 10

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
arm                       imx_v4_v5_defconfig
parisc                            allnoconfig
arm                           h3600_defconfig
sh                        sh7763rdp_defconfig
powerpc                         ps3_defconfig
powerpc                 mpc8272_ads_defconfig
ia64                        generic_defconfig
mips                        qi_lb60_defconfig
m68k                       bvme6000_defconfig
sparc64                          allmodconfig
mips                malta_qemu_32r6_defconfig
arm                      footbridge_defconfig
sh                            shmin_defconfig
mips                     loongson1b_defconfig
ia64                              allnoconfig
sh                           se7619_defconfig
arm                            qcom_defconfig
sh                          kfr2r09_defconfig
sh                          r7780mp_defconfig
riscv                    nommu_virt_defconfig
sparc                       sparc32_defconfig
sh                ecovec24-romimage_defconfig
arm                           spitz_defconfig
mips                        vocore2_defconfig
mips                           ip28_defconfig
xtensa                generic_kc705_defconfig
arc                             nps_defconfig
arm                        keystone_defconfig
arm                        multi_v5_defconfig
arm                        shmobile_defconfig
mips                           xway_defconfig
arm                          ixp4xx_defconfig
sh                           se7780_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
arm                      pxa255-idp_defconfig
arm                     am200epdkit_defconfig
mips                      maltaaprp_defconfig
arm                     eseries_pxa_defconfig
sparc64                          alldefconfig
m68k                            mac_defconfig
alpha                            alldefconfig
mips                  maltasmvp_eva_defconfig
sh                        dreamcast_defconfig
sh                          lboxre2_defconfig
arm                           corgi_defconfig
arm                         bcm2835_defconfig
sh                         microdev_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            u300_defconfig
arm                          simpad_defconfig
arm                           efm32_defconfig
nios2                         3c120_defconfig
powerpc                      pasemi_defconfig
m68k                       m5208evb_defconfig
sh                         apsh4a3a_defconfig
arm                    vt8500_v6_v7_defconfig
arm                         hackkit_defconfig
mips                     cu1000-neo_defconfig
x86_64                              defconfig
mips                           ci20_defconfig
mips                           ip22_defconfig
sparc                               defconfig
arm                        realview_defconfig
arm                          badge4_defconfig
mips                         cobalt_defconfig
arm                         lpc18xx_defconfig
arm                              zx_defconfig
ia64                             alldefconfig
mips                        nlm_xlp_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
arc                              allyesconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200602
i386                 randconfig-a006-20200602
i386                 randconfig-a002-20200602
i386                 randconfig-a005-20200602
i386                 randconfig-a003-20200602
i386                 randconfig-a004-20200602
x86_64               randconfig-a011-20200602
x86_64               randconfig-a016-20200602
x86_64               randconfig-a013-20200602
x86_64               randconfig-a012-20200602
x86_64               randconfig-a014-20200602
x86_64               randconfig-a015-20200602
i386                 randconfig-a014-20200602
i386                 randconfig-a015-20200602
i386                 randconfig-a011-20200602
i386                 randconfig-a016-20200602
i386                 randconfig-a012-20200602
i386                 randconfig-a013-20200602
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
