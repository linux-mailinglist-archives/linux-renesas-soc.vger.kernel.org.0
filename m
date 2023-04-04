Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 805F26D55A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 02:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjDDArz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Apr 2023 20:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjDDArz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2023 20:47:55 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9E710CB;
        Mon,  3 Apr 2023 17:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680569273; x=1712105273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RXv6nnvuAvYkBkDjFqAcvYEGLIrMuHjL2t3Rp8C34WY=;
  b=Yg/7+0dM+hAn1wa+OmIDbSZ4Ps3eMY+ElmSmUQZXXueHi5R6tEe0JdUc
   ly0UclulijRa+Zt8X4O+XiVqZvAIm0m+WWKtHSwNAl+A2Hm05uUoyLZgc
   DlYotn1NNvKIwmsYCx2GTHA8QnTMIm/qOGqKq1zeLTMkPdrdy8zK3DLOM
   1U0ek4XYLHZN/GsrFFImBSx6C5UfkNAXT63lV8olAJOpbl1DI/YIly8Nu
   cJA+GgzHq0Z8XoDFezWyqChnLBTfObfrsham6Zvunwo4AQnm64QZFT5yH
   WvO88t2/pwBZ/OXj4NCDY9pnHk9R5Av3gcvZKHcPX3eFIRmI/aitEG6UD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="321710748"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="321710748"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 17:47:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="686167807"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="686167807"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Apr 2023 17:47:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pjUpx-000Oyk-1l;
        Tue, 04 Apr 2023 00:47:49 +0000
Date:   Tue, 4 Apr 2023 08:47:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drivers: clk: Add support for versa3 clock driver
Message-ID: <202304040800.ncpvZq1s-lkp@intel.com>
References: <20230403103257.328954-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403103257.328954-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on next-20230403]
[cannot apply to geert-renesas-devel/next robh/for-next linus/master v6.3-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/dt-bindings-clock-Add-Renesas-versa3-clock-generator-bindings/20230403-183501
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230403103257.328954-3-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v3 2/3] drivers: clk: Add support for versa3 clock driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20230404/202304040800.ncpvZq1s-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/bd1f4d06603f7dc65276411a65078a8ffaf5b844
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Biju-Das/dt-bindings-clock-Add-Renesas-versa3-clock-generator-bindings/20230403-183501
        git checkout bd1f4d06603f7dc65276411a65078a8ffaf5b844
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/clk/ drivers/gpio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304040800.ncpvZq1s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-versaclock3.c:263:8: warning: variable 'premul' is uninitialized when used here [-Wuninitialized]
                           if (premul & VC3_PLL2_MDIV_DOUBLER)
                               ^~~~~~
   drivers/clk/clk-versaclock3.c:244:29: note: initialize the variable 'premul' to silence this warning
           unsigned int prediv, premul;
                                      ^
                                       = 0
   1 warning generated.


vim +/premul +263 drivers/clk/clk-versaclock3.c

   238	
   239	static unsigned long vc3_pfd_recalc_rate(struct clk_hw *hw,
   240						 unsigned long parent_rate)
   241	{
   242		struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
   243		const struct vc3_pfd_data *pfd = vc3->data;
   244		unsigned int prediv, premul;
   245		unsigned long rate;
   246		u8 mdiv;
   247	
   248		regmap_read(vc3->regmap, pfd->offs, &prediv);
   249		if (pfd->num == VC3_PFD1) {
   250			/* The bypass_prediv is set, PLL fed from Ref_in directly. */
   251			if (prediv & pfd->mdiv1_bitmsk) {
   252				/* check doubler is set or not */
   253				regmap_read(vc3->regmap, VC3_PLL1_CTRL_OUTDIV5, &premul);
   254				if (premul & VC3_PLL1_CTRL_OUTDIV5_PLL1_MDIV_DOUBLER)
   255					parent_rate *= 2;
   256				return parent_rate;
   257			}
   258			mdiv = VC3_PLL1_M_DIV(prediv);
   259		} else if (pfd->num == VC3_PFD2) {
   260			/* The bypass_prediv is set, PLL fed from Ref_in directly. */
   261			if (prediv & pfd->mdiv1_bitmsk) {
   262				/* check doubler is set or not */
 > 263				if (premul & VC3_PLL2_MDIV_DOUBLER)
   264					parent_rate *= 2;
   265				return parent_rate;
   266			}
   267	
   268			mdiv = VC3_PLL2_M_DIV(prediv);
   269		} else {
   270			/* The bypass_prediv is set, PLL fed from Ref_in directly. */
   271			if (prediv & pfd->mdiv1_bitmsk)
   272				return parent_rate;
   273	
   274			mdiv = VC3_PLL3_M_DIV(prediv);
   275		}
   276	
   277		if (prediv & pfd->mdiv2_bitmsk)
   278			rate = parent_rate / 2;
   279		else
   280			rate = parent_rate / mdiv;
   281	
   282		return rate;
   283	}
   284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
