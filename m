Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2669F605635
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Oct 2022 06:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiJTEHr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Oct 2022 00:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiJTEHq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Oct 2022 00:07:46 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C2FD181DBA
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Oct 2022 21:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666238865; x=1697774865;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eZajpO1OASqIcFiw9t1RhN6GZit3XdNc6Yj8cSqEXyg=;
  b=W5FS5e7Fmvx2OFs5YSbmdfxatS60IagXIan+zyEywD1HD3GgP0S3xLBb
   I2maO4TQNKEbvmUz1ai5PvZKBWFWZtFsV+XELtiHhWifn9wDbB7Bu8bzT
   hm/k3uY5MJDOgudB1hgwXMZN4sPAAG6LYycnzYRuXO3e0IVUY/KPteJlO
   d50vmF9RfT5gLICNW5Qx/Q1BnF+Ovz194WBSeUIIR6bwgY8ak4f6RYg8N
   3QIAqErvb33gaH6xdrMbnGbjZIwhE1qoGkIFw8HotGEfwXTpbEDxE0GON
   Tlw5oPXXA5Bdx9TOICBZwGDXxB/6I/2Xqeae+Z0Gb081GfNjm/XsSuJtf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="286316262"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="286316262"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 21:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="958678125"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="958678125"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Oct 2022 21:07:43 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1olMqM-0000oZ-2D;
        Thu, 20 Oct 2022 04:07:42 +0000
Date:   Thu, 20 Oct 2022 12:07:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD REGRESSION
 9f9ee49572231e413f38daca80808e9595d6f703
Message-ID: <6350c96f.6Lx7kfoYIkSG+gLk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 9f9ee49572231e413f38daca80808e9595d6f703  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

Error/Warning: (recently discovered and may have been fixed)

include/linux/compiler_types.h:298:27: error: expression in static assertion is not an integer

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- alpha-randconfig-c031-20221019
    `-- include-linux-compiler_types.h:error:expression-in-static-assertion-is-not-an-integer

elapsed time: 2297m

configs tested: 78
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                              defconfig
x86_64                        randconfig-a002
x86_64                         rhel-8.3-kunit
arc                                 defconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
s390                             allmodconfig
x86_64                               rhel-8.3
alpha                               defconfig
x86_64                           rhel-8.3-syz
x86_64                           allyesconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a006
x86_64                        randconfig-a013
s390                                defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a004
i386                             allyesconfig
i386                          randconfig-a001
s390                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a003
arc                  randconfig-r043-20221018
mips                             allyesconfig
i386                          randconfig-a005
powerpc                           allnoconfig
m68k                             allmodconfig
riscv                randconfig-r042-20221018
arc                              allyesconfig
s390                 randconfig-r044-20221018
alpha                            allyesconfig
sh                               allmodconfig
m68k                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
powerpc                 mpc834x_itx_defconfig
sh                           se7206_defconfig
arm                          simpad_defconfig
xtensa                  audio_kc705_defconfig
m68k                        mvme147_defconfig
sh                          lboxre2_defconfig
powerpc                     sequoia_defconfig
powerpc                        warp_defconfig
powerpc                     tqm8548_defconfig
arm64                            alldefconfig
sh                        sh7757lcr_defconfig
m68k                           virt_defconfig
sh                          rsk7269_defconfig
sh                     sh7710voipgw_defconfig
s390                          debug_defconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a003
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a012
hexagon              randconfig-r041-20221018
hexagon              randconfig-r045-20221018
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a011-20221017
i386                 randconfig-a013-20221017
i386                 randconfig-a012-20221017
i386                 randconfig-a014-20221017
i386                 randconfig-a016-20221017
i386                 randconfig-a015-20221017
arm                             mxs_defconfig
arm                         socfpga_defconfig
powerpc                   lite5200b_defconfig
powerpc                          g5_defconfig
mips                        bcm63xx_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
