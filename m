Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35947643957
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Dec 2022 00:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbiLEXP3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 18:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbiLEXP0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 18:15:26 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6442BB1C
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 15:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670282126; x=1701818126;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qtliULppthk9JmuTKGwK4rWM4nD+3Mn/yXSJzYDIvg8=;
  b=a9w5RYxgo37jeLhpxbQoWcn5AiWhbatZrOVI7pZIOTfN8Ww4edGeW59j
   c9cbC+XZfeXj+MdMgHHwraaf7b7TKHCoMJ+7/etQu+EU2ZMG7TeIziqTR
   P6lor0ClwMg7Eh9xVohsqdEpmRlY3j46JDDhPa+BLYaVrVZ5fFvNh/3/d
   BnyimMzvAhih+NLUp3/Z/iR7fIK+t3ykfGVOfG+q9a4bnKtijUt8VB+BH
   6NFldnuUygwEtKjbmmFoynTiQkthnzZyfGzMCglat+LNul63HVigK+pn5
   7B39y7ZNCQwn8IHEjYVX5Y8V+3esq95cWzv4xQOTmjkQ/VQH6FPhXonbU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="296843447"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="296843447"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 15:15:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="770518072"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="770518072"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Dec 2022 15:15:22 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p2KgE-0000PW-0g;
        Mon, 05 Dec 2022 23:15:22 +0000
Date:   Tue, 06 Dec 2022 07:14:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-riscv-dt-for-v6.3] BUILD SUCCESS
 6f4b3272458eb78d1c84831bfca3c6eccef03cc3
Message-ID: <638e7b5e.tm0g3m+rdKBVDj58%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-riscv-dt-for-v6.3
branch HEAD: 6f4b3272458eb78d1c84831bfca3c6eccef03cc3  riscv: dts: renesas: rzfive-smarc-som: Enable WDT

elapsed time: 731m

configs tested: 64
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
powerpc                           allnoconfig
s390                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
i386                                defconfig
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
arc                  randconfig-r043-20221205
i386                 randconfig-a014-20221205
i386                 randconfig-a013-20221205
i386                 randconfig-a012-20221205
i386                 randconfig-a015-20221205
i386                 randconfig-a011-20221205
i386                 randconfig-a016-20221205
s390                 randconfig-r044-20221205
riscv                randconfig-r042-20221205
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a014-20221205
x86_64               randconfig-a011-20221205
x86_64               randconfig-a012-20221205
x86_64               randconfig-a013-20221205
x86_64               randconfig-a015-20221205
x86_64               randconfig-a016-20221205
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                            allnoconfig

clang tested configs:
x86_64               randconfig-a003-20221205
x86_64               randconfig-a004-20221205
x86_64               randconfig-a006-20221205
x86_64               randconfig-a005-20221205
x86_64               randconfig-a001-20221205
x86_64               randconfig-a002-20221205
arm                  randconfig-r046-20221205
hexagon              randconfig-r041-20221205
hexagon              randconfig-r045-20221205
i386                 randconfig-a001-20221205
i386                 randconfig-a004-20221205
i386                 randconfig-a002-20221205
i386                 randconfig-a005-20221205
i386                 randconfig-a006-20221205
i386                 randconfig-a003-20221205
hexagon              randconfig-r041-20221204
riscv                randconfig-r042-20221204
hexagon              randconfig-r045-20221204
s390                 randconfig-r044-20221204

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
