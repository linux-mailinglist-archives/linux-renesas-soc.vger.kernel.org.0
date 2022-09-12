Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAB55B6417
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 01:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbiILX1K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Sep 2022 19:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbiILX0y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2022 19:26:54 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC3850060
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2022 16:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663025210; x=1694561210;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/Z0b+F/QHbQnuhqVQfAUAm3tF4+WLyI7SOOmJYwog2Y=;
  b=UehXWng4vm4wQ1/HjtEog0bmWNGEFtNUwDnkk4ElH+PQ4oCxKMOrdftG
   c7rQJ9Dioygr64FOZkrWPCGYqj7BOcAwP4Se8/Kt8jdIImaCNJDyMhdHM
   iBnQ4JdJUgQDnK1oaoE1UAjjgusAQDPDDOXtZZbx9CpkbEYB2VobwNAlc
   8ij7+E0QYTpWMrfCdJSfZ1ty3IWbiw+SDUiNRLHLbb8DWzxcisXDbA9Xo
   NlDuUPkLQVk5Rs4FRdaqaMX1mNVf7Grqj5qpV4qzSrbKZOzLL9l8+TX9e
   3xsjku39Q0HNxKBC5dDlpUM/ZI2ax5FpYqcMyRAXnzZwMrt+epX1PczQR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="361944969"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="361944969"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 16:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="567359094"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Sep 2022 16:26:34 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oXsp0-0002yN-0O;
        Mon, 12 Sep 2022 23:26:34 +0000
Date:   Tue, 13 Sep 2022 07:25:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 94f27a9ea2691030ed8a87c33e1e6a0badc3bde9
Message-ID: <631fc005.RfdZRz1uWs9kYuBL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 94f27a9ea2691030ed8a87c33e1e6a0badc3bde9  Merge tag 'v6.0-rc5' into renesas-devel

elapsed time: 723m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
m68k                             allmodconfig
powerpc                          allmodconfig
arc                              allyesconfig
x86_64                              defconfig
mips                             allyesconfig
alpha                            allyesconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
m68k                             allyesconfig
sh                               allmodconfig
x86_64                           allyesconfig
i386                                defconfig
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
arm64                            allyesconfig
x86_64               randconfig-a001-20220912
i386                 randconfig-a001-20220912
arm                              allyesconfig
riscv                randconfig-r042-20220911
x86_64               randconfig-a006-20220912
i386                             allyesconfig
i386                 randconfig-a002-20220912
arc                  randconfig-r043-20220912
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20220911
x86_64               randconfig-a004-20220912
i386                 randconfig-a004-20220912
s390                 randconfig-r044-20220911
i386                 randconfig-a003-20220912
x86_64               randconfig-a002-20220912
ia64                             allmodconfig
i386                 randconfig-a006-20220912
x86_64               randconfig-a005-20220912
i386                 randconfig-a005-20220912
x86_64               randconfig-a003-20220912

clang tested configs:
i386                 randconfig-a014-20220912
i386                 randconfig-a015-20220912
i386                 randconfig-a013-20220912
i386                 randconfig-a011-20220912
i386                 randconfig-a012-20220912
i386                 randconfig-a016-20220912
riscv                randconfig-r042-20220912
hexagon              randconfig-r041-20220912
hexagon              randconfig-r045-20220911
hexagon              randconfig-r041-20220911
x86_64               randconfig-a011-20220912
hexagon              randconfig-r045-20220912
s390                 randconfig-r044-20220912
x86_64               randconfig-a012-20220912
x86_64               randconfig-a013-20220912
x86_64               randconfig-a014-20220912
x86_64               randconfig-a016-20220912
x86_64               randconfig-a015-20220912

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
