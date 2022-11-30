Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2280C63DEE2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Nov 2022 19:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbiK3Sl5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Nov 2022 13:41:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbiK3Slo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2022 13:41:44 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD9FB99F59
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Nov 2022 10:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669833702; x=1701369702;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5oG0UUVcr4WsI5jIBh5HTKshbfPZICGGMJpi7BUgK0o=;
  b=ECmcNrFlG1UU2ur2H1wTa/qTIuWqyCZFKZ9VOxXNv4j0NQOXvS6GQO0x
   eNUHma1MrcXo2KBIekXv4aphuexVz+3yBHosWt5rhqPLkOiS+/NShh7I0
   zCioazwkGkuTK/43RvYtx23CXbIFJqAQSOB+JEIWX7ok9eRUDGLsuI8/8
   cqIH7ESjJthh40jca+gM9AbH42DooXiG6bnMQxodQXdRy2z/2N1CEg/rh
   homyNYUeReoq1LlNvfxldf2uS8ZsUMRpEXmirDNzWkxSxQoGDu/WR6bKm
   SLXtI4cIDSZcG/NjWPhA7CiG7btKA815lZI0QvxFIvn0DPWqa/1urmQVY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="295844903"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="295844903"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 10:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="786575608"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="786575608"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2022 10:41:41 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p0S1Z-000BaN-0d;
        Wed, 30 Nov 2022 18:41:37 +0000
Date:   Thu, 01 Dec 2022 02:40:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 7a5fa28492ec428c43bb3b9a52344b61f8bf83cf
Message-ID: <6387a3b1.5KII9G7Fh461ZH7x%lkp@intel.com>
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
branch HEAD: 7a5fa28492ec428c43bb3b9a52344b61f8bf83cf  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 1020m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                             allyesconfig
powerpc                           allnoconfig
x86_64                              defconfig
sh                               allmodconfig
mips                             allyesconfig
i386                                defconfig
powerpc                          allmodconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20221128
i386                             allyesconfig
x86_64                           allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
alpha                            allyesconfig
x86_64                        randconfig-a006
arc                              allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
m68k                             allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221128
riscv                randconfig-r042-20221128
hexagon              randconfig-r041-20221128
s390                 randconfig-r044-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a011-20221128
x86_64                        randconfig-a001
x86_64               randconfig-a013-20221128
x86_64                        randconfig-a003
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128
x86_64                        randconfig-a005
i386                 randconfig-a012-20221128
i386                 randconfig-a015-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a014-20221128
i386                 randconfig-a016-20221128
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
