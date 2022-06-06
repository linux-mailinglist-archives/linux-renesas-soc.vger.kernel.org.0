Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E94FC53F23F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jun 2022 00:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235145AbiFFWsf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jun 2022 18:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235139AbiFFWsd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 18:48:33 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF71EB7F1
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jun 2022 15:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654555712; x=1686091712;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vfEE5suOfoiZfxEbqpElzxRIB0ZjJGmaNIW5UhKI+KI=;
  b=VCKyNR1ph5vj6hhZYG5SXN+3/h5ixw7gR+h7KUpDhRXNWp3pbtSirYQT
   I0/2nXF/wqQQPyzxfNiND++SvuuPsGAid7YS7PRe8GFcMrP0EXj/6qdcZ
   kRDLTIjkznznKpq4uQm9c5BLPhADl7ucvFIG6bkuM0VaeR36SrF9aDR+f
   vik7vV6nI4lK76d7hYh/yBZpd7b8wkr4ZSr/5liKPm2q5WklhzXgGu9+2
   EZW8/FooyapZi5F66ueSjnAnkjtmD9MubA3T+HALWXxPsAqQRWSYmFO+D
   nNc48dpjhrhmsS1HedBTvUfgFSQAOOiFRWRgtRmk43zySCZbC3jhuIhWu
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="363042270"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="363042270"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 15:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="647775049"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Jun 2022 15:48:31 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nyLWQ-000D6T-KQ;
        Mon, 06 Jun 2022 22:48:30 +0000
Date:   Tue, 07 Jun 2022 06:47:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 f85c6f32f3b66d2a7851b4a7dea876839910bb37
Message-ID: <629e841c.mRdOapfgB/Zu9eNY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: f85c6f32f3b66d2a7851b4a7dea876839910bb37  Merge branch 'renesas-arm-dt-for-v5.20' into renesas-next

elapsed time: 748m

configs tested: 75
configs skipped: 104

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                          randconfig-c001
x86_64                        randconfig-c001
arm                  randconfig-c002-20220605
riscv                             allnoconfig
h8300                            allyesconfig
m68k                             allyesconfig
xtensa                           allyesconfig
m68k                             allmodconfig
csky                                defconfig
arc                                 defconfig
mips                             allyesconfig
nios2                            allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
alpha                            allyesconfig
mips                             allmodconfig
sh                               allmodconfig
parisc                              defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
sparc                               defconfig
powerpc                          allyesconfig
i386                             allyesconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
sparc                            allyesconfig
powerpc                          allmodconfig
i386                                defconfig
um                             i386_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
ia64                             allmodconfig
arm64                               defconfig
ia64                             allyesconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
ia64                                defconfig
x86_64                        randconfig-a011
i386                          randconfig-a010
i386                          randconfig-a012
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a008
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a007
i386                          randconfig-a005
i386                          randconfig-a009
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc              randconfig-c003-20220606
riscv                randconfig-c006-20220606
s390                 randconfig-c005-20220606
i386                 randconfig-c001-20220606
mips                 randconfig-c004-20220606
x86_64               randconfig-c007-20220606
arm                  randconfig-c002-20220606
powerpc                      walnut_defconfig
mips                        omega2p_defconfig
powerpc                   microwatt_defconfig
powerpc                 mpc8272_ads_defconfig
arm                                 defconfig
mips                           rs90_defconfig
arm                         s3c2410_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
