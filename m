Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1181023F4A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Aug 2020 23:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgHGV4r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 17:56:47 -0400
Received: from mga01.intel.com ([192.55.52.88]:34033 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726015AbgHGV4r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 17:56:47 -0400
IronPort-SDR: +frGw7lg7Vk+T4tF6olDSC5nqhO/JDkdvk3khQ9gZesMdog2pzqJ5leg5F0Hm0iwrJefUACguk
 zFer3bciym+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9706"; a="171258336"
X-IronPort-AV: E=Sophos;i="5.75,447,1589266800"; 
   d="scan'208";a="171258336"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2020 14:56:47 -0700
IronPort-SDR: D43L0hcC/hnv2hjUZNwQj0jIh5kbNTxKL6Vv3qnmLOX27ZA9eMgu39jZEDAOPG/RLzohU6uOqe
 Ee56XJEDtiBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,447,1589266800"; 
   d="scan'208";a="397706189"
Received: from lkp-server02.sh.intel.com (HELO 090e49ab5480) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 07 Aug 2020 14:56:46 -0700
Received: from kbuild by 090e49ab5480 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k4AM1-0000Wa-Fg; Fri, 07 Aug 2020 21:56:45 +0000
Date:   Sat, 08 Aug 2020 05:55:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:sh-pfc] BUILD SUCCESS
 e3a40f3d1db86852c6b14d90fd418cbadc8e5707
Message-ID: <5f2dcdee.GEUjyYZs57soLD7S%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  sh-pfc
branch HEAD: e3a40f3d1db86852c6b14d90fd418cbadc8e5707  pinctrl: sh-pfc: r8a7790: Add USB1 PWEN pin and group

elapsed time: 725m

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
