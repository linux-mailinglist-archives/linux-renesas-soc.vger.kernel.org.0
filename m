Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD3E55BD890
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Sep 2022 02:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbiITAAk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 20:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiITAAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 20:00:37 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C10101DA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 17:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663632036; x=1695168036;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=r4EYNDHCxfowpo/fDh7Yu8GCspKfMj/kVN2QdfoUh+U=;
  b=VtMVAzWSej8WzKEF5tYf7AkZJWwL8JpG0MzeCGiLpTkMUG7m0aSbW1qj
   3CUeM4X3RRWRK/J4aSnMF1YegVq3Ck2UrfLL3hc468qOBdKyEQSfWe5no
   nb3e8z68t+oHdpsxEPYvQOGeellzmYMpb9IpAhIus951IHj5FUyspz/2D
   CHIrC6rmndV2V4AIMxKOP8wZY59bP4DZlgV73/0PGSidchhoDZ5hxQq45
   9/BM3PBoKLe5uSdtpkHFCwO65ze4V32dPvQFW/GKM/Qj3WMAn8dTyJvr1
   IiqL7wOWdBnS7pjwS9B0E2xJcI8KQePbQGk7qa+anv4ghuk/6Zl308lNT
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="286599258"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="286599258"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 17:00:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="687183237"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Sep 2022 17:00:33 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oaQgj-0002JV-00;
        Tue, 20 Sep 2022 00:00:33 +0000
Date:   Tue, 20 Sep 2022 08:00:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v6.1] BUILD SUCCESS
 4ebf297b93403897668ee003427a9b780023c298
Message-ID: <63290299.96c8xDQlIhwLFcf5%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v6.1
branch HEAD: 4ebf297b93403897668ee003427a9b780023c298  arm64: dts: renesas: Adjust whitespace around '{'

elapsed time: 722m

configs tested: 95
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
x86_64                              defconfig
s390                                defconfig
s390                             allmodconfig
riscv                randconfig-r042-20220919
arc                  randconfig-r043-20220919
s390                 randconfig-r044-20220919
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
s390                             allyesconfig
x86_64                               rhel-8.3
i386                                defconfig
sh                               allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
x86_64               randconfig-a012-20220919
i386                 randconfig-a013-20220919
x86_64               randconfig-a014-20220919
i386                 randconfig-a012-20220919
x86_64               randconfig-a015-20220919
arm                                 defconfig
i386                 randconfig-a014-20220919
x86_64               randconfig-a013-20220919
ia64                             allmodconfig
i386                 randconfig-a011-20220919
x86_64               randconfig-a016-20220919
i386                 randconfig-a016-20220919
i386                 randconfig-a015-20220919
x86_64               randconfig-a011-20220919
arm64                            allyesconfig
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc              randconfig-c003-20220919
i386                 randconfig-c001-20220919
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64               randconfig-c001-20220919
arm                  randconfig-c002-20220919
sh                          sdk7786_defconfig
powerpc                   motionpro_defconfig
sh                             shx3_defconfig
sh                          kfr2r09_defconfig
arm                          exynos_defconfig
powerpc                       holly_defconfig
powerpc                     pq2fads_defconfig
powerpc                 linkstation_defconfig
sparc64                          alldefconfig
sh                        sh7757lcr_defconfig
x86_64               randconfig-k001-20220919
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
powerpc                        warp_defconfig
sparc64                             defconfig
powerpc                  storcenter_defconfig
arc                          axs103_defconfig

clang tested configs:
hexagon              randconfig-r045-20220919
hexagon              randconfig-r041-20220919
i386                 randconfig-a001-20220919
i386                 randconfig-a002-20220919
i386                 randconfig-a003-20220919
i386                 randconfig-a004-20220919
i386                 randconfig-a006-20220919
i386                 randconfig-a005-20220919
x86_64               randconfig-a003-20220919
x86_64               randconfig-a001-20220919
x86_64               randconfig-a002-20220919
x86_64               randconfig-a004-20220919
x86_64               randconfig-a005-20220919
x86_64               randconfig-a006-20220919
powerpc                          g5_defconfig
mips                        qi_lb60_defconfig
arm                         palmz72_defconfig
mips                     loongson1c_defconfig
hexagon                             defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
