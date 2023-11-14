Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7F07EB099
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 14:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbjKNNLp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 08:11:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjKNNLo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 08:11:44 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C89A618E;
        Tue, 14 Nov 2023 05:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699967500; x=1731503500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fhUtX6YItxSUVcN/cMKxZ8+lBC4Kdn2hHKloSt8uRZ8=;
  b=PmpY5UF1+zQHFOz3FLE2834e7gVD5OMULRGu+CUjMV5d4ePCjmWCYxPq
   t0CsPQ11kIqZ3a7E0EI3PqyAWKHlmnoP38IhT1RV4ZSmZDS5zE1hfLvdQ
   7kMCDNs1yryVicBcX57lRJpYEZ38jz7NUv2kjZGGjPkgexp603QV5d+9a
   gp4+nDEyvS/rkwgspsCEAUAsJgrikMVxvKdk+MdpvR50ZdonvPQP4JjqC
   DHumrQy6RqLSg+ZMTcRGuSgA5/EIcZWVinNIwXYNTlgBL/6GbuPdYjv49
   XVIPsHfaByj5Ggaat7HERnloQt1FtK2rauU60Xm/k6I6CI0QG+RHOLays
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="389508709"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="389508709"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 05:11:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="764655735"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="764655735"
Received: from lkp-server02.sh.intel.com (HELO 83346ef18697) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Nov 2023 05:11:37 -0800
Received: from kbuild by 83346ef18697 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1r2tCY-0000GB-2y;
        Tue, 14 Nov 2023 13:11:34 +0000
Date:   Tue, 14 Nov 2023 21:10:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Aymeric Aillet <aymeric.aillet@iot.bzh>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>
Subject: Re: [PATCH 4/4] drivers: clk: renesas: enable all clocks which is
 assinged to non Linux system
Message-ID: <202311142059.XrPUseGq-lkp@intel.com>
References: <87wmulrynq.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmulrynq.wl-kuninori.morimoto.gx@renesas.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kuninori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on geert-renesas-drivers/renesas-clk clk/clk-next linus/master v6.7-rc1 next-20231114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/of-add-__of_device_is_status-and-makes-more-generic-status-check/20231114-081044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/87wmulrynq.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH 4/4] drivers: clk: renesas: enable all clocks which is assinged to non Linux system
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231114/202311142059.XrPUseGq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311142059.XrPUseGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311142059.XrPUseGq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/renesas/renesas-cpg-mssr.c:175: warning: Function parameter or member 'reserved_ids' not described in 'cpg_mssr_priv'
>> drivers/clk/renesas/renesas-cpg-mssr.c:175: warning: Function parameter or member 'num_reserved_ids' not described in 'cpg_mssr_priv'


vim +175 drivers/clk/renesas/renesas-cpg-mssr.c

