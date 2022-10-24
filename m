Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7993660BD4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Oct 2022 00:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiJXWXN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 18:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbiJXWW7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 18:22:59 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A05A317E04
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666644153; x=1698180153;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VeflqlkwvqwXaH4M0MvWyZaC4yoTkji1n2SQPznhpbg=;
  b=h0LGfcnbTXqQDZHYgi5LGH4BHZAqKgVK4SlUUcQhp8Dly3PYt3LMEg09
   Ncp/w1m+39bX1LcRISzl9XWCP8s1R15Xm6m/wGLE0uYYe2uVPuTRloa7Q
   pJYGix51O8m5Au/uYbi531CuVhBZa+bYG20Y/eDVO7tDlNKGqe8/Y3XDP
   S5j9YnR8ZYtoXWjcIHMnjdS3pT9eCInpG3Glag3v3n5tBEwMAG47volgK
   3xOeYxbgFez8gyd4Idd5iuO7zbdX+OhU/6UeiVNc3B84dP5L9O0MVT0o/
   3H2TxP7Uo5qQ3IORVVd7j4Wvb+M1HWkFJwNeRjD7zu3dKya3O6RM0W5Tl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="306247471"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="306247471"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 13:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="720610883"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="720610883"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Oct 2022 13:40:49 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1on4Fd-0005df-07;
        Mon, 24 Oct 2022 20:40:49 +0000
Date:   Tue, 25 Oct 2022 04:40:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 e165b026d6f6a9f7c09e956119621b2f05b5f42d
Message-ID: <6356f840.0Au0sXzVdXawtGj/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: e165b026d6f6a9f7c09e956119621b2f05b5f42d  Merge branch 'renesas-arm-dt-for-v6.2' into renesas-next

elapsed time: 728m

configs tested: 102
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           allyesconfig
ia64                             allmodconfig
arm                                 defconfig
i386                             allyesconfig
i386                 randconfig-a011-20221024
i386                 randconfig-a014-20221024
arm64                            allyesconfig
i386                 randconfig-a013-20221024
arm                              allyesconfig
i386                 randconfig-a012-20221024
i386                 randconfig-a016-20221024
i386                 randconfig-a015-20221024
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
x86_64               randconfig-a011-20221024
x86_64               randconfig-a014-20221024
x86_64               randconfig-a015-20221024
x86_64               randconfig-a016-20221024
arc                  randconfig-r043-20221023
arc                  randconfig-r043-20221024
s390                 randconfig-r044-20221024
riscv                randconfig-r042-20221024
x86_64               randconfig-k001-20221024
mips                        bcm47xx_defconfig
powerpc                       eiger_defconfig
i386                             alldefconfig
mips                           jazz_defconfig
sh                           se7206_defconfig
powerpc                   motionpro_defconfig
sh                        sh7757lcr_defconfig
powerpc                        cell_defconfig
loongarch                        alldefconfig
sh                          polaris_defconfig
powerpc                 mpc8540_ads_defconfig
arc                      axs103_smp_defconfig
csky                             alldefconfig
powerpc                 mpc837x_rdb_defconfig
openrisc                            defconfig
sparc64                             defconfig
sh                          sdk7786_defconfig
powerpc                      tqm8xx_defconfig
arm                        mini2440_defconfig
parisc                generic-64bit_defconfig
sh                           se7712_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
powerpc                     tqm8555_defconfig
sh                          lboxre2_defconfig
i386                 randconfig-c001-20221024
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
i386                          randconfig-c001

clang tested configs:
x86_64               randconfig-a001-20221024
hexagon              randconfig-r045-20221023
x86_64               randconfig-a003-20221024
x86_64               randconfig-a002-20221024
x86_64               randconfig-a005-20221024
x86_64               randconfig-a006-20221024
x86_64               randconfig-a004-20221024
i386                 randconfig-a001-20221024
i386                 randconfig-a002-20221024
i386                 randconfig-a005-20221024
i386                 randconfig-a003-20221024
i386                 randconfig-a004-20221024
i386                 randconfig-a006-20221024
powerpc                  mpc885_ads_defconfig
mips                           rs90_defconfig
s390                 randconfig-r044-20221023
hexagon              randconfig-r041-20221023
riscv                randconfig-r042-20221023
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
arm                        mvebu_v5_defconfig
powerpc                 mpc832x_mds_defconfig
arm                        multi_v5_defconfig
arm                       spear13xx_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
