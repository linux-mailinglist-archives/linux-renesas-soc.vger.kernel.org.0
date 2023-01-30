Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8999E681F8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Jan 2023 00:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjA3XWD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 18:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjA3XWC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 18:22:02 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FB22887F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 15:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675120921; x=1706656921;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qukmzmzl1suNB8dvy+rf87IzMO0uo7DibiuTDtFa/Dc=;
  b=NSH/WBgn4lEvx8vzyCl8F1c28gQ2GhwsuL1gTdS4FHvPrDqJZQDfW9tK
   3mMjhMMZ7wP6C+XQqPAvgP8un7pbi0/PfAAmAKrFjUdVMnrVlLfRQZm5E
   bhiUE0wKYPwM2RSevSydGJ7GcfMKzzZw+E+XwxRFhUpeCE5RE0VmOs7Nh
   nQfi83pwyiHJShitX6HMgQSCZg3B3rvMdU+UozfUOQ8oHZQOfW68M3LXp
   fQhSpuZzIDLPIrpw25EwIMzfGlbdtFzClVAvkC72JlLRl7baceBrM3ZtI
   RAapXgMqzmFbkSvsBeqTfxazQXmX6SEkN2KKzorr+OGvR6aJNIIQtmFQc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="327715476"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="327715476"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 15:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="694738800"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="694738800"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Jan 2023 15:02:28 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMdAM-0003xK-15;
        Mon, 30 Jan 2023 23:02:22 +0000
Date:   Tue, 31 Jan 2023 07:01:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 8dd3dae1705b14948974debe04021549519dfb0b
Message-ID: <63d84c62.c/EADEW7aV5R3wlb%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 8dd3dae1705b14948974debe04021549519dfb0b  Merge branches 'renesas-arm-defconfig-for-v6.3', 'renesas-drivers-for-v6.3', 'renesas-dt-bindings-for-v6.3' and 'renesas-dts-for-v6.3' into renesas-next

elapsed time: 728m

configs tested: 95
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                 randconfig-a002-20230130
i386                 randconfig-a001-20230130
i386                 randconfig-a004-20230130
i386                 randconfig-a003-20230130
i386                 randconfig-a005-20230130
i386                 randconfig-a006-20230130
arc                                 defconfig
s390                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
alpha                               defconfig
x86_64               randconfig-a001-20230130
x86_64               randconfig-a003-20230130
x86_64               randconfig-a004-20230130
x86_64               randconfig-a002-20230130
s390                                defconfig
i386                                defconfig
arm                                 defconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20230130
x86_64               randconfig-a005-20230130
s390                             allyesconfig
x86_64                              defconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                  randconfig-r043-20230129
arm64                            allyesconfig
arc                              allyesconfig
arm                  randconfig-r046-20230129
x86_64                               rhel-8.3
i386                             allyesconfig
arm                              allyesconfig
arm                  randconfig-r046-20230130
arc                  randconfig-r043-20230130
sh                               allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
x86_64                           rhel-8.3-bpf
mips                             allyesconfig
powerpc                          allmodconfig
ia64                             allmodconfig
mips                        bcm47xx_defconfig
powerpc                     pq2fads_defconfig
openrisc                       virt_defconfig
arm                            qcom_defconfig
i386                          randconfig-c001
m68k                          hp300_defconfig
arm                        multi_v7_defconfig
sh                           se7750_defconfig
openrisc                 simple_smp_defconfig
sh                          sdk7786_defconfig
sh                          rsk7269_defconfig
powerpc                       holly_defconfig
arm                         nhk8815_defconfig

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a014-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a011-20230130
x86_64               randconfig-a012-20230130
x86_64               randconfig-a015-20230130
x86_64               randconfig-a016-20230130
hexagon              randconfig-r041-20230129
riscv                randconfig-r042-20230129
riscv                randconfig-r042-20230130
hexagon              randconfig-r045-20230130
hexagon              randconfig-r041-20230130
hexagon              randconfig-r045-20230129
s390                 randconfig-r044-20230129
s390                 randconfig-r044-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a014-20230130
i386                 randconfig-a013-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130
i386                 randconfig-a011-20230130
x86_64                        randconfig-k001
powerpc                 mpc8560_ads_defconfig
arm                          ixp4xx_defconfig
arm                         s5pv210_defconfig
powerpc                     skiroot_defconfig
powerpc                    gamecube_defconfig
powerpc                        fsp2_defconfig
arm                       versatile_defconfig
powerpc                      pmac32_defconfig
powerpc                        icon_defconfig
mips                       lemote2f_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                    mvme5100_defconfig
arm                         s3c2410_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
