Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2372D681F88
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Jan 2023 00:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjA3XWC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 18:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjA3XWB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 18:22:01 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BA829150
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 15:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675120920; x=1706656920;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cjodU1DGtOs6z2H+NBzTjtwyKvhZ/WhHxkIp0B87F7w=;
  b=TLDSOnXGKZVcRmDK9pAvoNKhdClwD9ldVFcG4X7olnGQGrFTvnhvqQH0
   AKic9jTUJj/q6xNGqkdEo00YvWrbzKyvrvso9Kd2W2VOaWVkQqq0/Es0d
   BJVYI1vz8n/JbPARGftTo6vzODFaC/l39gq6hN4dlrDIigonMXQN6iW34
   arCHU0dTj3FL7HO/6+Lx1ky7FrPQdpUakUo8lo7jx5xsXczJnUccD0IL1
   Kt9eUk6UOrJpEksDI7UgQx65clUF3qv/x0ztY0MSiePU8H57CiYpW5lo2
   jpEb+HUHoDKxq1/xMXvADxce9YxOhUGqktzo3NPSuOCIgPy8UzFoHIze1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="327715474"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="327715474"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 15:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="694738799"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="694738799"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Jan 2023 15:02:28 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMdAM-0003xG-0w;
        Mon, 30 Jan 2023 23:02:22 +0000
Date:   Tue, 31 Jan 2023 07:01:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 2aad9aa4eb647b900299e3d38d2e9b40b6f83235
Message-ID: <63d84c65.r2vjaDc+fCEzYKSt%lkp@intel.com>
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
branch HEAD: 2aad9aa4eb647b900299e3d38d2e9b40b6f83235  Merge branch 'renesas-next', tag 'v6.2-rc6' into renesas-devel

elapsed time: 728m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
x86_64               randconfig-a001-20230130
x86_64               randconfig-a003-20230130
x86_64               randconfig-a004-20230130
x86_64               randconfig-a002-20230130
sh                               allmodconfig
x86_64               randconfig-a006-20230130
x86_64                            allnoconfig
x86_64               randconfig-a005-20230130
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
powerpc                          allmodconfig
i386                                defconfig
mips                             allyesconfig
i386                 randconfig-a002-20230130
x86_64                              defconfig
ia64                             allmodconfig
i386                 randconfig-a006-20230130
alpha                            allyesconfig
x86_64                               rhel-8.3
alpha                               defconfig
i386                 randconfig-a001-20230130
m68k                             allyesconfig
arm                                 defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
s390                             allmodconfig
i386                 randconfig-a005-20230130
x86_64                          rhel-8.3-func
m68k                             allmodconfig
x86_64                           rhel-8.3-kvm
i386                 randconfig-a004-20230130
s390                             allyesconfig
x86_64                           rhel-8.3-bpf
arc                              allyesconfig
i386                 randconfig-a003-20230130
x86_64                           rhel-8.3-syz
s390                                defconfig
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20230129
arm64                            allyesconfig
arm                  randconfig-r046-20230129
arm                              allyesconfig
arm                  randconfig-r046-20230130
arc                  randconfig-r043-20230130
csky                                defconfig
arm                         s3c6400_defconfig
m68k                        stmark2_defconfig
sh                          r7785rp_defconfig
i386                          randconfig-c001

clang tested configs:
x86_64               randconfig-a014-20230130
x86_64               randconfig-a012-20230130
x86_64               randconfig-a015-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a016-20230130
x86_64                          rhel-8.3-rust
x86_64               randconfig-a011-20230130
i386                 randconfig-a013-20230130
i386                 randconfig-a012-20230130
hexagon              randconfig-r041-20230129
i386                 randconfig-a014-20230130
riscv                randconfig-r042-20230129
riscv                randconfig-r042-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130
hexagon              randconfig-r045-20230130
i386                 randconfig-a011-20230130
hexagon              randconfig-r041-20230130
hexagon              randconfig-r045-20230129
s390                 randconfig-r044-20230129
s390                 randconfig-r044-20230130
mips                          rm200_defconfig
arm                   milbeaut_m10v_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
