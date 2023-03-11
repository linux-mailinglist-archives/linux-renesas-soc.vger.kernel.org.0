Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFDE6B58D8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Mar 2023 07:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjCKGDr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Mar 2023 01:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjCKGDq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Mar 2023 01:03:46 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122EF12B7F7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 22:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678514625; x=1710050625;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Cl22zmTzlYuDCNUvPbv00PgWlecLJlIeTM8q2k5/vE4=;
  b=mhhBmEPc5vkRXF+0OQNfkHNaEoDNRJ4EwxglS5VWbeUwxkoZI2ycvXTX
   hCgy1aaC8tuk79J/VP7w+uj53XDzyscGrdYdXnvyj6tEv2jqAPixosGHj
   NYMHGGtAqRd45ptnI9YevwsH4tEmEgQMcUwX9DIOmfElC2yE/ds5tXv9U
   Ls6HD9XIk4U40IyFGCJ6jjHzyC5wVD16Z8E826wwnzuz1DlascABy87Gk
   f2N3KbVHx8xVmuE9SNIwOtUcSCqMMTG9JNi8IF7nrP3jdde4DyCJjYzHC
   WixM/R6vrIbcxdNQeWbtaoEDalLXGavaF1DCOIokAb2C9c+9eb0Rt0n9+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423147763"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="423147763"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 22:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="852178561"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="852178561"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Mar 2023 22:03:43 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pasKU-0004OK-0z;
        Sat, 11 Mar 2023 06:03:42 +0000
Date:   Sat, 11 Mar 2023 14:03:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.4] BUILD SUCCESS
 27159fb3e00652c44ed5451ca9df50bffcbc5273
Message-ID: <640c19b4.IqwDgI6u9p4Gnb5C%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.4
branch HEAD: 27159fb3e00652c44ed5451ca9df50bffcbc5273  arm64: dts: renesas: Remove R-Car H3 ES1.* devicetrees

elapsed time: 722m

configs tested: 2
configs skipped: 158

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
