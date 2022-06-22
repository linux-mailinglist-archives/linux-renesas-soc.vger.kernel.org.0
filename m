Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02182554028
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jun 2022 03:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354673AbiFVBmm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Jun 2022 21:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbiFVBmm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Jun 2022 21:42:42 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6808F3335E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Jun 2022 18:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655862161; x=1687398161;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tF88PgurSHIe8l0Zac9c/4s/PAsvEqi9wzbLvT8BWlo=;
  b=AxPm9HVb7TwIuTb+FoePAFt5UzkP1XTLbEUMXWgfb4VR4Wz/6dijF1Z8
   IV2tNaSCdKXJzH30LN6BSxS9zvau+NtNmyPkhg6kis6sa14ezPhji6gbu
   W7uys8HRB3f0Bn62N3d8ayjYtyJ/SqFy+x9Il88Zxix9HeSaX0ImXqDyb
   jUlHvhzgUgaAuQj8cMEmTW30/OdW0W//2ww5hfc+w8/dBhFWf6u2DSr7n
   JpV9suLQ3foTbHraQAJpXjte7sRDd+wXZJT/03X4SM9xr0kKKZ7OPaTf3
   49VUYCw+4ubOzzB9nC+b3lXEHfsAKxjVVTWLG/QWzfIrA++b8EJfO0BRd
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="281015466"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="281015466"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 18:42:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="655409095"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2022 18:42:23 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o3pNv-0000fy-7v;
        Wed, 22 Jun 2022 01:42:23 +0000
Date:   Wed, 22 Jun 2022 09:41:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 d2e8b5ad9e7895b57c60e1c19f760c9081bcd2cd
Message-ID: <62b27353.b3UM2ovbs27yazAl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: d2e8b5ad9e7895b57c60e1c19f760c9081bcd2cd  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 725m

configs tested: 75
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
m68k                       m5249evb_defconfig
ia64                         bigsur_defconfig
openrisc                 simple_smp_defconfig
xtensa                  nommu_kc705_defconfig
mips                           ci20_defconfig
ia64                             allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
powerpc                          allmodconfig
arc                                 defconfig
mips                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
parisc64                            defconfig
i386                   debian-10.3-kselftests
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                              debian-10.3
nios2                               defconfig
arc                              allyesconfig
powerpc                          allyesconfig
i386                 randconfig-a003-20220620
i386                 randconfig-a001-20220620
i386                 randconfig-a004-20220620
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a014
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
arc                  randconfig-r043-20220622
riscv                             allnoconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3

clang tested configs:
arm                       cns3420vb_defconfig
s390                             alldefconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20220622
hexagon              randconfig-r045-20220622
riscv                randconfig-r042-20220622
s390                 randconfig-r044-20220622

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
