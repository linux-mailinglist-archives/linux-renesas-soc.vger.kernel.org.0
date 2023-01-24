Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB8A67A576
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 23:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjAXWP2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 17:15:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjAXWP1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 17:15:27 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F84322787
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 14:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674598526; x=1706134526;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IDu3CuWWG/KIsSEaZxRZcyn2nMX7KKpHC7cC6wwLIOQ=;
  b=LMOywJ5qRVef/kS0d0R6SOb2jcVgzeCDdXetXrttyiovTfQURgJ8Kzse
   NCLrWi2/u6jzjWAJZ9Apthmai1Zplv3W86JmWVXMlf6FfpvCmh1q402m3
   a6fPn/fUlQgqE0+toJLcZ7Cx/KFW8lPjeqp+mP5xx86A+kpV0HpsQqTcf
   ubRdE/bAa/dj6xCNB/WLbfXMZWyxbR3HQ3HA8bw4Mp8wHlrFBeLAyUDlk
   mPqS10LPmRlZ5vShYo2MIQj6qkORHkXsqnhsRlLqRV40X8QGJZCae268R
   sLQzjiXoO8T4ruY9i/jREfMZQvgC0lm814tg3TuF3+60N/PhRq+O2Yl59
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="328506705"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="328506705"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 14:15:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="664260481"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="664260481"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Jan 2023 14:15:23 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKRZb-0006p6-0z;
        Tue, 24 Jan 2023 22:15:23 +0000
Date:   Wed, 25 Jan 2023 06:14:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.3] BUILD SUCCESS
 5d824fe1174e21db4569b8f74d343722f3d0ffb7
Message-ID: <63d05860.VD3zuuIkRiICc4HM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.3
branch HEAD: 5d824fe1174e21db4569b8f74d343722f3d0ffb7  arm64: dts: renesas: r8a779g0: Add Cortex-A76 1.8 GHz opp

elapsed time: 729m

configs tested: 31
configs skipped: 77

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                  randconfig-r046-20230123
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                            allnoconfig
ia64                             allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
i386                 randconfig-a004-20230123
i386                 randconfig-a006-20230123
i386                 randconfig-a005-20230123
i386                 randconfig-a002-20230123
i386                 randconfig-a003-20230123
i386                 randconfig-a001-20230123
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-r042-20230123
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
