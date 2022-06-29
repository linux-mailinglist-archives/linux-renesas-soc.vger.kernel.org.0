Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC4B7560946
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 20:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbiF2SiB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 14:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiF2SiA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 14:38:00 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB393B299
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 11:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656527880; x=1688063880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=14hbY9OMpN9d0ymUv5g9z85CBjmDlSqODoJNvWfpq2U=;
  b=eKFkNNJFx8MxUSdqvFDbQQkGgPJcnyLD7NTukSpjZ3wb+PjnY95pOZsF
   ox+RV37uhIpE1dHgvLhICL1aMXGWTyurzCfppoW3ZSROU3iWiE8MrKkQZ
   UXZ73wGH0yZ6j3V0Y6jcO9vP13yGmof7piun6c/yFT0WcSSQQrRD3DEQs
   MfBYjc3oJtne9o/zsBDDgCQkqEime+CcbNeYAn3CPVYX/30z6oqvXyZac
   8optuF0XIhFVNIiQ8qDs7jWG9CpXK/T9C2NrJkzgj3nu8M98ldsyK4xIE
   m0Uvd8z83geMlDrnKAd97k7ExR08M3KHdCT6k1rjiSWB8GYjMKVm7lSmH
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="346106899"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="346106899"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 11:37:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="595352807"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jun 2022 11:37:58 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o6cZZ-000BQA-LJ;
        Wed, 29 Jun 2022 18:37:57 +0000
Date:   Thu, 30 Jun 2022 02:37:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     kbuild-all@lists.01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [geert-renesas-drivers:renesas-pinctrl-for-v5.20 5/5]
 drivers/pinctrl/renesas/pinctrl-rzv2m.c:37:33: error: implicit declaration
 of function 'FIELD_GET'
Message-ID: <202206300252.mQeUSfuW-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl-for-v5.20
head:   1e18476c392f4491a93c29937c4d6a49c27661c8
commit: 1e18476c392f4491a93c29937c4d6a49c27661c8 [5/5] pinctrl: renesas: Add RZ/V2M pin and gpio controller driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20220630/202206300252.mQeUSfuW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=1e18476c392f4491a93c29937c4d6a49c27661c8
        git remote add geert-renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
        git fetch --no-tags geert-renesas-drivers renesas-pinctrl-for-v5.20
        git checkout 1e18476c392f4491a93c29937c4d6a49c27661c8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pinctrl/renesas/pinctrl-rzv2m.c: In function 'rzv2m_dt_subnode_to_map':
>> drivers/pinctrl/renesas/pinctrl-rzv2m.c:37:33: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      37 | #define MUX_FUNC(pinconf)       FIELD_GET(MUX_FUNC_MASK, (pinconf))
         |                                 ^~~~~~~~~
   drivers/pinctrl/renesas/pinctrl-rzv2m.c:306:31: note: in expansion of macro 'MUX_FUNC'
     306 |                 psel_val[i] = MUX_FUNC(value);
         |                               ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +37 drivers/pinctrl/renesas/pinctrl-rzv2m.c

    30	
    31	/*
    32	 * Use 16 lower bits [15:0] for pin identifier
    33	 * Use 16 higher bits [31:16] for pin mux function
    34	 */
    35	#define MUX_PIN_ID_MASK		GENMASK(15, 0)
    36	#define MUX_FUNC_MASK		GENMASK(31, 16)
  > 37	#define MUX_FUNC(pinconf)	FIELD_GET(MUX_FUNC_MASK, (pinconf))
    38	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
