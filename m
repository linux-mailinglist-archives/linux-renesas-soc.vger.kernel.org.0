Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDB660241C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Oct 2022 08:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbiJRGE3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Oct 2022 02:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbiJRGE1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Oct 2022 02:04:27 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801785FD1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Oct 2022 23:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666073065; x=1697609065;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+oG/57/EfBp2AVKmQ7lchAlLBQwrPrIvmuE9sWYqJQQ=;
  b=MYJRqyV+soObxRvPsLfIIUi5DJySO8m0fuI8C89rdg/9f/HJH11Jk9tM
   iIPx4qu7g/4eaXkPhB8LZO8WLmquZO+EpKpVJexyXpdA9jez8XUhakIz0
   QfGz64XcHBNS8ZDY+S1RwGNzI+zcl5STfo7zBbd3tlskHnCHMMa2eP+rw
   7A/UEa7Dl3B6818vlIkzqpOJB3+2bM+e2HAp/fRJqoNn7/T6y1Gr7Ctyo
   +XB5xVPkIkHHamyM9LMdW+f6m1H3wnHotPRZ0fKfDNPottvDwzqtAYaNN
   bJLHox9JCIhUqHvrpX7GOBLyEQQlfn6VenTF6N3oNtIDvuGtZrR9akJXQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="303620393"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="303620393"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 23:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="753903612"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="753903612"
Received: from lkp-server01.sh.intel.com (HELO 8381f64adc98) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Oct 2022 23:04:22 -0700
Received: from kbuild by 8381f64adc98 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1okfi9-0001OO-2z;
        Tue, 18 Oct 2022 06:04:21 +0000
Date:   Tue, 18 Oct 2022 14:03:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 66896860eb881fadaa890f7d047b961e36fcb910
Message-ID: <634e41b4.29j2bhQgSrj7KmzO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 66896860eb881fadaa890f7d047b961e36fcb910  Merge branch 'renesas-next' into renesas-devel

elapsed time: 895m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
i386                 randconfig-a001-20221017
i386                 randconfig-a002-20221017
powerpc                           allnoconfig
arc                  randconfig-r043-20221017
i386                 randconfig-a003-20221017
x86_64               randconfig-a002-20221017
powerpc                          allmodconfig
x86_64               randconfig-a003-20221017
i386                 randconfig-a004-20221017
x86_64               randconfig-a004-20221017
i386                 randconfig-a006-20221017
x86_64               randconfig-a001-20221017
mips                             allyesconfig
sh                               allmodconfig
x86_64               randconfig-a006-20221017
x86_64               randconfig-a005-20221017
i386                 randconfig-a005-20221017
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                                defconfig
i386                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arm                                 defconfig
m68k                             allyesconfig
ia64                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
x86_64               randconfig-a013-20221017
x86_64               randconfig-a014-20221017
x86_64               randconfig-a012-20221017
x86_64               randconfig-a011-20221017
hexagon              randconfig-r045-20221017
hexagon              randconfig-r041-20221017
riscv                randconfig-r042-20221017
s390                 randconfig-r044-20221017
x86_64               randconfig-a015-20221017
x86_64               randconfig-a016-20221017
i386                 randconfig-a011-20221017
i386                 randconfig-a013-20221017
i386                 randconfig-a012-20221017
i386                 randconfig-a014-20221017
i386                 randconfig-a015-20221017
i386                 randconfig-a016-20221017

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
