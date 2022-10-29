Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0240F611F17
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Oct 2022 03:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiJ2Bap (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Oct 2022 21:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiJ2Bam (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 21:30:42 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA4C5AEA08
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 18:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667007041; x=1698543041;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uMzZR+GGccWbSQSyTEDGn1iUZfC7gfJgj25s/39TnnQ=;
  b=akDoR4Le/3S3j+3Nrwqp1CwsR5RIHyRu5MYUIsSBTLR5AdMUrTcFG026
   r0fO8IjdgPlH7rbQhGwLuGsLuvmxsM1weyF8Hau7k+bRYDHb7TuNIiLUS
   RDnzD9HHdLFADmoapreTqSCzWEF3/pdWGCLmcjkH4+QBHGZT0cnTEMgUl
   4X6iJ4wdYlqBjCalsu2wCuPkW7emyW7HW+jnoxvK4OpAKffQXCPFBZCHY
   f8z08TMq1lp2L/mmHct+MQohbA17qr6Lhyag8Q7a3w2ivGJ3s0w+l82YI
   +v3DAxkq5QRpTKjkaFV8k4kOqvAEjDCGFPtVybgCdhggUwpy+RRRYOBRc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="288341365"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="288341365"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 18:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="610939180"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="610939180"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Oct 2022 18:30:39 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ooagI-000APX-1z;
        Sat, 29 Oct 2022 01:30:38 +0000
Date:   Sat, 29 Oct 2022 09:29:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 4bff929bc882c742102dbb29613c4cf8c0c92fa5
Message-ID: <635c8212.S1ahkzbuTh83FdmX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 4bff929bc882c742102dbb29613c4cf8c0c92fa5  Merge branches 'renesas-arm-dt-for-v6.2', 'renesas-arm-soc-for-v6.2' and 'renesas-dt-bindings-for-v6.2' into renesas-next

elapsed time: 726m

configs tested: 80
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
s390                                defconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                             allyesconfig
m68k                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                                defconfig
x86_64                              defconfig
ia64                             allmodconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                          randconfig-a001
i386                          randconfig-a003
powerpc                           allnoconfig
x86_64                        randconfig-a004
powerpc                          allmodconfig
x86_64                        randconfig-a002
mips                             allyesconfig
x86_64                        randconfig-a006
arc                  randconfig-r043-20221028
sh                               allmodconfig
i386                          randconfig-a014
i386                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
riscv                randconfig-r042-20221028
s390                 randconfig-r044-20221028
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
powerpc                      ep88xc_defconfig
powerpc                       ppc64_defconfig
powerpc                      makalu_defconfig
arm                           u8500_defconfig
arm                         lpc18xx_defconfig
arm                      jornada720_defconfig
csky                             alldefconfig
m68k                        mvme16x_defconfig
powerpc                 canyonlands_defconfig
i386                          randconfig-c001
sparc                            allyesconfig
powerpc                    sam440ep_defconfig
arm                           stm32_defconfig
arm64                            alldefconfig
arm                          gemini_defconfig
powerpc                      tqm8xx_defconfig
arm64                               defconfig
sh                            titan_defconfig
powerpc                      mgcoge_defconfig
arm                          pxa3xx_defconfig
sh                        dreamcast_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a013
x86_64                        randconfig-a003
i386                          randconfig-a015
hexagon              randconfig-r041-20221028
i386                          randconfig-a011
hexagon              randconfig-r045-20221028
i386                          randconfig-a006
s390                 randconfig-r044-20221029
hexagon              randconfig-r045-20221029
riscv                randconfig-r042-20221029
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-k001
mips                           rs90_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
