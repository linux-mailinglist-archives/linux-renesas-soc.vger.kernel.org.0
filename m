Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6882217E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jul 2020 00:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgGOWml (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 18:42:41 -0400
Received: from mga12.intel.com ([192.55.52.136]:15663 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726356AbgGOWml (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 18:42:41 -0400
IronPort-SDR: EpkOBiFVA0kRJLcdZ9H9/3dLLfv7l5e+5TfKdkXQZJdrRJVAVJwcw93Z2176ZkU2YI/i1t9Tmn
 l194n2Ueie8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="128850600"
X-IronPort-AV: E=Sophos;i="5.75,357,1589266800"; 
   d="scan'208";a="128850600"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2020 15:42:40 -0700
IronPort-SDR: o3KJSgox7Z6KHXwlwfNVJBJaF6IGaGHOk6fRcRZyfEOkHzmEAeuBUNCQ7U2C/quabbx5soEVhY
 X4SSD1mpuvJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,357,1589266800"; 
   d="scan'208";a="390922492"
Received: from lkp-server01.sh.intel.com (HELO e5b4d2dd85a6) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Jul 2020 15:42:39 -0700
Received: from kbuild by e5b4d2dd85a6 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jvq6o-00009t-Gx; Wed, 15 Jul 2020 22:42:38 +0000
Date:   Thu, 16 Jul 2020 06:41:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 828a89976a61ec3375fc9c117573c3c371ea766a
Message-ID: <5f0f8634.lpuIxRfKMp2KZP49%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: 828a89976a61ec3375fc9c117573c3c371ea766a  Merge branch 'renesas-next' into renesas-devel

elapsed time: 2301m

configs tested: 84
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
powerpc                     pq2fads_defconfig
powerpc                 linkstation_defconfig
arm                           h3600_defconfig
sh                            titan_defconfig
csky                                defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
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
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
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
mips                              allnoconfig
mips                             allyesconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
i386                 randconfig-a001-20200715
i386                 randconfig-a005-20200715
i386                 randconfig-a002-20200715
i386                 randconfig-a006-20200715
i386                 randconfig-a003-20200715
i386                 randconfig-a004-20200715
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                             allnoconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc64                             defconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
sparc                               defconfig
sparc64                           allnoconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
