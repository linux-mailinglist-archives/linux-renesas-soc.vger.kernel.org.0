Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436F42431E2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Aug 2020 02:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgHMA6H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Aug 2020 20:58:07 -0400
Received: from mga01.intel.com ([192.55.52.88]:9604 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726131AbgHMA6G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Aug 2020 20:58:06 -0400
IronPort-SDR: TapfGjcjJPO+DHyuGo66NOwnId8n7Hxr4lXMqUeD6tAudSJj2p/VfLUGZP4YJQAN3YLoZrE5Je
 gknZdpqXRcWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="172173689"
X-IronPort-AV: E=Sophos;i="5.76,306,1592895600"; 
   d="scan'208";a="172173689"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2020 17:58:05 -0700
IronPort-SDR: /7CBzHZgmQs3qP5taT8+CHB5AGqsarurQrwZgDIHc9lWbS12ZCLuLqht9eWmQfDO1gEH7lDAGk
 uXM9n55vQS5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,306,1592895600"; 
   d="scan'208";a="325254895"
Received: from lkp-server01.sh.intel.com (HELO 7f1ebb311643) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Aug 2020 17:58:04 -0700
Received: from kbuild by 7f1ebb311643 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k61ZD-0000Ly-QW; Thu, 13 Aug 2020 00:58:03 +0000
Date:   Thu, 13 Aug 2020 08:57:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-devel:master] BUILD SUCCESS
 fc2c2735b1d00dd8a6275006ccaa0a6eac9822b3
Message-ID: <5f348ff8.u2WsBmBxssI5Ablt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git  master
branch HEAD: fc2c2735b1d00dd8a6275006ccaa0a6eac9822b3  Merge branch 'renesas-arm-dt-for-v5.10' into renesas-devel

elapsed time: 724m

configs tested: 103
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                           corgi_defconfig
arm                   milbeaut_m10v_defconfig
arm                            dove_defconfig
openrisc                    or1ksim_defconfig
powerpc                           allnoconfig
h8300                     edosk2674_defconfig
sh                         ap325rxa_defconfig
arm                            pleb_defconfig
sh                           se7780_defconfig
mips                malta_kvm_guest_defconfig
sh                           se7722_defconfig
mips                      malta_kvm_defconfig
mips                         mpc30x_defconfig
arm                          ixp4xx_defconfig
sh                          landisk_defconfig
sh                          urquell_defconfig
mips                      pic32mzda_defconfig
arm                           viper_defconfig
arm                            hisi_defconfig
arc                           tb10x_defconfig
arc                          axs103_defconfig
sh                           se7705_defconfig
parisc                           alldefconfig
powerpc                mpc7448_hpc2_defconfig
openrisc                 simple_smp_defconfig
arm                        multi_v7_defconfig
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
powerpc                             defconfig
i386                 randconfig-a005-20200812
i386                 randconfig-a001-20200812
i386                 randconfig-a002-20200812
i386                 randconfig-a003-20200812
i386                 randconfig-a006-20200812
i386                 randconfig-a004-20200812
i386                 randconfig-a005-20200811
i386                 randconfig-a001-20200811
i386                 randconfig-a002-20200811
i386                 randconfig-a003-20200811
i386                 randconfig-a006-20200811
i386                 randconfig-a004-20200811
i386                 randconfig-a016-20200811
i386                 randconfig-a011-20200811
i386                 randconfig-a015-20200811
i386                 randconfig-a013-20200811
i386                 randconfig-a012-20200811
i386                 randconfig-a014-20200811
i386                 randconfig-a016-20200812
i386                 randconfig-a011-20200812
i386                 randconfig-a013-20200812
i386                 randconfig-a015-20200812
i386                 randconfig-a012-20200812
i386                 randconfig-a014-20200812
x86_64               randconfig-a006-20200811
x86_64               randconfig-a001-20200811
x86_64               randconfig-a003-20200811
x86_64               randconfig-a005-20200811
x86_64               randconfig-a004-20200811
x86_64               randconfig-a002-20200811
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
