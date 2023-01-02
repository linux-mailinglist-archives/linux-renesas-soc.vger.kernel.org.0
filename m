Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7240E65B753
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jan 2023 22:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbjABVKG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Jan 2023 16:10:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjABVKF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jan 2023 16:10:05 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF309584
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Jan 2023 13:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672693803; x=1704229803;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x5ioPJ/irt55FX7RMC+UIVqxdCZIBQwAHK53q73r0tQ=;
  b=mTPyjUoPFAFxnHZO5K8ajd4Kd0xLIzEMxuclxZ3pTzB4u4SQSOp0xhso
   Nqwho5GSgV6vQi6ey07Iz47HGNY1PSGRxquEVH8qc6tLFwgCg2nEn9vP0
   ImPCCGOPst8TAM0S/+vBFysnOo2OiLR/PJTWpgbe9ggmKDUlUVD6dAo9s
   lNB4SK1bhvvxKVhzrS6ZHQ4IYZSuj1pFHIl794plWNv08hW0ekSb9o3AU
   cZgqGtxAu+w8wcolKTRaveXmYEH9YU/9TUXJek4k+1GeRauThE7iwGWXO
   zP8B4tyOblUKa7ELHoxbNTQmLo3uZta1ijDra/jCzdfU/94GuEjXe3qmg
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="348760601"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; 
   d="scan'208";a="348760601"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 13:10:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="778653636"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; 
   d="scan'208";a="778653636"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Jan 2023 13:10:01 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pCS4F-000RY7-36;
        Mon, 02 Jan 2023 21:09:59 +0000
Date:   Tue, 03 Jan 2023 05:09:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 b61285fe1d0f3d98f4780d0889af30b13655c32e
Message-ID: <63b3481a.QmqMM4lI0bO71C8l%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: b61285fe1d0f3d98f4780d0889af30b13655c32e  Merge tag 'v6.2-rc2' into renesas-devel

elapsed time: 726m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
s390                             allmodconfig
um                           x86_64_defconfig
alpha                               defconfig
s390                             allyesconfig
s390                                defconfig
powerpc                           allnoconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
sh                               allmodconfig
x86_64                              defconfig
ia64                             allmodconfig
mips                             allyesconfig
x86_64                           rhel-8.3-bpf
arm                                 defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
x86_64                    rhel-8.3-kselftests
arm64                            allyesconfig
x86_64                          rhel-8.3-func
x86_64               randconfig-a003-20230102
x86_64               randconfig-a001-20230102
i386                                defconfig
x86_64               randconfig-a004-20230102
x86_64                           allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a002-20230102
i386                 randconfig-a004-20230102
arm                              allyesconfig
i386                 randconfig-a003-20230102
x86_64               randconfig-a006-20230102
i386                 randconfig-a001-20230102
x86_64                            allnoconfig
x86_64               randconfig-a005-20230102
i386                 randconfig-a002-20230102
i386                 randconfig-a005-20230102
i386                 randconfig-a006-20230102
riscv                randconfig-r042-20230101
s390                 randconfig-r044-20230101
arc                  randconfig-r043-20230102
i386                             allyesconfig
arm                  randconfig-r046-20230102
arc                  randconfig-r043-20230101

clang tested configs:
i386                 randconfig-a013-20230102
i386                 randconfig-a012-20230102
i386                 randconfig-a011-20230102
i386                 randconfig-a014-20230102
x86_64                          rhel-8.3-rust
i386                 randconfig-a015-20230102
i386                 randconfig-a016-20230102
x86_64               randconfig-a011-20230102
x86_64               randconfig-a014-20230102
x86_64               randconfig-a012-20230102
x86_64               randconfig-a013-20230102
x86_64               randconfig-a015-20230102
x86_64               randconfig-a016-20230102
hexagon              randconfig-r041-20230102
s390                 randconfig-r044-20230102
hexagon              randconfig-r045-20230101
hexagon              randconfig-r045-20230102
arm                  randconfig-r046-20230101
riscv                randconfig-r042-20230102
hexagon              randconfig-r041-20230101

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
