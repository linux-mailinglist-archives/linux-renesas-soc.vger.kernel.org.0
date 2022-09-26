Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB3565EB48A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Sep 2022 00:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbiIZW2S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 18:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbiIZW2Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 18:28:16 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D29C8FD50
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664231294; x=1695767294;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=keNvH+f2S2hW9kdpRJz2pICk2vYK/JvH/ggVfXg8NRo=;
  b=bgW+LUgxvSPTdXkqpXVZwuqnjPjEBou/eQTG13OhPoeIUfwZVz6H8IIH
   Sze1nSS4KNGCP6k8YCg+6E18XScLU3/8mSKRtH960rlzirezewwN0xB5g
   kXeuWjJNPRTVrffaHxqJEpJ/Oa3b/aRPO++P0PS2VlrBtwKOovgsgQ1qy
   vTAiMebX1rYc+oVFQ+o3Yph4yeFLUHlX7D1/hVBpPpaMvGvKa2dPqzzOb
   /iQYVFOF9P0tFVZ6/rzmGXy5avnyse+MXDmhX34yFvjqUPqoXCqioUW1v
   oQjgi0Qo6GJDHVY4JF4vwHZ7q7k+HgzpOeqH2Xtin2zvo3XWZ5NyJ7eC8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="302630432"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="302630432"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 15:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="572399513"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="572399513"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Sep 2022 15:28:13 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ocwaC-0000Iu-1A;
        Mon, 26 Sep 2022 22:28:12 +0000
Date:   Tue, 27 Sep 2022 06:27:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 ddd038d014eab0591a9b0bfbc8b20f64561f6eca
Message-ID: <6332274a.26x4Xw0Y/6/v4Wkk%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: ddd038d014eab0591a9b0bfbc8b20f64561f6eca  Merge branches 'renesas-next' and 'topic/renesas-defconfig', tag 'v6.0-rc7' into renesas-devel

elapsed time: 723m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                              defconfig
s390                                defconfig
x86_64                               rhel-8.3
s390                             allyesconfig
i386                                defconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
m68k                             allyesconfig
m68k                             allmodconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a001-20220926
x86_64                           rhel-8.3-syz
arm                                 defconfig
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a003-20220926
x86_64                           rhel-8.3-kvm
i386                 randconfig-a001-20220926
x86_64               randconfig-a004-20220926
i386                 randconfig-a004-20220926
x86_64               randconfig-a006-20220926
arc                  randconfig-r043-20220925
powerpc                           allnoconfig
x86_64               randconfig-a005-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
riscv                randconfig-r042-20220925
arm64                            allyesconfig
arc                  randconfig-r043-20220926
arm                              allyesconfig
s390                 randconfig-r044-20220925
i386                             allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220925
x86_64               randconfig-a015-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
i386                 randconfig-a011-20220926
hexagon              randconfig-r041-20220926
i386                 randconfig-a015-20220926
x86_64               randconfig-a011-20220926
i386                 randconfig-a014-20220926
x86_64               randconfig-a016-20220926
hexagon              randconfig-r045-20220926
i386                 randconfig-a013-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a012-20220926
s390                 randconfig-r044-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
