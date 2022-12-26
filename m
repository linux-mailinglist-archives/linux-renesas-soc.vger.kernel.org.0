Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B386565F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Dec 2022 00:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiLZXJG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 18:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiLZXJF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 18:09:05 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E98D9F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 15:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672096144; x=1703632144;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sgypHuTPlAdGlGy15Q4LxdYaSiKPITAalLD1UNfLZUo=;
  b=nxaBfjSpPfy/vyvXh7A83tBUjsq8dPptmNJK4P5RMr3E0uMkLIt59D+4
   e2q6miRXxPzND5h9QL48y/qXkO4BPpQSmLnvWhtobPMXiOYvL6Q6/3g+z
   OzfgeL3MUmnY0mAm7ZoxNSFZ9FsR1ipb9extEJgFUdvnrCo5aSFwR2X8A
   WatGwEkjaglymafOKw2lG3qnZs4s336aCk/BKdhXQ6e4J7cTjCJO8dw5i
   hF+nn0o+ComPifN8iHJqoM1stkE58qyWTrjqxiWNakgcg96OkYa5BSTt3
   uOGF9CS90zaKuC5JRLiYa3mZunAtllmplL7diXVJfccYEMQc6reT7/z/B
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="347808772"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="347808772"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2022 15:09:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10572"; a="630519066"
X-IronPort-AV: E=Sophos;i="5.96,276,1665471600"; 
   d="scan'208";a="630519066"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Dec 2022 15:09:02 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p9wab-000Ehh-2J;
        Mon, 26 Dec 2022 23:09:01 +0000
Date:   Tue, 27 Dec 2022 07:08:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.3] BUILD
 SUCCESS 7d106cb32a498fb40d1362b959638f2b3d413b7f
Message-ID: <63aa297c.vV/Zjp9OZn0gnwu0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.3
branch HEAD: 7d106cb32a498fb40d1362b959638f2b3d413b7f  arm64: defconfig: Enable Renesas RZ/G2L MIPI DSI driver

elapsed time: 721m

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
