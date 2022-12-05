Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD48F643956
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Dec 2022 00:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbiLEXP1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 18:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233149AbiLEXP0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 18:15:26 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05E62A7
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 15:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670282124; x=1701818124;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UeIngRcFx0H5lKfO+gHtnjbxsXAGRJl9yGTO14uc2ik=;
  b=YiMtQzn36hD1D1/1z35Y+1Dw++oQF1rCq4sE5NW2yrTR4MSM4+7HrLxS
   89PcT0SdHyPSQQXnsVCqa18jLjmFTw0zFUqs689mO6wAfDgKTXcy+df0/
   oU47CJrftRWQOtfTd3OJFwrKoQAElGft6s2oNO1BUquI6VPQKfvF8dGB8
   f81jclrU610NxJVTVaCqrv5Qj8BTVAAC67MEOWVoSr+lDWZ0EDRZHwcAW
   vpZoqYYgtWGL/Dmj+bKnuDbb2rrTCgSPsNvbJkqqjnXVpQQOujJ5mcglw
   N1/M5ZhyDQGp4VZoIdxf0kRFSHElVFscm26x5V80+OIqkBaxYd4KgZOwP
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="317629323"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="317629323"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 15:15:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="752391501"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="752391501"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2022 15:15:22 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p2KgE-0000PF-04;
        Mon, 05 Dec 2022 23:15:22 +0000
Date:   Tue, 06 Dec 2022 07:14:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk-for-v6.3] BUILD SUCCESS
 e5a297191c5248bfcaf8dd5d802cc127ad63454e
Message-ID: <638e7b55.yLWKNyBsR4z5CvaR%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.3
branch HEAD: e5a297191c5248bfcaf8dd5d802cc127ad63454e  clk: renesas: r8a779g0: Add display related clocks

elapsed time: 732m

configs tested: 64
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
arc                                 defconfig
alpha                               defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
i386                                defconfig
s390                                defconfig
s390                             allmodconfig
ia64                             allmodconfig
i386                             allyesconfig
i386                 randconfig-a014-20221205
x86_64               randconfig-a011-20221205
i386                 randconfig-a013-20221205
x86_64               randconfig-a012-20221205
i386                 randconfig-a012-20221205
x86_64               randconfig-a013-20221205
i386                 randconfig-a015-20221205
x86_64               randconfig-a014-20221205
i386                 randconfig-a011-20221205
i386                 randconfig-a016-20221205
x86_64               randconfig-a015-20221205
x86_64               randconfig-a016-20221205
um                           x86_64_defconfig
um                             i386_defconfig
s390                             allyesconfig
arc                  randconfig-r043-20221205
s390                 randconfig-r044-20221205
riscv                randconfig-r042-20221205
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                            allnoconfig

clang tested configs:
x86_64               randconfig-a001-20221205
x86_64               randconfig-a002-20221205
x86_64               randconfig-a003-20221205
x86_64               randconfig-a004-20221205
x86_64               randconfig-a006-20221205
x86_64               randconfig-a005-20221205
hexagon              randconfig-r045-20221205
arm                  randconfig-r046-20221205
hexagon              randconfig-r041-20221205
i386                 randconfig-a001-20221205
i386                 randconfig-a002-20221205
i386                 randconfig-a005-20221205
i386                 randconfig-a004-20221205
i386                 randconfig-a003-20221205
i386                 randconfig-a006-20221205
hexagon              randconfig-r041-20221204
riscv                randconfig-r042-20221204
hexagon              randconfig-r045-20221204
s390                 randconfig-r044-20221204

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
