Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65BA66FB863
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 22:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjEHUko (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 16:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjEHUkn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 16:40:43 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0C355A9
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 May 2023 13:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683578442; x=1715114442;
  h=date:from:to:cc:subject:message-id;
  bh=v+dL2h2oQwq8gTWgbhmETUgTdRRTmC3bCwWjv30ZJd4=;
  b=JJLlpqM0i2cCUpILQRQ/sriEJUPLBO7rn+arA9WIKzRxJzc1DrQvllSL
   027oxbaZVW4onlfapp3agO07Ghn4eDEFSHh3aPOJ863tiwAxNqHVIBkxW
   FGk5n7/67doJ9dKu3K9MNQpQ1Q0ojAlkaOnKVGeMaWWj5syiaFiOQqs7G
   dB8n+JB1AIsOlPOSS9fpUoPkQzgQ4uzjWG8PN40lNRroGI3PAWW+9EF/p
   Qj6JFv47jRt0fLTjKZ9Srmx9wVD4KwCI8TViaedRQFpO5LTyBG834utWB
   7JJMVnzEcZEDl9R8lThkgyTvFPRvQ9yqI6qZXz5xMcEMh1wW6xuXe26pe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415312619"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="415312619"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 13:40:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="872915445"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="872915445"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 May 2023 13:40:41 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pw7ey-0001Pn-1a;
        Mon, 08 May 2023 20:40:40 +0000
Date:   Tue, 09 May 2023 04:39:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 be43a9462ec2358f9bdc10832c2cf0f5a5e944c2
Message-ID: <20230508203954.c8dPU%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: be43a9462ec2358f9bdc10832c2cf0f5a5e944c2  Merge branch 'renesas-dts-for-v6.5' into renesas-next

elapsed time: 727m

configs tested: 2
configs skipped: 162

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
