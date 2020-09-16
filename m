Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4824326BC35
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 08:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgIPGJG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 02:09:06 -0400
Received: from mga18.intel.com ([134.134.136.126]:27363 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726132AbgIPGJD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 02:09:03 -0400
IronPort-SDR: sjAOPs8Iyp8mx350UdZikMkrLlcFz4pJkqArnUW8TeaySeNibp4T06NIrA72lWtV4zzgXL7ycf
 8qzczcQsVR0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="147158519"
X-IronPort-AV: E=Sophos;i="5.76,431,1592895600"; 
   d="scan'208";a="147158519"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2020 23:09:02 -0700
IronPort-SDR: z0EQ9LZLTZHMpbCEZaufw9HJ1R7W0Tdz+o8gLIOzGsfO0GLZMME+7hw62SBM16/XHo3RUI84JW
 LbwD6jwYCJ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,431,1592895600"; 
   d="scan'208";a="338950104"
Received: from lkp-server01.sh.intel.com (HELO 96654786cb26) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Sep 2020 23:09:00 -0700
Received: from kbuild by 96654786cb26 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kIQcm-0000Ta-2e; Wed, 16 Sep 2020 06:09:00 +0000
Date:   Wed, 16 Sep 2020 14:08:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:master] BUILD SUCCESS
 097e92b662b468b97a995cde68be1b94a9cb8299
Message-ID: <5f61abe7.pZowjC9rvSzvgiGi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  master
branch HEAD: 097e92b662b468b97a995cde68be1b94a9cb8299  [LOCAL] arm64: defconfig: Update renesas_defconfig

elapsed time: 928m

configs tested: 86
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      walnut_defconfig
powerpc                     ppa8548_defconfig
mips                        bcm63xx_defconfig
arm                             pxa_defconfig
arm                             mxs_defconfig
arc                         haps_hs_defconfig
mips                           rs90_defconfig
ia64                      gensparse_defconfig
openrisc                 simple_smp_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm5200_defconfig
arm                        spear6xx_defconfig
mips                           jazz_defconfig
powerpc                     rainier_defconfig
powerpc                      ppc64e_defconfig
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
x86_64               randconfig-a006-20200916
x86_64               randconfig-a004-20200916
x86_64               randconfig-a003-20200916
x86_64               randconfig-a002-20200916
x86_64               randconfig-a001-20200916
x86_64               randconfig-a005-20200916
i386                 randconfig-a004-20200916
i386                 randconfig-a006-20200916
i386                 randconfig-a003-20200916
i386                 randconfig-a001-20200916
i386                 randconfig-a002-20200916
i386                 randconfig-a005-20200916
i386                 randconfig-a015-20200916
i386                 randconfig-a014-20200916
i386                 randconfig-a011-20200916
i386                 randconfig-a013-20200916
i386                 randconfig-a016-20200916
i386                 randconfig-a012-20200916
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20200916
x86_64               randconfig-a011-20200916
x86_64               randconfig-a016-20200916
x86_64               randconfig-a012-20200916
x86_64               randconfig-a015-20200916
x86_64               randconfig-a013-20200916

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
