Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D6623F4E7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Aug 2020 00:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgHGWeU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 18:34:20 -0400
Received: from mga03.intel.com ([134.134.136.65]:13424 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgHGWeU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 18:34:20 -0400
IronPort-SDR: LxK9kgbFsIjpg/7RkJXp+YWVdw0DGWaxPYJfoQBKUGE5cE8aCtiKTA24etd2/GvvkNUD/MUzyn
 ACjjikRD6XcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9706"; a="153177007"
X-IronPort-AV: E=Sophos;i="5.75,447,1589266800"; 
   d="scan'208";a="153177007"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2020 15:34:19 -0700
IronPort-SDR: iYxVpG8nTKMEo07kYb7D/P420btcnxeOCJ63C2xFy014NVdT1+7o70pbuWYFOAYX3hXa+cOQKK
 XeTbZUP+H30g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,447,1589266800"; 
   d="scan'208";a="275491437"
Received: from lkp-server02.sh.intel.com (HELO 090e49ab5480) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 07 Aug 2020 15:34:18 -0700
Received: from kbuild by 090e49ab5480 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k4AwL-0000XG-Um; Fri, 07 Aug 2020 22:34:17 +0000
Date:   Sat, 08 Aug 2020 06:34:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 f022d152b4eb2b7a3f2e5344f7d3201108ffc019
Message-ID: <5f2dd6e1.+Wvbo3JX4NTpe6QD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: f022d152b4eb2b7a3f2e5344f7d3201108ffc019  Merge branches 'renesas-arm-defconfig-for-v5.10' and 'renesas-arm-dt-for-v5.10' into renesas-devel

elapsed time: 722m

configs tested: 85
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
arm                       imx_v4_v5_defconfig
powerpc                      pasemi_defconfig
mips                     loongson1b_defconfig
sh                           se7619_defconfig
sh                           se7206_defconfig
arm                         lpc32xx_defconfig
arm                          ixp4xx_defconfig
mips                           jazz_defconfig
sh                        sh7763rdp_defconfig
sh                           se7712_defconfig
arm                             ezx_defconfig
mips                       rbtx49xx_defconfig
sh                          lboxre2_defconfig
mips                        workpad_defconfig
arm                         axm55xx_defconfig
xtensa                generic_kc705_defconfig
arm                          gemini_defconfig
arm                           h3600_defconfig
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
powerpc                             defconfig
i386                 randconfig-a005-20200807
i386                 randconfig-a004-20200807
i386                 randconfig-a001-20200807
i386                 randconfig-a002-20200807
i386                 randconfig-a003-20200807
i386                 randconfig-a006-20200807
x86_64               randconfig-a013-20200807
x86_64               randconfig-a011-20200807
x86_64               randconfig-a012-20200807
x86_64               randconfig-a016-20200807
x86_64               randconfig-a015-20200807
x86_64               randconfig-a014-20200807
i386                 randconfig-a011-20200807
i386                 randconfig-a012-20200807
i386                 randconfig-a013-20200807
i386                 randconfig-a015-20200807
i386                 randconfig-a014-20200807
i386                 randconfig-a016-20200807
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
