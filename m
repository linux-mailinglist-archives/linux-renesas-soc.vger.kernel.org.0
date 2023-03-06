Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E48596AD2F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Mar 2023 00:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjCFXpn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 18:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCFXpm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 18:45:42 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E07521F5
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Mar 2023 15:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678146341; x=1709682341;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iHuCVZe6nlcYNZEAoSaGP1But3CPgWx2fVYgqlWpN3g=;
  b=Gu9Q9mxdpx5Zf/BJpsZMbpMsxXgaOrFbu72u4OSwEDNl8aoItqOUQ2t7
   S1vaKXOzFl5kQ/46wmPuIT2pOrP9v0ZdaQGyXthif+34Pi2shz/eJIIqW
   +u3jnwRkJD3MkAQExpgVto0KolRMa7dTrrgJR9aOqvJ72d9otj9O82VoV
   OJd1/MyIj67y4k8/xf3+j66jIJ1YL1X43r6t41c8Wc1NjZgh4VrUc3vk2
   YVHvlh6qNfszw+XUpkL3Zq+aO7wYGG/FH1XrgePP+RVrUr07p0OV2ddGm
   HTUODRpTv9+OZ0D3rESbCHY/QL6HUyw7Fxi2ks6BJykNNLyqZ+2larUpT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400536127"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="400536127"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 15:45:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="708830869"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="708830869"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Mar 2023 15:45:39 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZKWQ-0000jQ-2Z;
        Mon, 06 Mar 2023 23:45:38 +0000
Date:   Tue, 07 Mar 2023 07:44:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v6.4] BUILD SUCCESS
 4077043be27f4cadf1d2b3d1be8ae13657d963a2
Message-ID: <64067af4.0syzh/Pblw7CuEOW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.4
branch HEAD: 4077043be27f4cadf1d2b3d1be8ae13657d963a2  arm64: dts: renesas: white-hawk-csi-dsi: Add and connect MAX96712

elapsed time: 723m

configs tested: 2
configs skipped: 63

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
