Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 819C751D1BD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 May 2022 08:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243822AbiEFHAf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 May 2022 03:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243243AbiEFHAe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 May 2022 03:00:34 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6EA42C10C
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 May 2022 23:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651820211; x=1683356211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H/+B1lbKEsxoJP5le5i7EGVtD8MKRBqt5nVtBOHmbNU=;
  b=UMj32f5KF2fFgUjITzjBsBeOGGLBigUou3HOMpj+Cwhpf45IdH7EEn3S
   LwUQD+QVTYrci3Xyo0aUwf63+hS96zOaJ7jbQe1po2E7UOO/LlD8OHwV0
   6/vUEgRPuDRdoHFgBK58PDUOH4W533dLaZDGdGU90QNSyvV5hwnhB9rVk
   E+Yv1GjFvdUl1M8+BRNrMOmbqVRn3H9+6KF3jg6oJqUddYd2OQMWiwHYu
   2nZtpuS/ed6xtOItDBmWqNdaOlImn4s1yGR7KwzHKZ1l/0fkIQAP6uPnB
   2WUDupqD0iu2tJYVyJdd28PsqdHDI7nOhhMMtmtL3kpF4ieoFatYMuSBe
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="328917590"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="328917590"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 23:56:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="695033550"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 May 2022 23:56:50 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nmrtR-000DEe-G3;
        Fri, 06 May 2022 06:56:49 +0000
Date:   Fri, 6 May 2022 14:56:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     kbuild-all@lists.01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [geert-renesas-drivers:renesas-clk-for-v5.19 46/47]
 drivers/clk/renesas/r9a09g011-cpg.c:118:9: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202205061401.IHqhpmgm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v5.19
head:   2e0e144796fb5cfa637384f1e3ffc045c40bc4ca
commit: 6bca154251df4bdc32391965a49d90e143f272ff [46/47] clk: renesas: Add RZ/V2M support using the rzg2l driver
config: parisc-randconfig-s032-20220506 (https://download.01.org/0day-ci/archive/20220506/202205061401.IHqhpmgm-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=6bca154251df4bdc32391965a49d90e143f272ff
        git remote add geert-renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
        git fetch --no-tags geert-renesas-drivers renesas-clk-for-v5.19
        git checkout 6bca154251df4bdc32391965a49d90e143f272ff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash drivers/clk/renesas/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/clk/renesas/r9a09g011-cpg.c:118:9: sparse: sparse: Using plain integer as NULL pointer

vim +118 drivers/clk/renesas/r9a09g011-cpg.c

    99	
   100	static const struct cpg_core_clk r9a09g011_core_clks[] __initconst = {
   101		/* External Clock Inputs */
   102		DEF_INPUT("extal",	CLK_EXTAL),
   103	
   104		/* Internal Core Clocks */
   105		DEF_FIXED(".main",	CLK_MAIN,	CLK_EXTAL,	1,	1),
   106		DEF_FIXED(".main_24",	CLK_MAIN_24,	CLK_MAIN,	1,	2),
   107		DEF_FIXED(".main_2",	CLK_MAIN_2,	CLK_MAIN,	1,	24),
   108		DEF_FIXED(".pll1",	CLK_PLL1,	CLK_MAIN_2,	498,	1),
   109		DEF_FIXED(".pll2",	CLK_PLL2,	CLK_MAIN_2,	800,	1),
   110		DEF_FIXED(".pll2_800",	CLK_PLL2_800,	CLK_PLL2,	1,	2),
   111		DEF_FIXED(".pll2_400",	CLK_PLL2_400,	CLK_PLL2_800,	1,	2),
   112		DEF_FIXED(".pll2_200",	CLK_PLL2_200,	CLK_PLL2_800,	1,	4),
   113		DEF_FIXED(".pll2_100",	CLK_PLL2_100,	CLK_PLL2_800,	1,	8),
   114		DEF_SAMPLL(".pll4",	CLK_PLL4,	CLK_MAIN_2,	PLL4_CONF),
   115	
   116		DEF_DIV_RO(".diva",	CLK_DIV_A,	CLK_PLL1,	DIV_A,	dtable_diva),
   117		DEF_DIV_RO(".divb",	CLK_DIV_B,	CLK_PLL2_400,	DIV_B,	dtable_divb),
 > 118		DEF_DIV_RO(".dive",	CLK_DIV_E,	CLK_PLL2_100,	DIV_E,	0),
   119		DEF_DIV_RO(".divw",	CLK_DIV_W,	CLK_PLL4,	DIV_W,	dtable_divw),
   120	
   121		DEF_MUX_RO(".selb",	CLK_SEL_B,	SEL_B,		sel_b),
   122		DEF_MUX_RO(".sele",	CLK_SEL_E,	SEL_E,		sel_e),
   123		DEF_MUX(".selw0",	CLK_SEL_W0,	SEL_W0,		sel_w),
   124	
   125		DEF_FIXED(".selb_d2",	CLK_SEL_B_D2,	CLK_SEL_B,	1,	2),
   126	};
   127	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