17bcc8035d2d19 drivers/clk/renesas/renesas-cpg-mssr.c  Yoshihiro Shimoda   2020-09-11  124  
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  125  /**
b5fb3b8859a491 drivers/clk/renesas/renesas-cpg-mssr.c  Krzysztof Kozlowski 2020-11-03  126   * struct cpg_mssr_priv - Clock Pulse Generator / Module Standby
b5fb3b8859a491 drivers/clk/renesas/renesas-cpg-mssr.c  Krzysztof Kozlowski 2020-11-03  127   *                        and Software Reset Private Data
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  128   *
6197aa65c49055 drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2017-01-20  129   * @rcdev: Optional reset controller entity
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  130   * @dev: CPG/MSSR device
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  131   * @base: CPG/MSSR register block base address
ffbf9cf3f9460e drivers/clk/renesas/renesas-cpg-mssr.c  Yoshihiro Shimoda   2020-09-11  132   * @reg_layout: CPG/MSSR register layout
a4ea6a0f83073f drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2017-01-20  133   * @rmw_lock: protects RMW register accesses
d2e4cb45af8fac drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2019-06-12  134   * @np: Device node in DT for this CPG/MSSR module
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  135   * @num_core_clks: Number of Core Clocks in clks[]
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  136   * @num_mod_clks: Number of Module Clocks in clks[]
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  137   * @last_dt_core_clk: ID of the last Core Clock exported to DT
1f4023cdd1bdbe drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2017-06-21  138   * @notifiers: Notifier chain to save/restore clock state for system resume
8b652aa8a1fb02 drivers/clk/renesas/renesas-cpg-mssr.c  Yoshihiro Shimoda   2020-09-11  139   * @status_regs: Pointer to status registers array
8b652aa8a1fb02 drivers/clk/renesas/renesas-cpg-mssr.c  Yoshihiro Shimoda   2020-09-11  140   * @control_regs: Pointer to control registers array
8b652aa8a1fb02 drivers/clk/renesas/renesas-cpg-mssr.c  Yoshihiro Shimoda   2020-09-11  141   * @reset_regs: Pointer to reset registers array
8b652aa8a1fb02 drivers/clk/renesas/renesas-cpg-mssr.c  Yoshihiro Shimoda   2020-09-11  142   * @reset_clear_regs:  Pointer to reset clearing registers array
24ece96554a963 drivers/clk/renesas/renesas-cpg-mssr.c  Lee Jones           2021-01-26  143   * @smstpcr_saved: [].mask: Mask of SMSTPCR[] bits under our control
24ece96554a963 drivers/clk/renesas/renesas-cpg-mssr.c  Lee Jones           2021-01-26  144   *                 [].val: Saved values of SMSTPCR[]
8f5e20b6b8848b drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2019-06-12  145   * @clks: Array containing all Core and Module Clocks
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  146   */
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  147  struct cpg_mssr_priv {
6197aa65c49055 drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2017-01-20  148  #ifdef CONFIG_RESET_CONTROLLER
6197aa65c49055 drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2017-01-20  149  	struct reset_controller_dev rcdev;
6197aa65c49055 drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2017-01-20  150  #endif
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  151  	struct device *dev;
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  152  	void __iomem *base;
ffbf9cf3f9460e drivers/clk/renesas/renesas-cpg-mssr.c  Yoshihiro Shimoda   2020-09-11  153  	enum clk_reg_layout reg_layout;
a4ea6a0f83073f drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2017-01-20  154  	spinlock_t rmw_lock;
1f7db7bbf03182 drivers/clk/renesas/renesas-cpg-mssr.c  Chris Brandt        2018-09-24  155  	struct device_node *np;
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  156  
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  157  	unsigned int num_core_clks;
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  158  	unsigned int num_mod_clks;
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  159  	unsigned int last_dt_core_clk;
560869100b99a3 drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2017-06-07  160  
1f4023cdd1bdbe drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2017-06-21  161  	struct raw_notifier_head notifiers;
8b652aa8a1fb02 drivers/clk/renesas/renesas-cpg-mssr.c  Yoshihiro Shimoda   2020-09-11  162  	const u16 *status_regs;
8b652aa8a1fb02 drivers/clk/renesas/renesas-cpg-mssr.c  Yoshihiro Shimoda   2020-09-11  163  	const u16 *control_regs;
8b652aa8a1fb02 drivers/clk/renesas/renesas-cpg-mssr.c  Yoshihiro Shimoda   2020-09-11  164  	const u16 *reset_regs;
8b652aa8a1fb02 drivers/clk/renesas/renesas-cpg-mssr.c  Yoshihiro Shimoda   2020-09-11  165  	const u16 *reset_clear_regs;
560869100b99a3 drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2017-06-07  166  	struct {
560869100b99a3 drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2017-06-07  167  		u32 mask;
560869100b99a3 drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2017-06-07  168  		u32 val;
470e3f0d0b1529 drivers/clk/renesas/renesas-cpg-mssr.c  Yoshihiro Shimoda   2021-12-01  169  	} smstpcr_saved[ARRAY_SIZE(mstpsr_for_gen4)];
8f5e20b6b8848b drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2019-06-12  170  
b357c19f075f23 drivers/clk/renesas/renesas-cpg-mssr.c  Kuninori Morimoto   2023-11-14  171  	unsigned int *reserved_ids;
b357c19f075f23 drivers/clk/renesas/renesas-cpg-mssr.c  Kuninori Morimoto   2023-11-14  172  	unsigned int num_reserved_ids;
b357c19f075f23 drivers/clk/renesas/renesas-cpg-mssr.c  Kuninori Morimoto   2023-11-14  173  
8f5e20b6b8848b drivers/clk/renesas/renesas-cpg-mssr.c  Geert Uytterhoeven  2019-06-12  174  	struct clk *clks[];
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16 @175  };
f793d1e51705b2 drivers/clk/shmobile/renesas-cpg-mssr.c Geert Uytterhoeven  2015-10-16  176  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
