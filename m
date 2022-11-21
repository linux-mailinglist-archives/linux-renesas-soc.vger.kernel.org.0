Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEAB63197D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 06:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiKUFXJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 00:23:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiKUFXJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 00:23:09 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BAE2652
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Nov 2022 21:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669008188; x=1700544188;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2tJZaxc6hcXQFG3Xl6ok0NzdbMEIOLmVFQvH2PepKkY=;
  b=JnEMe6dT5EzQ/SKxEHhD9H6+0fvY/kgYZKGHhQNnEB3iQGpaViqoDS4V
   RNqRqoDRRt7vchPZZNj9/PGqy+o61F2yro3UaCeCtV6J6mGEhweF76qBz
   HSXtQxAHEI6uKz4hvV4k0SAC2KTVgmArvJMHVbUTJaWS5D9hw2di2hZxe
   IofNLU3UM9hyBn+pzylegHdmP+MRNX2II1iEzQsx01jwcSYKoTxgBqWoU
   CmqHQqoooGHzH4Nu8DS9pUATYGvYYFLr42No4ySe67sGjprlxErQu6oo/
   aKqKIqn7dMqlNljUdUq9E1uIsXVqVS+ZzzF+uQD2m/N0Mc7eDKjbWmxXs
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="293863227"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="293863227"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2022 21:22:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="643183867"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="643183867"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Nov 2022 21:22:57 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1owzGi-0000Ao-20;
        Mon, 21 Nov 2022 05:22:56 +0000
Date:   Mon, 21 Nov 2022 13:22:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.2] BUILD
 SUCCESS fa8eec59570923f4132253e61c45f9d70377f049
Message-ID: <637b0b10.Naq20KHjOpch+A/P%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.2
branch HEAD: fa8eec59570923f4132253e61c45f9d70377f049  arm64: defconfig: Enable Renesas R-Car S4-8 Spider Ethernet devices

elapsed time: 3610m

configs tested: 1
configs skipped: 84

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
