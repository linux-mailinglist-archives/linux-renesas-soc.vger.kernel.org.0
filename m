Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 576396FB85E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 22:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233714AbjEHUjp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 16:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233705AbjEHUjo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 16:39:44 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119F45587
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 May 2023 13:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683578384; x=1715114384;
  h=date:from:to:cc:subject:message-id;
  bh=u0SBcCiDs/tBRZV64Y+uKD0IknoIICPYdd3vz3+7OmY=;
  b=Hj3dM8Xlrke8Ubh3bKOnDNDYuoDt60BCgzSciulIMgOYLNlg505k0Fl6
   1eFVKC9jgI7sDRQIIxhfOig/RKw7GO+pCuJo8kWHfLm/LRLdrnCwXEDRn
   QH7ryfO/iWXcdVXo2U48ozdohbB5hV7gGl8qW6Y7WGCHlJnTeDpSArkCE
   xnRxtJ5sUAOuPYbHy+0+lGCJWbV2xnvBb7m/2CYtxCw7jP78ftERbpyP6
   I/SfLgfJL8kvPwOkeLNdAltVQRMg64qnQGhpapXo1J/CX4Fu/8IRslIZM
   EXAZokN/ZGH/s8TeNaDbFA02gLK4MYcLVA6aGfzBz1jxzfHsGfueZ9Dc1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348578835"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="348578835"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 13:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="822825115"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="822825115"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 May 2023 13:39:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pw7e0-0001PF-0F;
        Mon, 08 May 2023 20:39:40 +0000
Date:   Tue, 09 May 2023 04:39:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.5] BUILD SUCCESS
 18cbbdd846c5d74bd56fd1f229d074e1f7068fc8
Message-ID: <20230508203918.3tAzM%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.5
branch HEAD: 18cbbdd846c5d74bd56fd1f229d074e1f7068fc8  arm64: dts: renesas: r8a779a0: Add PWM nodes

elapsed time: 726m

configs tested: 2
configs skipped: 174

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
