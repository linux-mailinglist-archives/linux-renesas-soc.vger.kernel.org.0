Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B339D24932B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Aug 2020 05:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgHSDDf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Aug 2020 23:03:35 -0400
Received: from mga07.intel.com ([134.134.136.100]:13155 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727068AbgHSDDf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Aug 2020 23:03:35 -0400
IronPort-SDR: 5yezFvEoiRBhxGjjwCS4YOjvVVdNUnG3dvU9s7AbqeivxUbv79BIXA1dZ2HZ9l8JwJQVrbCOcv
 y1hFQBMFKtIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="219342282"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; 
   d="scan'208";a="219342282"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 20:03:34 -0700
IronPort-SDR: rlhLi7aBMTqnJqAnREazuSM76W8fLp3QJzZr6NxzzedtbjthwzgO4hZiB4K5JYouJC3v1XOpTX
 tPP8+id/25Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; 
   d="scan'208";a="334544477"
Received: from lkp-server01.sh.intel.com (HELO 4cedd236b688) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Aug 2020 20:03:32 -0700
Received: from kbuild by 4cedd236b688 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k8ENv-000059-Pv; Wed, 19 Aug 2020 03:03:31 +0000
Date:   Wed, 19 Aug 2020 11:02:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [renesas-drivers:topic/overlays-v5.9-rc1] BUILD SUCCESS
 412f1fa2911cd52004a92a4570dd43e59e9b97ba
Message-ID: <5f3c9663.bSF9JdfkI7ukga16%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git  topic/overlays-v5.9-rc1
branch HEAD: 412f1fa2911cd52004a92a4570dd43e59e9b97ba  kbuild: Create a rule for validating device tree overlay files

elapsed time: 720m

configs tested: 72
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
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
i386                 randconfig-a005-20200818
i386                 randconfig-a002-20200818
i386                 randconfig-a001-20200818
i386                 randconfig-a006-20200818
i386                 randconfig-a003-20200818
i386                 randconfig-a004-20200818
x86_64               randconfig-a013-20200818
x86_64               randconfig-a016-20200818
x86_64               randconfig-a012-20200818
x86_64               randconfig-a011-20200818
x86_64               randconfig-a014-20200818
x86_64               randconfig-a015-20200818
i386                 randconfig-a016-20200818
i386                 randconfig-a011-20200818
i386                 randconfig-a015-20200818
i386                 randconfig-a013-20200818
i386                 randconfig-a012-20200818
i386                 randconfig-a014-20200818
x86_64               randconfig-a006-20200819
x86_64               randconfig-a001-20200819
x86_64               randconfig-a003-20200819
x86_64               randconfig-a005-20200819
x86_64               randconfig-a004-20200819
x86_64               randconfig-a002-20200819
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
