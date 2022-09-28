Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C18B05ED3E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Sep 2022 06:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbiI1E1J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Sep 2022 00:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbiI1E1I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2022 00:27:08 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CAD41EEE3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 21:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664339228; x=1695875228;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vFJrJAPNyjoE7p9KHqQpKMcOPR+1ALck70iYllPMxJ4=;
  b=epWoMvyYHIRhT/yRPHK9ShXlG/ZWEBTkK+nx6xrAuW4euVjvNKl8uIB8
   WDYzfF6dFx0dbDMKP7SguZIBbQy8ZGh1vFGUnjRRsXl7PA1kGOgaTBiKb
   CeCVhlPxySBjQeN0r6XUpSa6AX8HG31Cdw3F07Om8aPksvCwx7P1zvWab
   +zL+WQBxgcW8XFOJwT8AKBF7Gvpaq9FG2n7mFnWR4A5Uaj0eS5j3aDdYv
   Yv7hm5z6aba3TVFWLxQgZ8JiawyHbtmLhu8OCNbQX07hwhzyWD0BcShvq
   BBsngQrr4Es2boiCYBkMg3mXnAMTsMAUh2L/8N2c4qX39oz9vkOwbEsOu
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="363341032"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="363341032"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 21:27:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="652531800"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="652531800"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 27 Sep 2022 21:27:06 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1odOf3-0001yG-2n;
        Wed, 28 Sep 2022 04:27:05 +0000
Date:   Wed, 28 Sep 2022 12:26:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.2] BUILD SUCCESS
 8c071622822441f22680b2559acfc99909313fd4
Message-ID: <6333ccdf.X0QXCMUHEssNRyZ2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.2
branch HEAD: 8c071622822441f22680b2559acfc99909313fd4  clk: renesas: r8a779f0: Add Ethernet Switch clocks

elapsed time: 791m

configs tested: 69
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
x86_64                          rhel-8.3-func
alpha                               defconfig
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                              defconfig
mips                             allyesconfig
s390                             allmodconfig
arc                  randconfig-r043-20220925
s390                                defconfig
riscv                randconfig-r042-20220925
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
x86_64                               rhel-8.3
sh                               allmodconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a004-20220926
m68k                             allmodconfig
x86_64               randconfig-a001-20220926
arc                              allyesconfig
s390                             allyesconfig
alpha                            allyesconfig
x86_64                           rhel-8.3-syz
x86_64                           allyesconfig
arm                                 defconfig
x86_64               randconfig-a003-20220926
i386                                defconfig
x86_64               randconfig-a005-20220926
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a006-20220926
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
arm                              allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
i386                 randconfig-a003-20220926
i386                 randconfig-a001-20220926
i386                 randconfig-a006-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a002-20220926
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
i386                          randconfig-a002
i386                          randconfig-a004
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a015-20220926
i386                          randconfig-a006
x86_64               randconfig-a016-20220926
i386                 randconfig-a011-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a012-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
