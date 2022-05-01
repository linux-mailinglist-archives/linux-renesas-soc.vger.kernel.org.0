Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7718F516469
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 May 2022 14:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347174AbiEAMgD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 May 2022 08:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240202AbiEAMgC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 May 2022 08:36:02 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D361F5E762
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 May 2022 05:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651408357; x=1682944357;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3lc5R9+rdDl/JxM0Zwvr3vdUuI/qER/na+zfFvovR1I=;
  b=OOH9IPw8b+59v2TbrocMK+Suym/5mfe/wOS+G1axlmbzoDYO/YRoozYX
   OAAIkoFqh4qUbpyAknzBE8JHvao8yG4XcQMBT2kZBYucxgUP1ms4C060o
   9AhwqqAGwPw7HyboClucbzFwXRort9tHAuO1U7vmT0PS2BdW0VuSV/K/H
   MsPugPx7yo54M1xZMs7TtrWZ4RkIha/13FyGPUVkCpRV158pr/1lcvM96
   eSdZ9HwwXpien/Gu7EFpOk4BeDtsdS3J0yqJRLfyKLDf9+lx2BrsjMFHb
   sVPR8CaOlK+wUtTRUO12WbjRPrpQnJC9VIGiZYLlE4BIEbl6SWLgJIroF
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10333"; a="266867344"
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; 
   d="scan'208";a="266867344"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 05:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="566809882"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 May 2022 05:32:36 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nl8kd-0008kd-JY;
        Sun, 01 May 2022 12:32:35 +0000
Date:   Sun, 01 May 2022 20:32:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 46bde326fc339f3bdb06b5fa3f44d27329eebfdf
Message-ID: <626e7dda.CZEAsOYlidoEREFd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 46bde326fc339f3bdb06b5fa3f44d27329eebfdf  [LOCAL] arm64: renesas: defconfig: Update renesas_defconfig

elapsed time: 17118m

configs tested: 22
configs skipped: 37

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
