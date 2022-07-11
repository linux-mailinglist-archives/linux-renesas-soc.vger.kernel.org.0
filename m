Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B118A5704AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Jul 2022 15:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbiGKNwc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jul 2022 09:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbiGKNwb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jul 2022 09:52:31 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1F95C97B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jul 2022 06:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657547551; x=1689083551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jaLk3U5F0ruQHET+4ZAEZkZ2sJ4tqgalPz8uL9NtPfk=;
  b=FSFQ+tzcye0uig90IqAPnEIBGtCK1OsdcqcwpDaEtnvTyARl/d/5Wsn5
   RojX7OkarYtGfaZgygS8DCn5V7MsnX9VOZQ7jtB4LSBq9fZMCVADQrS/x
   WLSUC+zDaYR1filCSVRmqecVMZOQMGZobA+Ya9T4WyUinXLFSpUA3lYCi
   m0wrQjfjSXrZQGOvft13JqoYYKk/wo+RpuJwnOdFqgGyVGjoBCs73uSQb
   9yL2DWnlVbfuaBjCe2WYOKd2+YuR9fNwrJaRxoyl5HS9pRXJ3xP/7wSpf
   87mL5A0sh3Y9vdpmrHPFlkA/czJ2WSWay3K6qkZrPVVoVeik3/TlOXrIu
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="285407074"
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="285407074"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 06:52:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="569770809"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Jul 2022 06:52:29 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oAtpt-0000rV-0L;
        Mon, 11 Jul 2022 13:52:29 +0000
Date:   Mon, 11 Jul 2022 21:52:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     kbuild-all@lists.01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 65/81] drivers/mfd/axp20x.c:634:35:
 error: initialization of 'unsigned int (*)(struct regmap_irq_chip_data *,
 unsigned int,  int)' from incompatible pointer type 'int (*)(unsigned int,
  int)'
Message-ID: <202207112139.Kmxa8JYf-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   e3fa3b4c04d13d042e259755e2d48d2170e667ca
commit: cc168f07ac2789c2fc94db32e11e411c99e229e9 [65/81] Merge remote-tracking branch 'mfd/for-mfd-next' into renesas-drivers
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/20220711/202207112139.Kmxa8JYf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=cc168f07ac2789c2fc94db32e11e411c99e229e9
        git remote add geert-renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
        git fetch --no-tags geert-renesas-drivers master
        git checkout cc168f07ac2789c2fc94db32e11e411c99e229e9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mfd/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mfd/axp20x.c:634:35: error: initialization of 'unsigned int (*)(struct regmap_irq_chip_data *, unsigned int,  int)' from incompatible pointer type 'int (*)(unsigned int,  int)' [-Werror=incompatible-pointer-types]
     634 |         .get_irq_reg            = axp192_get_irq_reg,
         |                                   ^~~~~~~~~~~~~~~~~~
   drivers/mfd/axp20x.c:634:35: note: (near initialization for 'axp192_regmap_irq_chip.get_irq_reg')
   cc1: some warnings being treated as errors


vim +634 drivers/mfd/axp20x.c

d8d79f8f60c436 Michal Suchanek 2015-07-11  623  
8c7d8aa029a3ca Aidan MacDonald 2022-06-03  624  static const struct regmap_irq_chip axp192_regmap_irq_chip = {
8c7d8aa029a3ca Aidan MacDonald 2022-06-03  625  	.name			= "axp192_irq_chip",
8c7d8aa029a3ca Aidan MacDonald 2022-06-03  626  	.status_base		= AXP192_IRQ1_STATE,
8c7d8aa029a3ca Aidan MacDonald 2022-06-03  627  	.ack_base		= AXP192_IRQ1_STATE,
8c7d8aa029a3ca Aidan MacDonald 2022-06-03  628  	.mask_base		= AXP192_IRQ1_EN,
8c7d8aa029a3ca Aidan MacDonald 2022-06-03  629  	.mask_invert		= true,
8c7d8aa029a3ca Aidan MacDonald 2022-06-03  630  	.init_ack_masked	= true,
8c7d8aa029a3ca Aidan MacDonald 2022-06-03  631  	.irqs			= axp192_regmap_irqs,
8c7d8aa029a3ca Aidan MacDonald 2022-06-03  632  	.num_irqs		= ARRAY_SIZE(axp192_regmap_irqs),
8c7d8aa029a3ca Aidan MacDonald 2022-06-03  633  	.num_regs		= 5,
8c7d8aa029a3ca Aidan MacDonald 2022-06-03 @634  	.get_irq_reg		= axp192_get_irq_reg,
8c7d8aa029a3ca Aidan MacDonald 2022-06-03  635  };
8c7d8aa029a3ca Aidan MacDonald 2022-06-03  636  

:::::: The code at line 634 was first introduced by commit
:::::: 8c7d8aa029a3cac42a468cd458adde840d2c5a06 mfd: axp20x: Add support for AXP192

:::::: TO: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
:::::: CC: Lee Jones <lee.jones@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
