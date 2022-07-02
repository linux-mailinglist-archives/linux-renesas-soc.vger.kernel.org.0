Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE8EB564098
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Jul 2022 16:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbiGBOD7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Jul 2022 10:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiGBOD7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Jul 2022 10:03:59 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 691C7E088
        for <linux-renesas-soc@vger.kernel.org>; Sat,  2 Jul 2022 07:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656770638; x=1688306638;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BDZleUSwLI1VOH06lCo/bSWHH4fF3RVWqeFewOGYZdM=;
  b=k6Kd/Gu85W2sqnLABqfxopT+0gQwzQQGzJpQYgTr+ncevPe1xJQOlLLY
   Sq/A1mfLQrQOYydPdvsMyckx/CXPuWCvY7w1X0YfxTPqgfcTpcetEWpml
   aQAZOOn7arUlWBhNY4pkQxDEt31wbsJjhle3GbuwrF2O79HU/mNHo6YEE
   Nkp3TVFUg5rWscayQ5b5qHjOd7JdCnJuVvbrSIAOBVKtYXF7hEF0Ucw2u
   YN/AJOlNtOY6rAWSMQ3dUEvrowApxzvVLR4gHya4N+7WwdR7OQ+ZWzU4T
   NTmNi5aFQVV6L6mD6RAu5ySgnUWPi/yuZ1+ErgrZxvaeA4u7bE15JmAnb
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="344518540"
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="344518540"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 07:03:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="918793966"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Jul 2022 07:03:56 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o7dj2-000FJR-6f;
        Sat, 02 Jul 2022 14:03:56 +0000
Date:   Sat, 02 Jul 2022 22:03:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v5.20] BUILD SUCCESS
 29a99eb2215a2bf56c9e8ffa6fbeddc41f8bbf2e
Message-ID: <62c0501f.a/bZqASvxl30nhDW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v5.20
branch HEAD: 29a99eb2215a2bf56c9e8ffa6fbeddc41f8bbf2e  pinctrl: renesas: Add RZ/V2M pin and gpio controller driver

elapsed time: 1834m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a004
i386                          randconfig-a005
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220629
riscv                randconfig-r042-20220629
s390                 randconfig-r044-20220629
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a005
hexagon              randconfig-r041-20220629
hexagon              randconfig-r045-20220629

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
