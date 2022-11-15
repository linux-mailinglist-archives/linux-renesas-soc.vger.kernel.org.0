Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1652862A3F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 22:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238754AbiKOVV0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 16:21:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238758AbiKOVVE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 16:21:04 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED3F31DE0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 13:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668547220; x=1700083220;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ox/F6vN5N/7wKcjYvJIzpi96t1yZIbhKJo41w6nh+LY=;
  b=n9hJ1qFHC3XoAqa+nutlOx0M4p7aJzQOOqkm62RW5ywCwhYQmFzU+vRl
   o+X6aHiz2sSIvf/bN2vAoWZXyxo/5oy7a7Ja0YR/iat00VSrDyyWTO5yA
   EdVgOEoia5QwoUtFyWHisjGdUpF1jJPS57XRHcE00zv0eRWN2Ols/uCHK
   ekxhBsa9imfxPyiDx9tz24+oYI53+KRo+/bg7e9SPUbWJfyg5CSrlLGY1
   aMqCiYbyfPIkCw0r4FTN1pnLZDyC0UhHt8dspa6CpPwbyTTB8wgNOhEnB
   +qnQjyO5mryBoXA6Oq+z7y4BWWw7pRAkFfcWMy07OunynZ+iGaLuW5O2z
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="295736810"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="295736810"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 13:20:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="672142035"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="672142035"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Nov 2022 13:20:19 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ov3Lu-0001fL-1V;
        Tue, 15 Nov 2022 21:20:18 +0000
Date:   Wed, 16 Nov 2022 05:19:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 7c5179718b0c2a627f8db3044b0414e3484564c6
Message-ID: <6374027d.hbMnuWd5RmMk9Fqy%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 7c5179718b0c2a627f8db3044b0414e3484564c6  Merge branch 'renesas-next' into renesas-devel

elapsed time: 721m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
i386                                defconfig
ia64                             allmodconfig
alpha                               defconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20221114
s390                                defconfig
x86_64               randconfig-a001-20221114
m68k                             allmodconfig
x86_64               randconfig-a004-20221114
x86_64                          rhel-8.3-func
alpha                            allyesconfig
arc                              allyesconfig
s390                             allmodconfig
x86_64               randconfig-a003-20221114
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221114
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
mips                             allyesconfig
x86_64               randconfig-a006-20221114
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
s390                             allyesconfig
i386                 randconfig-a001-20221114
x86_64               randconfig-a005-20221114
i386                 randconfig-a004-20221114
i386                 randconfig-a002-20221114
x86_64                           rhel-8.3-syz
i386                 randconfig-a005-20221114
x86_64                               rhel-8.3
i386                 randconfig-a006-20221114
i386                 randconfig-a003-20221114
x86_64                           allyesconfig
arm                                 defconfig
powerpc                          allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221114
hexagon              randconfig-r041-20221114
s390                 randconfig-r044-20221114
x86_64               randconfig-a012-20221114
x86_64               randconfig-a015-20221114
riscv                randconfig-r042-20221114
x86_64               randconfig-a011-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a014-20221114
x86_64               randconfig-a013-20221114
i386                 randconfig-a013-20221114
x86_64               randconfig-a014-20221114
i386                 randconfig-a012-20221114
x86_64               randconfig-a016-20221114
i386                 randconfig-a015-20221114
i386                 randconfig-a016-20221114

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
