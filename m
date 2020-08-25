Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A26825246C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Aug 2020 01:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgHYXpv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Aug 2020 19:45:51 -0400
Received: from mga17.intel.com ([192.55.52.151]:51460 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726581AbgHYXps (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Aug 2020 19:45:48 -0400
IronPort-SDR: ZqSICYcn3mpJzcTN4pgoX/lF3YTqb+Sg7ndbyp2wKSRQ6LvmD7O6GFIEobU6avZxBNQtJDr6Ti
 VJosE6Dp2oNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="136274778"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; 
   d="scan'208";a="136274778"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2020 16:45:46 -0700
IronPort-SDR: Wae3RW2eEC/L2/JcAHZ+CqzqUIGeOooZH55NkSHpmgPhfiMKXxPeZD3Xv7Y95bWibYJIV4gbfj
 ZkELyA5ELoXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; 
   d="scan'208";a="312718166"
Received: from lkp-server01.sh.intel.com (HELO 4f455964fc6c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Aug 2020 16:45:45 -0700
Received: from kbuild by 4f455964fc6c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kAidM-00019Q-Jt; Tue, 25 Aug 2020 23:45:44 +0000
Date:   Wed, 26 Aug 2020 07:45:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 4fd4d7a0a12a6d8f522c82ea46c205b96c685515
Message-ID: <5f45a28a.g0ENAGaV1pAF8hRV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  topic/renesas-defconfig
branch HEAD: 4fd4d7a0a12a6d8f522c82ea46c205b96c685515  arm64: renesas: defconfig: Refresh for v5.9-rc1

elapsed time: 725m

configs tested: 76
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      ppc64e_defconfig
arc                           tb10x_defconfig
arm                        vexpress_defconfig
mips                        bcm63xx_defconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200825
i386                 randconfig-a004-20200825
i386                 randconfig-a005-20200825
i386                 randconfig-a003-20200825
i386                 randconfig-a006-20200825
i386                 randconfig-a001-20200825
i386                 randconfig-a013-20200826
i386                 randconfig-a012-20200826
i386                 randconfig-a011-20200826
i386                 randconfig-a016-20200826
i386                 randconfig-a015-20200826
i386                 randconfig-a014-20200826
i386                 randconfig-a013-20200825
i386                 randconfig-a012-20200825
i386                 randconfig-a011-20200825
i386                 randconfig-a016-20200825
i386                 randconfig-a015-20200825
i386                 randconfig-a014-20200825
x86_64               randconfig-a003-20200825
x86_64               randconfig-a002-20200825
x86_64               randconfig-a001-20200825
x86_64               randconfig-a005-20200825
x86_64               randconfig-a006-20200825
x86_64               randconfig-a004-20200825
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
