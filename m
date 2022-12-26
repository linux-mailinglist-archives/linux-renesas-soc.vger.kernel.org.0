Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44ACB6565F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Dec 2022 00:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbiLZXJG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 18:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbiLZXJF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 18:09:05 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F467EA4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 15:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672096144; x=1703632144;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=we2DY4IZHKFv7aymhoQF3Eu+ga7pXw6j7spH501lm5I=;
  b=ITvfOdhEGy7UFJDhrccvZhjTkwlsdQLcxCuR1HURMH5bYEduOUE4HzuE
   oqHZ+BLBiPM3zOa9WUusfdLW1NPnRxddBqVKq2frfD+T1Ulx1t048SGKa
   wxM5TsiIoM386zgzR9LNadAr5WKCJGR5jlWZJJdq/8jAF5UMrFAHMr8Ne
   IDOjoO8WNDmwHCKG37Dyf0/bMewwjQZrE+8WEFX0UoCxkgkfOLYeno8/l
   qqq48ew+HKMdwgKPxAWKb3JWaHFVdDIvRQYe/gO+x3MKAZ/78y856VTF0
   YBgr/y5dz4L5vc5vSMw8qGr8vm+yybtUegypj6TZksGMmjaw9cQbsrkVG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="318287819"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="318287819"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2022 15:09:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="652877058"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="652877058"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Dec 2022 15:09:02 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p9wab-000Ehk-2m;
        Mon, 26 Dec 2022 23:09:01 +0000
Date:   Tue, 27 Dec 2022 07:08:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v6.3] BUILD SUCCESS
 b8f29b94bb7b383de5e0d1a16b22a73411295827
Message-ID: <63aa2976.3apk1/E45lnczHgl%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v6.3
branch HEAD: b8f29b94bb7b383de5e0d1a16b22a73411295827  arm64: dts: renesas: white-hawk-cpu: Add DP output support

elapsed time: 720m

configs tested: 11
configs skipped: 122

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
x86_64                            allnoconfig
i386                          randconfig-c001
i386                             allyesconfig
i386                                defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                     tqm8541_defconfig
ia64                        generic_defconfig
powerpc                 mpc837x_mds_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
