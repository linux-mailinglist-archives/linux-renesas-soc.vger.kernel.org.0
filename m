Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E33EE67FA83
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jan 2023 20:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjA1Tmy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 28 Jan 2023 14:42:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbjA1Tmx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 28 Jan 2023 14:42:53 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3595FDE
        for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Jan 2023 11:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674934971; x=1706470971;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XaFWBHRgSMhhyWvMF9kdYAVUVrWqCjlxy1vjXDjYyTQ=;
  b=gk53eYvzNukcuLFc2rHE1MCw7OLm5MPP+9b5Nkaq0jit49/sGAm03+sF
   bhApUfwEtwlQNgWmFpbBunIfvxmKunui8P326Jhf45Je2btfaFenlEO+b
   rD1MppWf/8DzELcHurS94bhys/uVMlBI3ky5ybNUr7EoaYT1mgXFIEYwf
   FSTPtVbvhHPhMAdbkUpTFDBYzxh/5yjqq6G0wV+HlLUA1d0vcnyMhjA8W
   YsMjHPfs7w4G5k/2rdfOuVmiEqGctnEfS0o32ji6eRKycDK19Eb8YU+Nz
   XXEfgVmVHTSDhHzbsVJL393Tt5VPOQN9tEvJUyMlUEOye8+JMtP5Nhsip
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="328613155"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="328613155"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 11:42:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="727046020"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="727046020"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jan 2023 11:42:49 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pLr68-00012a-3D;
        Sat, 28 Jan 2023 19:42:49 +0000
Date:   Sun, 29 Jan 2023 03:42:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 635b2020aa8744f7174ce492c342357cb34c9e86
Message-ID: <63d57ab2.+1UNwjzGG2Rh+vdD%lkp@intel.com>
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
branch HEAD: 635b2020aa8744f7174ce492c342357cb34c9e86  Merge branch 'renesas-next' into renesas-devel

elapsed time: 1056m

configs tested: 31
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
sh                               allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
mips                             allyesconfig
powerpc                          allmodconfig
i386                                defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
