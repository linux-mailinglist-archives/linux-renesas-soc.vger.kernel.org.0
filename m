Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E943F550589
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Jun 2022 16:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbiFROsX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 18 Jun 2022 10:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiFROsW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 Jun 2022 10:48:22 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35C917A97
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jun 2022 07:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655563701; x=1687099701;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=whXWjlW2JEXxmep1EQLhtNhdH1RAX7ecxuN4ji8YMF4=;
  b=TsI6hjtXDsmgu4nOIj6YLMMkXuY/DyLnG4KObYc0rKQpm2cLWQKodl+U
   WgJsHb5G4J/69JryYVrbmLkQsgUAoowh2KCPa7NLPVO3OSE94WAh583cQ
   dqdexmghwSxrGn6hZv/aX7cJCSyP/1ilpWhPEOPNiocyjdWbqJ/+sQoSK
   NJgyJVkN1De7pvIfthXlnSO4YbS/XSa7Pei9kKdUwXmml7hmsI8VZaLph
   LNCbc05x5bAzAAVhX47WKygCO8aiuoVrU5H6RL54tN+jh7JdcrAzCHT5L
   WN5OD9/QjRXSD4XTqVI4ZSZUI1ZCym7KjuWWRhGVRNTyRCRKjP9y+Itig
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280720080"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="280720080"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2022 07:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="654025315"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jun 2022 07:48:19 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o2ZkI-000QMx-G2;
        Sat, 18 Jun 2022 14:48:18 +0000
Date:   Sat, 18 Jun 2022 22:47:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-dt-for-v5.20] BUILD SUCCESS
 3c7742a45c170430001c5a1767d9dd76686dc14d
Message-ID: <62ade593.icHeXdTVxyynWza9%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v5.20
branch HEAD: 3c7742a45c170430001c5a1767d9dd76686dc14d  ARM: dts: rza2mevb: Fix LED node names

elapsed time: 1808m

configs tested: 5
configs skipped: 97

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
