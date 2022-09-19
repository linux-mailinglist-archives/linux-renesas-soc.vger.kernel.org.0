Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B92E25BC119
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 03:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiISBpA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 18 Sep 2022 21:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbiISBo6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Sep 2022 21:44:58 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D28E7650
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Sep 2022 18:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663551897; x=1695087897;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=frZFHZj+FX4VDTpz+pHRsddEB4NofpOzjFRjyruW8pE=;
  b=O8gAly1oY1NKFkCVrZ/QZtHHJOBGRguPKzTh3g11aq6+LUBfWgnQG/16
   6Y+R+3Xu6voZ2O/X8lsJGt2Y/40u9dtBTUanw05AhTqqI8/LDiLkWe3Gb
   FuU0J3Gy5NdKTNCKtHzYWfeWkJQ2ET5PQdihLckU/t7UoW822SmI90j8H
   m/4epjazCZ4zWFGAqQR99uqQpVT7lkTauIB1IdoF/g+FJBcLaEe453LHe
   cJm8qZjOQYR3mGiE+4Y9Dq21eu7rKxd4sU2lbbbkkALqvR4GNFWNmaMH9
   SDwh0EGdDkXDXf/+dz0gg1AnNipdYNgyn+ed0RvG+MZyn7A0yIVym9eJG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="299276536"
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="299276536"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2022 18:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="595898919"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Sep 2022 18:44:55 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oa5qA-0001cV-1Q;
        Mon, 19 Sep 2022 01:44:54 +0000
Date:   Mon, 19 Sep 2022 09:44:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-soc-for-v6.1] BUILD SUCCESS
 c2ce1e734282662c0b3117e4f26b831d30370bcb
Message-ID: <6327c982.Nu+O0hoeGwweevyL%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-soc-for-v6.1
branch HEAD: c2ce1e734282662c0b3117e4f26b831d30370bcb  ARM: shmobile: Drop selecting SOC_BUS

elapsed time: 721m

configs tested: 53
configs skipped: 97

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-c001
m68k                         amcore_defconfig
mips                           ci20_defconfig
csky                              allnoconfig
nios2                            allyesconfig
i386                                defconfig
arm                            hisi_defconfig
sh                           se7724_defconfig
m68k                          atari_defconfig
m68k                       m5275evb_defconfig
sh                         microdev_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220918
arm                        mvebu_v7_defconfig
sh                   rts7751r2dplus_defconfig
mips                           xway_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
arm64                               defconfig
ia64                             allyesconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig

clang tested configs:
arm                      tct_hammer_defconfig
powerpc                     ksi8560_defconfig
x86_64                        randconfig-k001
mips                          malta_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
