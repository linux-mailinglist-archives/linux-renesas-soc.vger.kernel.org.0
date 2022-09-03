Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7398A5ABD14
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Sep 2022 06:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbiICEpx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 3 Sep 2022 00:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiICEpv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Sep 2022 00:45:51 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131D3C88A7
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Sep 2022 21:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662180350; x=1693716350;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bcUJXRTSxohoFKBudcIG5p31g+2goKjtZijiXU4af/o=;
  b=fV1CPMIQ/IPfDSqXFL1VQUWFVJOmG+hVfqIZpSG4FRITjEk4YTWOUQ9J
   bmy328RZJmcJJ/vMfSmOrVMBbQX+hvLK9UFxm0TXvDcorhffbPwDaF74a
   OlXZ/FXWonx3sKsTz7clgKh4JxhXlpLGWv8iqBOukquOkDKpLy5AqD/AJ
   tvW+/KFBFprmNzJz1dHIAp9mmbNEYfZ1X0ux3OUzEXy3x0k9AOKNDLLhP
   4uo5apIikFO4VoDCPSU9hDwWU2LQ5pMbJVVeEY/nqDxRYwLnj7Hci65Tj
   Bp/6e7rkME1qaO6LTUiLg/b614+tTm1xVNJCTnD8V2M+i24iCFY410Kn4
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="279146015"
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="279146015"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 21:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="564182806"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Sep 2022 21:45:48 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUL2R-00013Z-2P;
        Sat, 03 Sep 2022 04:45:47 +0000
Date:   Sat, 03 Sep 2022 12:45:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 e312ae92077f90d6ccdca05fb6d640bd9624c37c
Message-ID: <6312dbed.qHGA6ZGmEoWdl0gw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: e312ae92077f90d6ccdca05fb6d640bd9624c37c  dt-bindings: clock: renesas,rzg2l: Document RZ/Five SoC

elapsed time: 906m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
sh                               allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                  randconfig-r043-20220901
x86_64                              defconfig
i386                          randconfig-a012
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                           allyesconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a011
i386                          randconfig-a001
i386                          randconfig-a016
i386                          randconfig-a014
x86_64                               rhel-8.3
x86_64                        randconfig-a002
i386                          randconfig-a005
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
i386                          randconfig-a003
x86_64                           rhel-8.3-kvm
i386                                defconfig
x86_64                        randconfig-a004
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a012
riscv                randconfig-r042-20220901
hexagon              randconfig-r045-20220901
hexagon              randconfig-r041-20220901
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a013
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a014
s390                 randconfig-r044-20220901
i386                          randconfig-a002
x86_64                        randconfig-a003
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
