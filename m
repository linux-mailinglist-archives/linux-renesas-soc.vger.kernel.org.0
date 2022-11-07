Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 195766203FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Nov 2022 00:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbiKGXuo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Nov 2022 18:50:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbiKGXuo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 18:50:44 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB311FFAE
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Nov 2022 15:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667865043; x=1699401043;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=P+nf1d6j8nLsOhyHznubzcNk1+0rYIpffIxiK/nSco0=;
  b=NFOEDHP0yMnsyDW0BsDRTfHMKEV3YI7KYadcdk17PWHV1VQLQTbL5OLB
   W8bGWMLpmh67UNjGIrY6QLbIgigypZGkzxr6kT+QzVaUJBKAxT0eIkJQd
   9tiPXjGim4rydEU8k6iK44FPllp51SS5Tocp3Ot0zHdef8eELNfXs0ebh
   uuMlwlNSmZ402S5QmfZc065taw/T/VVwoPIUQbyW/UgD18XCVImsx/lh0
   WXgQw/grqBtkvTvEMMlvmt0ArdkK27C20ODRJvJq0qocHpCdMdnNc66qD
   cmt1e/YGym1M4S9Hw0pv/wZSQ1MS/N8dEDGVdf3cvAwZkUUPRrZa3VtWy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308176734"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="308176734"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 15:50:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="636111548"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="636111548"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Nov 2022 15:50:25 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1osBsm-0001JV-2U;
        Mon, 07 Nov 2022 23:50:24 +0000
Date:   Tue, 08 Nov 2022 07:49:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 d49546ff226ac7b625b180afe6df8247a16964a5
Message-ID: <63699994.CHKwgY6Vprwbftyv%lkp@intel.com>
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
branch HEAD: d49546ff226ac7b625b180afe6df8247a16964a5  Merge tag 'v6.1-rc4' into renesas-devel

elapsed time: 722m

configs tested: 65
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arc                  randconfig-r043-20221107
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
ia64                             allmodconfig
i386                 randconfig-a002-20221107
i386                 randconfig-a003-20221107
i386                 randconfig-a004-20221107
i386                 randconfig-a005-20221107
i386                 randconfig-a001-20221107
i386                 randconfig-a006-20221107
i386                                defconfig
x86_64               randconfig-a004-20221107
x86_64               randconfig-a001-20221107
x86_64               randconfig-a003-20221107
x86_64               randconfig-a005-20221107
x86_64               randconfig-a006-20221107
x86_64               randconfig-a002-20221107
i386                             allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016

clang tested configs:
hexagon              randconfig-r041-20221107
s390                 randconfig-r044-20221107
x86_64               randconfig-a014-20221107
x86_64               randconfig-a011-20221107
x86_64               randconfig-a013-20221107
x86_64               randconfig-a012-20221107
x86_64               randconfig-a015-20221107
x86_64               randconfig-a016-20221107
riscv                randconfig-r042-20221107
hexagon              randconfig-r045-20221107
i386                 randconfig-a013-20221107
i386                 randconfig-a011-20221107
i386                 randconfig-a012-20221107
i386                 randconfig-a014-20221107
i386                 randconfig-a016-20221107
i386                 randconfig-a015-20221107
hexagon              randconfig-r041-20221108
hexagon              randconfig-r045-20221108
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
