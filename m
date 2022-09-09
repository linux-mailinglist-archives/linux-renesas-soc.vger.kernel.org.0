Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 726FF5B4310
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Sep 2022 01:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiIIXfR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 19:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiIIXfQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 19:35:16 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C65F7D1FC
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 16:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662766515; x=1694302515;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vrwrFW9++KzUgcqij9DPBRUUivBc3+anDy1s1TpVd3A=;
  b=a1MNG+LAyi18sQCKS0Dgk9wPsBeeHwASlWoRw5FNc6rhTjg9PF0JBELS
   4NX2JqPZT1cyI5VZ9FWA96eAifbkkQtCHuhv8EiY7R+4TXepX5g6TfpS0
   sKmVS4rH6RU7sNY9ueOZDwN4WNyD2fthv76i5R6h1j/LP2wPu2eg8wfe0
   cp600HS1lKzFUROp3yDeMiJqVyDSy48M5IGW5v7cSPbi/M87reWqyOj9v
   V1SfkwEIuKwAstATdxXkV3damadcXVXoMhaEZlOJrG+tbN77AM6mHfsEq
   j13hWd1omOJYuqlI6g/DoaC8soiu6iC+EJxIROJHxRLgR6ZT3xqFkBb2G
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="277983389"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="277983389"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 16:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="943954639"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2022 16:35:14 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oWnWj-0001rX-1l;
        Fri, 09 Sep 2022 23:35:13 +0000
Date:   Sat, 10 Sep 2022 07:34:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 23a58e624fdd0e208b810d360cacd29a9869820e
Message-ID: <631bcd8f.C8+HST2RF1i0oy0U%lkp@intel.com>
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
branch HEAD: 23a58e624fdd0e208b810d360cacd29a9869820e  Merge branch 'renesas-next' into renesas-devel

elapsed time: 721m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
i386                                defconfig
arm                                 defconfig
x86_64                              defconfig
arm                              allyesconfig
m68k                             allmodconfig
arm64                            allyesconfig
m68k                             allyesconfig
alpha                            allyesconfig
arc                  randconfig-r043-20220907
i386                          randconfig-a001
arc                              allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a013
x86_64                        randconfig-a004
i386                          randconfig-a014
x86_64                        randconfig-a002
x86_64                        randconfig-a011
i386                          randconfig-a012
x86_64                        randconfig-a015
i386                          randconfig-a016
x86_64                        randconfig-a006
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
i386                          randconfig-a002
riscv                randconfig-r042-20220907
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a012
x86_64                        randconfig-a001
i386                          randconfig-a015
x86_64                        randconfig-a016
x86_64                        randconfig-a003
x86_64                        randconfig-a014
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
