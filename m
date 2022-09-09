Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFCC5B4268
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Sep 2022 00:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiIIWSO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 18:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiIIWSN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 18:18:13 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971F5ED997
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 15:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662761892; x=1694297892;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EOAZHlOWVhfBIn9N6bePFSFWc6euqH3TpoPpuLuHbZg=;
  b=YJSooAcb6N9eGnKZKf+tq4pGMsJw9OVvc9AXseyV9L1hLzXtXk8tKxqW
   X1QsJ9NWwh4TMEQenyl3UNvN39fTlDfTLbOsg/lYRythmf7CYWR9zKfRf
   tshQttvX8evJBnxf0WtwnlZqhLjz0PXFS4BoZO4KxBqObFjhDqC4PUlKT
   Fp71v7IceYxGXhQxSa7daHJN01qRf2SIaLwJHo3es7w1ysdC9einvqH9H
   hIS0st1DG8ccWiowAj9eEB6gP3OPIvyzCLLlr7NM3tUbkUebYVi0eMkrr
   Spw963u78yCgBv3Q+I0F3nDVhC43UANvTFlgGmFUXyZRBJw9Fvkkx2fHH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="277973111"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="277973111"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 15:18:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="592769008"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Sep 2022 15:18:11 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oWmKA-0001n3-1s;
        Fri, 09 Sep 2022 22:18:10 +0000
Date:   Sat, 10 Sep 2022 06:18:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:topic/white-hawk-enhancements-v1] BUILD
 SUCCESS f6ba1deb7501d31e8d237a8628d9c21298ce76c5
Message-ID: <631bbba1.23CdaLRtAfEbY8qJ%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/white-hawk-enhancements-v1
branch HEAD: f6ba1deb7501d31e8d237a8628d9c21298ce76c5  arm64: dts: renesas: white-hawk-cpu: Add Ethernet support

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
x86_64                              defconfig
m68k                             allyesconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
x86_64                        randconfig-a013
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20220908
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
arm                                 defconfig
x86_64                        randconfig-a011
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
x86_64                        randconfig-a004
arm                              allyesconfig
powerpc                           allnoconfig
arc                  randconfig-r043-20220907
x86_64                           rhel-8.3-syz
s390                 randconfig-r044-20220908
riscv                randconfig-r042-20220908
powerpc                          allmodconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a002
mips                             allyesconfig
x86_64                        randconfig-a006
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a001
sh                               allmodconfig
i386                          randconfig-a003
i386                          randconfig-a005
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220907
hexagon              randconfig-r041-20220908
x86_64                        randconfig-a016
riscv                randconfig-r042-20220907
hexagon              randconfig-r045-20220908
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
