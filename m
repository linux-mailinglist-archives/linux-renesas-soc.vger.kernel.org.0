Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01DBD5BD5AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 22:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiISUUb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 16:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiISUUY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 16:20:24 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B464A836
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 13:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663618816; x=1695154816;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+CzLN6PRyZw+nyX1LP9YlBPykL0/OMHzLiqmbTkbTp8=;
  b=Yyn14NiZkQhilFEaLEIc/Cw+OgOJ4W5/EB5nzC5NYsI4n6OPx8UPXchH
   j4Zo4KnOQacwwsIqHNZ9DDYmX2QKVED1J83tBjtCWXrgXX+i7Y/8PTjLB
   6Gp0f0yku02XMurKUWnH0TGBzDzKs6a6w0KJJIk3Q2Jpil9gHCBb8mOYk
   OhQ2UuZzAUnVgrfIsRx3MsR79UTVLBSE4dtD1bs0erkSUPyAu/IKuQkC0
   WR/+rbKYJxGkgNJmRNOhpYy35Y7biPZWpn+gswTRlAa7dmroVG1J091vO
   5gNxwC5Gk4v77ZrA6t2P/CojcFyHuO4U6ZVkq44YSTbT+HmvCyotwa89I
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="325808560"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="325808560"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 13:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="618634092"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Sep 2022 13:20:12 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oaNFT-0002D3-2o;
        Mon, 19 Sep 2022 20:20:11 +0000
Date:   Tue, 20 Sep 2022 04:19:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 5c8e5995413313a628eb0f9ea0d9ae6641854298
Message-ID: <6328cec3.ekfBQ6P+BGfVEgER%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 5c8e5995413313a628eb0f9ea0d9ae6641854298  Merge tag 'v6.0-rc6' into renesas-devel

elapsed time: 724m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
arc                                 defconfig
alpha                               defconfig
arc                  randconfig-r043-20220919
x86_64                               rhel-8.3
s390                 randconfig-r044-20220919
riscv                randconfig-r042-20220919
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a012-20220919
s390                             allmodconfig
i386                                defconfig
i386                 randconfig-a013-20220919
x86_64               randconfig-a011-20220919
i386                 randconfig-a012-20220919
x86_64                           allyesconfig
i386                 randconfig-a014-20220919
s390                                defconfig
i386                 randconfig-a011-20220919
arm                                 defconfig
x86_64               randconfig-a014-20220919
i386                 randconfig-a016-20220919
x86_64                          rhel-8.3-func
i386                 randconfig-a015-20220919
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a015-20220919
s390                             allyesconfig
x86_64               randconfig-a013-20220919
x86_64                           rhel-8.3-syz
x86_64               randconfig-a016-20220919
i386                             allyesconfig
arm                              allyesconfig
mips                             allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
powerpc                           allnoconfig
ia64                             allmodconfig
arm64                            allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220919
hexagon              randconfig-r045-20220919
i386                 randconfig-a001-20220919
i386                 randconfig-a006-20220919
i386                 randconfig-a002-20220919
i386                 randconfig-a003-20220919
x86_64               randconfig-a003-20220919
i386                 randconfig-a004-20220919
x86_64               randconfig-a001-20220919
i386                 randconfig-a005-20220919
x86_64               randconfig-a002-20220919
x86_64               randconfig-a004-20220919
x86_64               randconfig-a006-20220919
x86_64               randconfig-a005-20220919

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
