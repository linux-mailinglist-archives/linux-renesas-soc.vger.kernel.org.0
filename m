Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5A5F6B58D6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Mar 2023 07:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjCKGDq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Mar 2023 01:03:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjCKGDp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Mar 2023 01:03:45 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D04612B7C7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 22:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678514624; x=1710050624;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=F3fJo4Wbsvl84awBy1YgCJ/o7jOeVlaqZ3lC0E+MTHk=;
  b=HtiwFzmAQvzaxZA+Q8ESThXxhEyv7LqyI7Cy6I0kSc2SjRRBS7Xxkz0j
   VNW3mllGVCLuklSWIFnZXIM2OfrKBoXOTb7mYM9hJzpFJHesXdvTq/edq
   bFBfHs0TWVYu+H6+4EsxdhI5kPFYOnZtsnO0RtETKbzA5ABR0oQR1oWgx
   VCcco9Qn3N6M0ysoj4MyATbJnBU3P/UyFMGO8O979TSn1/x7/iHCeIoMv
   ky0s40OpBIRKXe2zz7cNosLQpyCqOS1lK0LORUwqJihqE9mwZfZD+WR2T
   HSH0Idh7vJU7/+GLbFcjtS5UKodojbWBar7vANfvfVPycGkeJwXmi10KU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="338437669"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="338437669"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 22:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="801863818"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="801863818"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Mar 2023 22:03:42 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pasKU-0004OI-0s;
        Sat, 11 Mar 2023 06:03:42 +0000
Date:   Sat, 11 Mar 2023 14:03:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-arm-defconfig-for-v6.4] BUILD
 SUCCESS 93582bdfd0cf5aeeb4451ade1076a455c53d8a85
Message-ID: <640c19ab.Ua6nP8YTSPsUPYpG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-defconfig-for-v6.4
branch HEAD: 93582bdfd0cf5aeeb4451ade1076a455c53d8a85  arm64: defconfig: Enable RZ/V2M xHCI and USB3.1 DRD controller support

elapsed time: 723m

configs tested: 6
configs skipped: 153

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230310   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
