Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7B0664E25
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 22:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbjAJVkB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 16:40:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbjAJVj4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 16:39:56 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF13B15
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 13:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673386796; x=1704922796;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AWfOUNdGabU006jVHEHiN/Nv0pAl+ovd8d/5x3U6JPM=;
  b=B0Ufdx0O1vMjzMBT3wxjSeeEWyH81AiYTSGexC8QS+3KY9f8dyp56GTg
   Q5w86Ejjbl0gwIqWehwpnGtL7vxpDHTKITTEI6r2PeERlQTuFXWUDtOGj
   j9JXEdwG6SO33lEHQU3LBIiNqqHEKDmx528TUOLUf+TyQmIOUWhcKQLkb
   VsZTiRNbatqx5S9h2IILnYZfBfGT/5zVp8fCDcPx8gI6puY5FffnaOYzt
   FD1+6d78j0JNEQgCpetv+dUTBXJ3tscklHQUCriXskCXnpx3vQcEaIQfn
   qLbBwc3RlmTvMn4Qf93PXUR/DzfoRJ/qBK3ou+fG7pAfZ10H73GG70rRQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311069163"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="311069163"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 13:39:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="725681419"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="725681419"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jan 2023 13:39:51 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pFMLW-0008OA-1D;
        Tue, 10 Jan 2023 21:39:50 +0000
Date:   Wed, 11 Jan 2023 05:39:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 c1aa674b1c83163a1d232cc65c77eaff7041b663
Message-ID: <63bddaf8.PCwwul1ChpDSi0fs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: c1aa674b1c83163a1d232cc65c77eaff7041b663  Merge branches 'renesas-next' and 'topic/renesas-defconfig' into renesas-devel

elapsed time: 722m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
ia64                             allmodconfig
i386                                defconfig
x86_64               randconfig-a011-20230109
x86_64               randconfig-a013-20230109
x86_64               randconfig-a012-20230109
i386                 randconfig-a014-20230109
x86_64                              defconfig
i386                 randconfig-a011-20230109
x86_64               randconfig-a014-20230109
i386                 randconfig-a013-20230109
x86_64                               rhel-8.3
x86_64               randconfig-a016-20230109
i386                 randconfig-a012-20230109
i386                 randconfig-a016-20230109
x86_64               randconfig-a015-20230109
sh                               allmodconfig
i386                 randconfig-a015-20230109
i386                          randconfig-a001
mips                             allyesconfig
x86_64                           allyesconfig
powerpc                          allmodconfig
m68k                             allmodconfig
i386                          randconfig-a003
m68k                             allyesconfig
alpha                            allyesconfig
i386                          randconfig-a005
arc                              allyesconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
i386                             allyesconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
riscv                randconfig-r042-20230109
s390                 randconfig-r044-20230109
arm                  randconfig-r046-20230108
arc                  randconfig-r043-20230108
arc                  randconfig-r043-20230109
arm                                 defconfig
x86_64                          rhel-8.3-func
s390                                defconfig
s390                             allyesconfig
arm                              allyesconfig
x86_64                    rhel-8.3-kselftests
arm64                            allyesconfig

clang tested configs:
i386                          randconfig-a002
hexagon              randconfig-r045-20230109
i386                          randconfig-a004
arm                  randconfig-r046-20230109
riscv                randconfig-r042-20230108
hexagon              randconfig-r041-20230108
hexagon              randconfig-r041-20230109
i386                          randconfig-a006
hexagon              randconfig-r045-20230108
s390                 randconfig-r044-20230108
x86_64               randconfig-a003-20230109
x86_64               randconfig-a002-20230109
x86_64                          rhel-8.3-rust
x86_64               randconfig-a004-20230109
x86_64               randconfig-a005-20230109
x86_64               randconfig-a001-20230109
x86_64               randconfig-a006-20230109

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
