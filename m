Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43F0D64395A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Dec 2022 00:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbiLEXP7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 18:15:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbiLEXPy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 18:15:54 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867002A7
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 15:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670282153; x=1701818153;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oWPnHZBm9DmUFbNYIlKkUBMid7UP1RmIL7jiahgwZWg=;
  b=nDiy/GUT1MqiiZsmkGvWqpMcobJL9+TEpSRYM1f/+Wsfb2Y8NCuQUKEY
   U5h+t/B7HJontgyykXopZvg1fO/LG9ASpy9V4S4Z7/GRrXCl4Tz7mHOZ7
   yePGhKsQ+34q1FYxBSfmvj/si+offYI3Wg0VkXf4WlpaYqecR2R6WobW7
   Tom7h/Gj0ucuckasldE9t2Fp6s4qwTNN5Hbp5D+wmU0FWPsYOurHebo9d
   hygchoiusSEudsZ2LdX0yiNPiwfjM7c+sOpmUWKuaWdt2hrNtp8HnrEht
   jBxHyLMfAEN6Uv6rmy74pPhTXIwrSTuYObNM0dSpesfCWjHlj+XNAGKp+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="299913515"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="299913515"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 15:15:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="734773735"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="734773735"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2022 15:15:22 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p2KgE-0000PZ-0m;
        Mon, 05 Dec 2022 23:15:22 +0000
Date:   Tue, 06 Dec 2022 07:14:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.3] BUILD
 SUCCESS 02414a99c8294d5b3725e699924803535a7fa7ed
Message-ID: <638e7b58.OVAseBT6xx9PNx5z%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.3
branch HEAD: 02414a99c8294d5b3725e699924803535a7fa7ed  arm64: defconfig: Enable Renesas RZ/G2L MIPI DSI driver

elapsed time: 733m

configs tested: 60
configs skipped: 119

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
ia64                             allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64               randconfig-a014-20221205
x86_64               randconfig-a011-20221205
x86_64               randconfig-a012-20221205
x86_64               randconfig-a013-20221205
x86_64               randconfig-a015-20221205
x86_64               randconfig-a016-20221205
i386                 randconfig-a016-20221205
i386                 randconfig-a013-20221205
i386                 randconfig-a012-20221205
i386                 randconfig-a015-20221205
i386                 randconfig-a011-20221205
i386                 randconfig-a014-20221205

clang tested configs:
x86_64               randconfig-a004-20221205
x86_64               randconfig-a005-20221205
x86_64               randconfig-a003-20221205
x86_64               randconfig-a006-20221205
x86_64               randconfig-a002-20221205
x86_64               randconfig-a001-20221205
hexagon              randconfig-r041-20221205
arm                  randconfig-r046-20221205
hexagon              randconfig-r045-20221205
hexagon              randconfig-r041-20221204
riscv                randconfig-r042-20221204
hexagon              randconfig-r045-20221204
s390                 randconfig-r044-20221204
i386                 randconfig-a003-20221205
i386                 randconfig-a004-20221205
i386                 randconfig-a001-20221205
i386                 randconfig-a002-20221205
i386                 randconfig-a005-20221205
i386                 randconfig-a006-20221205

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
