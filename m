Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C26585ABD8B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Sep 2022 08:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbiICG4B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 3 Sep 2022 02:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbiICGz7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Sep 2022 02:55:59 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71DB5D476E
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Sep 2022 23:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662188158; x=1693724158;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5K+Va2QJooBDekpjG6El7+lthYPdt4i0axSY1gfewT4=;
  b=KNMC5dPws2b4JxJvxwMOSjKpcgWwXUgkDq4MRZfrPZGqhOwhjBcqfOXK
   DvMqpzxEGelTW/On0lAiekHgwjfQQqQL31tOug6GQJvxbdKxTdIRmboAY
   hINtgjRdAurvyzASDAlsmqjJ4j3jeiBwJQ11yIGlKPxNfP/dVSGUBxSGb
   wm2rEWXtg7Jqkh80bCKoGQo00r/+k1KYdt0pjrp1bF1EBPSxVjaLU7PVC
   VHgI4AYTT77BUd1FcbACelf8ab9vHEI/Gzm5WLUlhUSFLJu8rbS3RAqrg
   4qHgaCZSFJL+DJSkZvSUT+na/4p5H69lUB/8nySiuERUYX4aED0Y58iC1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="294876871"
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="294876871"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 23:55:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="674639480"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 02 Sep 2022 23:55:57 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUN4O-0001DT-1Q;
        Sat, 03 Sep 2022 06:55:56 +0000
Date:   Sat, 03 Sep 2022 14:55:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v6.1] BUILD SUCCESS
 6f67580ca9edb33a95897d8c0056b961cbd2aeac
Message-ID: <6312fa4e.l9eXR3EcWGeb/Fow%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v6.1
branch HEAD: 6f67580ca9edb33a95897d8c0056b961cbd2aeac  arm64: dts: renesas: Add V3H2 Condor-I board support

elapsed time: 1035m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
arc                  randconfig-r043-20220901
x86_64                        randconfig-a013
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a011
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
m68k                             allmodconfig
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
arc                              allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a015
alpha                            allyesconfig
m68k                             allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
i386                          randconfig-a014
i386                          randconfig-a001
i386                          randconfig-a012
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a004
i386                             allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
riscv                randconfig-r042-20220901
hexagon              randconfig-r045-20220901
hexagon              randconfig-r041-20220901
s390                 randconfig-r044-20220901
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
