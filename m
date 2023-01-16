Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFD4566D1A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 23:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235195AbjAPWQQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 17:16:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235114AbjAPWP6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 17:15:58 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE132A146
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 14:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673907348; x=1705443348;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1MPdPPMrg/J2N4LVONIHlJmHJmtuyVbQwB7McU9LFj4=;
  b=BTov+ydkbQaTG6FqBru5Dd+7OMMTPPpzk1QmEtjmZNe1kEfkYvrqmrcx
   VRlBBMZiZYutEzWSHQbG9O/Eqa6n46vgop9MztDGDd2ayk7tccthr/+hK
   Osob8B6Yqy+rF6D/o7yKA2Zaq/3eV1AtJufyDejHIk9uzRtphGX2GS0S0
   PUqLXAe9Hby4iR/y3ZD8Fx4VIX6+OCcvNiMFvGThg81Hg+FLMlVYo59TN
   U5QcYEyc3tNE6hUxIfo5ax0GUO8NBz7acZlQq0Sgp32JhUjPbP+itUfEW
   cFHK+NAr0xk4UDmMR6nfBAgxjTgsf/YM5ledaTCKjPcalwpGh0pHg2hkw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="325837189"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="325837189"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 14:14:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="609049938"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="609049938"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Jan 2023 14:14:11 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pHXk2-0000kT-1N;
        Mon, 16 Jan 2023 22:14:10 +0000
Date:   Tue, 17 Jan 2023 06:14:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 53f1d973ba5f7b61d0a8b15648e089f267b79e10
Message-ID: <63c5cc2b.vU5cNn/uNlA7dBTc%lkp@intel.com>
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
branch HEAD: 53f1d973ba5f7b61d0a8b15648e089f267b79e10  Merge tag 'v6.2-rc4' into renesas-devel

elapsed time: 726m

configs tested: 73
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                  randconfig-r043-20230116
s390                 randconfig-r044-20230116
riscv                randconfig-r042-20230116
ia64                             allmodconfig
x86_64                            allnoconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                 randconfig-a013-20230116
i386                 randconfig-a012-20230116
i386                 randconfig-a016-20230116
i386                 randconfig-a014-20230116
i386                 randconfig-a015-20230116
i386                 randconfig-a011-20230116
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a011-20230116
x86_64               randconfig-a016-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a013-20230116
x86_64               randconfig-a015-20230116
x86_64               randconfig-a012-20230116
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
i386                             allyesconfig
i386                                defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64               randconfig-k001-20230116
mips                         db1xxx_defconfig
m68k                         apollo_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                 mpc837x_rdb_defconfig
um                               alldefconfig

clang tested configs:
hexagon              randconfig-r041-20230116
arm                  randconfig-r046-20230116
hexagon              randconfig-r045-20230116
x86_64                          rhel-8.3-rust
x86_64               randconfig-a001-20230116
x86_64               randconfig-a003-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a002-20230116
x86_64               randconfig-a006-20230116
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a006-20230116
riscv                randconfig-r042-20230115
s390                 randconfig-r044-20230115
hexagon              randconfig-r041-20230115
hexagon              randconfig-r045-20230115
arm                            dove_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
