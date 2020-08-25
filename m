Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1BF25246B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Aug 2020 01:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgHYXpv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Aug 2020 19:45:51 -0400
Received: from mga02.intel.com ([134.134.136.20]:10008 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726698AbgHYXpt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Aug 2020 19:45:49 -0400
IronPort-SDR: Ux+GsNbKtlDllstV0lfAWWDDNijcKe453ZLeuo6fJ1jQgKlf6Q/nUmn75iZfgShl0P5e1+hxQy
 tBQNMoCTpKcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="143985287"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; 
   d="scan'208";a="143985287"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2020 16:45:46 -0700
IronPort-SDR: Recp+H8TTVn9G6/PuKf4HHGPbAe/daeTg4VMdQTlQUXKULq96xDAgmMGiKaLxZZJ0O9L1HXfWD
 3+WCw9zkrApQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; 
   d="scan'208";a="280140784"
Received: from lkp-server01.sh.intel.com (HELO 4f455964fc6c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Aug 2020 16:45:45 -0700
Received: from kbuild by 4f455964fc6c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kAidM-00019N-JI; Tue, 25 Aug 2020 23:45:44 +0000
Date:   Wed, 26 Aug 2020 07:45:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:renesas-arm-defconfig-for-v5.10] BUILD SUCCESS
 ddc0e61a2e3e2cb3c8cf428ead1ddbfdc443b4e2
Message-ID: <5f45a282.BKMuujNDwkEh/rtz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  renesas-arm-defconfig-for-v5.10
branch HEAD: ddc0e61a2e3e2cb3c8cf428ead1ddbfdc443b4e2  arm64: defconfig: Enable RPC-IF support

elapsed time: 725m

configs tested: 82
configs skipped: 67

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
arc                        vdk_hs38_defconfig
sh                 kfr2r09-romimage_defconfig
sh                               j2_defconfig
arm                        mvebu_v5_defconfig
arm                          imote2_defconfig
arm                        realview_defconfig
mips                       capcella_defconfig
arm                          ep93xx_defconfig
arm                         assabet_defconfig
openrisc                    or1ksim_defconfig
powerpc                      ppc64e_defconfig
arc                           tb10x_defconfig
arm                        vexpress_defconfig
mips                        bcm63xx_defconfig
arc                              alldefconfig
xtensa                          iss_defconfig
powerpc                     mpc83xx_defconfig
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
i386                 randconfig-a002-20200826
i386                 randconfig-a004-20200826
i386                 randconfig-a003-20200826
i386                 randconfig-a005-20200826
i386                 randconfig-a006-20200826
i386                 randconfig-a001-20200826
x86_64               randconfig-a015-20200826
x86_64               randconfig-a016-20200826
x86_64               randconfig-a012-20200826
x86_64               randconfig-a014-20200826
x86_64               randconfig-a011-20200826
x86_64               randconfig-a013-20200826
i386                 randconfig-a013-20200826
i386                 randconfig-a012-20200826
i386                 randconfig-a011-20200826
i386                 randconfig-a016-20200826
i386                 randconfig-a015-20200826
i386                 randconfig-a014-20200826
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
