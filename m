Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE14062A3F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 22:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbiKOVVa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 16:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238740AbiKOVVO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 16:21:14 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB3631DF9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 13:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668547225; x=1700083225;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lqjSGAqzGo8MfB6IehcuY3iwmOqPKfFb5+vNcFrM3vk=;
  b=EfCe+bcmya68TtstSCuZiJPVbw7SOLGQy7LeUxqXUrUtqVwMZtpNFIL1
   KrwSa4QCfvEpugMjRqkMs8RwIWdfhTNpKWahm7fMWjm9FPN1zAE5HJH+/
   +TeSu0+5d3VM1ifgAFiOtZAOq7hk8hIsPaf+UFrM367Iqep0nSu7MHx88
   /qK8LblaCnlOALCjIIuTl5DR9ykmyk1C9FxZAp7fUItibboWCpMvdDPRF
   m0lqXflWoWWzrF2qb2LOt00pyNq3kD+SFYCJiWtSqfTFHVehbZST6q1Oc
   HKz2j8GIRhIu6fiUnRTwKxN8T1vZc/HxVeTU+FTpqTGlxotRMfKZubJkl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="312376388"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="312376388"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 13:20:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="968146963"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="968146963"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Nov 2022 13:20:19 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ov3Lu-0001fZ-1o;
        Tue, 15 Nov 2022 21:20:18 +0000
Date:   Wed, 16 Nov 2022 05:19:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v6.2] BUILD SUCCESS
 c6b1737f45ca708fee76a30afb4a7b0247455749
Message-ID: <63740278.aaZPgqzuqC5Kpdii%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v6.2
branch HEAD: c6b1737f45ca708fee76a30afb4a7b0247455749  arm64: dts: renesas: r9a09g011: Add L2 Cache node

elapsed time: 720m

configs tested: 74
configs skipped: 105

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
um                           x86_64_defconfig
um                             i386_defconfig
ia64                             allmodconfig
sh                          kfr2r09_defconfig
xtensa                  nommu_kc705_defconfig
xtensa                          iss_defconfig
i386                 randconfig-a002-20221114
i386                 randconfig-a004-20221114
i386                 randconfig-a003-20221114
i386                 randconfig-a005-20221114
i386                 randconfig-a006-20221114
i386                 randconfig-a001-20221114
microblaze                      mmu_defconfig
arm                       multi_v4t_defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
powerpc                      ppc40x_defconfig
powerpc                     taishan_defconfig
arc                          axs101_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                            allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arm                      integrator_defconfig
mips                           ci20_defconfig
powerpc                      ppc6xx_defconfig
sh                 kfr2r09-romimage_defconfig
i386                             allyesconfig
i386                                defconfig
i386                          randconfig-c001
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
s390                          debug_defconfig
riscv                    nommu_k210_defconfig
mips                        vocore2_defconfig
mips                     decstation_defconfig
sh                         apsh4a3a_defconfig
openrisc                 simple_smp_defconfig

clang tested configs:
hexagon              randconfig-r041-20221115
hexagon              randconfig-r045-20221115
x86_64               randconfig-a012-20221114
x86_64               randconfig-a013-20221114
x86_64               randconfig-a016-20221114
x86_64               randconfig-a014-20221114
x86_64               randconfig-a015-20221114
x86_64               randconfig-a011-20221114
powerpc                   bluestone_defconfig
powerpc               mpc834x_itxgp_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
