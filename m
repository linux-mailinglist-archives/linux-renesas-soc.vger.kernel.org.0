Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B83EE611F13
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Oct 2022 03:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbiJ2Bam (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Oct 2022 21:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiJ2Bal (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 21:30:41 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADEA0B18E7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 18:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667007040; x=1698543040;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3IkITiTWJoEWGDJECQQdJN3ljDE3BJBYDrGj2bk9FgM=;
  b=QnSL1GmtDNBPEZs/E8Oezdl08JXmoAdLHkAiZjEuv8X8p75Nj2s31n9H
   TcgJAQ9sAt57nZmt87X1BS8CCTHg1biJepcU8LNNY1d7ZtqNUeEV+8hGG
   T1IZB8Jn/1fxofA0J8QjgzZ+V7fSTsSJ9B4v1nj/k/RHSBdFBN2T4F9e1
   2rsv+auH5NaN9ygcQKjaOLxcB5suHmAIOBRBQ8b/qLgYczjzsiNVMvAZM
   Ck5JAw7GFVBpUZs5FKjSLzwkDvElwOGmR7eM1itpHtRadmtGKMie0yqxr
   mNht9GktUtyTHtCEHvoRHj2P58iwga/grxaWlvsgvRdDJRSgDpjLDWXYN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="288341362"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="288341362"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 18:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="962224832"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="962224832"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 28 Oct 2022 18:30:39 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ooagI-000APZ-24;
        Sat, 29 Oct 2022 01:30:38 +0000
Date:   Sat, 29 Oct 2022 09:29:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 e3ee6a5b11b04ae5efa890cdfe9c94b77e36f136
Message-ID: <635c8214./UjwFsZBTQp5ReM+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: e3ee6a5b11b04ae5efa890cdfe9c94b77e36f136  Merge branches 'renesas-next' and 'topic/renesas-defconfig' into renesas-devel

elapsed time: 727m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
arc                  randconfig-r043-20221028
s390                             allmodconfig
s390                                defconfig
riscv                randconfig-r042-20221028
s390                 randconfig-r044-20221028
x86_64                           rhel-8.3-kvm
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func
s390                             allyesconfig
m68k                             allmodconfig
x86_64                              defconfig
i386                          randconfig-a001
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a003
ia64                             allmodconfig
i386                          randconfig-a014
alpha                            allyesconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
i386                             allyesconfig
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                           allyesconfig
x86_64                        randconfig-a002
arm                                 defconfig
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a013
x86_64                        randconfig-a006
x86_64                        randconfig-a011
arm64                            allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a015
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig

clang tested configs:
hexagon              randconfig-r041-20221028
hexagon              randconfig-r045-20221028
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
