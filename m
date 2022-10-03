Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D681C5F3716
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 22:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiJCU3G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 16:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiJCU3E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 16:29:04 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379DA4A81B
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Oct 2022 13:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664828943; x=1696364943;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UqCh7uAjDjI0YF9zlS3bLgLS/jWMuHXYlXIHrhfPuyg=;
  b=QiyWpkACGbxGsVl0YB1EdKW5wwJxY+aZamKrWegYWIHP3jZSKlAi9jT7
   C8ZgsFUjhDWnt3ydRcniMXxf2VaIFAUNW11ocFZH+gEv8VEP1fAs1ylhk
   mUvumRhX3I8LNdNvi5p8qmbvLq8E03x1jrGsEgghw5GWnaHrTqFNKlsx3
   RKJLP3GtN+ephxv4ovON4yBS3dkLiCqat3FfSFhjtCVyumOSMEYPlCrOG
   PzDQUhrOFuABuJoYTTHxvu3kAjD84lf1Jud00eARCvuwwGInQZrr4vN2q
   Y0ON028gOXKCNVAvXtgXEINHqEZKaznURSZ34xaZ1BmEAuY7rHASwN6XF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="304294778"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="304294778"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 13:29:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="952515112"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="952515112"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Oct 2022 13:29:01 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ofS3g-0004vU-1o;
        Mon, 03 Oct 2022 20:29:00 +0000
Date:   Tue, 04 Oct 2022 04:28:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 f0dbcd134f5abcdd4e2ad16bc81a158b2a23e2d9
Message-ID: <633b45d9.Bnp7P0Ov+9j4sAN2%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: f0dbcd134f5abcdd4e2ad16bc81a158b2a23e2d9  Merge tag 'v6.0' into renesas-devel

elapsed time: 727m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
x86_64                          rhel-8.3-func
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                    rhel-8.3-kselftests
s390                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
s390                                defconfig
mips                             allyesconfig
sh                               allmodconfig
arm                                 defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
s390                             allyesconfig
x86_64                              defconfig
i386                                defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                 randconfig-a011-20221003
i386                 randconfig-a012-20221003
arm64                            allyesconfig
i386                 randconfig-a013-20221003
arm                              allyesconfig
m68k                             allmodconfig
x86_64               randconfig-a011-20221003
x86_64               randconfig-a015-20221003
alpha                            allyesconfig
x86_64               randconfig-a014-20221003
arc                              allyesconfig
x86_64               randconfig-a012-20221003
i386                 randconfig-a014-20221003
x86_64               randconfig-a013-20221003
riscv                randconfig-r042-20221003
i386                 randconfig-a015-20221003
x86_64               randconfig-a016-20221003
arc                  randconfig-r043-20221003
m68k                             allyesconfig
i386                 randconfig-a016-20221003
arc                  randconfig-r043-20221002
s390                 randconfig-r044-20221003
i386                             allyesconfig
ia64                             allmodconfig

clang tested configs:
x86_64               randconfig-a003-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a004-20221003
i386                 randconfig-a003-20221003
i386                 randconfig-a002-20221003
x86_64               randconfig-a006-20221003
hexagon              randconfig-r041-20221002
x86_64               randconfig-a005-20221003
s390                 randconfig-r044-20221002
i386                 randconfig-a001-20221003
hexagon              randconfig-r045-20221002
hexagon              randconfig-r045-20221003
i386                 randconfig-a004-20221003
i386                 randconfig-a005-20221003
hexagon              randconfig-r041-20221003
i386                 randconfig-a006-20221003
riscv                randconfig-r042-20221002

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
