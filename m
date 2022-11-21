Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E04BD633006
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 23:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbiKUW4o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 17:56:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbiKUW4n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 17:56:43 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68CD96AEFE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 14:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669071402; x=1700607402;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XFWlHUGQN0DuBMKs7ZaT3oRyeoc5lSHJMl5Ol3ThIQk=;
  b=Lcp4EgPy4KXfup7A4DAqjgDCDy2vWTnx2AKg8KYHHVGNYwwNufiVGjP2
   2H87+1tNJC4kh6DNAb3CUHOQipKPT4dW6pVkxz5bwut0VGLbMHIQrSX2T
   hB/km+gRgLDDZtkUnfbeDHA0/H1X7brEB0zq9/Y1Y7PX3qtc107xWPgg4
   Bra9K9S5+FS2m52YarUdyCorLzbIqa0h+iv2KnEe/p7F0mBigIL1818cy
   UH3lsOTe5PanEHHG/kwHAK/zVbHEbt2pNWdZOYvVXkUNw5Xw5nPoZoZdI
   jkOoxxvV2zaJuQV1PbMOUxNrNlNRJgUKmwnSpAfWG6Hc2E6Sa0dsF2kFs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="297035700"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="297035700"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 14:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="886292198"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="886292198"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Nov 2022 14:56:39 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oxFiR-0000oh-0l;
        Mon, 21 Nov 2022 22:56:39 +0000
Date:   Tue, 22 Nov 2022 06:55:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 2cfa2abd5264510d47f2d4a07621a48c01152209
Message-ID: <637c01fa.qTXHipH35U94rxc3%lkp@intel.com>
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
branch HEAD: 2cfa2abd5264510d47f2d4a07621a48c01152209  Merge branch 'renesas-next', tag 'v6.1-rc6' into renesas-devel

elapsed time: 726m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
sh                               allmodconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-a011-20221121
i386                 randconfig-a013-20221121
i386                 randconfig-a012-20221121
i386                 randconfig-a016-20221121
i386                 randconfig-a014-20221121
i386                 randconfig-a015-20221121
ia64                             allmodconfig
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221122
x86_64               randconfig-a011-20221121
x86_64               randconfig-a013-20221121
i386                             allyesconfig
x86_64               randconfig-a014-20221121
x86_64               randconfig-a016-20221121
x86_64               randconfig-a012-20221121
x86_64               randconfig-a015-20221121
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
powerpc                           allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                              defconfig
mips                             allyesconfig
powerpc                          allmodconfig
arm                                 defconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
arc                              allyesconfig
x86_64                           allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221122
riscv                randconfig-r042-20221122
s390                 randconfig-r044-20221122
hexagon              randconfig-r045-20221122
i386                          randconfig-a002
i386                          randconfig-a004
x86_64               randconfig-a004-20221121
x86_64               randconfig-a001-20221121
x86_64               randconfig-a003-20221121
i386                          randconfig-a006
x86_64               randconfig-a002-20221121
x86_64               randconfig-a006-20221121
x86_64               randconfig-a005-20221121

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
