Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1F6C664E27
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 22:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbjAJVkC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 16:40:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjAJVj5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 16:39:57 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7953B51
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 13:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673386796; x=1704922796;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=op+ePOFdjGLQ9jNVBpAQ+qKC0GgQz3RUq9XlaSdvOow=;
  b=aDq+sFzaqfEoJCEqcQbp++ChIL1/8kNMM1Y8irHz8C+4ih7dWyaX+eCF
   X7W02frCB1ka/EcUbojqU6TZdZ1rp+QU7ALBCEGwWKrWFgsGiJfKgKwSz
   xhSlodJ/ttdQImYbSAF5raJ3g5Kl9HbLDLNq0g6PKMIrhb5ZY3OJ6Dg1S
   USMQ3WXSVt3RC/1KWB+9BLwgxb53EP/sXeEIZRXBRqQ8Wh1eHDgI9IUuU
   EFSfGsCHm7Z+tKpkaCXwa+H7FulU5aZk3HCipd8AihP73oCYL5/8/cYCb
   /4GLkxBF5D0dpr1LhOMvAXyF0pqf7AzmEEKnihcQCzOp0s6UnbCPD3pb0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311069164"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="311069164"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 13:39:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="725681420"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="725681420"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jan 2023 13:39:51 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pFMLW-0008OL-1T;
        Tue, 10 Jan 2023 21:39:50 +0000
Date:   Wed, 11 Jan 2023 05:39:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 240ef1da471e76ffb4490378372caeea09d57f85
Message-ID: <63bddafb.xVdgznoKIIuCYhdQ%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 240ef1da471e76ffb4490378372caeea09d57f85  arm64: renesas: defconfig: Refresh for v6.2-rc1

elapsed time: 720m

configs tested: 62
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
x86_64                            allnoconfig
m68k                             allmodconfig
arc                                 defconfig
arc                              allyesconfig
m68k                             allyesconfig
alpha                               defconfig
um                             i386_defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
i386                 randconfig-a011-20230109
i386                 randconfig-a013-20230109
s390                                defconfig
i386                 randconfig-a012-20230109
s390                             allmodconfig
x86_64               randconfig-a011-20230109
ia64                             allmodconfig
i386                 randconfig-a014-20230109
x86_64               randconfig-a013-20230109
x86_64               randconfig-a012-20230109
i386                                defconfig
i386                 randconfig-a016-20230109
x86_64               randconfig-a014-20230109
s390                             allyesconfig
x86_64               randconfig-a016-20230109
i386                 randconfig-a015-20230109
x86_64                              defconfig
x86_64               randconfig-a015-20230109
x86_64                               rhel-8.3
arm                                 defconfig
i386                          randconfig-a001
sh                               allmodconfig
i386                          randconfig-a003
x86_64                           allyesconfig
i386                          randconfig-a005
arm                              allyesconfig
arc                  randconfig-r043-20230110
s390                 randconfig-r044-20230110
arm64                            allyesconfig
mips                             allyesconfig
riscv                randconfig-r042-20230110
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-bpf
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a004
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                             allyesconfig

clang tested configs:
i386                          randconfig-a002
hexagon              randconfig-r041-20230110
i386                          randconfig-a006
arm                  randconfig-r046-20230110
i386                          randconfig-a004
hexagon              randconfig-r045-20230110
x86_64                          rhel-8.3-rust
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
