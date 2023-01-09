Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D18756635D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 00:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237789AbjAIXtB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Jan 2023 18:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237905AbjAIXsM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2023 18:48:12 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F8A41D78
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Jan 2023 15:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673308004; x=1704844004;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=K/+Y2eq/oc8W40lJVieY3zJcbAeNhMgoI8vwaJELkFQ=;
  b=J99eQT0aJbsBklVGlce/xzjyUoSKAJuz1r8nTmH1jyQZrYuOUf8fsvRK
   UTjl36DQjQJF6iMsecv2V/Zaz8JBRXKPJRw5Zq+ixNFuZ6QOgCaZQP5pv
   IyWrdr93S5pa0rwHbt+YiUu+x68besJTOVeqHn9WLeKS3BnoAhkyo/2Am
   mIaPIvfMwdnLtfNLa4RjPJhSt3V4039d03woNaeLasx44H+p5wrNT7Eip
   B779uVw2DqVLvyk6iAD+gymOtbA1ngpWIorZoxEVGFB6B0B4gTme0e61r
   pjsTCEAM9/zUhrrvDDvqxS4KlG6MYGfpCvZkKXEHw9dqrte4aErc+v/xL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="310813648"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; 
   d="scan'208";a="310813648"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 15:46:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="830789763"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; 
   d="scan'208";a="830789763"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 09 Jan 2023 15:46:41 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pF1qi-0007N9-2i;
        Mon, 09 Jan 2023 23:46:40 +0000
Date:   Tue, 10 Jan 2023 07:46:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 84545c94403b4b5a90561c9c97c2c2c00091cff1
Message-ID: <63bca74c.phlRqHk1krAnhufn%lkp@intel.com>
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
branch HEAD: 84545c94403b4b5a90561c9c97c2c2c00091cff1  Merge tag 'v6.2-rc3' into renesas-devel

elapsed time: 726m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
i386                                defconfig
powerpc                           allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           rhel-8.3-bpf
sh                               allmodconfig
x86_64                           rhel-8.3-syz
arm                                 defconfig
x86_64                         rhel-8.3-kunit
mips                             allyesconfig
x86_64                           rhel-8.3-kvm
powerpc                          allmodconfig
arc                                 defconfig
x86_64               randconfig-a012-20230109
s390                             allmodconfig
x86_64                        randconfig-a002
x86_64               randconfig-a014-20230109
i386                 randconfig-a011-20230109
i386                 randconfig-a013-20230109
x86_64                        randconfig-a006
i386                 randconfig-a012-20230109
ia64                             allmodconfig
x86_64                        randconfig-a004
i386                 randconfig-a014-20230109
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64               randconfig-a011-20230109
arm64                            allyesconfig
alpha                               defconfig
i386                 randconfig-a016-20230109
x86_64               randconfig-a016-20230109
i386                 randconfig-a015-20230109
arm                              allyesconfig
x86_64               randconfig-a013-20230109
s390                                defconfig
i386                             allyesconfig
s390                             allyesconfig
x86_64               randconfig-a015-20230109
riscv                randconfig-r042-20230109
s390                 randconfig-r044-20230109
arm                  randconfig-r046-20230108
arc                  randconfig-r043-20230108
arc                  randconfig-r043-20230109

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                          rhel-8.3-rust
x86_64                        randconfig-a005
i386                 randconfig-a004-20230109
i386                 randconfig-a002-20230109
i386                 randconfig-a003-20230109
i386                 randconfig-a001-20230109
i386                 randconfig-a005-20230109
i386                 randconfig-a006-20230109
hexagon              randconfig-r045-20230109
arm                  randconfig-r046-20230109
riscv                randconfig-r042-20230108
hexagon              randconfig-r041-20230108
hexagon              randconfig-r041-20230109
hexagon              randconfig-r045-20230108
s390                 randconfig-r044-20230108

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
