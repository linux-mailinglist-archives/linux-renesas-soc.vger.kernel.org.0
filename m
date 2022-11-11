Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 201386252DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Nov 2022 05:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiKKEwL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 23:52:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbiKKEv6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 23:51:58 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5B418B21
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 20:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668142317; x=1699678317;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EUQhkAth+bo99lkRVRTwcyuxVeVy61n5As2B4IlGtT4=;
  b=ffTZBqVp+wI+6ycKdn++0RvvAH8aYspeacQIhJY0QIoJowmJ33CkmhGg
   TUWjMODSiH3XHeljqJfLUrEBHmX8N0RmO9qrbwRPCbyEr9hoS+D8wTzzu
   LRe34A2zfFiwWujYq8NSlUzuJKfj1468Z3Ka9tI4TM97Oalmiv8/bvfzs
   jhvMt7T63zQ9BRI7ft1aSmZzXE1JtEDnTIG1XaVhkMznuobFj7e+EaROD
   S/PPxM4IBdZhiWGI62OE3EfLlGxZA/97K5XvwD3KeFbIc+dVXdx+8vLa6
   XPbexqSszMZmhJR2ah2r9NkBhXoRBgLQ4x7IpA2TViej11eLR+PC9mF4W
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291927901"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; 
   d="scan'208";a="291927901"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 20:51:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="966697744"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; 
   d="scan'208";a="966697744"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Nov 2022 20:51:54 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1otM1B-0003bF-22;
        Fri, 11 Nov 2022 04:51:53 +0000
Date:   Fri, 11 Nov 2022 12:50:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 35f5248b8c44355d69637ca0ae3fc3fbfc8aa2d0
Message-ID: <636dd4b0.O7HX+hvF+1d4iPie%lkp@intel.com>
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
branch HEAD: 35f5248b8c44355d69637ca0ae3fc3fbfc8aa2d0  Merge branch 'renesas-next' into renesas-devel

elapsed time: 727m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
s390                             allmodconfig
s390                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a013
x86_64                        randconfig-a011
s390                             allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a002
i386                                defconfig
m68k                             allmodconfig
i386                          randconfig-a014
x86_64                              defconfig
arc                              allyesconfig
i386                          randconfig-a012
alpha                            allyesconfig
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                               rhel-8.3
x86_64                        randconfig-a015
arc                  randconfig-r043-20221110
x86_64                           allyesconfig
ia64                             allmodconfig
i386                             allyesconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                          randconfig-a001
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
x86_64                        randconfig-a012
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a016
riscv                randconfig-r042-20221110
x86_64                        randconfig-a014
hexagon              randconfig-r041-20221110
hexagon              randconfig-r045-20221110
s390                 randconfig-r044-20221110

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
