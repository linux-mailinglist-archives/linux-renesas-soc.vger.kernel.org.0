Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63DC1678D79
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 02:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbjAXBdf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 20:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbjAXBdf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 20:33:35 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 188811A483
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 17:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674524014; x=1706060014;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sYV/q8MZhlTyYyhi8wW0os9jr15AuyhdoZII4H5m8mk=;
  b=ke3RmyjwEBYXHUX+Hz0Ic3VSEmFCHCrbxHvVhcUq317VIcSY6AjRuMU6
   1iwDJP7+gk64Fymy+qUj5DJcc3lELkFMNJyf6lX+tgOSKyMVGjEmwLJFv
   RcZjY3lGjcVhHMq138iTCoe5rZayslp/vHz1S4SIX52UrT5gL1yPEIHDb
   xUEqYD4alJHPEy35ZK3zNJOJeqCavwx4jNo4Bj/1b/Kzi789iRgLK48Du
   FS7aCCMy78tUCRYWGMCcdWrWZAbPlo+pgPJun4lWpkJ8EyAJjLeuanRZN
   k1lT1dJpVaEl6k4gQsmO5PO1lxHPDBfEbYPgm9LpdeD3wbtoTKEOhz0SL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412439777"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="412439777"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 17:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655253095"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="655253095"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Jan 2023 17:33:31 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pK8Bm-00061B-1A;
        Tue, 24 Jan 2023 01:33:30 +0000
Date:   Tue, 24 Jan 2023 09:32:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD REGRESSION
 8e27b1d4225c6a239971725fb12a477f99fc4b64
Message-ID: <63cf354b./7UCCbDxzGWplUEx%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 8e27b1d4225c6a239971725fb12a477f99fc4b64  Merge branch 'renesas-next' into renesas-devel

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301240428.nR3yBWOD-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301240450.yiHTqTmb-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/block/pktcdvd.c:49:10: fatal error: 'linux/pktcdvd.h' file not found
drivers/block/pktcdvd.c:49:10: fatal error: linux/pktcdvd.h: No such file or directory

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-randconfig-r026-20230123
|   `-- drivers-block-pktcdvd.c:fatal-error:linux-pktcdvd.h:No-such-file-or-directory
|-- i386-randconfig-m021-20230123
|   `-- drivers-block-pktcdvd.c:fatal-error:linux-pktcdvd.h:No-such-file-or-directory
|-- m68k-allmodconfig
|   `-- drivers-block-pktcdvd.c:fatal-error:linux-pktcdvd.h:No-such-file-or-directory
`-- sh-allmodconfig
    `-- drivers-block-pktcdvd.c:fatal-error:linux-pktcdvd.h:No-such-file-or-directory
clang_recent_errors
`-- x86_64-rhel-8.3-rust
    `-- drivers-block-pktcdvd.c:fatal-error:linux-pktcdvd.h-file-not-found

elapsed time: 726m

configs tested: 62
configs skipped: 2

gcc tested configs:
powerpc                           allnoconfig
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
m68k                             allmodconfig
x86_64                              defconfig
alpha                            allyesconfig
sh                               allmodconfig
arc                              allyesconfig
arc                                 defconfig
i386                                defconfig
s390                             allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
alpha                               defconfig
i386                 randconfig-a004-20230123
x86_64                           rhel-8.3-syz
i386                 randconfig-a003-20230123
s390                                defconfig
x86_64               randconfig-a002-20230123
ia64                             allmodconfig
i386                             allyesconfig
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20230123
x86_64                               rhel-8.3
i386                 randconfig-a002-20230123
x86_64               randconfig-a001-20230123
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
arm                  randconfig-r046-20230123
x86_64                    rhel-8.3-kselftests
m68k                             allyesconfig
arm                                 defconfig
i386                 randconfig-a001-20230123
x86_64                           rhel-8.3-bpf
x86_64                          rhel-8.3-func
x86_64               randconfig-a006-20230123
i386                 randconfig-a005-20230123
x86_64               randconfig-a004-20230123
i386                 randconfig-a006-20230123
x86_64               randconfig-a003-20230123
x86_64               randconfig-a005-20230123
x86_64                           allyesconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
i386                 randconfig-a012-20230123
i386                 randconfig-a013-20230123
riscv                randconfig-r042-20230123
s390                 randconfig-r044-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a014-20230123
x86_64                          rhel-8.3-rust
i386                 randconfig-a016-20230123
i386                 randconfig-a015-20230123
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a016-20230123
x86_64               randconfig-a015-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
