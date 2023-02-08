Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 667C568E908
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Feb 2023 08:35:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbjBHHfD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Feb 2023 02:35:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbjBHHfB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Feb 2023 02:35:01 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9973C3346B
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Feb 2023 23:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675841697; x=1707377697;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dkjX7FlQTXowv92RvPwTXln47srfAVp0CUY+vIRGBNs=;
  b=Udxkkc1RmA6TFzl8g+3nURzn88Ha9+7dxhcVBbl4ZO41kapMJTbYMI3n
   cBWCs0u58R9mcdrnAYBZ9X6FhJF1YADUncpowxf8bGBAE63BCLXsqVgSz
   wvkYgGBo1AaWGegEQLc1AM2TiNrDBdF14jYWlRjY3rkBG94n7saCyfGEC
   vJTe3XbahScZpl+0GUghhmh5/CsnU+nTDqwDmXZ9IfAep4KfgZ6Ss7bu7
   GfUJ/4jlqUwC8+TYC4EIrMByKT5rQri7RpMJVXGYRfNyP0+O8fWOunDpQ
   k8I+ZkEr2cYUthsX885esuEy9npP1ABPwMelNB0m8BiNf4IOaFoyWBGei
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="392129778"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="392129778"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 23:34:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="912641445"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="912641445"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Feb 2023 23:34:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pPeyl-0004HD-0W;
        Wed, 08 Feb 2023 07:34:55 +0000
Date:   Wed, 08 Feb 2023 15:34:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 2026dc209b160f390f3c9d2abc3020561fe63204
Message-ID: <63e35077.Y6Gp+La3hSE3pkMd%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 2026dc209b160f390f3c9d2abc3020561fe63204  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 724m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
x86_64                           rhel-8.3-bpf
s390                                defconfig
s390                             allyesconfig
ia64                             allmodconfig
alpha                            allyesconfig
powerpc                           allnoconfig
x86_64                           rhel-8.3-syz
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                         rhel-8.3-kunit
arc                              allyesconfig
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
arm                                 defconfig
x86_64                              defconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                               rhel-8.3
i386                 randconfig-a013-20230206
i386                 randconfig-a011-20230206
i386                 randconfig-a014-20230206
i386                 randconfig-a012-20230206
i386                 randconfig-a015-20230206
i386                 randconfig-a016-20230206
arm64                            allyesconfig
x86_64                           allyesconfig
arm                              allyesconfig
x86_64               randconfig-a013-20230206
s390                 randconfig-r044-20230206
x86_64               randconfig-a011-20230206
arc                  randconfig-r043-20230205
x86_64               randconfig-a012-20230206
arm                  randconfig-r046-20230205
x86_64               randconfig-a014-20230206
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a015-20230206
x86_64                          rhel-8.3-func
x86_64               randconfig-a016-20230206
arc                  randconfig-r043-20230206
i386                                defconfig
riscv                randconfig-r042-20230206
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r041-20230205
riscv                randconfig-r042-20230205
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
x86_64                          rhel-8.3-rust
arm                  randconfig-r046-20230206
s390                 randconfig-r044-20230205
hexagon              randconfig-r045-20230205
i386                 randconfig-a002-20230206
i386                 randconfig-a004-20230206
i386                 randconfig-a003-20230206
i386                 randconfig-a001-20230206
i386                 randconfig-a005-20230206
i386                 randconfig-a006-20230206

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
