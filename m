Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6BC5EB48B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Sep 2022 00:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbiIZW2T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 18:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiIZW2Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 18:28:16 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567538E9AF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664231294; x=1695767294;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AyhQ0k4JyjPlrZ9hdHn6HHwLSfAZn5xWcf/ZgLBaMd4=;
  b=askonaTm1qBRjgD3gSL9C3TOwav85qxmwrq/Imy9Hk9nm/vxdFpU5w3r
   IApbJNg4nRmONEsLXfpohwn/bmSDnKIqJnoiOZk9OxPAmVvYHbCxAH0VC
   ksIz4kvsWNT6gf80RVWOyOqYBtXtYG240q+6ld/2ABwJ4qY1FLbahHF2g
   qa/ihoLBkAZikIzw3ajFv5c8WSijhKcG3rGAlLPJ5ZdfaPgEVkxj1mIPH
   S7Wtcsx0Zr0YgMFw7ztWHCPchYvsm05MJD372lJdcsJGA7V4sBW2pSbH+
   DFnEHhWJHZww75Xzze0PFygZG46zxkT9473sCILQ2DKVeVGqypqw3SQb0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="280880606"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="280880606"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 15:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="689748343"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="689748343"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2022 15:28:13 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ocwaC-0000J0-1G;
        Mon, 26 Sep 2022 22:28:12 +0000
Date:   Tue, 27 Sep 2022 06:27:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 a7ec6f47e9d38bc0f9c1c09ef51538426f7c8a91
Message-ID: <63322748.jEMiLycgEJH5zpLS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: a7ec6f47e9d38bc0f9c1c09ef51538426f7c8a91  Merge branches 'renesas-arm-dt-for-v6.1' and 'renesas-arm-soc-for-v6.1' into renesas-next

elapsed time: 723m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                               rhel-8.3
i386                                defconfig
arm                                 defconfig
x86_64               randconfig-a002-20220926
x86_64                           rhel-8.3-syz
x86_64                           allyesconfig
x86_64               randconfig-a005-20220926
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a004-20220926
arm64                            allyesconfig
x86_64               randconfig-a006-20220926
x86_64                           rhel-8.3-kvm
arm                              allyesconfig
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
i386                             allyesconfig
arc                  randconfig-r043-20220925
i386                 randconfig-a001-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
riscv                randconfig-r042-20220925
i386                 randconfig-a006-20220926
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
arc                  randconfig-r043-20220926
ia64                             allmodconfig
s390                 randconfig-r044-20220925
sh                   secureedge5410_defconfig
arm                          gemini_defconfig
powerpc                      tqm8xx_defconfig
sh                               alldefconfig
m68k                        m5307c3_defconfig
powerpc                      cm5200_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
s390                          debug_defconfig

clang tested configs:
i386                 randconfig-a011-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a014-20220926
x86_64               randconfig-a012-20220926
i386                 randconfig-a016-20220926
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
x86_64               randconfig-a013-20220926
i386                 randconfig-a015-20220926
hexagon              randconfig-r045-20220926
x86_64               randconfig-a011-20220926
hexagon              randconfig-r041-20220925
x86_64               randconfig-a015-20220926
riscv                randconfig-r042-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a016-20220926
s390                 randconfig-r044-20220926
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
