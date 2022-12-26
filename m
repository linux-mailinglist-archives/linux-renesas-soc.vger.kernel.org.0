Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6796565F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Dec 2022 00:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232314AbiLZXJI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 18:09:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbiLZXJF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 18:09:05 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C2210A2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 15:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672096145; x=1703632145;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=02fUi1AWks32bDvRqMGRRvKmWiRujRA7hojLm1WI0Dk=;
  b=RO/zoXgOX6VV2HsBJLTUv09rjocORtT6elPEKv9v2eRIQLHM6ddU2agb
   ClQ+YnWmeT/qX/HAoglykmVmlhZ2eKTZrojO7WRWzFuD3e4pRBEUj8wn5
   6+QbYKeKzDg5XQyQt8T4nyCnoOYLBXLV6LuWl19GwjmcmiRNBm/88HdUo
   0CH89ZGF2qMGEc9vaRJC8r2svzcZrNl183VNkCSXfw8yJbJ+WKNqxENb2
   L25neQBrQ1Y6u1HlhRtzGRXAlnixLYtqd2OugQ6shak82yGl4aPP2JPj9
   UUIgvuVVYGK4EOsBE4gQiuyd6J2KNZJkyP4iA4EjC55BV+ytc1JoXc5tI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="318287820"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="318287820"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2022 15:09:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="652877059"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="652877059"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Dec 2022 15:09:02 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p9wac-000Ehw-0O;
        Mon, 26 Dec 2022 23:09:02 +0000
Date:   Tue, 27 Dec 2022 07:08:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 b0aba6507e1ff279b0c30d78c75eb192aaedf22b
Message-ID: <63aa2989.2lWQHPtdtOtFSFXM%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: b0aba6507e1ff279b0c30d78c75eb192aaedf22b  Merge branch 'renesas-next' into renesas-devel

elapsed time: 722m

configs tested: 88
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
sh                               allmodconfig
arc                                 defconfig
um                             i386_defconfig
mips                             allyesconfig
s390                             allmodconfig
um                           x86_64_defconfig
alpha                               defconfig
s390                                defconfig
x86_64                              defconfig
alpha                            allyesconfig
arc                              allyesconfig
s390                             allyesconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
i386                                defconfig
m68k                             allyesconfig
i386                 randconfig-a012-20221226
i386                 randconfig-a011-20221226
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
i386                 randconfig-a013-20221226
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                 randconfig-a014-20221226
i386                 randconfig-a016-20221226
arm                                 defconfig
x86_64               randconfig-a014-20221226
x86_64               randconfig-a016-20221226
x86_64                           allyesconfig
i386                 randconfig-a015-20221226
x86_64               randconfig-a013-20221226
powerpc                          allmodconfig
ia64                             allmodconfig
x86_64               randconfig-a011-20221226
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a012-20221226
x86_64               randconfig-a015-20221226
mips                         rt305x_defconfig
x86_64                          rhel-8.3-func
arm64                            alldefconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                  randconfig-r046-20221225
arc                  randconfig-r043-20221225
arc                  randconfig-r043-20221226
riscv                randconfig-r042-20221226
s390                 randconfig-r044-20221226
x86_64                            allnoconfig
parisc                           alldefconfig
arm                          badge4_defconfig
powerpc                     mpc83xx_defconfig
sh                          rsk7201_defconfig
m68k                       m5475evb_defconfig
m68k                        m5407c3_defconfig
xtensa                              defconfig
microblaze                          defconfig
mips                      maltasmvp_defconfig
arc                    vdk_hs38_smp_defconfig
arm64                               defconfig

clang tested configs:
x86_64               randconfig-a002-20221226
x86_64               randconfig-a003-20221226
i386                 randconfig-a004-20221226
x86_64                          rhel-8.3-rust
i386                 randconfig-a001-20221226
i386                 randconfig-a003-20221226
x86_64               randconfig-a001-20221226
i386                 randconfig-a002-20221226
arm                          pcm027_defconfig
powerpc                     ppa8548_defconfig
i386                 randconfig-a006-20221226
x86_64               randconfig-a004-20221226
i386                 randconfig-a005-20221226
x86_64               randconfig-a005-20221226
x86_64               randconfig-a006-20221226
riscv                             allnoconfig
hexagon              randconfig-r045-20221225
hexagon              randconfig-r041-20221225
hexagon              randconfig-r041-20221226
arm                  randconfig-r046-20221226
hexagon              randconfig-r045-20221226
s390                 randconfig-r044-20221225
riscv                randconfig-r042-20221225
arm                         orion5x_defconfig
arm                         shannon_defconfig
arm                          moxart_defconfig
arm                          ep93xx_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
