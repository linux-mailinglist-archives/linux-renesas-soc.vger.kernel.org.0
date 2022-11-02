Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC644615B31
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Nov 2022 04:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiKBDwo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Nov 2022 23:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiKBDwn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2022 23:52:43 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C75275FA
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 20:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667361162; x=1698897162;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Am9VwKzvmHzNvgc67XKqBIpshknPazL8oCkolCvtdHo=;
  b=jYsHpY1efHdfWpXMFEvPtv6jOD/yRHnjLG3ttKqFxn7BKSYQt1Hx5pM2
   73jX7E3i8QKITsUel1dEThuOo6vAphXLsBCBljcn3K51nlx2wetIepdqT
   GMdtel9F3TzMct4OQdpl2RZQ0HWEzGGGdn95ptXnoLDEIukvlqTqw6qla
   LiZ9DhINJbc+32ZJR6QKTZ2py726J7Uw83KuP7En3sopXYYrc7N+3nOZ2
   36ZYIckcjTwqRfgn0fUVorjctKOc+XQx8rpwWZGtZUgAx7kxlOEADnGXv
   eNj2fZ0iqO728f9l5im5PgRstFBv2hcZ/pIZcTHNcWCr6Nv7PFa8krOaa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="289693955"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="289693955"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 20:52:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="612087007"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="612087007"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 01 Nov 2022 20:52:41 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oq4nw-000EPh-2U;
        Wed, 02 Nov 2022 03:52:40 +0000
Date:   Wed, 02 Nov 2022 11:52:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 aacb215c8fa8c4bbef4bfd1230ebd528a59b25be
Message-ID: <6361e97f.CNVEnlxKdgK7cNNy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: aacb215c8fa8c4bbef4bfd1230ebd528a59b25be  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 753m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                               rhel-8.3
x86_64                              defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
s390                             allyesconfig
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20221101
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           allyesconfig
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                                defconfig
arm                                 defconfig
i386                          randconfig-a001
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a006
x86_64                        randconfig-a004
arm                              allyesconfig
m68k                             allmodconfig
powerpc                           allnoconfig
m68k                             allyesconfig
powerpc                          allmodconfig
alpha                            allyesconfig
mips                             allyesconfig
arc                              allyesconfig
sh                               allmodconfig
arm64                            allyesconfig
ia64                             allmodconfig
i386                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016

clang tested configs:
x86_64                        randconfig-a014
hexagon              randconfig-r041-20221101
x86_64                        randconfig-a016
hexagon              randconfig-r045-20221101
x86_64                        randconfig-a012
s390                 randconfig-r044-20221101
riscv                randconfig-r042-20221101
i386                          randconfig-a002
x86_64                        randconfig-a005
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
