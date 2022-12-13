Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6A064AF57
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Dec 2022 06:32:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbiLMFcD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 00:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbiLMFcB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 00:32:01 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F8C8120B6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2022 21:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670909521; x=1702445521;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vCWJd3J5FeyetIRCUKuX05fvGZ5avi4ap1cytT8L4N4=;
  b=akj/uPTpmzfJ+nIFKb3j+afwpp2wG/hhgfYfPpPwv+wgHoI+h/7xBW80
   q+N/JTnkLRbnWquvDRKY15pHlDyuP//7JL6iSOVipOUGj0vMJ3mQOGTcb
   wfd36yBvhdlN6+7myy67OGRitmRZtrIElwPbPXFa13g6dZd4iuxEFG6SB
   xXqY2vOJ9Cv+qRu5tjHGFF9DfnlaUh2Ehwxt6hL6rTqXDQrhSoarrb7tp
   e4m9e6bs5fMVXvorvBqVBg/FyXWw15hzZZ+WozFx/s71sfLXNF7RagUNS
   E+/nxQ2IJ/lycDSGgnT8ZJm7tVNpJ4qw0qCwwDKR12DeYWj0elyoup5mQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="404304137"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; 
   d="scan'208";a="404304137"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 21:32:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="650608637"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; 
   d="scan'208";a="650608637"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Dec 2022 21:31:59 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p4xtX-00047m-0o;
        Tue, 13 Dec 2022 05:31:59 +0000
Date:   Tue, 13 Dec 2022 13:31:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e
Message-ID: <63980e14.BP9a5icyCdf7KUH3%lkp@intel.com>
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
branch HEAD: 710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e  Merge tag 'v6.1' into renesas-devel

elapsed time: 723m

configs tested: 69
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
m68k                             allyesconfig
x86_64                          rhel-8.3-rust
sh                               allmodconfig
m68k                             allmodconfig
x86_64                    rhel-8.3-kselftests
arc                              allyesconfig
x86_64                          rhel-8.3-func
alpha                            allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                 randconfig-a013-20221212
i386                 randconfig-a014-20221212
i386                 randconfig-a012-20221212
i386                                defconfig
ia64                             allmodconfig
i386                 randconfig-a011-20221212
x86_64                           allyesconfig
i386                 randconfig-a016-20221212
i386                 randconfig-a015-20221212
x86_64               randconfig-a011-20221212
x86_64               randconfig-a012-20221212
x86_64               randconfig-a014-20221212
x86_64               randconfig-a013-20221212
arm                                 defconfig
x86_64               randconfig-a015-20221212
x86_64               randconfig-a016-20221212
riscv                randconfig-r042-20221212
arc                  randconfig-r043-20221211
arc                  randconfig-r043-20221212
arm                  randconfig-r046-20221211
s390                 randconfig-r044-20221212
i386                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
x86_64                            allnoconfig
i386                          randconfig-c001

clang tested configs:
i386                 randconfig-a002-20221212
i386                 randconfig-a003-20221212
i386                 randconfig-a001-20221212
i386                 randconfig-a004-20221212
i386                 randconfig-a006-20221212
x86_64               randconfig-a002-20221212
x86_64               randconfig-a001-20221212
x86_64               randconfig-a004-20221212
i386                 randconfig-a005-20221212
x86_64               randconfig-a003-20221212
x86_64               randconfig-a006-20221212
x86_64               randconfig-a005-20221212
arm                  randconfig-r046-20221212
riscv                randconfig-r042-20221211
hexagon              randconfig-r045-20221211
hexagon              randconfig-r041-20221211
hexagon              randconfig-r045-20221212
s390                 randconfig-r044-20221211
hexagon              randconfig-r041-20221212

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
