Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1032202AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 05:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbgGODAZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jul 2020 23:00:25 -0400
Received: from mga18.intel.com ([134.134.136.126]:30746 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727772AbgGODAY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jul 2020 23:00:24 -0400
IronPort-SDR: 1/X4lgnL6fRWcKsRATuo9Rt3aeLWF2pz9P29/ZOAsBfcwk3Deqt/0moiF9grpR4qvEdYg1kAYd
 snmrEF+JW0LQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="136527281"
X-IronPort-AV: E=Sophos;i="5.75,353,1589266800"; 
   d="scan'208";a="136527281"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2020 20:00:23 -0700
IronPort-SDR: zNyF3oTkmftpNmbhyyOqRaznKwNI+SyAg6ZCN0aEziYq5bSVYYoTTeTJ2cb4dFF/crg5XYThZJ
 GrsmYhcLHNQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,353,1589266800"; 
   d="scan'208";a="429974163"
Received: from lkp-server01.sh.intel.com (HELO e1edd1aee32c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Jul 2020 20:00:22 -0700
Received: from kbuild by e1edd1aee32c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jvXef-00001f-QC; Wed, 15 Jul 2020 03:00:21 +0000
Date:   Wed, 15 Jul 2020 11:00:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:sh-pfc] BUILD SUCCESS
 a5e8b53adeb4b458971dfd6232b71299010e981a
Message-ID: <5f0e7141.B0nVIEqS1LuAcWSy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  sh-pfc
branch HEAD: a5e8b53adeb4b458971dfd6232b71299010e981a  pinctrl: sh-pfc: pfc-r8a77951: Add R8A774E1 PFC support

elapsed time: 723m

configs tested: 129
configs skipped: 7

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
sh                           se7724_defconfig
sh                          sdk7786_defconfig
arm                          tango4_defconfig
sh                            migor_defconfig
i386                             allyesconfig
arm                         s3c6400_defconfig
m68k                         amcore_defconfig
c6x                               allnoconfig
xtensa                generic_kc705_defconfig
mips                           ip27_defconfig
mips                  mips_paravirt_defconfig
c6x                        evmc6474_defconfig
powerpc                      pasemi_defconfig
sh                        dreamcast_defconfig
openrisc                         alldefconfig
m68k                        m5407c3_defconfig
arm                          ep93xx_defconfig
arm                          moxart_defconfig
sparc                               defconfig
mips                        maltaup_defconfig
mips                          rb532_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                        nlm_xlp_defconfig
arm                             pxa_defconfig
m68k                        m5307c3_defconfig
m68k                          amiga_defconfig
sh                 kfr2r09-romimage_defconfig
openrisc                            defconfig
xtensa                          iss_defconfig
arm                  colibri_pxa270_defconfig
ia64                      gensparse_defconfig
arm                        clps711x_defconfig
sh                          landisk_defconfig
arm                         assabet_defconfig
mips                 decstation_r4k_defconfig
i386                              allnoconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
c6x                              allyesconfig
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
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200714
i386                 randconfig-a005-20200714
i386                 randconfig-a002-20200714
i386                 randconfig-a006-20200714
i386                 randconfig-a003-20200714
i386                 randconfig-a004-20200714
x86_64               randconfig-a012-20200714
x86_64               randconfig-a011-20200714
x86_64               randconfig-a016-20200714
x86_64               randconfig-a014-20200714
x86_64               randconfig-a013-20200714
x86_64               randconfig-a015-20200714
i386                 randconfig-a016-20200714
i386                 randconfig-a011-20200714
i386                 randconfig-a015-20200714
i386                 randconfig-a012-20200714
i386                 randconfig-a013-20200714
i386                 randconfig-a014-20200714
x86_64               randconfig-a005-20200715
x86_64               randconfig-a006-20200715
x86_64               randconfig-a002-20200715
x86_64               randconfig-a001-20200715
x86_64               randconfig-a003-20200715
x86_64               randconfig-a004-20200715
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
sparc64                          allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
