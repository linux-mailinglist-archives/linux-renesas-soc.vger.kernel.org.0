Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFD804C09B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Feb 2022 03:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233116AbiBWCxx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Feb 2022 21:53:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233357AbiBWCxw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 21:53:52 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7813D53B4B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Feb 2022 18:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645584806; x=1677120806;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=b7m5c0FSReVZs6lK9ZB+XFP/PJfnliUKm8rlXA9Y2vs=;
  b=fRGMFfCuKDjQbfTx52KHZQwUiKc8MtZjf8LvMLoadm9LU2ep9DMEjUWI
   W8qBdtKOAwCaluQjwzb7NLLA69xmFMt9i6mdV0Kxr5N2N5vcHEMNmS//1
   Vl+xUxonmrLUI3pk0NkBQqkSaD/oVdjWqgJ4b9Do4xpz7JHeVKecvbEZ1
   cS00Y5zB5XE+22xtCAegy7wNrqWf+2/DcpGafzAGgPGgGea+FmAlGZmO6
   0bjOYIzFPFE5yL/mcBNzj7ABJL3/eTuwJXdV9yPmFckS6fECNfeCLMO1p
   urKCxzELs6NosyERlecRsgnRtmbgiVjMO0h6m7RdPkFu+1OHJyx6t7Igc
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="232491575"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="232491575"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 18:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="776527200"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Feb 2022 18:52:14 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMhlE-0000tu-LN; Wed, 23 Feb 2022 02:52:12 +0000
Date:   Wed, 23 Feb 2022 10:51:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 1e4e9aa2ba216d810a407b9c923b819c860cacb6
Message-ID: <6215a11d.QHrfZOmJRPMySt2r%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 1e4e9aa2ba216d810a407b9c923b819c860cacb6  Enter Area 51.

elapsed time: 721m

configs tested: 105
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
i386                 randconfig-c001-20220221
mips                            ar7_defconfig
sh                             espt_defconfig
sh                   sh7770_generic_defconfig
m68k                        m5307c3_defconfig
sparc                               defconfig
mips                         db1xxx_defconfig
arm                          pxa910_defconfig
powerpc                         ps3_defconfig
microblaze                          defconfig
mips                           ci20_defconfig
m68k                       bvme6000_defconfig
powerpc                   currituck_defconfig
arm                  randconfig-c002-20220221
arm                  randconfig-c002-20220222
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                 randconfig-a002-20220221
i386                 randconfig-a003-20220221
i386                 randconfig-a001-20220221
i386                 randconfig-a006-20220221
i386                 randconfig-a005-20220221
i386                 randconfig-a004-20220221
x86_64               randconfig-a002-20220221
x86_64               randconfig-a001-20220221
x86_64               randconfig-a003-20220221
x86_64               randconfig-a006-20220221
x86_64               randconfig-a004-20220221
x86_64               randconfig-a005-20220221
arc                  randconfig-r043-20220221
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
arm                          imote2_defconfig
arm                         mv78xx0_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     tqm5200_defconfig
mips                           ip27_defconfig
mips                          ath79_defconfig
powerpc                     mpc5200_defconfig
x86_64               randconfig-a011-20220221
x86_64               randconfig-a016-20220221
x86_64               randconfig-a012-20220221
x86_64               randconfig-a014-20220221
x86_64               randconfig-a013-20220221
x86_64               randconfig-a015-20220221
i386                 randconfig-a012-20220221
i386                 randconfig-a011-20220221
i386                 randconfig-a014-20220221
i386                 randconfig-a015-20220221
i386                 randconfig-a016-20220221
i386                 randconfig-a013-20220221
hexagon              randconfig-r045-20220221
hexagon              randconfig-r041-20220221
riscv                randconfig-r042-20220221
s390                 randconfig-r044-20220221

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
