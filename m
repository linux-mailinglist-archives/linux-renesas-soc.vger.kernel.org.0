Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7532B59CC21
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 01:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238076AbiHVXZS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 19:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbiHVXZR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 19:25:17 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E43558C3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 16:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661210716; x=1692746716;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nwp411VJnFxXHwyihLHJRYcu1Grs5itOt0G8v7k9eF8=;
  b=a7k/SpiYj5OdIQgG8/Rkzz7ZT3mkx95e+zrJow4EjXtDm5/ZRk1BAOEI
   lINmxCMZY4N17UvJ/6GxsRjPFwpPaoJl8YrRcq0oXvRYJgBymOAYJ/VlF
   6VnWaZEURyZ9dUZ+Wz+cJC6rpqb/brYqOSF6RDx/2eh4A8wlQ9Pm0mIp1
   srQ2zSBfSa3UletKhsxv0AgOCUZ/V1adcK+18Asp/nhrWZ050DjGdlui4
   ZvvZWp2MffStzgWt2TFO2FvvClgifEBChJN6EXFOpVX+sT0WeduVdxGYg
   Eb9ZcsDr+3xz7DVRRRhYc7Qm83kMthrD7oReKO6HHsaPskJ0CUjE12cNC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="355274876"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="355274876"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 16:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="751470787"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2022 16:25:13 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQGnB-0000qI-0u;
        Mon, 22 Aug 2022 23:25:13 +0000
Date:   Tue, 23 Aug 2022 07:24:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 0b923c18404277346b012fab71a5bf981e8ad927
Message-ID: <63041033.JulZBnm/U74h7FaA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 0b923c18404277346b012fab71a5bf981e8ad927  Merge branch 'renesas-next', tag 'v6.0-rc2' into renesas-devel

elapsed time: 724m

configs tested: 71
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64               randconfig-a012-20220822
x86_64               randconfig-a013-20220822
x86_64               randconfig-a011-20220822
m68k                             allmodconfig
m68k                             allyesconfig
x86_64                              defconfig
x86_64               randconfig-a014-20220822
x86_64               randconfig-a015-20220822
x86_64               randconfig-a016-20220822
arc                  randconfig-r043-20220821
arc                  randconfig-r043-20220822
riscv                randconfig-r042-20220822
x86_64                               rhel-8.3
x86_64                           allyesconfig
s390                 randconfig-r044-20220822
arm                                 defconfig
i386                             allyesconfig
i386                          randconfig-a014
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a012
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
i386                          randconfig-a016
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
alpha                             allnoconfig
csky                              allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                 randconfig-a015-20220822
i386                 randconfig-a016-20220822
i386                 randconfig-a011-20220822
i386                 randconfig-a013-20220822
i386                 randconfig-a014-20220822
i386                 randconfig-a012-20220822

clang tested configs:
i386                 randconfig-a001-20220822
i386                 randconfig-a004-20220822
i386                 randconfig-a002-20220822
i386                 randconfig-a003-20220822
i386                 randconfig-a006-20220822
i386                 randconfig-a005-20220822
hexagon              randconfig-r041-20220822
x86_64               randconfig-a002-20220822
x86_64               randconfig-a004-20220822
x86_64               randconfig-a003-20220822
hexagon              randconfig-r045-20220822
x86_64               randconfig-a001-20220822
riscv                randconfig-r042-20220821
x86_64               randconfig-a005-20220822
hexagon              randconfig-r045-20220821
hexagon              randconfig-r041-20220821
s390                 randconfig-r044-20220821
x86_64               randconfig-a006-20220822
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
