Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4924698E3A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Feb 2023 09:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjBPICZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Feb 2023 03:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjBPICY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Feb 2023 03:02:24 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9470140F8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Feb 2023 00:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676534543; x=1708070543;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=czrMdeRlx/9cRKNmgQsVEVTE5L/n3pgBN6rN0BPwH0o=;
  b=mIhGkS31E2hUTfJhqbnbVwBV5iCGjtQx9sbSTuNwljLeYk3b5NuYjuA7
   aUKdC24Q5XprfpsPaoSAcVZ94hkDASHHltQYwYpBz2llRDl/sE4DbSjDK
   3F7zGnpuQ9t68TKD3pQuvNp+58YwFXLnQ4A0dqEFDsTIAVMk7NG1BUAPM
   e1EeMh45gZLfUjt+ZysiN7n+ODQm/PQ7xXZ30VAGWAd8+CQRiitPt6fNp
   OIjdW5EADQOu2OgQG3M5kOLUPS1XiHrzPDr3R7ZXK+jONWTj7BXReEVYD
   uqRFNdEhEwrOlfXLksxCVQuBpeHvhv5eZjRKmP57B4IsT5/jOX2hLKq2o
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="329374618"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="329374618"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 00:02:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="670038477"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="670038477"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Feb 2023 00:02:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pSZDg-000A7m-2F;
        Thu, 16 Feb 2023 08:02:20 +0000
Date:   Thu, 16 Feb 2023 16:01:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.4] BUILD SUCCESS
 6521cb4af294529a068e33b32731a415e7a64433
Message-ID: <63ede2f7.qxKXC4JyjsAvVPGf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LONGWORDS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.4
branch HEAD: 6521cb4af294529a068e33b32731a415e7a64433  clk: renesas: r8a77995: Fix VIN parent clock

elapsed time: 1057m

configs tested: 71
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arc                        nsimosci_defconfig
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm                          lpd270_defconfig
arm                           tegra_defconfig
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                 randconfig-a011-20230213
i386                 randconfig-a012-20230213
i386                 randconfig-a013-20230213
i386                 randconfig-a014-20230213
i386                 randconfig-a015-20230213
i386                 randconfig-a016-20230213
i386                          randconfig-c001
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
mips                             allmodconfig
mips                             allyesconfig
nios2                               defconfig
openrisc                         alldefconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
sh                               allmodconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64               randconfig-a011-20230213
x86_64               randconfig-a012-20230213
x86_64               randconfig-a013-20230213
x86_64               randconfig-a014-20230213
x86_64               randconfig-a015-20230213
x86_64               randconfig-a016-20230213
x86_64                               rhel-8.3

clang tested configs:
mips                     cu1830-neo_defconfig
mips                      pic32mzda_defconfig
powerpc                       ebony_defconfig
powerpc                 mpc8272_ads_defconfig
x86_64               randconfig-a001-20230213
x86_64               randconfig-a002-20230213
x86_64               randconfig-a003-20230213
x86_64               randconfig-a004-20230213
x86_64               randconfig-a005-20230213
x86_64               randconfig-a006-20230213
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
