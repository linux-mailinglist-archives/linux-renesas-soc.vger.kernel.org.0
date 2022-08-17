Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56E265968BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Aug 2022 07:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238548AbiHQFlZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Aug 2022 01:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238599AbiHQFlW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Aug 2022 01:41:22 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A4B78239
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 22:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660714875; x=1692250875;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SHQR44hybNMxYfI7V7OU0ZDhcH1Cc6vFEDzkwwEAVNM=;
  b=feekdkE0nCR8ZD7LEjIAKncos5MUvFc9FDX1t7pr7bO6bI8QIkHQ/f2O
   aKxo1dJav3HX5RzH6To3TQEG3+Dbe8l/MnrJblphJd6vfu9AXtvMaoNC7
   oYaDIl2r/aYSjyXwzoRwA/ftKVOEWtT8N6HDWm44Q7npVqBW0FaoRCJK9
   12uSrfRJ34xgQOI974yCkKlw/aZC0qslGuDBWr0+B9cTXwdRUxtatKmLO
   SJmpuaA6d+qReqpETEQqusl22bSwg9bOde8+UXZOqzNjXGvtZ7yFYJsU7
   H199m92Crt/9jRbd5zryvvEXLsmCoveLkNgvTa294rhByrq3F0SVNs25b
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="272174434"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="272174434"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 22:41:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="583618788"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Aug 2022 22:41:12 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oOBnj-0000cv-2A;
        Wed, 17 Aug 2022 05:41:11 +0000
Date:   Wed, 17 Aug 2022 13:40:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 6f736f21cd347c5a1f4130cb05253c9503e72c3d
Message-ID: <62fc7f64.x+m7A2OLV85wz083%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 6f736f21cd347c5a1f4130cb05253c9503e72c3d  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 812m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arc                  randconfig-r043-20220815
i386                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                 randconfig-a003-20220815
i386                 randconfig-a004-20220815
i386                 randconfig-a006-20220815
m68k                             allyesconfig
i386                 randconfig-a005-20220815
i386                 randconfig-a002-20220815
arm                                 defconfig
x86_64               randconfig-a001-20220815
x86_64               randconfig-a003-20220815
powerpc                          allmodconfig
x86_64               randconfig-a005-20220815
x86_64               randconfig-a004-20220815
i386                 randconfig-a001-20220815
x86_64               randconfig-a002-20220815
x86_64               randconfig-a006-20220815
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
ia64                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                               rhel-8.3
x86_64                           allyesconfig
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
i386                 randconfig-c001-20220815
m68k                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220815
hexagon              randconfig-r041-20220815
s390                 randconfig-r044-20220815
riscv                randconfig-r042-20220815
x86_64               randconfig-a012-20220815
x86_64               randconfig-a011-20220815
x86_64               randconfig-a015-20220815
x86_64               randconfig-a014-20220815
x86_64               randconfig-a013-20220815
x86_64               randconfig-a016-20220815
i386                 randconfig-a012-20220815
i386                 randconfig-a011-20220815
i386                 randconfig-a013-20220815
i386                 randconfig-a015-20220815
i386                 randconfig-a014-20220815
i386                 randconfig-a016-20220815

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
