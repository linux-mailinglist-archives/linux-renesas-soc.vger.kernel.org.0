Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E81560BD4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Oct 2022 00:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbiJXWWz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 18:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbiJXWWi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 18:22:38 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B58A98E3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 13:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666644088; x=1698180088;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qBJeUx7QzYcaaXlphPOryE6Cwi0vY20U9b5pTOAlgT0=;
  b=XjYzl6o+xVdSH3nJrtCAMrZFAwyw70sk7CEnJaBLGt45chO+KIbPLYy/
   7CmzfqXoc4GnMTwlDn6N/VjgxLHEbJPEj84OXmsXpmthSvYaEUyVYFt3B
   3H0Gyi/mZs+0i8c1xSh6OUEM6hVc33zscAPXuZTIm8OuAFlJq45Gw+syp
   /Ae/L8Lc2dEsWGUZ8G1WNPiIPeDY7HIodgjKDE+yTDFUNsdfrj2GpggFK
   ixv+BQ2FE7kmiytSAgKVD/cjMWSgDm2s+nWfR9vzLYYB1oJhGPn2bLLRj
   gELPBEIvxKU8f7tUWR2FSuNtq7Z4Trfa7lmTUgDkGfLMy0NXMLcy+0b28
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="290820322"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="290820322"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 13:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="694687361"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="694687361"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 24 Oct 2022 13:40:49 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1on4Fc-0005dT-2z;
        Mon, 24 Oct 2022 20:40:48 +0000
Date:   Tue, 25 Oct 2022 04:40:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 547a476a7857aadfcaa264982527697926c55d6a
Message-ID: <6356f843.fHbH4wuYJJHo+P6Y%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 547a476a7857aadfcaa264982527697926c55d6a  Merge branch 'renesas-next', tag 'v6.1-rc2' into renesas-devel

elapsed time: 729m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
arc                                 defconfig
arc                              allyesconfig
s390                             allmodconfig
alpha                            allyesconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
m68k                             allyesconfig
i386                 randconfig-a011-20221024
x86_64               randconfig-a014-20221024
x86_64               randconfig-a013-20221024
i386                 randconfig-a013-20221024
x86_64               randconfig-a012-20221024
i386                 randconfig-a012-20221024
x86_64               randconfig-a016-20221024
i386                 randconfig-a016-20221024
x86_64               randconfig-a011-20221024
i386                 randconfig-a015-20221024
x86_64               randconfig-a015-20221024
i386                 randconfig-a014-20221024
x86_64                              defconfig
i386                                defconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                               rhel-8.3
arm64                            allyesconfig
x86_64                           allyesconfig
ia64                             allmodconfig
i386                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arc                  randconfig-r043-20221023
arc                  randconfig-r043-20221024
s390                 randconfig-r044-20221024
riscv                randconfig-r042-20221024

clang tested configs:
i386                 randconfig-a004-20221024
i386                 randconfig-a001-20221024
x86_64               randconfig-a001-20221024
i386                 randconfig-a002-20221024
i386                 randconfig-a005-20221024
x86_64               randconfig-a005-20221024
i386                 randconfig-a003-20221024
x86_64               randconfig-a003-20221024
i386                 randconfig-a006-20221024
x86_64               randconfig-a006-20221024
x86_64               randconfig-a004-20221024
x86_64               randconfig-a002-20221024
hexagon              randconfig-r041-20221023
riscv                randconfig-r042-20221023
hexagon              randconfig-r045-20221023
s390                 randconfig-r044-20221023

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
