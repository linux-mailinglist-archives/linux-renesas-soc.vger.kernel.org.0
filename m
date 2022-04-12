Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 354954FE9F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 23:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbiDLVcK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 17:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiDLVcI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 17:32:08 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8107819483B;
        Tue, 12 Apr 2022 14:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649797846; x=1681333846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fsC3N9+404/5tl0jll2ggxWkaFkkOSR8q6gQ3tnrsoo=;
  b=BEXfsLEfCgsaQmtJzDprGXCpJ1VNP13b1xhxs9yCumLFkV4lgD25Acy/
   BLdYehHy55MFDWDSMHnnt4FS4uHv3lIN9uCvUCOqvx8yS17XjN0MVihBC
   /b7eHkNPqbI51KdbQJWZ9gwGe4UuIKBBhitO6XgTpjL4HPDwVyh60AjSb
   YAKOOpiTJ65MlmNe8bgnNgVGIcJpHRjThOyCwuMwm/lXeSL0Lj8rHPIv2
   DFdRjLWWNZQVoNvpjYPfmUy6+yctmHNSGjSHRgu1H1am6ObEhWfnFhAzJ
   /MaysOtuC6szTIdL3DTFPXvDQw8TwLHi40yXBIZ7l6H5Ewhkc/ih+mE/W
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="242441601"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="242441601"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 14:06:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="526218846"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 12 Apr 2022 14:06:15 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1neNiI-0003Ac-Gg;
        Tue, 12 Apr 2022 21:06:14 +0000
Date:   Wed, 13 Apr 2022 05:05:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 1/3] clk: renesas: Add support for RZ/G2UL SoC
Message-ID: <202204130437.n3GTbhuH-lkp@intel.com>
References: <20220412161314.13800-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412161314.13800-2-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on geert-renesas-drivers/renesas-clk]
[also build test ERROR on geert-renesas-devel/next krzk/for-next v5.18-rc2 next-20220412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/Add-Renesas-RZ-G2UL-Type-1-SoC-SMARC-EVK-support/20220413-003233
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20220413/202204130437.n3GTbhuH-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ecfc4ccb6c8bc2ea667b9387be29a4b96212499d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Biju-Das/Add-Renesas-RZ-G2UL-Type-1-SoC-SMARC-EVK-support/20220413-003233
        git checkout ecfc4ccb6c8bc2ea667b9387be29a4b96212499d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/renesas/r9a07g043-cpg.c:13:10: fatal error: dt-bindings/clock/r9a07g043-cpg.h: No such file or directory
      13 | #include <dt-bindings/clock/r9a07g043-cpg.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +13 drivers/clk/renesas/r9a07g043-cpg.c

    12	
  > 13	#include <dt-bindings/clock/r9a07g043-cpg.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
