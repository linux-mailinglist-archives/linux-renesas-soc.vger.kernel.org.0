Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9071B643955
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Dec 2022 00:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbiLEXP1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 18:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233056AbiLEXP0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 18:15:26 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF46B1C
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 15:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670282124; x=1701818124;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JZVNtJRHUgM3uQb9Uelwi0dbJt+MQrl+7qhdrOu4J3o=;
  b=WsmLmxfQ8luQBGrGd/CQBuo/5qlY1Q953KMxLRNLx4iqzDK0HYPmETSo
   E9+YVJE7H9Im8j109+iVJFDTkAH5eV4ERXjdv6yyK2cDNAPR38o42OpNN
   8Ii32+uouw36nHIykZU38IsZPlXUGsv7WBm/evD4vzG1WAuWIyotbvVJZ
   48LiE6mV6OVi/etCV00Xzx/8svhNizNzRt0TUK2NBzCJyyMMOoAwWcLlz
   Ph7ekvxi3ADMUFb7U87UvSfR0j3+zvSJ3zdyk0UiRODf4uF2k1kbkKsXG
   5q3uheHTJuUFTGOYQak2Wxk1Wixf73DPeqeqK3mhRQPlPS1dh7Z3AkeA5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="314133252"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="314133252"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 15:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="709432799"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="709432799"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Dec 2022 15:15:22 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p2KgE-0000PR-0U;
        Mon, 05 Dec 2022 23:15:22 +0000
Date:   Tue, 06 Dec 2022 07:14:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v6.3] BUILD SUCCESS
 e7c8eec0699e6920dbcb03bdf6077b2fbae75422
Message-ID: <638e7b61.bIap7S7k+Q6vt8wE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.3
branch HEAD: e7c8eec0699e6920dbcb03bdf6077b2fbae75422  soc: renesas: r8a779g0-sysc: Add missing A3DUL power domain

elapsed time: 732m

configs tested: 64
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
i386                                defconfig
ia64                             allmodconfig
s390                                defconfig
s390                             allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20221205
i386                             allyesconfig
s390                 randconfig-r044-20221205
riscv                randconfig-r042-20221205
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
arm                                 defconfig
arm                              allyesconfig
sh                               allmodconfig
i386                 randconfig-a013-20221205
i386                 randconfig-a012-20221205
arm64                            allyesconfig
i386                 randconfig-a015-20221205
i386                 randconfig-a011-20221205
i386                 randconfig-a014-20221205
i386                 randconfig-a016-20221205
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a014-20221205
x86_64               randconfig-a011-20221205
x86_64               randconfig-a012-20221205
x86_64               randconfig-a013-20221205
x86_64               randconfig-a015-20221205
x86_64               randconfig-a016-20221205
x86_64                            allnoconfig

clang tested configs:
x86_64               randconfig-a003-20221205
x86_64               randconfig-a004-20221205
x86_64               randconfig-a005-20221205
x86_64               randconfig-a001-20221205
x86_64               randconfig-a002-20221205
x86_64               randconfig-a006-20221205
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
