Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 034A65ADA66
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Sep 2022 22:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbiIEUv4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Sep 2022 16:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiIEUvz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Sep 2022 16:51:55 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C18C50044
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Sep 2022 13:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662411114; x=1693947114;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iYx36QRI8zOgJ1UsZLjSXw5j3KU7eEMHqkrcxQNs/D8=;
  b=bMpvGUt3quwRi4cX0uqLDv0IrvYFuPxsZzaE5wshsxrH6/yhB/+QrnGw
   PXNBE+59AViMfO/MVnO2KRwQ/lTfUes0rmsDTrw53ZVTY6lqfEfuTcrfL
   ycj982HWowQwrkl4wwAtt3ZMvMZggC/H8apou3RYCrJUuo6/3m8N/Bmqq
   LC/A7gSVGPYUqjgKvmlW46v6s1hR2AmSOd8c2ENS7Ur59qjLzB7e8TK02
   w50THA9Nf+O+Gux2jqnOjHHLVK308uv/E4LNTi2fyZf4iQ09gdiuahKKZ
   U3accxJTcK8I9zbv/XMgnDjJg0pGVLo7Oh6SH1otALFz5KjHnv+u7XSDI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="295188790"
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="295188790"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 13:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="682163231"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Sep 2022 13:51:53 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oVJ4S-0004We-1M;
        Mon, 05 Sep 2022 20:51:52 +0000
Date:   Tue, 06 Sep 2022 04:51:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 ce5bd4a14031a91fb83af3882c226513c60d5bf1
Message-ID: <63166158.rlvb3+1WJ4GA3HsW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: ce5bd4a14031a91fb83af3882c226513c60d5bf1  Merge tag 'v6.0-rc4' into renesas-devel

elapsed time: 725m

configs tested: 51
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20220905
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-a001-20220905
i386                 randconfig-a002-20220905
i386                 randconfig-a005-20220905
i386                 randconfig-a006-20220905
i386                 randconfig-a004-20220905
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
sh                               allmodconfig
i386                             allyesconfig
arc                  randconfig-r043-20220905
x86_64                              defconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20220905
x86_64               randconfig-a002-20220905
x86_64               randconfig-a001-20220905
x86_64               randconfig-a004-20220905
x86_64                          rhel-8.3-func
x86_64               randconfig-a005-20220905
x86_64               randconfig-a006-20220905
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
ia64                             allmodconfig
arc                               allnoconfig
alpha                             allnoconfig
csky                              allnoconfig
riscv                             allnoconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r045-20220905
i386                 randconfig-a013-20220905
i386                 randconfig-a012-20220905
riscv                randconfig-r042-20220905
i386                 randconfig-a011-20220905
hexagon              randconfig-r041-20220905
i386                 randconfig-a014-20220905
s390                 randconfig-r044-20220905
i386                 randconfig-a015-20220905
i386                 randconfig-a016-20220905

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
