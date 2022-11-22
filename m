Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B21F633921
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Nov 2022 10:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbiKVJ4L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Nov 2022 04:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiKVJ4K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2022 04:56:10 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980FC183AC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Nov 2022 01:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669110969; x=1700646969;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=89n8MnZ8raUoB4z0dox8XA+qgFIqOzhtJSrWStGddT0=;
  b=LkoRhUuezMzree0Nxjhgn+Nbmfdlsh3N8ggdN+cLVaaqLYyUlxDwp2Nr
   UEpYHuJZbW550CQKPGqhZkWsilW6V0nJCC81dCVAoF8x1i2nj89hMilzP
   eT11v68QzLcwFubfzs0tthxy3clymZSO2VeYFt/L4eKZFULqk5SuvNhqo
   ui8mi6ItiFbJ4Ts7VDvOOVAsPCJapU2btnLiaq8MTWITWfIlpGSe4QJzD
   HZMtcL+tQRelcIEvm1zWxTTZV73G4W9L6aVpb3SXDPxoQ3xpM01/yOw1z
   mebIQhvndGzoDvK9qHLh6/Y9nObHTu07DY87P7QLcKpbyjExUSzqiBncN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="314927893"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="314927893"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2022 01:56:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="886472063"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="886472063"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Nov 2022 01:56:07 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oxQ0d-0001LP-19;
        Tue, 22 Nov 2022 09:56:07 +0000
Date:   Tue, 22 Nov 2022 17:55:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 00841e945654c53409a811ab1ddaa934631ac54c
Message-ID: <637c9c90.mjuAa2KUn9MIAyrb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 00841e945654c53409a811ab1ddaa934631ac54c  Merge branch 'renesas-arm-dt-for-v6.2' into renesas-next

elapsed time: 1385m

configs tested: 64
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
um                           x86_64_defconfig
um                             i386_defconfig
s390                             allyesconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
sh                               allmodconfig
ia64                             allmodconfig
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a011-20221121
x86_64                          rhel-8.3-func
i386                 randconfig-a015-20221121
i386                 randconfig-a013-20221121
i386                 randconfig-a014-20221121
i386                 randconfig-a016-20221121
i386                 randconfig-a012-20221121
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20221120
riscv                randconfig-r042-20221121
arc                  randconfig-r043-20221121
s390                 randconfig-r044-20221121
i386                                defconfig
i386                             allyesconfig
x86_64               randconfig-a012-20221121
x86_64               randconfig-a011-20221121
x86_64               randconfig-a013-20221121
x86_64               randconfig-a014-20221121
x86_64               randconfig-a016-20221121
x86_64               randconfig-a015-20221121
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                            allnoconfig

clang tested configs:
x86_64               randconfig-a001-20221121
x86_64               randconfig-a003-20221121
x86_64               randconfig-a002-20221121
x86_64               randconfig-a005-20221121
x86_64               randconfig-a004-20221121
x86_64               randconfig-a006-20221121
hexagon              randconfig-r041-20221120
hexagon              randconfig-r041-20221121
hexagon              randconfig-r045-20221120
hexagon              randconfig-r045-20221121
riscv                randconfig-r042-20221120
s390                 randconfig-r044-20221120
i386                 randconfig-a001-20221121
i386                 randconfig-a003-20221121
i386                 randconfig-a005-20221121
i386                 randconfig-a002-20221121
i386                 randconfig-a006-20221121
i386                 randconfig-a004-20221121

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
