Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E16BC5ECD2A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Sep 2022 21:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbiI0TuC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Sep 2022 15:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbiI0Tt7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2022 15:49:59 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5408172FFE
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 12:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664308197; x=1695844197;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=THnN+91dfjUjOKfSFJJuh6tq3KuHn+7UkqBsN33OFYg=;
  b=O2hEWiasX6JaUYDqvt/ozFNHXMlrr8UZX1LUP3gIpFAnaJrUqx02gvwc
   9X1z880r9Eke39mRUYmSDg5QbOR1eWCOl19bu/RGBBlx5G4viEQlk7p0s
   BqgDMAQkYKT+7fa6v+MdwXqMpLiImoS96N3LfKNSksWnbrDIar50m5IRQ
   kL23OOKwPeYKM9aX6zIa2iG80hCaZ0Shw4BP5GgaXQlGOz5U6L0BZh5+E
   Bu1Wb4LzfVMtTNt4REBIfFWCDDlccZniQh0n0pHpVrhO2LpaTXYzznK2+
   /bBjq8r3+pu89nsBsRcOtGHkQfOAfZd1Q4i11Ar+vJwfGzoGG7n2gtxLn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="299015790"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="299015790"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 12:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="654848818"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="654848818"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 27 Sep 2022 12:49:52 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1odGaV-0001WW-1n;
        Tue, 27 Sep 2022 19:49:51 +0000
Date:   Wed, 28 Sep 2022 03:49:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 021286ccf6c17f224e1137ebdbbbecae1e64612f
Message-ID: <633353b8.LukK0hG7R1cbXrhZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 021286ccf6c17f224e1137ebdbbbecae1e64612f  Merge branches 'renesas-arm-dt-for-v6.2' and 'renesas-drivers-for-v6.2' into renesas-devel

elapsed time: 723m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
i386                                defconfig
powerpc                          allmodconfig
sh                               allmodconfig
arc                                 defconfig
x86_64                          rhel-8.3-func
alpha                               defconfig
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                               rhel-8.3
m68k                             allmodconfig
arc                              allyesconfig
arm                                 defconfig
i386                          randconfig-a005
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
i386                             allyesconfig
x86_64                           allyesconfig
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20220925
arm64                            allyesconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a001-20220926
s390                                defconfig
x86_64               randconfig-a003-20220926
s390                             allmodconfig
riscv                randconfig-r042-20220925
x86_64               randconfig-a005-20220926
arm                              allyesconfig
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
s390                             allyesconfig
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                 randconfig-a011-20220926
i386                          randconfig-a006
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a016-20220926
hexagon              randconfig-r041-20220925
i386                 randconfig-a015-20220926
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a015-20220926
x86_64               randconfig-a016-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
